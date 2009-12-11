/*=========================================================================

  Program:   Visualization Toolkit
  Module:    $RCSfile: vtkTkRenderWidget.cxx,v $
  Language:  C++
  Date:      $Date: 2002/04/17 01:12:05 $
  Version:   $Revision: 1.4 $
  Thanks:    Thanks to C. Charles Law who developed this class.


Copyright (c) 1993-2000 Ken Martin, Will Schroeder, Bill Lorensen 
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice,
   this list of conditions and the following disclaimer.

 * Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

 * Neither name of Ken Martin, Will Schroeder, or Bill Lorensen nor the names
   of any contributors may be used to endorse or promote products derived
   from this software without specific prior written permission.

 * Modified source versions must be plainly marked as such, and must not be
   misrepresented as being the original software.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS ``AS IS''
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

=========================================================================*/
#include <stdio.h>
#include <stdlib.h>

#include "vtkTkport.h"
#include "tkPort.h"
#include "tkInt.h"

#include "vtkTkRenderWidget.h"

#include "tkVMacro.h"


#ifdef _WIN32
#include "vtkWin32OpenGLRenderWindow.h"
#define VTK_TK_EXPORT __declspec( dllexport ) 
#else
#include "vtkXRenderWindow.h"
#define VTK_TK_EXPORT
#endif


#define VTK_ALL_EVENTS_MASK \
    KeyPressMask|KeyReleaseMask|ButtonPressMask|ButtonReleaseMask|	\
    EnterWindowMask|LeaveWindowMask|PointerMotionMask|ExposureMask|	\
    VisibilityChangeMask|FocusChangeMask|PropertyChangeMask|ColormapChangeMask

#define VTK_MAX(a,b)	(((a)>(b))?(a):(b))
    
// These are the options that can be set when the widget is created
// or with the command configure.  The only new one is "-rw" which allows
// the uses to set their own render window.
static Tk_ConfigSpec vtkTkRenderWidgetConfigSpecs[] = {
    {TK_CONFIG_PIXELS, "-height", "height", "Height",
     "400", Tk_Offset(struct vtkTkRenderWidget, Height), 0, NULL},
  
    {TK_CONFIG_PIXELS, "-width", "width", "Width",
     "400", Tk_Offset(struct vtkTkRenderWidget, Width), 0, NULL},
  
    {TK_CONFIG_LANGARG, "-rw", "rw", "RW",
     (char *) NULL, Tk_Offset(struct vtkTkRenderWidget, RW), 0, NULL},

    {TK_CONFIG_END, (char *) NULL, (char *) NULL, (char *) NULL,
     (char *) NULL, 0, 0, NULL}
};


// Foward prototypes
static void vtkTkRenderWidget_EventProc(ClientData clientData, 
					XEvent *eventPtr);
static int vtkTkRenderWidget_MakeRenderWindow(struct vtkTkRenderWidget *self);
int vtkRenderWindowCommand(ClientData cd, Tcl_Interp *interp,
				  int argc, Arg  *args )
{ int i; return 1;} // Dummy definition, routine not needed for perltk

    
//----------------------------------------------------------------------------
// It's possible to change with this function or in a script some
// options like width, hieght or the render widget.
int vtkTkRenderWidget_Configure(Tcl_Interp *interp, 
				struct vtkTkRenderWidget *self,
				int argc, Arg *args, int flags) 
{
  // Let Tk handle generic configure options.
  if (Tk_ConfigureWidget(interp, self->TkWin, vtkTkRenderWidgetConfigSpecs,
			 argc, args, (char *)self, flags) == TCL_ERROR) 
    {
    return(TCL_ERROR);
    }
  
  // Get the new  width and height of the widget
  Tk_GeometryRequest(self->TkWin, self->Width, self->Height);
  
  // Make sure the render window has been set.  If not, create one.
  if (vtkTkRenderWidget_MakeRenderWindow(self) == TCL_ERROR) 
    {
    return TCL_ERROR;
    }
  
  return TCL_OK;
}

