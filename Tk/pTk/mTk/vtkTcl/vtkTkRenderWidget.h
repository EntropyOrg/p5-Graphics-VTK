/*=========================================================================

  Program:   Visualization Toolkit
  Module:    $RCSfile: vtkTkRenderWidget.h,v $
  Language:  C++
  Date:      $Date: 2002/04/05 03:05:54 $
  Version:   $Revision: 1.3 $
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
// .NAME vtkTkRenderWidget - a Tk Widget for vtk renderering

// .SECTION Description
// vtkTkRenderWidget is a Tk widget that you can render into. It has a 
// GetRenderWindow method that returns a vtkRenderWindow. This can then
// be used to create a vtkRenderer and etc. You can also specify a 
// vtkRenderWindow to be used when creating the widget by using
// the -rw option. It also takes -width and -height options.
// Events can be bound on this widget just like any other Tk widget.

// .SECTION See Also
// vtkRenderWindow vtkRenderer


#ifndef __vtkTkRenderWidget_h
#define __vtkTkRenderWidget_h

#include "vtkRenderWindow.h"
#ifndef VTK_PYTHON_BUILD
#endif

struct vtkTkRenderWidget
{
  Tk_Window  TkWin;		/* Tk window structure */
  Tcl_Interp *Interp;		/* Tcl interpreter */
  int Width;
  int Height;
  Tcl_Command widgetCmd;	/* Token for entry's widget command. */  
  vtkRenderWindow *RenderWindow;
  Arg RW;
#ifdef _WIN32
  WNDPROC OldProc;
#endif
};

// This widget requires access to structures that are normally 
// not visible to Tcl/Tk applications. For this reason you must
// have access to tkInt.h
// #include "tkInt.h"

#ifdef _WIN32
extern "C" {
#include "tkWinInt.h" 
}
#endif 

/* Definitions for the vtkGlue.cpp functions: */
EXTERN void vtkTclGetObjectFromPointer(Tcl_Interp *interp, void * &temp1,
			   int (*command)(ClientData, 
					  Tcl_Interp *,int, Arg *));
					  
EXTERN void *vtkTclGetPointerFromObject( Arg object,
					       char *result_type,
					       Tcl_Interp *interp, 
					       int &error);					  

extern "C" { int vtkTkRenderWidget_Cmd(ClientData clientData, Tcl_Interp *interp, 
                               int argc, Arg *args);
}

/* Debug-only Function */
EXTERN int Tcl_RefCount( Arg object);					  

#endif








