#include "EXTERN.h"

/* avoid some nasty defines on win32 that cause c++ compilation to fail */
#ifdef WIN32
#define WIN32IOP_H
#endif

#include "perl.h"
#include "XSUB.h"

/* 'THIS' gets redefined to 'void' in 
the standard mingw include 'basetyps.h', which causes problems with
the 'THIS' that appears in XS code. */
#ifdef __MINGW32__
#undef THIS
#endif

#include "vtkPerl.h"
#include "vtkContrib.h"
#include "vtkArcPlotter.h"
#include "vtkBranchExtentTranslator.h"
#include "vtkCellDerivatives.h"
#include "vtkCubeAxesActor2D.h"
#include "vtkDEMReader.h"
#include "vtkDepthSortPolyData.h"
#include "vtkEarthSource.h"
#include "vtkGetRemoteGhostCells.h"
#include "vtkGridTransform.h"
#include "vtkImageToPolyDataFilter.h"
#include "vtkImageReslice.h"
#include "vtkIVWriter.h"
#include "vtkLandmarkTransform.h"
#include "vtkLegendBoxActor.h"
#include "vtkLightKit.h"
#include "vtkMassProperties.h"
#include "vtkMultiProcessController.h"
#include "vtkOBJReader.h"
#include "vtkOutlineCornerFilter.h"
#include "vtkOutlineCornerSource.h"
#include "vtkPieceScalars.h"
#include "vtkProjectedTexture.h"
#include "vtkRenderLargeImage.h"
#include "vtkRIBExporter.h"
#include "vtkRIBLight.h"
#include "vtkRIBProperty.h"
#include "vtkSuperquadric.h"
#include "vtkSurfaceReconstructionFilter.h"
#include "vtkSuperquadricSource.h"
#include "vtkSubdivideTetra.h"
#include "vtkThreadedController.h"
#include "vtkThinPlateSplineTransform.h"
#include "vtkTransformToGrid.h"
#include "vtkTreeComposite.h"
#include "vtkVideoSource.h"
#include "vtkVolumeProMapper.h"
#include "vtkInputPort.h"
#include "vtkOutputPort.h"
#include "vtkVRMLImporter.h"
#include "vtkXYPlotActor.h"
#ifdef WIN32
#include "vtkWin32OffscreenRenderWindow.h"
#endif
#include "vtkRectilinearGrid.h"
#include "vtkStructuredGrid.h"
#include "vtkDataObjectCollection.h"
#include "vtkDataSetCollection.h"
#include "vtkGlyphSource2D.h"
/* Routine to call a perl code ref, used by all the Set...Method methods
   like SetExecuteMethod.
*/

void
callperlsub(void * codeRef){
	SV* code = (SV*) codeRef;
	int count;
	dSP;
	PUSHMARK(SP) ;
	/*printf("callperlsub called'%s'\n",SvPV_nolen(code)); */
	count = perl_call_sv(code, G_DISCARD|G_NOARGS ) ;

}

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::ArcPlotter PREFIX = vtk

PROTOTYPES: DISABLE



vtkCamera *
vtkArcPlotter::GetCamera()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCamera";
		CODE:
		RETVAL = THIS->GetCamera();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


const char *
vtkArcPlotter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkArcPlotter::GetDefaultNormal()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetDefaultNormal();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkArcPlotter::GetFieldDataArray()
		CODE:
		RETVAL = THIS->GetFieldDataArray();
		OUTPUT:
		RETVAL


float
vtkArcPlotter::GetHeight()
		CODE:
		RETVAL = THIS->GetHeight();
		OUTPUT:
		RETVAL


unsigned long
vtkArcPlotter::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


float
vtkArcPlotter::GetOffset()
		CODE:
		RETVAL = THIS->GetOffset();
		OUTPUT:
		RETVAL


int
vtkArcPlotter::GetPlotComponent()
		CODE:
		RETVAL = THIS->GetPlotComponent();
		OUTPUT:
		RETVAL


int
vtkArcPlotter::GetPlotMode()
		CODE:
		RETVAL = THIS->GetPlotMode();
		OUTPUT:
		RETVAL


float
vtkArcPlotter::GetRadius()
		CODE:
		RETVAL = THIS->GetRadius();
		OUTPUT:
		RETVAL


int
vtkArcPlotter::GetUseDefaultNormal()
		CODE:
		RETVAL = THIS->GetUseDefaultNormal();
		OUTPUT:
		RETVAL


static vtkArcPlotter*
vtkArcPlotter::New()
		CODE:
		RETVAL = vtkArcPlotter::New();
		OUTPUT:
		RETVAL


void
vtkArcPlotter::SetCamera(arg1)
		vtkCamera *	arg1
		CODE:
		THIS->SetCamera(arg1);
		XSRETURN_EMPTY;