//----------------------------------------------------------------------------
// This function is called when the render widget name is 
// evaluated in a Tcl script.  It will compare string parameters
// to choose the appropriate method to invoke.
int vtkTkRenderWidget_Widget(ClientData clientData, Tcl_Interp *interp,
			   int argc, Arg *args) 
{
  struct vtkTkRenderWidget *self = (struct vtkTkRenderWidget *)clientData;
  int result = TCL_OK;

  // Check to see if the command has enough arguments.
  if (argc < 2) 
    {
    Tcl_AppendResult(interp, "wrong # args: should be \"",
		     args[0], " ?options?\"", NULL);
    return TCL_ERROR;
    }
  
  // Make sure the widget is not deleted during this function
  Tcl_Preserve((ClientData)self);
  
  // Handle render call to the widget
  if (strncmp(LangString(args[1]), "render", VTK_MAX(1, strlen(LangString(args[1])))) == 0 || 
      strncmp(LangString(args[1]), "Render", VTK_MAX(1, strlen(LangString(args[1])))) == 0) 
    {
    // make sure we have a window
    if (self->RenderWindow == NULL)
      {
      vtkTkRenderWidget_MakeRenderWindow(self); 
      }
    self->RenderWindow->Render();
    }
  // Handle configure method
  else if (!strncmp(LangString(args[1]), "configure", VTK_MAX(1, strlen(LangString(args[1]))))) 
    {
    if (argc == 2) 
      {
      /* Return list of all configuration parameters */
      result = Tk_ConfigureInfo(interp, self->TkWin, 
				vtkTkRenderWidgetConfigSpecs,
				(char *)self, (char *)NULL, 0);
      }
    else if (argc == 3) 
      {
      /* Return a specific configuration parameter */
      result = Tk_ConfigureInfo(interp, self->TkWin, 
				vtkTkRenderWidgetConfigSpecs,
				(char *)self, LangString(args[2]), 0);
      }
    else 
      {
      /* Execute a configuration change */
      result = vtkTkRenderWidget_Configure(interp, self, argc-2, 
					   args+2, TK_CONFIG_ARGV_ONLY);
      }
    }
    /* Cget Command */
  else if ( !strncmp(LangString(args[1]), "cget", VTK_MAX(1, strlen(LangString(args[1]))))) 
    {
    if (argc != 3) 
      {
	    Tcl_WrongNumArgs(interp, 2, args, "option");
	    result = TCL_ERROR;
      }
     else
      {
      /* Return a specific configuration parameter */
      result = Tk_ConfigureValue(interp, self->TkWin, 
				vtkTkRenderWidgetConfigSpecs,
				(char *)self, LangString(args[2]), 0);
      }
    }
  else if (!strcmp(LangString(args[1]), "GetRenderWindow"))
    { // Get RenderWindow is my own method
    // Create a RenderWidget if one has not been set yet.
    result = vtkTkRenderWidget_MakeRenderWindow(self);
    if (result != TCL_ERROR)
      {
      // Return the name (Make Tcl copy the string)
      result = Tk_ConfigureValue(interp, self->TkWin, 
				vtkTkRenderWidgetConfigSpecs,
				(char *)self, "-rw", 0);
      
      }
    }
  else 
    {
    // Unknown method name.
    Tcl_AppendResult(interp, "vtkTkRenderWidget: Unknown option: ", args[1], 
		     "\n", "Try: configure or GetRenderWindow\n", NULL);
    result = TCL_ERROR;
    }

  // Unlock the object so it can be deleted.
  Tcl_Release((ClientData)self);
   return result;
}

//----------------------------------------------------------------------------
// vtkTkRenderWidget_Cmd
// Called when vtkTkRenderWidget is executed 
// - creation of a vtkTkRenderWidget widget.
//     * Creates a new window
//     * Creates an 'vtkTkRenderWidget' data structure
//     * Creates an event handler for this window
//     * Creates a command that handles this object
//     * Configures this vtkTkRenderWidget for the given arguments
EXTERN  int vtkTkRenderWidget_Cmd(ClientData clientData, Tcl_Interp *interp, 
                               int argc, Arg *args)
{
  char *name;
  Tk_Window main = (Tk_Window)clientData;
  Tk_Window tkwin;
  struct vtkTkRenderWidget *self;
  
  // Make sure we have an instance name.
  if (argc <= 1) 
    {
    Tcl_ResetResult(interp);
    Tcl_AppendResult(interp, 
		     "wrong # args: should be \"pathName read filename\"", 
		     NULL);
    return(TCL_ERROR);
    }
  
  // Create the window.
  name = LangString(args[1]);
  // Possibly X dependent
  tkwin = Tk_CreateWindowFromPath(interp, main, name, (char *) NULL);
  if (tkwin == NULL) 
    {
    return TCL_ERROR;
    }
  
  // Tcl needs this for setting options and matching event bindings.
  Tk_SetClass(tkwin, "vtkTkRenderWidget");
  
  // Create vtkTkRenderWidget data structure 
  self = (struct vtkTkRenderWidget *)malloc(sizeof(struct vtkTkRenderWidget));
  self->TkWin = tkwin;
  self->Interp = interp;
  self->Width = 0;
  self->Height = 0;
  self->RenderWindow = NULL;
  self->RW = NULL;
  
  // ...
  // Create command event handler
  self->widgetCmd = Lang_CreateWidget(interp, tkwin, vtkTkRenderWidget_Widget, 
		    (ClientData)self, (void (*)(ClientData)) NULL);
  Tk_CreateEventHandler(tkwin, ExposureMask | StructureNotifyMask,
			vtkTkRenderWidget_EventProc, (ClientData)self);
  
  // Configure vtkTkRenderWidget widget
  if (vtkTkRenderWidget_Configure(interp, self, argc-2, args+2, 0) 
      == TCL_ERROR) 
    {
    Tk_DestroyWindow(tkwin);
    Tcl_DeleteCommandFromToken(interp, self->widgetCmd);
    // Don't free it, if we do a crash occurs later...
    //free(self);  
    return TCL_ERROR;
    }
  
  /* Tcl_AppendResult(interp, Tk_PathName(tkwin), NULL); */

  /* Tk800.022 needs to old-style LangWidgetArg Call
        newer perltk's should be ok with the default.
    */
#ifdef USE_LANGWIDGETARG
    Tcl_SetObjResult(interp, LangWidgetArg(interp,tkwin));
#else
    Tcl_SetObjResult(interp, LangWidgetObj(interp,tkwin));
#endif
  return TCL_OK;
}


//----------------------------------------------------------------------------
Arg vtkTkRenderWidget_RW(const struct vtkTkRenderWidget *self)
{
  return self->RW;
}


//----------------------------------------------------------------------------
int vtkTkRenderWidget_Width( const struct vtkTkRenderWidget *self)
{
   return self->Width;
}


//----------------------------------------------------------------------------
int vtkTkRenderWidget_Height( const struct vtkTkRenderWidget *self)
{
   return self->Height;
}


/*
 *----------------------------------------------------------------------
 *
 * vtkTkRenderWidget_Destroy ---
 *
 *	This procedure is invoked by Tcl_EventuallyFree or Tcl_Release
 *	to clean up the internal structure of a canvas at a safe time
 *	(when no-one is using it anymore).
 *
 * Results:
 *	None.
 *
 * Side effects:
 *	Everything associated with the canvas is freed up.
 *
 *----------------------------------------------------------------------
 */

static void vtkTkRenderWidget_Destroy(char *memPtr)
{
  struct vtkTkRenderWidget *self = (struct vtkTkRenderWidget *)memPtr;

  /* Destruction of the Render window is handled thru the widget's perl code
  if (self->RenderWindow)
    {
    self->RenderWindow->UnRegister(NULL);
    self->RenderWindow = NULL;
    ckfree (self->RW);
    }
*/
  ckfree((char *) memPtr);
}

//----------------------------------------------------------------------------
// This gets called to handle vtkTkRenderWidget window configuration events
// Possibly X dependent
static void vtkTkRenderWidget_EventProc(ClientData clientData, 
					XEvent *eventPtr) 
{
  struct vtkTkRenderWidget *self = (struct vtkTkRenderWidget *)clientData;
  
  switch (eventPtr->type) 
    {
    case Expose:
      if ((eventPtr->xexpose.count == 0)
	  /* && !self->UpdatePending*/) 
	{
	// let the user bind expose events
	// self->RenderWindow->Render();
	}
      break;
    case ConfigureNotify:
      //if ( Tk_IsMapped(self->TkWin) ) 
        {
	self->Width = Tk_Width(self->TkWin);
	self->Height = Tk_Height(self->TkWin);
        //Tk_GeometryRequest(self->TkWin,self->Width,self->Height);
	if (self->RenderWindow)
	  {
	  self->RenderWindow->SetPosition(Tk_X(self->TkWin),Tk_Y(self->TkWin));
	  self->RenderWindow->SetSize(self->Width, self->Height);
	  }
	//vtkTkRenderWidget_PostRedisplay(self);
	}
      break;
    case MapNotify:
      break;
    case DestroyNotify:
      Tcl_EventuallyFree((ClientData) self, vtkTkRenderWidget_Destroy );
      break;
    default:
      // nothing
      ;
    }
}