void
vtkArcPlotter::SetDefaultNormal(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetDefaultNormal(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkArcPlotter::SetDefaultNormal\n");



void
vtkArcPlotter::SetFieldDataArray(arg1)
		int 	arg1
		CODE:
		THIS->SetFieldDataArray(arg1);
		XSRETURN_EMPTY;


void
vtkArcPlotter::SetHeight(arg1)
		float 	arg1
		CODE:
		THIS->SetHeight(arg1);
		XSRETURN_EMPTY;


void
vtkArcPlotter::SetOffset(arg1)
		float 	arg1
		CODE:
		THIS->SetOffset(arg1);
		XSRETURN_EMPTY;


void
vtkArcPlotter::SetPlotComponent(arg1)
		int 	arg1
		CODE:
		THIS->SetPlotComponent(arg1);
		XSRETURN_EMPTY;


void
vtkArcPlotter::SetPlotMode(arg1)
		int 	arg1
		CODE:
		THIS->SetPlotMode(arg1);
		XSRETURN_EMPTY;


void
vtkArcPlotter::SetPlotModeToPlotFieldData()
		CODE:
		THIS->SetPlotModeToPlotFieldData();
		XSRETURN_EMPTY;


void
vtkArcPlotter::SetPlotModeToPlotNormals()
		CODE:
		THIS->SetPlotModeToPlotNormals();
		XSRETURN_EMPTY;


void
vtkArcPlotter::SetPlotModeToPlotScalars()
		CODE:
		THIS->SetPlotModeToPlotScalars();
		XSRETURN_EMPTY;


void
vtkArcPlotter::SetPlotModeToPlotTCoords()
		CODE:
		THIS->SetPlotModeToPlotTCoords();
		XSRETURN_EMPTY;


void
vtkArcPlotter::SetPlotModeToPlotTensors()
		CODE:
		THIS->SetPlotModeToPlotTensors();
		XSRETURN_EMPTY;


void
vtkArcPlotter::SetPlotModeToPlotVectors()
		CODE:
		THIS->SetPlotModeToPlotVectors();
		XSRETURN_EMPTY;


void
vtkArcPlotter::SetRadius(arg1)
		float 	arg1
		CODE:
		THIS->SetRadius(arg1);
		XSRETURN_EMPTY;


void
vtkArcPlotter::SetUseDefaultNormal(arg1)
		int 	arg1
		CODE:
		THIS->SetUseDefaultNormal(arg1);
		XSRETURN_EMPTY;


void
vtkArcPlotter::UseDefaultNormalOff()
		CODE:
		THIS->UseDefaultNormalOff();
		XSRETURN_EMPTY;


void
vtkArcPlotter::UseDefaultNormalOn()
		CODE:
		THIS->UseDefaultNormalOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::BranchExtentTranslator PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkBranchExtentTranslator::GetAssignedNumberOfPieces()
		CODE:
		RETVAL = THIS->GetAssignedNumberOfPieces();
		OUTPUT:
		RETVAL


int
vtkBranchExtentTranslator::GetAssignedPiece()
		CODE:
		RETVAL = THIS->GetAssignedPiece();
		OUTPUT:
		RETVAL


const char *
vtkBranchExtentTranslator::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkImageData *
vtkBranchExtentTranslator::GetOriginalSource()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImageData";
		CODE:
		RETVAL = THIS->GetOriginalSource();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkBranchExtentTranslator*
vtkBranchExtentTranslator::New()
		CODE:
		RETVAL = vtkBranchExtentTranslator::New();
		OUTPUT:
		RETVAL


int
vtkBranchExtentTranslator::PieceToExtent()
		CODE:
		RETVAL = THIS->PieceToExtent();
		OUTPUT:
		RETVAL


void
vtkBranchExtentTranslator::SetAssignedNumberOfPieces(arg1)
		int 	arg1
		CODE:
		THIS->SetAssignedNumberOfPieces(arg1);
		XSRETURN_EMPTY;


void
vtkBranchExtentTranslator::SetAssignedPiece(arg1)
		int 	arg1
		CODE:
		THIS->SetAssignedPiece(arg1);
		XSRETURN_EMPTY;


void
vtkBranchExtentTranslator::SetOriginalSource(arg1)
		vtkImageData *	arg1
		CODE:
		THIS->SetOriginalSource(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::CellDerivatives PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkCellDerivatives::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkCellDerivatives::GetTensorMode()
		CODE:
		RETVAL = THIS->GetTensorMode();
		OUTPUT:
		RETVAL


const char *
vtkCellDerivatives::GetTensorModeAsString()
		CODE:
		RETVAL = THIS->GetTensorModeAsString();
		OUTPUT:
		RETVAL


int
vtkCellDerivatives::GetVectorMode()
		CODE:
		RETVAL = THIS->GetVectorMode();
		OUTPUT:
		RETVAL


const char *
vtkCellDerivatives::GetVectorModeAsString()
		CODE:
		RETVAL = THIS->GetVectorModeAsString();
		OUTPUT:
		RETVAL


static vtkCellDerivatives*
vtkCellDerivatives::New()
		CODE:
		RETVAL = vtkCellDerivatives::New();
		OUTPUT:
		RETVAL


void
vtkCellDerivatives::SetTensorMode(arg1)
		int 	arg1
		CODE:
		THIS->SetTensorMode(arg1);
		XSRETURN_EMPTY;


void
vtkCellDerivatives::SetTensorModeToComputeGradient()
		CODE:
		THIS->SetTensorModeToComputeGradient();
		XSRETURN_EMPTY;


void
vtkCellDerivatives::SetTensorModeToComputeStrain()
		CODE:
		THIS->SetTensorModeToComputeStrain();
		XSRETURN_EMPTY;


void
vtkCellDerivatives::SetTensorModeToPassTensors()
		CODE:
		THIS->SetTensorModeToPassTensors();
		XSRETURN_EMPTY;


void
vtkCellDerivatives::SetVectorMode(arg1)
		int 	arg1
		CODE:
		THIS->SetVectorMode(arg1);
		XSRETURN_EMPTY;


void
vtkCellDerivatives::SetVectorModeToComputeGradient()
		CODE:
		THIS->SetVectorModeToComputeGradient();
		XSRETURN_EMPTY;


void
vtkCellDerivatives::SetVectorModeToComputeVorticity()
		CODE:
		THIS->SetVectorModeToComputeVorticity();
		XSRETURN_EMPTY;


void
vtkCellDerivatives::SetVectorModeToPassVectors()
		CODE:
		THIS->SetVectorModeToPassVectors();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::CubeAxesActor2D PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkCubeAxesActor2D::BoldOff()
		CODE:
		THIS->BoldOff();
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::BoldOn()
		CODE:
		THIS->BoldOn();
		XSRETURN_EMPTY;


int
vtkCubeAxesActor2D::GetBold()
		CODE:
		RETVAL = THIS->GetBold();
		OUTPUT:
		RETVAL


float *
vtkCubeAxesActor2D::GetBounds(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		float 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		float 	arg6
		CODE:
		THIS->GetBounds(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
		OUTPUT:
		arg1
		arg2
		arg3
		arg4
		arg5
		arg6
	CASE: items == 1
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetBounds();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


vtkCamera *
vtkCubeAxesActor2D::GetCamera()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCamera";
		CODE:
		RETVAL = THIS->GetCamera();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


const char *
vtkCubeAxesActor2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkCubeAxesActor2D::GetCornerOffset()
		CODE:
		RETVAL = THIS->GetCornerOffset();
		OUTPUT:
		RETVAL


int
vtkCubeAxesActor2D::GetFlyMode()
		CODE:
		RETVAL = THIS->GetFlyMode();
		OUTPUT:
		RETVAL


float
vtkCubeAxesActor2D::GetFontFactor()
		CODE:
		RETVAL = THIS->GetFontFactor();
		OUTPUT:
		RETVAL


int
vtkCubeAxesActor2D::GetFontFamily()
		CODE:
		RETVAL = THIS->GetFontFamily();
		OUTPUT:
		RETVAL


float
vtkCubeAxesActor2D::GetInertia()
		CODE:
		RETVAL = THIS->GetInertia();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkCubeAxesActor2D::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkCubeAxesActor2D::GetItalic()
		CODE:
		RETVAL = THIS->GetItalic();
		OUTPUT:
		RETVAL


char *
vtkCubeAxesActor2D::GetLabelFormat()
		CODE:
		RETVAL = THIS->GetLabelFormat();
		OUTPUT:
		RETVAL


int
vtkCubeAxesActor2D::GetNumberOfLabels()
		CODE:
		RETVAL = THIS->GetNumberOfLabels();
		OUTPUT:
		RETVAL


vtkProp *
vtkCubeAxesActor2D::GetProp()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkProp";
		CODE:
		RETVAL = THIS->GetProp();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkCubeAxesActor2D::GetScaling()
		CODE:
		RETVAL = THIS->GetScaling();
		OUTPUT:
		RETVAL


int
vtkCubeAxesActor2D::GetShadow()
		CODE:
		RETVAL = THIS->GetShadow();
		OUTPUT:
		RETVAL


int
vtkCubeAxesActor2D::GetXAxisVisibility()
		CODE:
		RETVAL = THIS->GetXAxisVisibility();
		OUTPUT:
		RETVAL


char *
vtkCubeAxesActor2D::GetXLabel()
		CODE:
		RETVAL = THIS->GetXLabel();
		OUTPUT:
		RETVAL


int
vtkCubeAxesActor2D::GetYAxisVisibility()
		CODE:
		RETVAL = THIS->GetYAxisVisibility();
		OUTPUT:
		RETVAL


char *
vtkCubeAxesActor2D::GetYLabel()
		CODE:
		RETVAL = THIS->GetYLabel();
		OUTPUT:
		RETVAL


int
vtkCubeAxesActor2D::GetZAxisVisibility()
		CODE:
		RETVAL = THIS->GetZAxisVisibility();
		OUTPUT:
		RETVAL


char *
vtkCubeAxesActor2D::GetZLabel()
		CODE:
		RETVAL = THIS->GetZLabel();
		OUTPUT:
		RETVAL


void
vtkCubeAxesActor2D::ItalicOff()
		CODE:
		THIS->ItalicOff();
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::ItalicOn()
		CODE:
		THIS->ItalicOn();
		XSRETURN_EMPTY;


static vtkCubeAxesActor2D*
vtkCubeAxesActor2D::New()
		CODE:
		RETVAL = vtkCubeAxesActor2D::New();
		OUTPUT:
		RETVAL


void
vtkCubeAxesActor2D::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;


int
vtkCubeAxesActor2D::RenderOpaqueGeometry(arg1)
		vtkViewport *	arg1
		CODE:
		RETVAL = THIS->RenderOpaqueGeometry(arg1);
		OUTPUT:
		RETVAL


int
vtkCubeAxesActor2D::RenderOverlay(arg1)
		vtkViewport *	arg1
		CODE:
		RETVAL = THIS->RenderOverlay(arg1);
		OUTPUT:
		RETVAL


int
vtkCubeAxesActor2D::RenderTranslucentGeometry(arg1)
		vtkViewport *	arg1
		CODE:
		RETVAL = THIS->RenderTranslucentGeometry(arg1);
		OUTPUT:
		RETVAL


void
vtkCubeAxesActor2D::ScalingOff()
		CODE:
		THIS->ScalingOff();
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::ScalingOn()
		CODE:
		THIS->ScalingOn();
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetBold(arg1)
		int 	arg1
		CODE:
		THIS->SetBold(arg1);
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetBounds(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		float  	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		float 	arg6
		CODE:
		THIS->SetBounds(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkCubeAxesActor2D::SetBounds\n");



void
vtkCubeAxesActor2D::SetCamera(arg1)
		vtkCamera *	arg1
		CODE:
		THIS->SetCamera(arg1);
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetCornerOffset(arg1)
		float 	arg1
		CODE:
		THIS->SetCornerOffset(arg1);
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetFlyMode(arg1)
		int 	arg1
		CODE:
		THIS->SetFlyMode(arg1);
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetFlyModeToClosestTriad()
		CODE:
		THIS->SetFlyModeToClosestTriad();
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetFlyModeToOuterEdges()
		CODE:
		THIS->SetFlyModeToOuterEdges();
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetFontFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetFontFactor(arg1);
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetFontFamily(arg1)
		int 	arg1
		CODE:
		THIS->SetFontFamily(arg1);
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetFontFamilyToArial()
		CODE:
		THIS->SetFontFamilyToArial();
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetFontFamilyToCourier()
		CODE:
		THIS->SetFontFamilyToCourier();
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetFontFamilyToTimes()
		CODE:
		THIS->SetFontFamilyToTimes();
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetInertia(arg1)
		int 	arg1
		CODE:
		THIS->SetInertia(arg1);
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetInput(arg1)
		vtkDataSet *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetItalic(arg1)
		int 	arg1
		CODE:
		THIS->SetItalic(arg1);
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetLabelFormat(arg1)
		char *	arg1
		CODE:
		THIS->SetLabelFormat(arg1);
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetNumberOfLabels(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfLabels(arg1);
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetProp(arg1)
		vtkProp *	arg1
		CODE:
		THIS->SetProp(arg1);
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetScaling(arg1)
		int 	arg1
		CODE:
		THIS->SetScaling(arg1);
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetShadow(arg1)
		int 	arg1
		CODE:
		THIS->SetShadow(arg1);
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetXAxisVisibility(arg1)
		int 	arg1
		CODE:
		THIS->SetXAxisVisibility(arg1);
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetXLabel(arg1)
		char *	arg1
		CODE:
		THIS->SetXLabel(arg1);
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetYAxisVisibility(arg1)
		int 	arg1
		CODE:
		THIS->SetYAxisVisibility(arg1);
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetYLabel(arg1)
		char *	arg1
		CODE:
		THIS->SetYLabel(arg1);
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetZAxisVisibility(arg1)
		int 	arg1
		CODE:
		THIS->SetZAxisVisibility(arg1);
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::SetZLabel(arg1)
		char *	arg1
		CODE:
		THIS->SetZLabel(arg1);
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::ShadowOff()
		CODE:
		THIS->ShadowOff();
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::ShadowOn()
		CODE:
		THIS->ShadowOn();
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::ShallowCopy(arg1 = 0)
	CASE: items == 2
		vtkCubeAxesActor2D *	arg1
		CODE:
		THIS->ShallowCopy(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkCubeAxesActor2D::ShallowCopy\n");



void
vtkCubeAxesActor2D::XAxisVisibilityOff()
		CODE:
		THIS->XAxisVisibilityOff();
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::XAxisVisibilityOn()
		CODE:
		THIS->XAxisVisibilityOn();
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::YAxisVisibilityOff()
		CODE:
		THIS->YAxisVisibilityOff();
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::YAxisVisibilityOn()
		CODE:
		THIS->YAxisVisibilityOn();
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::ZAxisVisibilityOff()
		CODE:
		THIS->ZAxisVisibilityOff();
		XSRETURN_EMPTY;


void
vtkCubeAxesActor2D::ZAxisVisibilityOn()
		CODE:
		THIS->ZAxisVisibilityOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::DEMReader PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkDEMReader::ExecuteInformation()
		CODE:
		THIS->ExecuteInformation();
		XSRETURN_EMPTY;


int
vtkDEMReader::GetAccuracyCode()
		CODE:
		RETVAL = THIS->GetAccuracyCode();
		OUTPUT:
		RETVAL


const char *
vtkDEMReader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkDEMReader::GetDEMLevel()
		CODE:
		RETVAL = THIS->GetDEMLevel();
		OUTPUT:
		RETVAL


float  *
vtkDEMReader::GetElevationBounds()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetElevationBounds();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


int
vtkDEMReader::GetElevationPattern()
		CODE:
		RETVAL = THIS->GetElevationPattern();
		OUTPUT:
		RETVAL


int
vtkDEMReader::GetElevationUnitOfMeasure()
		CODE:
		RETVAL = THIS->GetElevationUnitOfMeasure();
		OUTPUT:
		RETVAL


char *
vtkDEMReader::GetFileName()
		CODE:
		RETVAL = THIS->GetFileName();
		OUTPUT:
		RETVAL


int
vtkDEMReader::GetGroundSystem()
		CODE:
		RETVAL = THIS->GetGroundSystem();
		OUTPUT:
		RETVAL


int
vtkDEMReader::GetGroundZone()
		CODE:
		RETVAL = THIS->GetGroundZone();
		OUTPUT:
		RETVAL


float
vtkDEMReader::GetLocalRotation()
		CODE:
		RETVAL = THIS->GetLocalRotation();
		OUTPUT:
		RETVAL


char *
vtkDEMReader::GetMapLabel()
		CODE:
		RETVAL = THIS->GetMapLabel();
		OUTPUT:
		RETVAL


int
vtkDEMReader::GetPlaneUnitOfMeasure()
		CODE:
		RETVAL = THIS->GetPlaneUnitOfMeasure();
		OUTPUT:
		RETVAL


int
vtkDEMReader::GetPolygonSize()
		CODE:
		RETVAL = THIS->GetPolygonSize();
		OUTPUT:
		RETVAL


int  *
vtkDEMReader::GetProfileDimension()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetProfileDimension();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


float  *
vtkDEMReader::GetProjectionParameters()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetProjectionParameters();
		EXTEND(SP, 15);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));
		PUSHs(sv_2mortal(newSVnv(retval[6])));
		PUSHs(sv_2mortal(newSVnv(retval[7])));
		PUSHs(sv_2mortal(newSVnv(retval[8])));
		PUSHs(sv_2mortal(newSVnv(retval[9])));
		PUSHs(sv_2mortal(newSVnv(retval[10])));
		PUSHs(sv_2mortal(newSVnv(retval[11])));
		PUSHs(sv_2mortal(newSVnv(retval[12])));
		PUSHs(sv_2mortal(newSVnv(retval[13])));
		PUSHs(sv_2mortal(newSVnv(retval[14])));


float  *
vtkDEMReader::GetSpatialResolution()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetSpatialResolution();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


static vtkDEMReader*
vtkDEMReader::New()
		CODE:
		RETVAL = vtkDEMReader::New();
		OUTPUT:
		RETVAL


void
vtkDEMReader::SetFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetFileName(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::DepthSortPolyData PREFIX = vtk

PROTOTYPES: DISABLE



vtkCamera *
vtkDepthSortPolyData::GetCamera()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCamera";
		CODE:
		RETVAL = THIS->GetCamera();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


const char *
vtkDepthSortPolyData::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkDepthSortPolyData::GetDirection()
		CODE:
		RETVAL = THIS->GetDirection();
		OUTPUT:
		RETVAL


unsigned long
vtkDepthSortPolyData::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


double  *
vtkDepthSortPolyData::GetOrigin()
		PREINIT:
		double  * retval;
		PPCODE:
		retval = THIS->GetOrigin();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


vtkProp3D *
vtkDepthSortPolyData::GetProp3D()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkProp3D";
		CODE:
		RETVAL = THIS->GetProp3D();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkDepthSortPolyData::GetSortScalars()
		CODE:
		RETVAL = THIS->GetSortScalars();
		OUTPUT:
		RETVAL


double  *
vtkDepthSortPolyData::GetVector()
		PREINIT:
		double  * retval;
		PPCODE:
		retval = THIS->GetVector();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


static vtkDepthSortPolyData*
vtkDepthSortPolyData::New()
		CODE:
		RETVAL = vtkDepthSortPolyData::New();
		OUTPUT:
		RETVAL


void
vtkDepthSortPolyData::SetCamera(arg1)
		vtkCamera *	arg1
		CODE:
		THIS->SetCamera(arg1);
		XSRETURN_EMPTY;


void
vtkDepthSortPolyData::SetDirection(arg1)
		int 	arg1
		CODE:
		THIS->SetDirection(arg1);
		XSRETURN_EMPTY;


void
vtkDepthSortPolyData::SetDirectionToBackToFront()
		CODE:
		THIS->SetDirectionToBackToFront();
		XSRETURN_EMPTY;


void
vtkDepthSortPolyData::SetDirectionToFrontToBack()
		CODE:
		THIS->SetDirectionToFrontToBack();
		XSRETURN_EMPTY;


void
vtkDepthSortPolyData::SetDirectionToSpecifiedVector()
		CODE:
		THIS->SetDirectionToSpecifiedVector();
		XSRETURN_EMPTY;


void
vtkDepthSortPolyData::SetOrigin(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double  	arg1
		double 	arg2
		double 	arg3
		CODE:
		THIS->SetOrigin(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDepthSortPolyData::SetOrigin\n");



void
vtkDepthSortPolyData::SetProp3D(arg1)
		vtkProp3D *	arg1
		CODE:
		THIS->SetProp3D(arg1);
		XSRETURN_EMPTY;


void
vtkDepthSortPolyData::SetSortScalars(arg1)
		int 	arg1
		CODE:
		THIS->SetSortScalars(arg1);
		XSRETURN_EMPTY;


void
vtkDepthSortPolyData::SetVector(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double  	arg1
		double 	arg2
		double 	arg3
		CODE:
		THIS->SetVector(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDepthSortPolyData::SetVector\n");



void
vtkDepthSortPolyData::SortScalarsOff()
		CODE:
		THIS->SortScalarsOff();
		XSRETURN_EMPTY;


void
vtkDepthSortPolyData::SortScalarsOn()
		CODE:
		THIS->SortScalarsOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::EarthSource PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkEarthSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkEarthSource::GetOnRatio()
		CODE:
		RETVAL = THIS->GetOnRatio();
		OUTPUT:
		RETVAL


int
vtkEarthSource::GetOutline()
		CODE:
		RETVAL = THIS->GetOutline();
		OUTPUT:
		RETVAL


float
vtkEarthSource::GetRadius()
		CODE:
		RETVAL = THIS->GetRadius();
		OUTPUT:
		RETVAL


static vtkEarthSource*
vtkEarthSource::New()
		CODE:
		RETVAL = vtkEarthSource::New();
		OUTPUT:
		RETVAL


void
vtkEarthSource::OutlineOff()
		CODE:
		THIS->OutlineOff();
		XSRETURN_EMPTY;


void
vtkEarthSource::OutlineOn()
		CODE:
		THIS->OutlineOn();
		XSRETURN_EMPTY;


void
vtkEarthSource::SetOnRatio(arg1)
		int 	arg1
		CODE:
		THIS->SetOnRatio(arg1);
		XSRETURN_EMPTY;


void
vtkEarthSource::SetOutline(arg1)
		int 	arg1
		CODE:
		THIS->SetOutline(arg1);
		XSRETURN_EMPTY;


void
vtkEarthSource::SetRadius(arg1)
		float 	arg1
		CODE:
		THIS->SetRadius(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::GetRemoteGhostCells PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkGetRemoteGhostCells::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkMultiProcessController *
vtkGetRemoteGhostCells::GetController()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkMultiProcessController";
		CODE:
		RETVAL = THIS->GetController();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkGetRemoteGhostCells*
vtkGetRemoteGhostCells::New()
		CODE:
		RETVAL = vtkGetRemoteGhostCells::New();
		OUTPUT:
		RETVAL


void
vtkGetRemoteGhostCells::SetController(arg1)
		vtkMultiProcessController *	arg1
		CODE:
		THIS->SetController(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::GridTransform PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkGridTransform::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkImageData *
vtkGridTransform::GetDisplacementGrid()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImageData";
		CODE:
		RETVAL = THIS->GetDisplacementGrid();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float
vtkGridTransform::GetDisplacementScale()
		CODE:
		RETVAL = THIS->GetDisplacementScale();
		OUTPUT:
		RETVAL


float
vtkGridTransform::GetDisplacementShift()
		CODE:
		RETVAL = THIS->GetDisplacementShift();
		OUTPUT:
		RETVAL


int
vtkGridTransform::GetInterpolationMode()
		CODE:
		RETVAL = THIS->GetInterpolationMode();
		OUTPUT:
		RETVAL


const char *
vtkGridTransform::GetInterpolationModeAsString()
		CODE:
		RETVAL = THIS->GetInterpolationModeAsString();
		OUTPUT:
		RETVAL


unsigned long
vtkGridTransform::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


vtkAbstractTransform *
vtkGridTransform::MakeTransform()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkAbstractTransform";
		CODE:
		RETVAL = THIS->MakeTransform();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkGridTransform*
vtkGridTransform::New()
		CODE:
		RETVAL = vtkGridTransform::New();
		OUTPUT:
		RETVAL


void
vtkGridTransform::SetDisplacementGrid(arg1)
		vtkImageData *	arg1
		CODE:
		THIS->SetDisplacementGrid(arg1);
		XSRETURN_EMPTY;


void
vtkGridTransform::SetDisplacementScale(arg1)
		float 	arg1
		CODE:
		THIS->SetDisplacementScale(arg1);
		XSRETURN_EMPTY;


void
vtkGridTransform::SetDisplacementShift(arg1)
		float 	arg1
		CODE:
		THIS->SetDisplacementShift(arg1);
		XSRETURN_EMPTY;


void
vtkGridTransform::SetInterpolationMode(mode)
		int 	mode
		CODE:
		THIS->SetInterpolationMode(mode);
		XSRETURN_EMPTY;


void
vtkGridTransform::SetInterpolationModeToCubic()
		CODE:
		THIS->SetInterpolationModeToCubic();
		XSRETURN_EMPTY;


void
vtkGridTransform::SetInterpolationModeToLinear()
		CODE:
		THIS->SetInterpolationModeToLinear();
		XSRETURN_EMPTY;


void
vtkGridTransform::SetInterpolationModeToNearestNeighbor()
		CODE:
		THIS->SetInterpolationModeToNearestNeighbor();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::ImageToPolyDataFilter PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImageToPolyDataFilter::DecimationOff()
		CODE:
		THIS->DecimationOff();
		XSRETURN_EMPTY;


void
vtkImageToPolyDataFilter::DecimationOn()
		CODE:
		THIS->DecimationOn();
		XSRETURN_EMPTY;


const char *
vtkImageToPolyDataFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageToPolyDataFilter::GetColorMode()
		CODE:
		RETVAL = THIS->GetColorMode();
		OUTPUT:
		RETVAL


int
vtkImageToPolyDataFilter::GetDecimation()
		CODE:
		RETVAL = THIS->GetDecimation();
		OUTPUT:
		RETVAL


float
vtkImageToPolyDataFilter::GetDecimationError()
		CODE:
		RETVAL = THIS->GetDecimationError();
		OUTPUT:
		RETVAL


int
vtkImageToPolyDataFilter::GetError()
		CODE:
		RETVAL = THIS->GetError();
		OUTPUT:
		RETVAL


vtkScalarsToColors *
vtkImageToPolyDataFilter::GetLookupTable()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkScalarsToColors";
		CODE:
		RETVAL = THIS->GetLookupTable();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkImageToPolyDataFilter::GetNumberOfSmoothingIterations()
		CODE:
		RETVAL = THIS->GetNumberOfSmoothingIterations();
		OUTPUT:
		RETVAL


int
vtkImageToPolyDataFilter::GetOutputStyle()
		CODE:
		RETVAL = THIS->GetOutputStyle();
		OUTPUT:
		RETVAL


int
vtkImageToPolyDataFilter::GetSmoothing()
		CODE:
		RETVAL = THIS->GetSmoothing();
		OUTPUT:
		RETVAL


int
vtkImageToPolyDataFilter::GetSubImageSize()
		CODE:
		RETVAL = THIS->GetSubImageSize();
		OUTPUT:
		RETVAL


static vtkImageToPolyDataFilter*
vtkImageToPolyDataFilter::New()
		CODE:
		RETVAL = vtkImageToPolyDataFilter::New();
		OUTPUT:
		RETVAL


void
vtkImageToPolyDataFilter::SetColorMode(arg1)
		int 	arg1
		CODE:
		THIS->SetColorMode(arg1);
		XSRETURN_EMPTY;


void
vtkImageToPolyDataFilter::SetColorModeToLUT()
		CODE:
		THIS->SetColorModeToLUT();
		XSRETURN_EMPTY;


void
vtkImageToPolyDataFilter::SetColorModeToLinear256()
		CODE:
		THIS->SetColorModeToLinear256();
		XSRETURN_EMPTY;


void
vtkImageToPolyDataFilter::SetDecimation(arg1)
		int 	arg1
		CODE:
		THIS->SetDecimation(arg1);
		XSRETURN_EMPTY;


void
vtkImageToPolyDataFilter::SetDecimationError(arg1)
		float 	arg1
		CODE:
		THIS->SetDecimationError(arg1);
		XSRETURN_EMPTY;


void
vtkImageToPolyDataFilter::SetError(arg1)
		int 	arg1
		CODE:
		THIS->SetError(arg1);
		XSRETURN_EMPTY;


void
vtkImageToPolyDataFilter::SetLookupTable(arg1)
		vtkScalarsToColors *	arg1
		CODE:
		THIS->SetLookupTable(arg1);
		XSRETURN_EMPTY;


void
vtkImageToPolyDataFilter::SetNumberOfSmoothingIterations(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfSmoothingIterations(arg1);
		XSRETURN_EMPTY;


void
vtkImageToPolyDataFilter::SetOutputStyle(arg1)
		int 	arg1
		CODE:
		THIS->SetOutputStyle(arg1);
		XSRETURN_EMPTY;


void
vtkImageToPolyDataFilter::SetOutputStyleToPixelize()
		CODE:
		THIS->SetOutputStyleToPixelize();
		XSRETURN_EMPTY;


void
vtkImageToPolyDataFilter::SetOutputStyleToPolygonalize()
		CODE:
		THIS->SetOutputStyleToPolygonalize();
		XSRETURN_EMPTY;


void
vtkImageToPolyDataFilter::SetOutputStyleToRunLength()
		CODE:
		THIS->SetOutputStyleToRunLength();
		XSRETURN_EMPTY;


void
vtkImageToPolyDataFilter::SetSmoothing(arg1)
		int 	arg1
		CODE:
		THIS->SetSmoothing(arg1);
		XSRETURN_EMPTY;


void
vtkImageToPolyDataFilter::SetSubImageSize(arg1)
		int 	arg1
		CODE:
		THIS->SetSubImageSize(arg1);
		XSRETURN_EMPTY;


void
vtkImageToPolyDataFilter::SmoothingOff()
		CODE:
		THIS->SmoothingOff();
		XSRETURN_EMPTY;


void
vtkImageToPolyDataFilter::SmoothingOn()
		CODE:
		THIS->SmoothingOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::ImageReslice PREFIX = vtk

PROTOTYPES: DISABLE



float  *
vtkImageReslice::GetBackgroundColor()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetBackgroundColor();
		EXTEND(SP, 4);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));


float
vtkImageReslice::GetBackgroundLevel()
		CODE:
		RETVAL = THIS->GetBackgroundLevel();
		OUTPUT:
		RETVAL


const char *
vtkImageReslice::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageReslice::GetInterpolate()
		CODE:
		RETVAL = THIS->GetInterpolate();
		OUTPUT:
		RETVAL


int
vtkImageReslice::GetInterpolationMode()
		CODE:
		RETVAL = THIS->GetInterpolationMode();
		OUTPUT:
		RETVAL


const char *
vtkImageReslice::GetInterpolationModeAsString()
		CODE:
		RETVAL = THIS->GetInterpolationModeAsString();
		OUTPUT:
		RETVAL


unsigned long
vtkImageReslice::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


int
vtkImageReslice::GetMirror()
		CODE:
		RETVAL = THIS->GetMirror();
		OUTPUT:
		RETVAL


int
vtkImageReslice::GetOptimization()
		CODE:
		RETVAL = THIS->GetOptimization();
		OUTPUT:
		RETVAL


int
vtkImageReslice::GetOutputAlwaysCenteredOnInput()
		CODE:
		RETVAL = THIS->GetOutputAlwaysCenteredOnInput();
		OUTPUT:
		RETVAL


int  *
vtkImageReslice::GetOutputExtent()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetOutputExtent();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


float  *
vtkImageReslice::GetOutputOrigin()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetOutputOrigin();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkImageReslice::GetOutputSpacing()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetOutputSpacing();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


vtkMatrix4x4 *
vtkImageReslice::GetResliceAxes()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkMatrix4x4";
		CODE:
		RETVAL = THIS->GetResliceAxes();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkAbstractTransform *
vtkImageReslice::GetResliceTransform()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkAbstractTransform";
		CODE:
		RETVAL = THIS->GetResliceTransform();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkImageReslice::GetWrap()
		CODE:
		RETVAL = THIS->GetWrap();
		OUTPUT:
		RETVAL


void
vtkImageReslice::InterpolateOff()
		CODE:
		THIS->InterpolateOff();
		XSRETURN_EMPTY;


void
vtkImageReslice::InterpolateOn()
		CODE:
		THIS->InterpolateOn();
		XSRETURN_EMPTY;


void
vtkImageReslice::MirrorOff()
		CODE:
		THIS->MirrorOff();
		XSRETURN_EMPTY;


void
vtkImageReslice::MirrorOn()
		CODE:
		THIS->MirrorOn();
		XSRETURN_EMPTY;


static vtkImageReslice*
vtkImageReslice::New()
		CODE:
		RETVAL = vtkImageReslice::New();
		OUTPUT:
		RETVAL


void
vtkImageReslice::OptimizationOff()
		CODE:
		THIS->OptimizationOff();
		XSRETURN_EMPTY;


void
vtkImageReslice::OptimizationOn()
		CODE:
		THIS->OptimizationOn();
		XSRETURN_EMPTY;


void
vtkImageReslice::OutputAlwaysCenteredOnInputOff()
		CODE:
		THIS->OutputAlwaysCenteredOnInputOff();
		XSRETURN_EMPTY;


void
vtkImageReslice::OutputAlwaysCenteredOnInputOn()
		CODE:
		THIS->OutputAlwaysCenteredOnInputOn();
		XSRETURN_EMPTY;


void
vtkImageReslice::SetBackgroundColor(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		float  	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		CODE:
		THIS->SetBackgroundColor(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageReslice::SetBackgroundColor\n");



void
vtkImageReslice::SetBackgroundLevel(v)
		float 	v
		CODE:
		THIS->SetBackgroundLevel(v);
		XSRETURN_EMPTY;


void
vtkImageReslice::SetInterpolate(t)
		int 	t
		CODE:
		THIS->SetInterpolate(t);
		XSRETURN_EMPTY;


void
vtkImageReslice::SetInterpolationMode(arg1)
		int 	arg1
		CODE:
		THIS->SetInterpolationMode(arg1);
		XSRETURN_EMPTY;


void
vtkImageReslice::SetInterpolationModeToCubic()
		CODE:
		THIS->SetInterpolationModeToCubic();
		XSRETURN_EMPTY;


void
vtkImageReslice::SetInterpolationModeToLinear()
		CODE:
		THIS->SetInterpolationModeToLinear();
		XSRETURN_EMPTY;


void
vtkImageReslice::SetInterpolationModeToNearestNeighbor()
		CODE:
		THIS->SetInterpolationModeToNearestNeighbor();
		XSRETURN_EMPTY;


void
vtkImageReslice::SetMirror(arg1)
		int 	arg1
		CODE:
		THIS->SetMirror(arg1);
		XSRETURN_EMPTY;


void
vtkImageReslice::SetOptimization(arg1)
		int 	arg1
		CODE:
		THIS->SetOptimization(arg1);
		XSRETURN_EMPTY;


void
vtkImageReslice::SetOutputAlwaysCenteredOnInput(arg1)
		int 	arg1
		CODE:
		THIS->SetOutputAlwaysCenteredOnInput(arg1);
		XSRETURN_EMPTY;


void
vtkImageReslice::SetOutputExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int  	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetOutputExtent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageReslice::SetOutputExtent\n");



void
vtkImageReslice::SetOutputOrigin(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetOutputOrigin(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageReslice::SetOutputOrigin\n");



void
vtkImageReslice::SetOutputSpacing(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetOutputSpacing(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageReslice::SetOutputSpacing\n");



void
vtkImageReslice::SetResliceAxes(arg1)
		vtkMatrix4x4 *	arg1
		CODE:
		THIS->SetResliceAxes(arg1);
		XSRETURN_EMPTY;


void
vtkImageReslice::SetResliceTransform(arg1)
		vtkAbstractTransform *	arg1
		CODE:
		THIS->SetResliceTransform(arg1);
		XSRETURN_EMPTY;


void
vtkImageReslice::SetWrap(arg1)
		int 	arg1
		CODE:
		THIS->SetWrap(arg1);
		XSRETURN_EMPTY;


void
vtkImageReslice::WrapOff()
		CODE:
		THIS->WrapOff();
		XSRETURN_EMPTY;


void
vtkImageReslice::WrapOn()
		CODE:
		THIS->WrapOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::IVWriter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkIVWriter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkIVWriter*
vtkIVWriter::New()
		CODE:
		RETVAL = vtkIVWriter::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::LandmarkTransform PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkLandmarkTransform::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


unsigned long
vtkLandmarkTransform::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


int
vtkLandmarkTransform::GetMode()
		CODE:
		RETVAL = THIS->GetMode();
		OUTPUT:
		RETVAL


const char *
vtkLandmarkTransform::GetModeAsString()
		CODE:
		RETVAL = THIS->GetModeAsString();
		OUTPUT:
		RETVAL


vtkPoints *
vtkLandmarkTransform::GetSourceLandmarks()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPoints";
		CODE:
		RETVAL = THIS->GetSourceLandmarks();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkPoints *
vtkLandmarkTransform::GetTargetLandmarks()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPoints";
		CODE:
		RETVAL = THIS->GetTargetLandmarks();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkLandmarkTransform::Inverse()
		CODE:
		THIS->Inverse();
		XSRETURN_EMPTY;


vtkAbstractTransform *
vtkLandmarkTransform::MakeTransform()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkAbstractTransform";
		CODE:
		RETVAL = THIS->MakeTransform();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkLandmarkTransform*
vtkLandmarkTransform::New()
		CODE:
		RETVAL = vtkLandmarkTransform::New();
		OUTPUT:
		RETVAL


void
vtkLandmarkTransform::SetMode(arg1)
		int 	arg1
		CODE:
		THIS->SetMode(arg1);
		XSRETURN_EMPTY;


void
vtkLandmarkTransform::SetModeToRigidBody()
		CODE:
		THIS->SetModeToRigidBody();
		XSRETURN_EMPTY;


void
vtkLandmarkTransform::SetModeToSimilarity()
		CODE:
		THIS->SetModeToSimilarity();
		XSRETURN_EMPTY;


void
vtkLandmarkTransform::SetSourceLandmarks(points)
		vtkPoints *	points
		CODE:
		THIS->SetSourceLandmarks(points);
		XSRETURN_EMPTY;


void
vtkLandmarkTransform::SetTargetLandmarks(points)
		vtkPoints *	points
		CODE:
		THIS->SetTargetLandmarks(points);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::LegendBoxActor PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkLegendBoxActor::BoldOff()
		CODE:
		THIS->BoldOff();
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::BoldOn()
		CODE:
		THIS->BoldOn();
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::BorderOff()
		CODE:
		THIS->BorderOff();
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::BorderOn()
		CODE:
		THIS->BorderOn();
		XSRETURN_EMPTY;


int
vtkLegendBoxActor::GetBold()
		CODE:
		RETVAL = THIS->GetBold();
		OUTPUT:
		RETVAL


int
vtkLegendBoxActor::GetBorder()
		CODE:
		RETVAL = THIS->GetBorder();
		OUTPUT:
		RETVAL


const char *
vtkLegendBoxActor::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


const char *
vtkLegendBoxActor::GetEntryString(i)
		int 	i
		CODE:
		RETVAL = THIS->GetEntryString(i);
		OUTPUT:
		RETVAL


vtkPolyData *
vtkLegendBoxActor::GetEntrySymbol(i)
		int 	i
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPolyData";
		CODE:
		RETVAL = THIS->GetEntrySymbol(i);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkLegendBoxActor::GetFontFamily()
		CODE:
		RETVAL = THIS->GetFontFamily();
		OUTPUT:
		RETVAL


int
vtkLegendBoxActor::GetItalic()
		CODE:
		RETVAL = THIS->GetItalic();
		OUTPUT:
		RETVAL


int
vtkLegendBoxActor::GetLockBorder()
		CODE:
		RETVAL = THIS->GetLockBorder();
		OUTPUT:
		RETVAL


int
vtkLegendBoxActor::GetNumberOfEntries()
		CODE:
		RETVAL = THIS->GetNumberOfEntries();
		OUTPUT:
		RETVAL


int
vtkLegendBoxActor::GetPadding()
		CODE:
		RETVAL = THIS->GetPadding();
		OUTPUT:
		RETVAL


int
vtkLegendBoxActor::GetScalarVisibility()
		CODE:
		RETVAL = THIS->GetScalarVisibility();
		OUTPUT:
		RETVAL


int
vtkLegendBoxActor::GetShadow()
		CODE:
		RETVAL = THIS->GetShadow();
		OUTPUT:
		RETVAL


void
vtkLegendBoxActor::ItalicOff()
		CODE:
		THIS->ItalicOff();
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::ItalicOn()
		CODE:
		THIS->ItalicOn();
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::LockBorderOff()
		CODE:
		THIS->LockBorderOff();
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::LockBorderOn()
		CODE:
		THIS->LockBorderOn();
		XSRETURN_EMPTY;


static vtkLegendBoxActor*
vtkLegendBoxActor::New()
		CODE:
		RETVAL = vtkLegendBoxActor::New();
		OUTPUT:
		RETVAL


void
vtkLegendBoxActor::ScalarVisibilityOff()
		CODE:
		THIS->ScalarVisibilityOff();
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::ScalarVisibilityOn()
		CODE:
		THIS->ScalarVisibilityOn();
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::SetBold(arg1)
		int 	arg1
		CODE:
		THIS->SetBold(arg1);
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::SetBorder(arg1)
		int 	arg1
		CODE:
		THIS->SetBorder(arg1);
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::SetEntryColor(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		int 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		CODE:
		THIS->SetEntryColor(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLegendBoxActor::SetEntryColor\n");



void
vtkLegendBoxActor::SetEntryString(i, string)
		int 	i
		char *	string
		CODE:
		THIS->SetEntryString(i, string);
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::SetEntrySymbol(i, symbol)
		int 	i
		vtkPolyData *	symbol
		CODE:
		THIS->SetEntrySymbol(i, symbol);
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::SetFontFamily(arg1)
		int 	arg1
		CODE:
		THIS->SetFontFamily(arg1);
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::SetFontFamilyToArial()
		CODE:
		THIS->SetFontFamilyToArial();
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::SetFontFamilyToCourier()
		CODE:
		THIS->SetFontFamilyToCourier();
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::SetFontFamilyToTimes()
		CODE:
		THIS->SetFontFamilyToTimes();
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::SetItalic(arg1)
		int 	arg1
		CODE:
		THIS->SetItalic(arg1);
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::SetLockBorder(arg1)
		int 	arg1
		CODE:
		THIS->SetLockBorder(arg1);
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::SetNumberOfEntries(num)
		int 	num
		CODE:
		THIS->SetNumberOfEntries(num);
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::SetPadding(arg1)
		int 	arg1
		CODE:
		THIS->SetPadding(arg1);
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::SetScalarVisibility(arg1)
		int 	arg1
		CODE:
		THIS->SetScalarVisibility(arg1);
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::SetShadow(arg1)
		int 	arg1
		CODE:
		THIS->SetShadow(arg1);
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::ShadowOff()
		CODE:
		THIS->ShadowOff();
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::ShadowOn()
		CODE:
		THIS->ShadowOn();
		XSRETURN_EMPTY;


void
vtkLegendBoxActor::ShallowCopy(prop)
		vtkProp *	prop
		CODE:
		THIS->ShallowCopy(prop);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::LightKit PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkLightKit::AddLightsToRenderer(renderer)
		vtkRenderer *	renderer
		CODE:
		THIS->AddLightsToRenderer(renderer);
		XSRETURN_EMPTY;


void
vtkLightKit::DeepCopy(kit)
		vtkLightKit *	kit
		CODE:
		THIS->DeepCopy(kit);
		XSRETURN_EMPTY;


const char *
vtkLightKit::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkLightKit::GetFillLightAngle()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetFillLightAngle();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


float
vtkLightKit::GetFillLightAzimuth()
		CODE:
		RETVAL = THIS->GetFillLightAzimuth();
		OUTPUT:
		RETVAL


float  *
vtkLightKit::GetFillLightColor()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetFillLightColor();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float
vtkLightKit::GetFillLightElevation()
		CODE:
		RETVAL = THIS->GetFillLightElevation();
		OUTPUT:
		RETVAL


float
vtkLightKit::GetFillLightWarmth()
		CODE:
		RETVAL = THIS->GetFillLightWarmth();
		OUTPUT:
		RETVAL


float  *
vtkLightKit::GetHeadlightColor()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetHeadlightColor();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float
vtkLightKit::GetHeadlightWarmth()
		CODE:
		RETVAL = THIS->GetHeadlightWarmth();
		OUTPUT:
		RETVAL


float  *
vtkLightKit::GetKeyLightAngle()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetKeyLightAngle();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


float
vtkLightKit::GetKeyLightAzimuth()
		CODE:
		RETVAL = THIS->GetKeyLightAzimuth();
		OUTPUT:
		RETVAL


float  *
vtkLightKit::GetKeyLightColor()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetKeyLightColor();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float
vtkLightKit::GetKeyLightElevation()
		CODE:
		RETVAL = THIS->GetKeyLightElevation();
		OUTPUT:
		RETVAL


float
vtkLightKit::GetKeyLightIntensity()
		CODE:
		RETVAL = THIS->GetKeyLightIntensity();
		OUTPUT:
		RETVAL


float
vtkLightKit::GetKeyLightWarmth()
		CODE:
		RETVAL = THIS->GetKeyLightWarmth();
		OUTPUT:
		RETVAL


float
vtkLightKit::GetKeyToFillRatio()
		CODE:
		RETVAL = THIS->GetKeyToFillRatio();
		OUTPUT:
		RETVAL


float
vtkLightKit::GetKeyToHeadRatio()
		CODE:
		RETVAL = THIS->GetKeyToHeadRatio();
		OUTPUT:
		RETVAL


int
vtkLightKit::GetMaintainLuminance()
		CODE:
		RETVAL = THIS->GetMaintainLuminance();
		OUTPUT:
		RETVAL


void
vtkLightKit::MaintainLuminanceOff()
		CODE:
		THIS->MaintainLuminanceOff();
		XSRETURN_EMPTY;


void
vtkLightKit::MaintainLuminanceOn()
		CODE:
		THIS->MaintainLuminanceOn();
		XSRETURN_EMPTY;


void
vtkLightKit::Modified()
		CODE:
		THIS->Modified();
		XSRETURN_EMPTY;


static vtkLightKit*
vtkLightKit::New()
		CODE:
		RETVAL = vtkLightKit::New();
		OUTPUT:
		RETVAL


void
vtkLightKit::RemoveLightsFromRenderer(renderer)
		vtkRenderer *	renderer
		CODE:
		THIS->RemoveLightsFromRenderer(renderer);
		XSRETURN_EMPTY;


void
vtkLightKit::SetFillLightAngle(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float 	arg1
		float 	arg2
		CODE:
		THIS->SetFillLightAngle(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLightKit::SetFillLightAngle\n");



void
vtkLightKit::SetFillLightAzimuth(x)
		float 	x
		CODE:
		THIS->SetFillLightAzimuth(x);
		XSRETURN_EMPTY;


void
vtkLightKit::SetFillLightElevation(x)
		float 	x
		CODE:
		THIS->SetFillLightElevation(x);
		XSRETURN_EMPTY;


void
vtkLightKit::SetFillLightWarmth(arg1)
		float 	arg1
		CODE:
		THIS->SetFillLightWarmth(arg1);
		XSRETURN_EMPTY;


void
vtkLightKit::SetHeadlightWarmth(arg1)
		float 	arg1
		CODE:
		THIS->SetHeadlightWarmth(arg1);
		XSRETURN_EMPTY;


void
vtkLightKit::SetKeyLightAngle(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float 	arg1
		float 	arg2
		CODE:
		THIS->SetKeyLightAngle(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLightKit::SetKeyLightAngle\n");



void
vtkLightKit::SetKeyLightAzimuth(x)
		float 	x
		CODE:
		THIS->SetKeyLightAzimuth(x);
		XSRETURN_EMPTY;


void
vtkLightKit::SetKeyLightElevation(x)
		float 	x
		CODE:
		THIS->SetKeyLightElevation(x);
		XSRETURN_EMPTY;


void
vtkLightKit::SetKeyLightIntensity(arg1)
		float 	arg1
		CODE:
		THIS->SetKeyLightIntensity(arg1);
		XSRETURN_EMPTY;


void
vtkLightKit::SetKeyLightWarmth(arg1)
		float 	arg1
		CODE:
		THIS->SetKeyLightWarmth(arg1);
		XSRETURN_EMPTY;


void
vtkLightKit::SetKeyToFillRatio(arg1)
		float 	arg1
		CODE:
		THIS->SetKeyToFillRatio(arg1);
		XSRETURN_EMPTY;


void
vtkLightKit::SetKeyToHeadRatio(arg1)
		float 	arg1
		CODE:
		THIS->SetKeyToHeadRatio(arg1);
		XSRETURN_EMPTY;


void
vtkLightKit::SetMaintainLuminance(arg1)
		int 	arg1
		CODE:
		THIS->SetMaintainLuminance(arg1);
		XSRETURN_EMPTY;


void
vtkLightKit::Update()
		CODE:
		THIS->Update();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::MassProperties PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkMassProperties::Execute()
		CODE:
		THIS->Execute();
		XSRETURN_EMPTY;


const char *
vtkMassProperties::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkPolyData *
vtkMassProperties::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPolyData";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


double
vtkMassProperties::GetKx()
		CODE:
		RETVAL = THIS->GetKx();
		OUTPUT:
		RETVAL


double
vtkMassProperties::GetKy()
		CODE:
		RETVAL = THIS->GetKy();
		OUTPUT:
		RETVAL


double
vtkMassProperties::GetKz()
		CODE:
		RETVAL = THIS->GetKz();
		OUTPUT:
		RETVAL


double
vtkMassProperties::GetNormalizedShapeIndex()
		CODE:
		RETVAL = THIS->GetNormalizedShapeIndex();
		OUTPUT:
		RETVAL


double
vtkMassProperties::GetSurfaceArea()
		CODE:
		RETVAL = THIS->GetSurfaceArea();
		OUTPUT:
		RETVAL


double
vtkMassProperties::GetVolume()
		CODE:
		RETVAL = THIS->GetVolume();
		OUTPUT:
		RETVAL


double
vtkMassProperties::GetVolumeX()
		CODE:
		RETVAL = THIS->GetVolumeX();
		OUTPUT:
		RETVAL


double
vtkMassProperties::GetVolumeY()
		CODE:
		RETVAL = THIS->GetVolumeY();
		OUTPUT:
		RETVAL


double
vtkMassProperties::GetVolumeZ()
		CODE:
		RETVAL = THIS->GetVolumeZ();
		OUTPUT:
		RETVAL


static vtkMassProperties*
vtkMassProperties::New()
		CODE:
		RETVAL = vtkMassProperties::New();
		OUTPUT:
		RETVAL


void
vtkMassProperties::SetInput(input)
		vtkPolyData *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;


void
vtkMassProperties::Update()
		CODE:
		THIS->Update();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::MultiProcessController PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkMultiProcessController::ForceDeepCopyOff()
		CODE:
		THIS->ForceDeepCopyOff();
		XSRETURN_EMPTY;


void
vtkMultiProcessController::ForceDeepCopyOn()
		CODE:
		THIS->ForceDeepCopyOn();
		XSRETURN_EMPTY;


int
vtkMultiProcessController::GetBreakFlag()
		CODE:
		RETVAL = THIS->GetBreakFlag();
		OUTPUT:
		RETVAL


const char *
vtkMultiProcessController::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkMultiProcessController::GetForceDeepCopy()
		CODE:
		RETVAL = THIS->GetForceDeepCopy();
		OUTPUT:
		RETVAL


vtkMultiProcessController *
vtkMultiProcessController::GetGlobalController()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkMultiProcessController";
		CODE:
		RETVAL = THIS->GetGlobalController();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkMultiProcessController::GetLocalProcessId()
		CODE:
		RETVAL = THIS->GetLocalProcessId();
		OUTPUT:
		RETVAL


int
vtkMultiProcessController::GetNumberOfProcesses()
		CODE:
		RETVAL = THIS->GetNumberOfProcesses();
		OUTPUT:
		RETVAL


float
vtkMultiProcessController::GetReadTime()
		CODE:
		RETVAL = THIS->GetReadTime();
		OUTPUT:
		RETVAL


float
vtkMultiProcessController::GetReceiveTime()
		CODE:
		RETVAL = THIS->GetReceiveTime();
		OUTPUT:
		RETVAL


float
vtkMultiProcessController::GetReceiveWaitTime()
		CODE:
		RETVAL = THIS->GetReceiveWaitTime();
		OUTPUT:
		RETVAL


float
vtkMultiProcessController::GetSendTime()
		CODE:
		RETVAL = THIS->GetSendTime();
		OUTPUT:
		RETVAL


float
vtkMultiProcessController::GetSendWaitTime()
		CODE:
		RETVAL = THIS->GetSendWaitTime();
		OUTPUT:
		RETVAL


float
vtkMultiProcessController::GetWriteTime()
		CODE:
		RETVAL = THIS->GetWriteTime();
		OUTPUT:
		RETVAL


void
vtkMultiProcessController::MultipleMethodExecute()
		CODE:
		THIS->MultipleMethodExecute();
		XSRETURN_EMPTY;


static vtkMultiProcessController*
vtkMultiProcessController::New()
		CODE:
		RETVAL = vtkMultiProcessController::New();
		OUTPUT:
		RETVAL


void
vtkMultiProcessController::ProcessRMIs()
		CODE:
		THIS->ProcessRMIs();
		XSRETURN_EMPTY;


int
vtkMultiProcessController::Receive(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		char *	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		CODE:
		RETVAL = THIS->Receive(arg1, arg2, arg3, arg4);
		OUTPUT:
		RETVAL
	CASE: items == 4
		vtkDataObject *	arg1
		int 	arg2
		int 	arg3
		CODE:
		RETVAL = THIS->Receive(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkMultiProcessController::Receive\n");



int
vtkMultiProcessController::Send(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		char *	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		CODE:
		RETVAL = THIS->Send(arg1, arg2, arg3, arg4);
		OUTPUT:
		RETVAL
	CASE: items == 4
		vtkDataObject *	arg1
		int 	arg2
		int 	arg3
		CODE:
		RETVAL = THIS->Send(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkMultiProcessController::Send\n");



void
vtkMultiProcessController::SetBreakFlag(arg1)
		int 	arg1
		CODE:
		THIS->SetBreakFlag(arg1);
		XSRETURN_EMPTY;


void
vtkMultiProcessController::SetForceDeepCopy(arg1)
		int 	arg1
		CODE:
		THIS->SetForceDeepCopy(arg1);
		XSRETURN_EMPTY;


void
vtkMultiProcessController::SetNumberOfProcesses(num)
		int 	num
		CODE:
		THIS->SetNumberOfProcesses(num);
		XSRETURN_EMPTY;


void
vtkMultiProcessController::SingleMethodExecute()
		CODE:
		THIS->SingleMethodExecute();
		XSRETURN_EMPTY;


void
vtkMultiProcessController::TriggerRMI(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		char *	arg2
		int 	arg3
		CODE:
		THIS->TriggerRMI(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 3
		int 	arg1
		int 	arg2
		CODE:
		THIS->TriggerRMI(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkMultiProcessController::TriggerRMI\n");


MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::OBJReader PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkOBJReader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


char *
vtkOBJReader::GetFileName()
		CODE:
		RETVAL = THIS->GetFileName();
		OUTPUT:
		RETVAL


static vtkOBJReader*
vtkOBJReader::New()
		CODE:
		RETVAL = vtkOBJReader::New();
		OUTPUT:
		RETVAL


void
vtkOBJReader::SetFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetFileName(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::OutlineCornerFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkOutlineCornerFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkOutlineCornerFilter::GetCornerFactor()
		CODE:
		RETVAL = THIS->GetCornerFactor();
		OUTPUT:
		RETVAL


static vtkOutlineCornerFilter*
vtkOutlineCornerFilter::New()
		CODE:
		RETVAL = vtkOutlineCornerFilter::New();
		OUTPUT:
		RETVAL


void
vtkOutlineCornerFilter::SetCornerFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetCornerFactor(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::OutlineCornerSource PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkOutlineCornerSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkOutlineCornerSource::GetCornerFactor()
		CODE:
		RETVAL = THIS->GetCornerFactor();
		OUTPUT:
		RETVAL


static vtkOutlineCornerSource*
vtkOutlineCornerSource::New()
		CODE:
		RETVAL = vtkOutlineCornerSource::New();
		OUTPUT:
		RETVAL


void
vtkOutlineCornerSource::SetCornerFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetCornerFactor(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::PieceScalars PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkPieceScalars::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkPieceScalars*
vtkPieceScalars::New()
		CODE:
		RETVAL = vtkPieceScalars::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::ProjectedTexture PREFIX = vtk

PROTOTYPES: DISABLE



float  *
vtkProjectedTexture::GetAspectRatio()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetAspectRatio();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


const char *
vtkProjectedTexture::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkProjectedTexture::GetFocalPoint()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetFocalPoint();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkProjectedTexture::GetOrientation()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetOrientation();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkProjectedTexture::GetPosition()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetPosition();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkProjectedTexture::GetSRange()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetSRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


float  *
vtkProjectedTexture::GetTRange()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetTRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


float  *
vtkProjectedTexture::GetUp()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetUp();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


static vtkProjectedTexture*
vtkProjectedTexture::New()
		CODE:
		RETVAL = vtkProjectedTexture::New();
		OUTPUT:
		RETVAL


void
vtkProjectedTexture::SetAspectRatio(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetAspectRatio(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProjectedTexture::SetAspectRatio\n");



void
vtkProjectedTexture::SetFocalPoint(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetFocalPoint(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProjectedTexture::SetFocalPoint\n");



void
vtkProjectedTexture::SetPosition(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetPosition(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProjectedTexture::SetPosition\n");



void
vtkProjectedTexture::SetSRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetSRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProjectedTexture::SetSRange\n");



void
vtkProjectedTexture::SetTRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetTRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProjectedTexture::SetTRange\n");



void
vtkProjectedTexture::SetUp(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetUp(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProjectedTexture::SetUp\n");


MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::RenderLargeImage PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkRenderLargeImage::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkRenderer *
vtkRenderLargeImage::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkRenderer";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkRenderLargeImage::GetMagnification()
		CODE:
		RETVAL = THIS->GetMagnification();
		OUTPUT:
		RETVAL


static vtkRenderLargeImage*
vtkRenderLargeImage::New()
		CODE:
		RETVAL = vtkRenderLargeImage::New();
		OUTPUT:
		RETVAL


void
vtkRenderLargeImage::SetInput(arg1)
		vtkRenderer *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;


void
vtkRenderLargeImage::SetMagnification(arg1)
		int 	arg1
		CODE:
		THIS->SetMagnification(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::RIBExporter PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkRIBExporter::BackgroundOff()
		CODE:
		THIS->BackgroundOff();
		XSRETURN_EMPTY;


void
vtkRIBExporter::BackgroundOn()
		CODE:
		THIS->BackgroundOn();
		XSRETURN_EMPTY;


int
vtkRIBExporter::GetBackground()
		CODE:
		RETVAL = THIS->GetBackground();
		OUTPUT:
		RETVAL


const char *
vtkRIBExporter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


char *
vtkRIBExporter::GetFilePrefix()
		CODE:
		RETVAL = THIS->GetFilePrefix();
		OUTPUT:
		RETVAL


int  *
vtkRIBExporter::GetPixelSamples()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetPixelSamples();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


int  *
vtkRIBExporter::GetSize()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetSize();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


char *
vtkRIBExporter::GetTexturePrefix()
		CODE:
		RETVAL = THIS->GetTexturePrefix();
		OUTPUT:
		RETVAL


static vtkRIBExporter*
vtkRIBExporter::New()
		CODE:
		RETVAL = vtkRIBExporter::New();
		OUTPUT:
		RETVAL


void
vtkRIBExporter::SetBackground(arg1)
		int 	arg1
		CODE:
		THIS->SetBackground(arg1);
		XSRETURN_EMPTY;


void
vtkRIBExporter::SetFilePrefix(arg1)
		char *	arg1
		CODE:
		THIS->SetFilePrefix(arg1);
		XSRETURN_EMPTY;


void
vtkRIBExporter::SetPixelSamples(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int  	arg1
		int 	arg2
		CODE:
		THIS->SetPixelSamples(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkRIBExporter::SetPixelSamples\n");



void
vtkRIBExporter::SetSize(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int  	arg1
		int 	arg2
		CODE:
		THIS->SetSize(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkRIBExporter::SetSize\n");



void
vtkRIBExporter::SetTexturePrefix(arg1)
		char *	arg1
		CODE:
		THIS->SetTexturePrefix(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::RIBLight PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkRIBLight::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkRIBLight::GetShadows()
		CODE:
		RETVAL = THIS->GetShadows();
		OUTPUT:
		RETVAL


static vtkRIBLight*
vtkRIBLight::New()
		CODE:
		RETVAL = vtkRIBLight::New();
		OUTPUT:
		RETVAL


void
vtkRIBLight::Render(ren, index)
		vtkRenderer *	ren
		int 	index
		CODE:
		THIS->Render(ren, index);
		XSRETURN_EMPTY;


void
vtkRIBLight::SetShadows(arg1)
		int 	arg1
		CODE:
		THIS->SetShadows(arg1);
		XSRETURN_EMPTY;


void
vtkRIBLight::ShadowsOff()
		CODE:
		THIS->ShadowsOff();
		XSRETURN_EMPTY;


void
vtkRIBLight::ShadowsOn()
		CODE:
		THIS->ShadowsOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::RIBProperty PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkRIBProperty::AddParameter(parameter, value)
		char *	parameter
		char *	value
		CODE:
		THIS->AddParameter(parameter, value);
		XSRETURN_EMPTY;


void
vtkRIBProperty::AddVariable(variable, declaration)
		char *	variable
		char *	declaration
		CODE:
		THIS->AddVariable(variable, declaration);
		XSRETURN_EMPTY;


const char *
vtkRIBProperty::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


char *
vtkRIBProperty::GetDeclarations()
		CODE:
		RETVAL = THIS->GetDeclarations();
		OUTPUT:
		RETVAL


char *
vtkRIBProperty::GetDisplacementShader()
		CODE:
		RETVAL = THIS->GetDisplacementShader();
		OUTPUT:
		RETVAL


char *
vtkRIBProperty::GetParameters()
		CODE:
		RETVAL = THIS->GetParameters();
		OUTPUT:
		RETVAL


char *
vtkRIBProperty::GetSurfaceShader()
		CODE:
		RETVAL = THIS->GetSurfaceShader();
		OUTPUT:
		RETVAL


static vtkRIBProperty*
vtkRIBProperty::New()
		CODE:
		RETVAL = vtkRIBProperty::New();
		OUTPUT:
		RETVAL


void
vtkRIBProperty::SetDisplacementShader(arg1)
		char *	arg1
		CODE:
		THIS->SetDisplacementShader(arg1);
		XSRETURN_EMPTY;


void
vtkRIBProperty::SetParameter(parameter, value)
		char *	parameter
		char *	value
		CODE:
		THIS->SetParameter(parameter, value);
		XSRETURN_EMPTY;


void
vtkRIBProperty::SetSurfaceShader(arg1)
		char *	arg1
		CODE:
		THIS->SetSurfaceShader(arg1);
		XSRETURN_EMPTY;


void
vtkRIBProperty::SetVariable(variable, declaration)
		char *	variable
		char *	declaration
		CODE:
		THIS->SetVariable(variable, declaration);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::Superquadric PREFIX = vtk

PROTOTYPES: DISABLE



float
vtkSuperquadric::EvaluateFunction(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		RETVAL = THIS->EvaluateFunction(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkSuperquadric::EvaluateFunction\n");



float  *
vtkSuperquadric::GetCenter()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetCenter();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


const char *
vtkSuperquadric::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkSuperquadric::GetPhiRoundness()
		CODE:
		RETVAL = THIS->GetPhiRoundness();
		OUTPUT:
		RETVAL


float  *
vtkSuperquadric::GetScale()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetScale();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float
vtkSuperquadric::GetSize()
		CODE:
		RETVAL = THIS->GetSize();
		OUTPUT:
		RETVAL


float
vtkSuperquadric::GetThetaRoundness()
		CODE:
		RETVAL = THIS->GetThetaRoundness();
		OUTPUT:
		RETVAL


float
vtkSuperquadric::GetThickness()
		CODE:
		RETVAL = THIS->GetThickness();
		OUTPUT:
		RETVAL


int
vtkSuperquadric::GetToroidal()
		CODE:
		RETVAL = THIS->GetToroidal();
		OUTPUT:
		RETVAL


static vtkSuperquadric*
vtkSuperquadric::New()
		CODE:
		RETVAL = vtkSuperquadric::New();
		OUTPUT:
		RETVAL


void
vtkSuperquadric::SetCenter(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetCenter(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkSuperquadric::SetCenter\n");



void
vtkSuperquadric::SetPhiRoundness(e)
		float 	e
		CODE:
		THIS->SetPhiRoundness(e);
		XSRETURN_EMPTY;


void
vtkSuperquadric::SetScale(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetScale(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkSuperquadric::SetScale\n");



void
vtkSuperquadric::SetSize(arg1)
		float 	arg1
		CODE:
		THIS->SetSize(arg1);
		XSRETURN_EMPTY;


void
vtkSuperquadric::SetThetaRoundness(e)
		float 	e
		CODE:
		THIS->SetThetaRoundness(e);
		XSRETURN_EMPTY;


void
vtkSuperquadric::SetThickness(arg1)
		float 	arg1
		CODE:
		THIS->SetThickness(arg1);
		XSRETURN_EMPTY;


void
vtkSuperquadric::SetToroidal(arg1)
		int 	arg1
		CODE:
		THIS->SetToroidal(arg1);
		XSRETURN_EMPTY;


void
vtkSuperquadric::ToroidalOff()
		CODE:
		THIS->ToroidalOff();
		XSRETURN_EMPTY;


void
vtkSuperquadric::ToroidalOn()
		CODE:
		THIS->ToroidalOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::SurfaceReconstructionFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkSurfaceReconstructionFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkSurfaceReconstructionFilter::GetNeighborhoodSize()
		CODE:
		RETVAL = THIS->GetNeighborhoodSize();
		OUTPUT:
		RETVAL


float
vtkSurfaceReconstructionFilter::GetSampleSpacing()
		CODE:
		RETVAL = THIS->GetSampleSpacing();
		OUTPUT:
		RETVAL


static vtkSurfaceReconstructionFilter*
vtkSurfaceReconstructionFilter::New()
		CODE:
		RETVAL = vtkSurfaceReconstructionFilter::New();
		OUTPUT:
		RETVAL


void
vtkSurfaceReconstructionFilter::SetNeighborhoodSize(arg1)
		int 	arg1
		CODE:
		THIS->SetNeighborhoodSize(arg1);
		XSRETURN_EMPTY;


void
vtkSurfaceReconstructionFilter::SetSampleSpacing(arg1)
		float 	arg1
		CODE:
		THIS->SetSampleSpacing(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::SuperquadricSource PREFIX = vtk

PROTOTYPES: DISABLE



float  *
vtkSuperquadricSource::GetCenter()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetCenter();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


const char *
vtkSuperquadricSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkSuperquadricSource::GetPhiResolution()
		CODE:
		RETVAL = THIS->GetPhiResolution();
		OUTPUT:
		RETVAL


float
vtkSuperquadricSource::GetPhiRoundness()
		CODE:
		RETVAL = THIS->GetPhiRoundness();
		OUTPUT:
		RETVAL


float  *
vtkSuperquadricSource::GetScale()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetScale();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float
vtkSuperquadricSource::GetSize()
		CODE:
		RETVAL = THIS->GetSize();
		OUTPUT:
		RETVAL


int
vtkSuperquadricSource::GetThetaResolution()
		CODE:
		RETVAL = THIS->GetThetaResolution();
		OUTPUT:
		RETVAL


float
vtkSuperquadricSource::GetThetaRoundness()
		CODE:
		RETVAL = THIS->GetThetaRoundness();
		OUTPUT:
		RETVAL


float
vtkSuperquadricSource::GetThickness()
		CODE:
		RETVAL = THIS->GetThickness();
		OUTPUT:
		RETVAL


int
vtkSuperquadricSource::GetToroidal()
		CODE:
		RETVAL = THIS->GetToroidal();
		OUTPUT:
		RETVAL


static vtkSuperquadricSource*
vtkSuperquadricSource::New()
		CODE:
		RETVAL = vtkSuperquadricSource::New();
		OUTPUT:
		RETVAL


void
vtkSuperquadricSource::SetCenter(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetCenter(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkSuperquadricSource::SetCenter\n");



void
vtkSuperquadricSource::SetPhiResolution(i)
		int 	i
		CODE:
		THIS->SetPhiResolution(i);
		XSRETURN_EMPTY;


void
vtkSuperquadricSource::SetPhiRoundness(e)
		float 	e
		CODE:
		THIS->SetPhiRoundness(e);
		XSRETURN_EMPTY;


void
vtkSuperquadricSource::SetScale(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetScale(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkSuperquadricSource::SetScale\n");



void
vtkSuperquadricSource::SetSize(arg1)
		float 	arg1
		CODE:
		THIS->SetSize(arg1);
		XSRETURN_EMPTY;


void
vtkSuperquadricSource::SetThetaResolution(i)
		int 	i
		CODE:
		THIS->SetThetaResolution(i);
		XSRETURN_EMPTY;


void
vtkSuperquadricSource::SetThetaRoundness(e)
		float 	e
		CODE:
		THIS->SetThetaRoundness(e);
		XSRETURN_EMPTY;


void
vtkSuperquadricSource::SetThickness(arg1)
		float 	arg1
		CODE:
		THIS->SetThickness(arg1);
		XSRETURN_EMPTY;


void
vtkSuperquadricSource::SetToroidal(arg1)
		int 	arg1
		CODE:
		THIS->SetToroidal(arg1);
		XSRETURN_EMPTY;


void
vtkSuperquadricSource::ToroidalOff()
		CODE:
		THIS->ToroidalOff();
		XSRETURN_EMPTY;


void
vtkSuperquadricSource::ToroidalOn()
		CODE:
		THIS->ToroidalOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::SubdivideTetra PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkSubdivideTetra::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkSubdivideTetra*
vtkSubdivideTetra::New()
		CODE:
		RETVAL = vtkSubdivideTetra::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::ThreadedController PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkThreadedController::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkThreadedController::GetLocalProcessId()
		CODE:
		RETVAL = THIS->GetLocalProcessId();
		OUTPUT:
		RETVAL


void
vtkThreadedController::MultipleMethodExecute()
		CODE:
		THIS->MultipleMethodExecute();
		XSRETURN_EMPTY;


static vtkThreadedController*
vtkThreadedController::New()
		CODE:
		RETVAL = vtkThreadedController::New();
		OUTPUT:
		RETVAL


int
vtkThreadedController::Receive(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		char *	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		CODE:
		RETVAL = THIS->Receive(arg1, arg2, arg3, arg4);
		OUTPUT:
		RETVAL
	CASE: items == 4
		vtkDataObject *	arg1
		int 	arg2
		int 	arg3
		CODE:
		RETVAL = THIS->Receive(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkThreadedController::Receive\n");



int
vtkThreadedController::Send(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		char *	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		CODE:
		RETVAL = THIS->Send(arg1, arg2, arg3, arg4);
		OUTPUT:
		RETVAL
	CASE: items == 4
		vtkDataObject *	arg1
		int 	arg2
		int 	arg3
		CODE:
		RETVAL = THIS->Send(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkThreadedController::Send\n");



void
vtkThreadedController::SingleMethodExecute()
		CODE:
		THIS->SingleMethodExecute();
		XSRETURN_EMPTY;


void
vtkThreadedController::Start(threadIdx)
		int 	threadIdx
		CODE:
		THIS->Start(threadIdx);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::ThinPlateSplineTransform PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkThinPlateSplineTransform::GetBasis()
		CODE:
		RETVAL = THIS->GetBasis();
		OUTPUT:
		RETVAL


const char *
vtkThinPlateSplineTransform::GetBasisAsString()
		CODE:
		RETVAL = THIS->GetBasisAsString();
		OUTPUT:
		RETVAL


const char *
vtkThinPlateSplineTransform::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


unsigned long
vtkThinPlateSplineTransform::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


double
vtkThinPlateSplineTransform::GetSigma()
		CODE:
		RETVAL = THIS->GetSigma();
		OUTPUT:
		RETVAL


vtkPoints *
vtkThinPlateSplineTransform::GetSourceLandmarks()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPoints";
		CODE:
		RETVAL = THIS->GetSourceLandmarks();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkPoints *
vtkThinPlateSplineTransform::GetTargetLandmarks()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPoints";
		CODE:
		RETVAL = THIS->GetTargetLandmarks();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkAbstractTransform *
vtkThinPlateSplineTransform::MakeTransform()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkAbstractTransform";
		CODE:
		RETVAL = THIS->MakeTransform();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkThinPlateSplineTransform*
vtkThinPlateSplineTransform::New()
		CODE:
		RETVAL = vtkThinPlateSplineTransform::New();
		OUTPUT:
		RETVAL


void
vtkThinPlateSplineTransform::SetBasis(basis)
		int 	basis
		CODE:
		THIS->SetBasis(basis);
		XSRETURN_EMPTY;


void
vtkThinPlateSplineTransform::SetBasisToR()
		CODE:
		THIS->SetBasisToR();
		XSRETURN_EMPTY;


void
vtkThinPlateSplineTransform::SetBasisToR2LogR()
		CODE:
		THIS->SetBasisToR2LogR();
		XSRETURN_EMPTY;


void
vtkThinPlateSplineTransform::SetSigma(arg1)
		double 	arg1
		CODE:
		THIS->SetSigma(arg1);
		XSRETURN_EMPTY;


void
vtkThinPlateSplineTransform::SetSourceLandmarks(source)
		vtkPoints *	source
		CODE:
		THIS->SetSourceLandmarks(source);
		XSRETURN_EMPTY;


void
vtkThinPlateSplineTransform::SetTargetLandmarks(target)
		vtkPoints *	target
		CODE:
		THIS->SetTargetLandmarks(target);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::TransformToGrid PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkTransformToGrid::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkTransformToGrid::GetDisplacementScale()
		CODE:
		RETVAL = THIS->GetDisplacementScale();
		OUTPUT:
		RETVAL


float
vtkTransformToGrid::GetDisplacementShift()
		CODE:
		RETVAL = THIS->GetDisplacementShift();
		OUTPUT:
		RETVAL


int  *
vtkTransformToGrid::GetGridExtent()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetGridExtent();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


float  *
vtkTransformToGrid::GetGridOrigin()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetGridOrigin();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkTransformToGrid::GetGridScalarType()
		CODE:
		RETVAL = THIS->GetGridScalarType();
		OUTPUT:
		RETVAL


float  *
vtkTransformToGrid::GetGridSpacing()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetGridSpacing();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


vtkAbstractTransform *
vtkTransformToGrid::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkAbstractTransform";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkTransformToGrid*
vtkTransformToGrid::New()
		CODE:
		RETVAL = vtkTransformToGrid::New();
		OUTPUT:
		RETVAL


void
vtkTransformToGrid::SetGridExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int  	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetGridExtent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTransformToGrid::SetGridExtent\n");



void
vtkTransformToGrid::SetGridOrigin(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetGridOrigin(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTransformToGrid::SetGridOrigin\n");



void
vtkTransformToGrid::SetGridScalarType(arg1)
		int 	arg1
		CODE:
		THIS->SetGridScalarType(arg1);
		XSRETURN_EMPTY;


void
vtkTransformToGrid::SetGridScalarTypeToChar()
		CODE:
		THIS->SetGridScalarTypeToChar();
		XSRETURN_EMPTY;


void
vtkTransformToGrid::SetGridScalarTypeToFloat()
		CODE:
		THIS->SetGridScalarTypeToFloat();
		XSRETURN_EMPTY;


void
vtkTransformToGrid::SetGridScalarTypeToShort()
		CODE:
		THIS->SetGridScalarTypeToShort();
		XSRETURN_EMPTY;


void
vtkTransformToGrid::SetGridScalarTypeToUnsignedChar()
		CODE:
		THIS->SetGridScalarTypeToUnsignedChar();
		XSRETURN_EMPTY;


void
vtkTransformToGrid::SetGridScalarTypeToUnsignedShort()
		CODE:
		THIS->SetGridScalarTypeToUnsignedShort();
		XSRETURN_EMPTY;


void
vtkTransformToGrid::SetGridSpacing(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetGridSpacing(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTransformToGrid::SetGridSpacing\n");



void
vtkTransformToGrid::SetInput(arg1)
		vtkAbstractTransform *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::TreeComposite PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkTreeComposite::ComputeVisiblePropBoundsRMI()
		CODE:
		THIS->ComputeVisiblePropBoundsRMI();
		XSRETURN_EMPTY;


void
vtkTreeComposite::EndRender()
		CODE:
		THIS->EndRender();
		XSRETURN_EMPTY;


void
vtkTreeComposite::ExitInteractor()
		CODE:
		THIS->ExitInteractor();
		XSRETURN_EMPTY;


const char *
vtkTreeComposite::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkRenderWindow *
vtkTreeComposite::GetRenderWindow()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkRenderWindow";
		CODE:
		RETVAL = THIS->GetRenderWindow();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkTreeComposite::InitializeOffScreen()
		CODE:
		THIS->InitializeOffScreen();
		XSRETURN_EMPTY;


void
vtkTreeComposite::InitializePieces()
		CODE:
		THIS->InitializePieces();
		XSRETURN_EMPTY;


static vtkTreeComposite*
vtkTreeComposite::New()
		CODE:
		RETVAL = vtkTreeComposite::New();
		OUTPUT:
		RETVAL


void
vtkTreeComposite::RenderRMI()
		CODE:
		THIS->RenderRMI();
		XSRETURN_EMPTY;


void
vtkTreeComposite::ResetCamera(ren)
		vtkRenderer *	ren
		CODE:
		THIS->ResetCamera(ren);
		XSRETURN_EMPTY;


void
vtkTreeComposite::ResetCameraClippingRange(ren)
		vtkRenderer *	ren
		CODE:
		THIS->ResetCameraClippingRange(ren);
		XSRETURN_EMPTY;


void
vtkTreeComposite::SetRenderWindow(renWin)
		vtkRenderWindow *	renWin
		CODE:
		THIS->SetRenderWindow(renWin);
		XSRETURN_EMPTY;


void
vtkTreeComposite::StartInteractor()
		CODE:
		THIS->StartInteractor();
		XSRETURN_EMPTY;


void
vtkTreeComposite::StartRender()
		CODE:
		THIS->StartRender();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::VideoSource PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkVideoSource::Advance(arg1 = 0)
	CASE: items == 2
		int 	arg1
		CODE:
		THIS->Advance(arg1);
		XSRETURN_EMPTY;
	CASE: items == 1
		CODE:
		THIS->Advance();
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVideoSource::Advance\n");



void
vtkVideoSource::AutoAdvanceOff()
		CODE:
		THIS->AutoAdvanceOff();
		XSRETURN_EMPTY;


void
vtkVideoSource::AutoAdvanceOn()
		CODE:
		THIS->AutoAdvanceOn();
		XSRETURN_EMPTY;


int
vtkVideoSource::GetAutoAdvance()
		CODE:
		RETVAL = THIS->GetAutoAdvance();
		OUTPUT:
		RETVAL


const char *
vtkVideoSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int  *
vtkVideoSource::GetClipRegion()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetClipRegion();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


float  *
vtkVideoSource::GetDataOrigin()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetDataOrigin();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkVideoSource::GetDataSpacing()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetDataSpacing();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkVideoSource::GetFrameBufferSize()
		CODE:
		RETVAL = THIS->GetFrameBufferSize();
		OUTPUT:
		RETVAL


float
vtkVideoSource::GetFrameRate()
		CODE:
		RETVAL = THIS->GetFrameRate();
		OUTPUT:
		RETVAL


int  *
vtkVideoSource::GetFrameSize()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetFrameSize();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


double
vtkVideoSource::GetFrameTimeStamp(arg1 = 0)
	CASE: items == 2
		int 	arg1
		CODE:
		RETVAL = THIS->GetFrameTimeStamp(arg1);
		OUTPUT:
		RETVAL
	CASE: items == 1
		CODE:
		RETVAL = THIS->GetFrameTimeStamp();
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVideoSource::GetFrameTimeStamp\n");



int
vtkVideoSource::GetGrabOnUpdate()
		CODE:
		RETVAL = THIS->GetGrabOnUpdate();
		OUTPUT:
		RETVAL


int
vtkVideoSource::GetNumberOfOutputFrames()
		CODE:
		RETVAL = THIS->GetNumberOfOutputFrames();
		OUTPUT:
		RETVAL


float
vtkVideoSource::GetOpacity()
		CODE:
		RETVAL = THIS->GetOpacity();
		OUTPUT:
		RETVAL


int
vtkVideoSource::GetOutputFormat()
		CODE:
		RETVAL = THIS->GetOutputFormat();
		OUTPUT:
		RETVAL


int  *
vtkVideoSource::GetOutputWholeExtent()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetOutputWholeExtent();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


int
vtkVideoSource::GetPlaying()
		CODE:
		RETVAL = THIS->GetPlaying();
		OUTPUT:
		RETVAL


int
vtkVideoSource::GetPreview()
		CODE:
		RETVAL = THIS->GetPreview();
		OUTPUT:
		RETVAL


void
vtkVideoSource::Grab(arg1 = 0)
	CASE: items == 2
		int 	arg1
		CODE:
		THIS->Grab(arg1);
		XSRETURN_EMPTY;
	CASE: items == 1
		CODE:
		THIS->Grab();
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVideoSource::Grab\n");



void
vtkVideoSource::GrabOnUpdateOff()
		CODE:
		THIS->GrabOnUpdateOff();
		XSRETURN_EMPTY;


void
vtkVideoSource::GrabOnUpdateOn()
		CODE:
		THIS->GrabOnUpdateOn();
		XSRETURN_EMPTY;


void
vtkVideoSource::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


void
vtkVideoSource::InternalGrab()
		CODE:
		THIS->InternalGrab();
		XSRETURN_EMPTY;


static vtkVideoSource*
vtkVideoSource::New()
		CODE:
		RETVAL = vtkVideoSource::New();
		OUTPUT:
		RETVAL


void
vtkVideoSource::Play()
		CODE:
		THIS->Play();
		XSRETURN_EMPTY;


void
vtkVideoSource::PreviewOff()
		CODE:
		THIS->PreviewOff();
		XSRETURN_EMPTY;


void
vtkVideoSource::PreviewOn()
		CODE:
		THIS->PreviewOn();
		XSRETURN_EMPTY;


void
vtkVideoSource::ReleaseSystemResources()
		CODE:
		THIS->ReleaseSystemResources();
		XSRETURN_EMPTY;


void
vtkVideoSource::Rewind(arg1 = 0)
	CASE: items == 2
		int 	arg1
		CODE:
		THIS->Rewind(arg1);
		XSRETURN_EMPTY;
	CASE: items == 1
		CODE:
		THIS->Rewind();
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVideoSource::Rewind\n");



void
vtkVideoSource::SetAutoAdvance(arg1)
		int 	arg1
		CODE:
		THIS->SetAutoAdvance(arg1);
		XSRETURN_EMPTY;


void
vtkVideoSource::SetClipRegion(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int 	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetClipRegion(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVideoSource::SetClipRegion\n");



void
vtkVideoSource::SetDataOrigin(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetDataOrigin(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVideoSource::SetDataOrigin\n");



void
vtkVideoSource::SetDataSpacing(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetDataSpacing(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVideoSource::SetDataSpacing\n");



void
vtkVideoSource::SetFrameBufferSize(FrameBufferSize)
		int 	FrameBufferSize
		CODE:
		THIS->SetFrameBufferSize(FrameBufferSize);
		XSRETURN_EMPTY;


void
vtkVideoSource::SetFrameRate(arg1)
		float 	arg1
		CODE:
		THIS->SetFrameRate(arg1);
		XSRETURN_EMPTY;


void
vtkVideoSource::SetFrameSize(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetFrameSize(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVideoSource::SetFrameSize\n");



void
vtkVideoSource::SetGrabOnUpdate(yesno)
		int 	yesno
		CODE:
		THIS->SetGrabOnUpdate(yesno);
		XSRETURN_EMPTY;


void
vtkVideoSource::SetNumberOfOutputFrames(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfOutputFrames(arg1);
		XSRETURN_EMPTY;


void
vtkVideoSource::SetOpacity(arg1)
		float 	arg1
		CODE:
		THIS->SetOpacity(arg1);
		XSRETURN_EMPTY;


void
vtkVideoSource::SetOutputFormat(format)
		int 	format
		CODE:
		THIS->SetOutputFormat(format);
		XSRETURN_EMPTY;


void
vtkVideoSource::SetOutputFormatToLuminance()
		CODE:
		THIS->SetOutputFormatToLuminance();
		XSRETURN_EMPTY;


void
vtkVideoSource::SetOutputFormatToRGB()
		CODE:
		THIS->SetOutputFormatToRGB();
		XSRETURN_EMPTY;


void
vtkVideoSource::SetOutputFormatToRGBA()
		CODE:
		THIS->SetOutputFormatToRGBA();
		XSRETURN_EMPTY;


void
vtkVideoSource::SetOutputWholeExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int  	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetOutputWholeExtent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVideoSource::SetOutputWholeExtent\n");



void
vtkVideoSource::SetPreview(arg1)
		int 	arg1
		CODE:
		THIS->SetPreview(arg1);
		XSRETURN_EMPTY;


void
vtkVideoSource::Stop()
		CODE:
		THIS->Stop();
		XSRETURN_EMPTY;


void
vtkVideoSource::UpdateInformation()
		CODE:
		THIS->UpdateInformation();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::VolumeProMapper PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkVolumeProMapper::CursorOff()
		CODE:
		THIS->CursorOff();
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::CursorOn()
		CODE:
		THIS->CursorOn();
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::CutPlaneOff()
		CODE:
		THIS->CutPlaneOff();
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::CutPlaneOn()
		CODE:
		THIS->CutPlaneOn();
		XSRETURN_EMPTY;


int
vtkVolumeProMapper::GetAvailableBoardMemory()
		CODE:
		RETVAL = THIS->GetAvailableBoardMemory();
		OUTPUT:
		RETVAL


int
vtkVolumeProMapper::GetBlendMode()
		CODE:
		RETVAL = THIS->GetBlendMode();
		OUTPUT:
		RETVAL


const char *
vtkVolumeProMapper::GetBlendModeAsString()
		CODE:
		RETVAL = THIS->GetBlendModeAsString();
		OUTPUT:
		RETVAL


const char *
vtkVolumeProMapper::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkVolumeProMapper::GetCursor()
		CODE:
		RETVAL = THIS->GetCursor();
		OUTPUT:
		RETVAL


double  *
vtkVolumeProMapper::GetCursorPosition()
		PREINIT:
		double  * retval;
		PPCODE:
		retval = THIS->GetCursorPosition();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkVolumeProMapper::GetCursorType()
		CODE:
		RETVAL = THIS->GetCursorType();
		OUTPUT:
		RETVAL


const char *
vtkVolumeProMapper::GetCursorTypeAsString()
		CODE:
		RETVAL = THIS->GetCursorTypeAsString();
		OUTPUT:
		RETVAL


double  *
vtkVolumeProMapper::GetCursorXAxisColor()
		PREINIT:
		double  * retval;
		PPCODE:
		retval = THIS->GetCursorXAxisColor();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


double  *
vtkVolumeProMapper::GetCursorYAxisColor()
		PREINIT:
		double  * retval;
		PPCODE:
		retval = THIS->GetCursorYAxisColor();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


double  *
vtkVolumeProMapper::GetCursorZAxisColor()
		PREINIT:
		double  * retval;
		PPCODE:
		retval = THIS->GetCursorZAxisColor();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkVolumeProMapper::GetCutPlane()
		CODE:
		RETVAL = THIS->GetCutPlane();
		OUTPUT:
		RETVAL


double  *
vtkVolumeProMapper::GetCutPlaneEquation()
		PREINIT:
		double  * retval;
		PPCODE:
		retval = THIS->GetCutPlaneEquation();
		EXTEND(SP, 4);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));


int
vtkVolumeProMapper::GetCutPlaneFallOffDistance()
		CODE:
		RETVAL = THIS->GetCutPlaneFallOffDistance();
		OUTPUT:
		RETVAL


double
vtkVolumeProMapper::GetCutPlaneThickness()
		CODE:
		RETVAL = THIS->GetCutPlaneThickness();
		OUTPUT:
		RETVAL


int
vtkVolumeProMapper::GetGradientDiffuseModulation()
		CODE:
		RETVAL = THIS->GetGradientDiffuseModulation();
		OUTPUT:
		RETVAL


int
vtkVolumeProMapper::GetGradientOpacityModulation()
		CODE:
		RETVAL = THIS->GetGradientOpacityModulation();
		OUTPUT:
		RETVAL


int
vtkVolumeProMapper::GetGradientSpecularModulation()
		CODE:
		RETVAL = THIS->GetGradientSpecularModulation();
		OUTPUT:
		RETVAL


int
vtkVolumeProMapper::GetMajorBoardVersion()
		CODE:
		RETVAL = THIS->GetMajorBoardVersion();
		OUTPUT:
		RETVAL


int
vtkVolumeProMapper::GetMapperType()
		CODE:
		RETVAL = THIS->GetMapperType();
		OUTPUT:
		RETVAL


int
vtkVolumeProMapper::GetMinorBoardVersion()
		CODE:
		RETVAL = THIS->GetMinorBoardVersion();
		OUTPUT:
		RETVAL


int
vtkVolumeProMapper::GetNoHardware()
		CODE:
		RETVAL = THIS->GetNoHardware();
		OUTPUT:
		RETVAL


int
vtkVolumeProMapper::GetNumberOfBoards()
		CODE:
		RETVAL = THIS->GetNumberOfBoards();
		OUTPUT:
		RETVAL


int  *
vtkVolumeProMapper::GetSubVolume()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetSubVolume();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


int
vtkVolumeProMapper::GetSuperSampling()
		CODE:
		RETVAL = THIS->GetSuperSampling();
		OUTPUT:
		RETVAL


double  *
vtkVolumeProMapper::GetSuperSamplingFactor()
		PREINIT:
		double  * retval;
		PPCODE:
		retval = THIS->GetSuperSamplingFactor();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkVolumeProMapper::GetWrongVLIVersion()
		CODE:
		RETVAL = THIS->GetWrongVLIVersion();
		OUTPUT:
		RETVAL


void
vtkVolumeProMapper::GradientDiffuseModulationOff()
		CODE:
		THIS->GradientDiffuseModulationOff();
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::GradientDiffuseModulationOn()
		CODE:
		THIS->GradientDiffuseModulationOn();
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::GradientOpacityModulationOff()
		CODE:
		THIS->GradientOpacityModulationOff();
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::GradientOpacityModulationOn()
		CODE:
		THIS->GradientOpacityModulationOn();
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::GradientSpecularModulationOff()
		CODE:
		THIS->GradientSpecularModulationOff();
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::GradientSpecularModulationOn()
		CODE:
		THIS->GradientSpecularModulationOn();
		XSRETURN_EMPTY;


static vtkVolumeProMapper*
vtkVolumeProMapper::New()
		CODE:
		RETVAL = vtkVolumeProMapper::New();
		OUTPUT:
		RETVAL


void
vtkVolumeProMapper::Render(arg1, arg2)
		vtkRenderer *	arg1
		vtkVolume *	arg2
		CODE:
		THIS->Render(arg1, arg2);
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::SetBlendMode(arg1)
		int 	arg1
		CODE:
		THIS->SetBlendMode(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::SetBlendModeToComposite()
		CODE:
		THIS->SetBlendModeToComposite();
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::SetBlendModeToMaximumIntensity()
		CODE:
		THIS->SetBlendModeToMaximumIntensity();
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::SetBlendModeToMinimumIntensity()
		CODE:
		THIS->SetBlendModeToMinimumIntensity();
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::SetCursor(arg1)
		int 	arg1
		CODE:
		THIS->SetCursor(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::SetCursorPosition(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double  	arg1
		double 	arg2
		double 	arg3
		CODE:
		THIS->SetCursorPosition(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVolumeProMapper::SetCursorPosition\n");



void
vtkVolumeProMapper::SetCursorType(arg1)
		int 	arg1
		CODE:
		THIS->SetCursorType(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::SetCursorTypeToCrossHair()
		CODE:
		THIS->SetCursorTypeToCrossHair();
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::SetCursorTypeToPlane()
		CODE:
		THIS->SetCursorTypeToPlane();
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::SetCursorXAxisColor(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double  	arg1
		double 	arg2
		double 	arg3
		CODE:
		THIS->SetCursorXAxisColor(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVolumeProMapper::SetCursorXAxisColor\n");



void
vtkVolumeProMapper::SetCursorYAxisColor(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double  	arg1
		double 	arg2
		double 	arg3
		CODE:
		THIS->SetCursorYAxisColor(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVolumeProMapper::SetCursorYAxisColor\n");



void
vtkVolumeProMapper::SetCursorZAxisColor(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double  	arg1
		double 	arg2
		double 	arg3
		CODE:
		THIS->SetCursorZAxisColor(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVolumeProMapper::SetCursorZAxisColor\n");



void
vtkVolumeProMapper::SetCutPlane(arg1)
		int 	arg1
		CODE:
		THIS->SetCutPlane(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::SetCutPlaneEquation(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		double  	arg1
		double 	arg2
		double 	arg3
		double 	arg4
		CODE:
		THIS->SetCutPlaneEquation(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVolumeProMapper::SetCutPlaneEquation\n");



void
vtkVolumeProMapper::SetCutPlaneFallOffDistance(arg1)
		int 	arg1
		CODE:
		THIS->SetCutPlaneFallOffDistance(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::SetCutPlaneThickness(arg1)
		double 	arg1
		CODE:
		THIS->SetCutPlaneThickness(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::SetGradientDiffuseModulation(arg1)
		int 	arg1
		CODE:
		THIS->SetGradientDiffuseModulation(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::SetGradientOpacityModulation(arg1)
		int 	arg1
		CODE:
		THIS->SetGradientOpacityModulation(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::SetGradientSpecularModulation(arg1)
		int 	arg1
		CODE:
		THIS->SetGradientSpecularModulation(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::SetSubVolume(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int  	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetSubVolume(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVolumeProMapper::SetSubVolume\n");



void
vtkVolumeProMapper::SetSuperSampling(arg1)
		int 	arg1
		CODE:
		THIS->SetSuperSampling(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::SetSuperSamplingFactor(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double 	arg1
		double 	arg2
		double 	arg3
		CODE:
		THIS->SetSuperSamplingFactor(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVolumeProMapper::SetSuperSamplingFactor\n");



void
vtkVolumeProMapper::SuperSamplingOff()
		CODE:
		THIS->SuperSamplingOff();
		XSRETURN_EMPTY;


void
vtkVolumeProMapper::SuperSamplingOn()
		CODE:
		THIS->SuperSamplingOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::InputPort PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkInputPort::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkMultiProcessController *
vtkInputPort::GetController()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkMultiProcessController";
		CODE:
		RETVAL = THIS->GetController();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkImageData *
vtkInputPort::GetImageDataOutput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImageData";
		CODE:
		RETVAL = THIS->GetImageDataOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkPolyData *
vtkInputPort::GetPolyDataOutput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPolyData";
		CODE:
		RETVAL = THIS->GetPolyDataOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkRectilinearGrid *
vtkInputPort::GetRectilinearGridOutput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkRectilinearGrid";
		CODE:
		RETVAL = THIS->GetRectilinearGridOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkInputPort::GetRemoteProcessId()
		CODE:
		RETVAL = THIS->GetRemoteProcessId();
		OUTPUT:
		RETVAL


vtkStructuredGrid *
vtkInputPort::GetStructuredGridOutput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredGrid";
		CODE:
		RETVAL = THIS->GetStructuredGridOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkStructuredPoints *
vtkInputPort::GetStructuredPointsOutput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredPoints";
		CODE:
		RETVAL = THIS->GetStructuredPointsOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkInputPort::GetTag()
		CODE:
		RETVAL = THIS->GetTag();
		OUTPUT:
		RETVAL


vtkUnstructuredGrid *
vtkInputPort::GetUnstructuredGridOutput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkUnstructuredGrid";
		CODE:
		RETVAL = THIS->GetUnstructuredGridOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkInputPort*
vtkInputPort::New()
		CODE:
		RETVAL = vtkInputPort::New();
		OUTPUT:
		RETVAL


void
vtkInputPort::PropagateUpdateExtent(arg1)
		vtkDataObject *	arg1
		CODE:
		THIS->PropagateUpdateExtent(arg1);
		XSRETURN_EMPTY;


void
vtkInputPort::SetController(arg1)
		vtkMultiProcessController *	arg1
		CODE:
		THIS->SetController(arg1);
		XSRETURN_EMPTY;


void
vtkInputPort::SetRemoteProcessId(arg1)
		int 	arg1
		CODE:
		THIS->SetRemoteProcessId(arg1);
		XSRETURN_EMPTY;


void
vtkInputPort::SetTag(arg1)
		int 	arg1
		CODE:
		THIS->SetTag(arg1);
		XSRETURN_EMPTY;


void
vtkInputPort::TriggerAsynchronousUpdate()
		CODE:
		THIS->TriggerAsynchronousUpdate();
		XSRETURN_EMPTY;


void
vtkInputPort::UpdateData(out)
		vtkDataObject *	out
		CODE:
		THIS->UpdateData(out);
		XSRETURN_EMPTY;


void
vtkInputPort::UpdateInformation()
		CODE:
		THIS->UpdateInformation();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::OutputPort PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkOutputPort::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkMultiProcessController *
vtkOutputPort::GetController()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkMultiProcessController";
		CODE:
		RETVAL = THIS->GetController();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkDataObject *
vtkOutputPort::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataObject";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkOutputPort::GetPipelineFlag()
		CODE:
		RETVAL = THIS->GetPipelineFlag();
		OUTPUT:
		RETVAL


int
vtkOutputPort::GetTag()
		CODE:
		RETVAL = THIS->GetTag();
		OUTPUT:
		RETVAL


static vtkOutputPort*
vtkOutputPort::New()
		CODE:
		RETVAL = vtkOutputPort::New();
		OUTPUT:
		RETVAL


void
vtkOutputPort::PipelineFlagOff()
		CODE:
		THIS->PipelineFlagOff();
		XSRETURN_EMPTY;


void
vtkOutputPort::PipelineFlagOn()
		CODE:
		THIS->PipelineFlagOn();
		XSRETURN_EMPTY;


void
vtkOutputPort::SetController(arg1)
		vtkMultiProcessController *	arg1
		CODE:
		THIS->SetController(arg1);
		XSRETURN_EMPTY;


void
vtkOutputPort::SetInput(input)
		vtkDataObject *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;


void
vtkOutputPort::SetParameterMethod(func)
		SV*	func
		CODE:
		HV * methodHash;
		HV * HashEntry;
		HE * tempHE;
		HV * tempHV;
      		/* put a copy of the callback in the executeMethodList hash */
		methodHash = perl_get_hv("Graphics::VTK::Object::executeMethodList", FALSE);
    		if (methodHash == (HV*)NULL)
    		    printf("Graphics::VTK::executeMethodList hash doesn't exist???\n");
    		else{
			tempHE = hv_fetch_ent(methodHash, ST(0), 0,0);
	    		if( tempHE == (HE*)NULL ) {  /* Entry doesn't exist (i.e. we didn't create it, make an entry for it */
		    		tempHV = newHV();  /* Create empty hash ref and put in executeMethodList */
				hv_store_ent(methodHash, ST(0), newRV_inc((SV*) tempHV), 0);
			}
		    HashEntry =   (HV *) SvRV(HeVAL(hv_fetch_ent(methodHash, ST(0), 0,0)));
		    hv_store_ent(HashEntry, newSVpv("SetParameterMethod",0), newRV(func), 0);
		}
		THIS->SetParameterMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkOutputPort::SetPipelineFlag(arg1)
		int 	arg1
		CODE:
		THIS->SetPipelineFlag(arg1);
		XSRETURN_EMPTY;


void
vtkOutputPort::SetTag(tag)
		int 	tag
		CODE:
		THIS->SetTag(tag);
		XSRETURN_EMPTY;


void
vtkOutputPort::TriggerUpdate(remoteProcessId)
		int 	remoteProcessId
		CODE:
		THIS->TriggerUpdate(remoteProcessId);
		XSRETURN_EMPTY;


void
vtkOutputPort::TriggerUpdateInformation(remoteProcessId)
		int 	remoteProcessId
		CODE:
		THIS->TriggerUpdateInformation(remoteProcessId);
		XSRETURN_EMPTY;


void
vtkOutputPort::WaitForUpdate()
		CODE:
		THIS->WaitForUpdate();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::VRMLImporter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkVRMLImporter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkObject *
vtkVRMLImporter::GetVRMLDEFObject(name)
		char *	name
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkObject";
		CODE:
		RETVAL = THIS->GetVRMLDEFObject(name);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkVRMLImporter*
vtkVRMLImporter::New()
		CODE:
		RETVAL = vtkVRMLImporter::New();
		OUTPUT:
		RETVAL


void
vtkVRMLImporter::enterField(arg1)
		char *	arg1
		CODE:
		THIS->enterField(arg1);
		XSRETURN_EMPTY;


void
vtkVRMLImporter::enterNode(arg1)
		char *	arg1
		CODE:
		THIS->enterNode(arg1);
		XSRETURN_EMPTY;


void
vtkVRMLImporter::exitField()
		CODE:
		THIS->exitField();
		XSRETURN_EMPTY;


void
vtkVRMLImporter::exitNode()
		CODE:
		THIS->exitNode();
		XSRETURN_EMPTY;


void
vtkVRMLImporter::useNode(arg1)
		char *	arg1
		CODE:
		THIS->useNode(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::XYPlotActor PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkXYPlotActor::AddDataObjectInput(in)
		vtkDataObject *	in
		CODE:
		THIS->AddDataObjectInput(in);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::AddInput(in)
		vtkDataSet *	in
		CODE:
		THIS->AddInput(in);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::BoldOff()
		CODE:
		THIS->BoldOff();
		XSRETURN_EMPTY;


void
vtkXYPlotActor::BoldOn()
		CODE:
		THIS->BoldOn();
		XSRETURN_EMPTY;


int
vtkXYPlotActor::GetBold()
		CODE:
		RETVAL = THIS->GetBold();
		OUTPUT:
		RETVAL


int
vtkXYPlotActor::GetBorder()
		CODE:
		RETVAL = THIS->GetBorder();
		OUTPUT:
		RETVAL


const char *
vtkXYPlotActor::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataObjectCollection *
vtkXYPlotActor::GetDataObjectInputList()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataObjectCollection";
		CODE:
		RETVAL = THIS->GetDataObjectInputList();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkXYPlotActor::GetDataObjectPlotMode()
		CODE:
		RETVAL = THIS->GetDataObjectPlotMode();
		OUTPUT:
		RETVAL


const char *
vtkXYPlotActor::GetDataObjectPlotModeAsString()
		CODE:
		RETVAL = THIS->GetDataObjectPlotModeAsString();
		OUTPUT:
		RETVAL


int
vtkXYPlotActor::GetDataObjectXComponent(i)
		int 	i
		CODE:
		RETVAL = THIS->GetDataObjectXComponent(i);
		OUTPUT:
		RETVAL


int
vtkXYPlotActor::GetDataObjectYComponent(i)
		int 	i
		CODE:
		RETVAL = THIS->GetDataObjectYComponent(i);
		OUTPUT:
		RETVAL


int
vtkXYPlotActor::GetFontFamily()
		CODE:
		RETVAL = THIS->GetFontFamily();
		OUTPUT:
		RETVAL


float
vtkXYPlotActor::GetGlyphSize()
		CODE:
		RETVAL = THIS->GetGlyphSize();
		OUTPUT:
		RETVAL


vtkGlyphSource2D *
vtkXYPlotActor::GetGlyphSource()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkGlyphSource2D";
		CODE:
		RETVAL = THIS->GetGlyphSource();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkDataSetCollection *
vtkXYPlotActor::GetInputList()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSetCollection";
		CODE:
		RETVAL = THIS->GetInputList();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkXYPlotActor::GetItalic()
		CODE:
		RETVAL = THIS->GetItalic();
		OUTPUT:
		RETVAL


char *
vtkXYPlotActor::GetLabelFormat()
		CODE:
		RETVAL = THIS->GetLabelFormat();
		OUTPUT:
		RETVAL


int
vtkXYPlotActor::GetLegend()
		CODE:
		RETVAL = THIS->GetLegend();
		OUTPUT:
		RETVAL


vtkLegendBoxActor *
vtkXYPlotActor::GetLegendBoxActor()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkLegendBoxActor";
		CODE:
		RETVAL = THIS->GetLegendBoxActor();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float  *
vtkXYPlotActor::GetLegendPosition()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetLegendPosition();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


float  *
vtkXYPlotActor::GetLegendPosition2()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetLegendPosition2();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


unsigned long
vtkXYPlotActor::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


int
vtkXYPlotActor::GetNumberOfXLabels()
		CODE:
		RETVAL = THIS->GetNumberOfXLabels();
		OUTPUT:
		RETVAL


int
vtkXYPlotActor::GetNumberOfYLabels()
		CODE:
		RETVAL = THIS->GetNumberOfYLabels();
		OUTPUT:
		RETVAL


float  *
vtkXYPlotActor::GetPlotCoordinate()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetPlotCoordinate();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


const char *
vtkXYPlotActor::GetPlotLabel(i)
		int 	i
		CODE:
		RETVAL = THIS->GetPlotLabel(i);
		OUTPUT:
		RETVAL


int
vtkXYPlotActor::GetPlotLines()
		CODE:
		RETVAL = THIS->GetPlotLines();
		OUTPUT:
		RETVAL


int
vtkXYPlotActor::GetPlotPoints()
		CODE:
		RETVAL = THIS->GetPlotPoints();
		OUTPUT:
		RETVAL


vtkPolyData *
vtkXYPlotActor::GetPlotSymbol(i)
		int 	i
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPolyData";
		CODE:
		RETVAL = THIS->GetPlotSymbol(i);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkXYPlotActor::GetPointComponent(i)
		int 	i
		CODE:
		RETVAL = THIS->GetPointComponent(i);
		OUTPUT:
		RETVAL


int
vtkXYPlotActor::GetShadow()
		CODE:
		RETVAL = THIS->GetShadow();
		OUTPUT:
		RETVAL


char *
vtkXYPlotActor::GetTitle()
		CODE:
		RETVAL = THIS->GetTitle();
		OUTPUT:
		RETVAL


float  *
vtkXYPlotActor::GetViewportCoordinate()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetViewportCoordinate();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


float  *
vtkXYPlotActor::GetXRange()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetXRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


char *
vtkXYPlotActor::GetXTitle()
		CODE:
		RETVAL = THIS->GetXTitle();
		OUTPUT:
		RETVAL


int
vtkXYPlotActor::GetXValues()
		CODE:
		RETVAL = THIS->GetXValues();
		OUTPUT:
		RETVAL


const char *
vtkXYPlotActor::GetXValuesAsString()
		CODE:
		RETVAL = THIS->GetXValuesAsString();
		OUTPUT:
		RETVAL


float  *
vtkXYPlotActor::GetYRange()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetYRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


char *
vtkXYPlotActor::GetYTitle()
		CODE:
		RETVAL = THIS->GetYTitle();
		OUTPUT:
		RETVAL


int
vtkXYPlotActor::IsInPlot(viewport, u, v)
		vtkViewport *	viewport
		float 	u
		float 	v
		CODE:
		RETVAL = THIS->IsInPlot(viewport, u, v);
		OUTPUT:
		RETVAL


void
vtkXYPlotActor::ItalicOff()
		CODE:
		THIS->ItalicOff();
		XSRETURN_EMPTY;


void
vtkXYPlotActor::ItalicOn()
		CODE:
		THIS->ItalicOn();
		XSRETURN_EMPTY;


void
vtkXYPlotActor::LegendOff()
		CODE:
		THIS->LegendOff();
		XSRETURN_EMPTY;


void
vtkXYPlotActor::LegendOn()
		CODE:
		THIS->LegendOn();
		XSRETURN_EMPTY;


static vtkXYPlotActor*
vtkXYPlotActor::New()
		CODE:
		RETVAL = vtkXYPlotActor::New();
		OUTPUT:
		RETVAL


void
vtkXYPlotActor::PlotLinesOff()
		CODE:
		THIS->PlotLinesOff();
		XSRETURN_EMPTY;


void
vtkXYPlotActor::PlotLinesOn()
		CODE:
		THIS->PlotLinesOn();
		XSRETURN_EMPTY;


void
vtkXYPlotActor::PlotPointsOff()
		CODE:
		THIS->PlotPointsOff();
		XSRETURN_EMPTY;


void
vtkXYPlotActor::PlotPointsOn()
		CODE:
		THIS->PlotPointsOn();
		XSRETURN_EMPTY;


void
vtkXYPlotActor::PlotToViewportCoordinate(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		vtkViewport *	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->PlotToViewportCoordinate(arg1, arg2, arg3);
		XSRETURN_EMPTY;
		OUTPUT:
		arg2
		arg3
	CASE: items == 2
		vtkViewport *	arg1
		CODE:
		THIS->PlotToViewportCoordinate(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkXYPlotActor::PlotToViewportCoordinate\n");



void
vtkXYPlotActor::RemoveDataObjectInput(in)
		vtkDataObject *	in
		CODE:
		THIS->RemoveDataObjectInput(in);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::RemoveInput(in)
		vtkDataSet *	in
		CODE:
		THIS->RemoveInput(in);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetBold(arg1)
		int 	arg1
		CODE:
		THIS->SetBold(arg1);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetBorder(arg1)
		int 	arg1
		CODE:
		THIS->SetBorder(arg1);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetDataObjectPlotMode(arg1)
		int 	arg1
		CODE:
		THIS->SetDataObjectPlotMode(arg1);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetDataObjectPlotModeToColumns()
		CODE:
		THIS->SetDataObjectPlotModeToColumns();
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetDataObjectPlotModeToRows()
		CODE:
		THIS->SetDataObjectPlotModeToRows();
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetDataObjectXComponent(i, comp)
		int 	i
		int 	comp
		CODE:
		THIS->SetDataObjectXComponent(i, comp);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetDataObjectYComponent(i, comp)
		int 	i
		int 	comp
		CODE:
		THIS->SetDataObjectYComponent(i, comp);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetFontFamily(arg1)
		int 	arg1
		CODE:
		THIS->SetFontFamily(arg1);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetFontFamilyToArial()
		CODE:
		THIS->SetFontFamilyToArial();
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetFontFamilyToCourier()
		CODE:
		THIS->SetFontFamilyToCourier();
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetFontFamilyToTimes()
		CODE:
		THIS->SetFontFamilyToTimes();
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetGlyphSize(arg1)
		float 	arg1
		CODE:
		THIS->SetGlyphSize(arg1);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetItalic(arg1)
		int 	arg1
		CODE:
		THIS->SetItalic(arg1);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetLabelFormat(arg1)
		char *	arg1
		CODE:
		THIS->SetLabelFormat(arg1);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetLegend(arg1)
		int 	arg1
		CODE:
		THIS->SetLegend(arg1);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetLegendPosition(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetLegendPosition(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkXYPlotActor::SetLegendPosition\n");



void
vtkXYPlotActor::SetLegendPosition2(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetLegendPosition2(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkXYPlotActor::SetLegendPosition2\n");



void
vtkXYPlotActor::SetNumberOfLabels(num)
		int 	num
		CODE:
		THIS->SetNumberOfLabels(num);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetNumberOfXLabels(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfXLabels(arg1);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetNumberOfYLabels(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfYLabels(arg1);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetPlotColor(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		int 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		CODE:
		THIS->SetPlotColor(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkXYPlotActor::SetPlotColor\n");



void
vtkXYPlotActor::SetPlotCoordinate(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetPlotCoordinate(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkXYPlotActor::SetPlotCoordinate\n");



void
vtkXYPlotActor::SetPlotLabel(i, label)
		int 	i
		char *	label
		CODE:
		THIS->SetPlotLabel(i, label);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetPlotLines(arg1)
		int 	arg1
		CODE:
		THIS->SetPlotLines(arg1);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetPlotPoints(arg1)
		int 	arg1
		CODE:
		THIS->SetPlotPoints(arg1);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetPlotRange(xmin, ymin, xmax, ymax)
		float 	xmin
		float 	ymin
		float 	xmax
		float 	ymax
		CODE:
		THIS->SetPlotRange(xmin, ymin, xmax, ymax);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetPlotSymbol(i, input)
		int 	i
		vtkPolyData *	input
		CODE:
		THIS->SetPlotSymbol(i, input);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetPointComponent(i, comp)
		int 	i
		int 	comp
		CODE:
		THIS->SetPointComponent(i, comp);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetShadow(arg1)
		int 	arg1
		CODE:
		THIS->SetShadow(arg1);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetTitle(arg1)
		char *	arg1
		CODE:
		THIS->SetTitle(arg1);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetViewportCoordinate(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetViewportCoordinate(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkXYPlotActor::SetViewportCoordinate\n");



void
vtkXYPlotActor::SetXRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetXRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkXYPlotActor::SetXRange\n");



void
vtkXYPlotActor::SetXTitle(arg1)
		char *	arg1
		CODE:
		THIS->SetXTitle(arg1);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetXValues(arg1)
		int 	arg1
		CODE:
		THIS->SetXValues(arg1);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetXValuesToArcLength()
		CODE:
		THIS->SetXValuesToArcLength();
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetXValuesToIndex()
		CODE:
		THIS->SetXValuesToIndex();
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetXValuesToNormalizedArcLength()
		CODE:
		THIS->SetXValuesToNormalizedArcLength();
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetXValuesToValue()
		CODE:
		THIS->SetXValuesToValue();
		XSRETURN_EMPTY;


void
vtkXYPlotActor::SetYRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetYRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkXYPlotActor::SetYRange\n");



void
vtkXYPlotActor::SetYTitle(arg1)
		char *	arg1
		CODE:
		THIS->SetYTitle(arg1);
		XSRETURN_EMPTY;


void
vtkXYPlotActor::ShadowOff()
		CODE:
		THIS->ShadowOff();
		XSRETURN_EMPTY;


void
vtkXYPlotActor::ShadowOn()
		CODE:
		THIS->ShadowOn();
		XSRETURN_EMPTY;


void
vtkXYPlotActor::ViewportToPlotCoordinate(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		vtkViewport *	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->ViewportToPlotCoordinate(arg1, arg2, arg3);
		XSRETURN_EMPTY;
		OUTPUT:
		arg2
		arg3
	CASE: items == 2
		vtkViewport *	arg1
		CODE:
		THIS->ViewportToPlotCoordinate(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkXYPlotActor::ViewportToPlotCoordinate\n");


#ifdef WIN32

MODULE = Graphics::VTK::Contrib	PACKAGE = Graphics::VTK::Win32OffscreenRenderWindow PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkWin32OffscreenRenderWindow::Frame()
		CODE:
		THIS->Frame();
		XSRETURN_EMPTY;


const char *
vtkWin32OffscreenRenderWindow::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkWin32OffscreenRenderWindow::GetEventPending()
		CODE:
		RETVAL = THIS->GetEventPending();
		OUTPUT:
		RETVAL


void *
vtkWin32OffscreenRenderWindow::GetGenericDisplayId()
		CODE:
		RETVAL = THIS->GetGenericDisplayId();
		OUTPUT:
		RETVAL


void *
vtkWin32OffscreenRenderWindow::GetGenericParentId()
		CODE:
		RETVAL = THIS->GetGenericParentId();
		OUTPUT:
		RETVAL


void *
vtkWin32OffscreenRenderWindow::GetGenericWindowId()
		CODE:
		RETVAL = THIS->GetGenericWindowId();
		OUTPUT:
		RETVAL


HWND
vtkWin32OffscreenRenderWindow::GetWindowId()
		CODE:
		RETVAL = THIS->GetWindowId();
		OUTPUT:
		RETVAL


static vtkWin32OffscreenRenderWindow*
vtkWin32OffscreenRenderWindow::New()
		CODE:
		RETVAL = vtkWin32OffscreenRenderWindow::New();
		OUTPUT:
		RETVAL


void
vtkWin32OffscreenRenderWindow::SetFullScreen(arg1)
		int 	arg1
		CODE:
		THIS->SetFullScreen(arg1);
		XSRETURN_EMPTY;


void
vtkWin32OffscreenRenderWindow::SetNextWindowId(arg1)
		HWND 	arg1
		CODE:
		THIS->SetNextWindowId(arg1);
		XSRETURN_EMPTY;


void
vtkWin32OffscreenRenderWindow::SetParentId(arg1)
		HWND 	arg1
		CODE:
		THIS->SetParentId(arg1);
		XSRETURN_EMPTY;


void
vtkWin32OffscreenRenderWindow::SetPosition(arg1, arg2)
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetPosition(arg1, arg2);
		XSRETURN_EMPTY;


void
vtkWin32OffscreenRenderWindow::SetSize(arg1, arg2)
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetSize(arg1, arg2);
		XSRETURN_EMPTY;


void
vtkWin32OffscreenRenderWindow::SetWindowId(arg1)
		HWND 	arg1
		CODE:
		THIS->SetWindowId(arg1);
		XSRETURN_EMPTY;


void
vtkWin32OffscreenRenderWindow::WindowInitialize()
		CODE:
		THIS->WindowInitialize();
		XSRETURN_EMPTY;

#endif