/*
//----------------------------------------------------------------------------
// vtkTkRenderWidget_Init
// Called upon system startup to create vtkTkRenderWidget command.
extern "C" {int VTK_TK_EXPORT Vtktkrenderwidget_Init(Tcl_Interp *interp);}
int VTK_TK_EXPORT Vtktkrenderwidget_Init(Tcl_Interp *interp)
{
  if (Tcl_PkgProvide(interp, "Vtktkrenderwidget", "1.2") != TCL_OK) 
    {
    return TCL_ERROR;
    }
  
  Tcl_CreateCommand(interp, "vtkTkRenderWidget", vtkTkRenderWidget_Cmd, 
		    Tk_MainWindow(interp), NULL);
  
  return TCL_OK;
}
*/

// Here is the windows specific code for creating the window
// The Xwindows version follows after this
#ifdef _WIN32

LRESULT APIENTRY vtkTkRenderWidgetProc(HWND hWnd, UINT message, 
                                       WPARAM wParam, LPARAM lParam)
{
  LRESULT rval;
  struct vtkTkRenderWidget *self = 
    (struct vtkTkRenderWidget *)GetWindowLong(hWnd,GWL_USERDATA);

  // watch for WM_USER + 12  this is a special message
  // from the vtkRenderWIndowInteractor letting us 
  // know it wants to get events also
  if ((message == WM_USER+12)&&(wParam == 24))
    {
    WNDPROC tmp = (WNDPROC)lParam;
    // we need to tell it what the original vtk event handler was 
    SetWindowLong(hWnd,GWL_USERDATA,(LONG)self->RenderWindow);
    tmp(hWnd, WM_USER+13,26,(LONG)self->OldProc);
    SetWindowLong(hWnd,GWL_USERDATA,(LONG)self);
    self->OldProc = tmp;
    return 1;
    }
  if ((message == WM_USER+14)&&(wParam == 28))
    {
    WNDPROC tmp = (WNDPROC)lParam;
    self->OldProc = tmp;
    return 1;
    }

  // forward message to Tk handler
  SetWindowLong(hWnd,GWL_USERDATA,(LONG)((TkWindow *)self->TkWin)->window);
  if (((TkWindow *)self->TkWin)->parentPtr)
    {
    SetWindowLong(hWnd,GWL_WNDPROC,(LONG)TkWinChildProc);
    rval = TkWinChildProc(hWnd,message,wParam,lParam);
    }
  else
    {
#if(TK_MAJOR_VERSION < 8)
    SetWindowLong(hWnd,GWL_WNDPROC,(LONG)TkWinTopLevelProc);
    rval = TkWinTopLevelProc(hWnd,message,wParam,lParam);
#else
    if (message == WM_WINDOWPOSCHANGED) 
      {
      XEvent event;
	    WINDOWPOS *pos = (WINDOWPOS *) lParam;
	    TkWindow *winPtr = (TkWindow *) Tk_HWNDToWindow(pos->hwnd);
    
	    if (winPtr == NULL) {
	      return 0;
	      }

	    /*
	     * Update the shape of the contained window.
	     */
	    if (!(pos->flags & SWP_NOSIZE)) {
	      winPtr->changes.width = pos->cx;
	      winPtr->changes.height = pos->cy;
	      }
	    if (!(pos->flags & SWP_NOMOVE)) {
	      winPtr->changes.x = pos->x;
	      winPtr->changes.y = pos->y;
	      }


      /*
       *  Generate a ConfigureNotify event.
       */
      event.type = ConfigureNotify;
      event.xconfigure.serial = winPtr->display->request;
      event.xconfigure.send_event = False;
      event.xconfigure.display = winPtr->display;
      event.xconfigure.event = winPtr->window;
      event.xconfigure.window = winPtr->window;
      event.xconfigure.border_width = winPtr->changes.border_width;
      event.xconfigure.override_redirect = winPtr->atts.override_redirect;
      event.xconfigure.x = winPtr->changes.x;
      event.xconfigure.y = winPtr->changes.y;
      event.xconfigure.width = winPtr->changes.width;
      event.xconfigure.height = winPtr->changes.height;
      event.xconfigure.above = None;
      Tk_QueueWindowEvent(&event, TCL_QUEUE_TAIL);

	    Tcl_ServiceAll();
	    return 0;
      }
    SetWindowLong(hWnd,GWL_WNDPROC,(LONG)TkWinChildProc);
    rval = TkWinChildProc(hWnd,message,wParam,lParam);
#endif
    }

    if (message != WM_PAINT)
      {
      SetWindowLong(hWnd,GWL_USERDATA,(LONG)self->RenderWindow);
      SetWindowLong(hWnd,GWL_WNDPROC,(LONG)self->OldProc);
      CallWindowProc(self->OldProc,hWnd,message,wParam,lParam);
      }

  // now reset to the original config
  SetWindowLong(hWnd,GWL_USERDATA,(LONG)self);
  SetWindowLong(hWnd,GWL_WNDPROC,(LONG)vtkTkRenderWidgetProc);
  return rval;
}

//-----------------------------------------------------------------------------
// Creates a render window and forces Tk to use the window.
static int vtkTkRenderWidget_MakeRenderWindow(struct vtkTkRenderWidget *self) 
{
  Display *dpy;
  TkWindow *winPtr = (TkWindow *) self->TkWin;
  TkWindow *winPtr2;
  Tcl_HashEntry *hPtr;
  int new_flag;
  vtkWin32OpenGLRenderWindow *renderWindow;
  TkWinDrawable *twdPtr;
  HWND parentWin;

  if (self->RenderWindow)
    {
    return TCL_OK;
    }
  
  dpy = Tk_Display(self->TkWin);

  if (winPtr->window != None) 
    {
    // XDestroyWindow(dpy, winPtr->window);
    }

  if (self->RW == NULL)
    {
    // Make the Render window.
    self->RenderWindow = vtkRenderWindow::New();
    self->RenderWindow->Register(NULL);
    self->RenderWindow->Delete();
    renderWindow = (vtkWin32OpenGLRenderWindow *)(self->RenderWindow);
#ifndef VTK_PYTHON_BUILD
    void * tempptr = (void *)self->RenderWindow;
    vtkTclGetObjectFromPointer(self->Interp, tempptr,
			       vtkRenderWindowCommand);
    self->RenderWindow = (vtkWin32OpenGLRenderWindow *)(tempptr);
    renderWindow = (vtkWin32OpenGLRenderWindow *)(self->RenderWindow);
#endif

    /* Execute a configuration change for RW*/
    Arg RW_change[2];
    RW_change[0] = LangStringArg("-rw");
    RW_change[1] = LangScalarResult(self->Interp);
    // kill(0,2);  /* Debug only, requires <sys/types.h> and <signal.h> */
    Tk_ConfigureWidget(self->Interp, self->TkWin, vtkTkRenderWidgetConfigSpecs, 2,
    						   RW_change, (char *)self, TK_CONFIG_ARGV_ONLY);
    // self->Interp->result[0] = '\0';

    }
  else
    {
#ifdef VTK_PYTHON_BUILD
    // is RW an address ? big ole python hack here
    if (self->RW[0] == 'A' && self->RW[1] == 'd' && 
	self->RW[2] == 'd' && self->RW[3] == 'r')
      {
      void *tmp;
      sscanf(self->RW+5,"%p",&tmp);
      renderWindow = (vtkWin32OpenGLRenderWindow *)tmp;
      }
    else
      {
#endif
#ifndef VTK_PYTHON_BUILD
      renderWindow = (vtkWin32OpenGLRenderWindow *)
	vtkTclGetPointerFromObject(self->RW, "vtkRenderWindow", self->Interp,
				   new_flag);
#endif
#ifdef VTK_PYTHON_BUILD
      }
#endif
    if (renderWindow != self->RenderWindow)
      {
      if (self->RenderWindow != NULL) {self->RenderWindow->UnRegister(NULL);}
      self->RenderWindow = (vtkRenderWindow *)(renderWindow);
      if (self->RenderWindow != NULL) {self->RenderWindow->Register(NULL);}
      }
    }
  
  // Set the size
  self->RenderWindow->SetSize(self->Width, self->Height);
  
  // Set the parent correctly
  // Possibly X dependent
  if ((winPtr->parentPtr != NULL) && !(winPtr->flags & TK_TOP_LEVEL)) 
    {
    if (winPtr->parentPtr->window == None) 
      {
      Tk_MakeWindowExist((Tk_Window) winPtr->parentPtr);
      }

    parentWin = ((TkWinDrawable *)winPtr->parentPtr->window)->window.handle;
    renderWindow->SetParentId(parentWin);
    }
  
  // Use the same display
  self->RenderWindow->SetDisplayId(dpy);
  
  /* Make sure Tk knows to switch to the new colormap when the cursor
   * is over this window when running in color index mode.
   */
  //Tk_SetWindowVisual(self->TkWin, renderWindow->GetDesiredVisual(), 
  //renderWindow->GetDesiredDepth(), 
  //renderWindow->GetDesiredColormap());
  
  self->RenderWindow->Render();  

#if(TK_MAJOR_VERSION >=  8)
  twdPtr = (TkWinDrawable*)Tk_AttachHWND(self->TkWin, renderWindow->GetWindowId());
#else
  twdPtr = (TkWinDrawable*) ckalloc(sizeof(TkWinDrawable));
  twdPtr->type = TWD_WINDOW;
  twdPtr->window.winPtr = winPtr;
  twdPtr->window.handle = renderWindow->GetWindowId();
#endif

  self->OldProc = (WNDPROC)GetWindowLong(twdPtr->window.handle,GWL_WNDPROC);
  SetWindowLong(twdPtr->window.handle,GWL_USERDATA,(LONG)self);
  SetWindowLong(twdPtr->window.handle,GWL_WNDPROC,(LONG)vtkTkRenderWidgetProc);

  winPtr->window = (Window)twdPtr;
  
  hPtr = Tcl_CreateHashEntry(&winPtr->dispPtr->winTable,
			     (char *) winPtr->window, &new_flag);
  Tcl_SetHashValue(hPtr, winPtr);

  
  winPtr->dirtyAtts = 0;
  winPtr->dirtyChanges = 0;
#ifdef TK_USE_INPUT_METHODS
  winPtr->inputContext = NULL;
#endif // TK_USE_INPUT_METHODS 

  if (!(winPtr->flags & TK_TOP_LEVEL)) 
    {
    /*
     * If this window has a different colormap than its parent, add
     * the window to the WM_COLORMAP_WINDOWS property for its top-level.
     */
    if ((winPtr->parentPtr != NULL) &&
	      (winPtr->atts.colormap != winPtr->parentPtr->atts.colormap)) 
      {
      TkWmAddToColormapWindows(winPtr);
      }
    } 

  /*
   * Issue a ConfigureNotify event if there were deferred configuration
   * changes (but skip it if the window is being deleted;  the
   * ConfigureNotify event could cause problems if we're being called
   * from Tk_DestroyWindow under some conditions).
   */
  if ((winPtr->flags & TK_NEED_CONFIG_NOTIFY)
      && !(winPtr->flags & TK_ALREADY_DEAD))
    {
    XEvent event;
    
    winPtr->flags &= ~TK_NEED_CONFIG_NOTIFY;
    
    event.type = ConfigureNotify;
    event.xconfigure.serial = LastKnownRequestProcessed(winPtr->display);
    event.xconfigure.send_event = False;
    event.xconfigure.display = winPtr->display;
    event.xconfigure.event = winPtr->window;
    event.xconfigure.window = winPtr->window;
    event.xconfigure.x = winPtr->changes.x;
    event.xconfigure.y = winPtr->changes.y;
    event.xconfigure.width = winPtr->changes.width;
    event.xconfigure.height = winPtr->changes.height;
    event.xconfigure.border_width = winPtr->changes.border_width;
    if (winPtr->changes.stack_mode == Above) 
      {
      event.xconfigure.above = winPtr->changes.sibling;
      }
    else 
      {
      event.xconfigure.above = None;
      }
    event.xconfigure.override_redirect = winPtr->atts.override_redirect;
    Tk_HandleEvent(&event);
    }

  return TCL_OK;
}

// now the Xwindows version
#else

//----------------------------------------------------------------------------
// Creates a render window and forces Tk to use the window.
static int
vtkTkRenderWidget_MakeRenderWindow(struct vtkTkRenderWidget *self) 
{
  Display *dpy;
  int new_flag;
  vtkXRenderWindow *renderWindow;
  
  if (self->RenderWindow)
    {
    return TCL_OK;
    }
  
  dpy = Tk_Display(self->TkWin);
  
  if (Tk_WindowId(self->TkWin) != None) 
    {
    XDestroyWindow(dpy, Tk_WindowId(self->TkWin));
    }

  if (self->RW == NULL )
    {
    // Make the Render window.
    self->RenderWindow = vtkRenderWindow::New();
    self->RenderWindow->Register(NULL);
    self->RenderWindow->Delete();
    renderWindow = (vtkXRenderWindow *)(self->RenderWindow);
#ifndef VTK_PYTHON_BUILD
    void * tempptr = (void *)self->RenderWindow;
    vtkTclGetObjectFromPointer(self->Interp, tempptr,
			       vtkRenderWindowCommand);
    
    self->RenderWindow = (vtkXRenderWindow *)(tempptr);
    renderWindow = (vtkXRenderWindow *)(self->RenderWindow);
#endif

    /* Execute a configuration change for RW*/
    Arg RW_change[2];
    RW_change[0] = LangStringArg("-rw");
    RW_change[1] = LangScalarResult(self->Interp);
    // kill(0,2);  /* Debug only, requires <sys/types.h> and <signal.h> */
    Tk_ConfigureWidget(self->Interp, self->TkWin, vtkTkRenderWidgetConfigSpecs, 2,
    						   RW_change, (char *)self, TK_CONFIG_ARGV_ONLY);
    // self->Interp->result[0] = '\0';
    }
  else
    {
#ifdef VTK_PYTHON_BUILD
    // is RW an address ? big ole python hack here
    if (self->RW[0] == 'A' && self->RW[1] == 'd' && 
	self->RW[2] == 'd' && self->RW[3] == 'r')
      {
      void *tmp;
      sscanf(self->RW+5,"%p",&tmp);
      renderWindow = (vtkXRenderWindow *)tmp;
      }
    else
      {
#endif
#ifndef VTK_PYTHON_BUILD
      renderWindow = (vtkXRenderWindow *) 
	vtkTclGetPointerFromObject(self->RW,"vtkRenderWindow",self->Interp, 
				   new_flag);
#endif
#ifdef VTK_PYTHON_BUILD
      }
#endif
    if (renderWindow != self->RenderWindow)
      {
      if (self->RenderWindow != NULL) {self->RenderWindow->UnRegister(NULL);}
      self->RenderWindow = (vtkRenderWindow *)(renderWindow);
      if (self->RenderWindow != NULL) {self->RenderWindow->Register(NULL);}
      }
    }
		
  // If the imageviewer has already created it's window, throw up our hands and quit...
  if ( renderWindow->GetWindowId() != (Window)NULL )
    {
    return TCL_ERROR;
    }
	
  // Use the same display
  renderWindow->SetDisplayId(dpy);
  
  /* Make sure Tk knows to switch to the new colormap when the cursor
   * is over this window when running in color index mode.
   */
  // The visual MUST BE SET BEFORE the window is created.
  Tk_SetWindowVisual(self->TkWin, renderWindow->GetDesiredVisual(), 
		     renderWindow->GetDesiredDepth(), 
		     renderWindow->GetDesiredColormap());
  
  // Make this window exist, then use that information to make the vtkImageViewer in sync
  Tk_MakeWindowExist ( self->TkWin );
  renderWindow->SetWindowId ( (void*)Tk_WindowId ( self->TkWin ) );
  
  // Set the size
  self->RenderWindow->SetSize(self->Width, self->Height);
  
  // Set the parent correctly
  // Possibly X dependent
  if ((Tk_Parent(self->TkWin) == NULL) || (Tk_IsTopLevel(self->TkWin))) 
    {
    renderWindow->SetParentId(XRootWindow(Tk_Display(self->TkWin), Tk_ScreenNumber(self->TkWin)));
    }
  else 
    {
    renderWindow->SetParentId(Tk_WindowId(Tk_Parent(self->TkWin) ));
    }

  self->RenderWindow->Render();  
  XSelectInput(dpy, Tk_WindowId(self->TkWin), VTK_ALL_EVENTS_MASK);
  
  return TCL_OK;
}
#endif

