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
#include "vtkGraphics.h"
#include "vtkCuller.h"
#include "vtkDirectionEncoder.h"
#include "vtkRayBounder.h"
#include "vtkAbstractMapper3D.h"
#include "vtkAbstractPicker.h"
#include "vtkAbstractPropPicker.h"
#include "vtkApproximatingSubdivisionFilter.h"
#include "vtkDataSetToDataSetFilter.h"
#include "vtkDataSetToPolyDataFilter.h"
#include "vtkDataSetToStructuredGridFilter.h"
#include "vtkDataSetToStructuredPointsFilter.h"
#include "vtkDataSetToUnstructuredGridFilter.h"
#include "vtkDicer.h"
#include "vtkEncodedGradientEstimator.h"
#include "vtkExporter.h"
#include "vtkGraphicsFactory.h"
#include "vtkImporter.h"
#include "vtkInterpolatingSubdivisionFilter.h"
#include "vtkMapper.h"
#include "vtkPointSetToPointSetFilter.h"
#include "vtkPolyDataToPolyDataFilter.h"
#include "vtkProp3D.h"
#include "vtkRectilinearGridToPolyDataFilter.h"
#include "vtkSpline.h"
#include "vtkStructuredGridToPolyDataFilter.h"
#include "vtkStructuredGridToStructuredGridFilter.h"
#include "vtkStructuredPointsToPolyDataFilter.h"
#include "vtkStructuredPointsToStructuredPointsFilter.h"
#include "vtkStructuredPointsToUnstructuredGridFilter.h"
#include "vtkUnstructuredGridToUnstructuredGridFilter.h"
#include "vtkVolumeMapper.h"
#include "vtkVolumeRayCastFunction.h"
#include "vtkVolumeReader.h"
#include "vtkVolumeTextureMapper.h"
#include "vtkWriter.h"
#include "vtk3DSImporter.h"
#include "vtkActor.h"
#include "vtkActorCollection.h"
#include "vtkAppendFilter.h"
#include "vtkAppendPolyData.h"
#include "vtkAssembly.h"
#include "vtkAttributeDataToFieldDataFilter.h"
#include "vtkAxes.h"
#include "vtkBYUReader.h"
#include "vtkBYUWriter.h"
#include "vtkBooleanTexture.h"
#include "vtkBrownianPoints.h"
#include "vtkButterflySubdivisionFilter.h"
#include "vtkCamera.h"
#include "vtkCardinalSpline.h"
#include "vtkCastToConcrete.h"
#include "vtkCellCenters.h"
#include "vtkCellDataToPointData.h"
#include "vtkCellLocator.h"
#include "vtkCellPicker.h"
#include "vtkCleanPolyData.h"
#include "vtkClipPolyData.h"
#include "vtkClipVolume.h"
#include "vtkColorTransferFunction.h"
#include "vtkCone.h"
#include "vtkConeSource.h"
#include "vtkConnectivityFilter.h"
#include "vtkContourFilter.h"
#include "vtkContourGrid.h"
#include "vtkCubeSource.h"
#include "vtkCursor3D.h"
#include "vtkCullerCollection.h"
#include "vtkCutter.h"
#include "vtkCylinder.h"
#include "vtkCylinderSource.h"
#include "vtkDashedStreamLine.h"
#include "vtkDataObjectReader.h"
#include "vtkDataObjectSource.h"
#include "vtkDataObjectToDataSetFilter.h"
#include "vtkDataObjectWriter.h"
#include "vtkDataReader.h"
#include "vtkDataSetMapper.h"
#include "vtkDataSetReader.h"
#include "vtkDataSetSource.h"
#include "vtkDataSetToDataObjectFilter.h"
#include "vtkDataSetTriangleFilter.h"
#include "vtkDataSetWriter.h"
#include "vtkDataWriter.h"
#include "vtkDecimatePro.h"
#include "vtkDelaunay2D.h"
#include "vtkDelaunay3D.h"
#include "vtkDiskSource.h"
#include "vtkEdgePoints.h"
#include "vtkElevationFilter.h"
#include "vtkEncodedGradientShader.h"
#include "vtkExtractEdges.h"
#include "vtkExtractGeometry.h"
#include "vtkExtractPolyDataGeometry.h"
#include "vtkExtractPolyDataPiece.h"
#include "vtkExtractGrid.h"
#include "vtkExtractTensorComponents.h"
#include "vtkExtractUnstructuredGrid.h"
#include "vtkExtractVOI.h"
#include "vtkExtractVectorComponents.h"
#include "vtkFeatureEdges.h"
#include "vtkFieldDataToAttributeDataFilter.h"
#include "vtkFiniteDifferenceGradientEstimator.h"
#include "vtkFollower.h"
#include "vtkFrustumCoverageCuller.h"
#include "vtkGaussianSplatter.h"
#include "vtkGeometryFilter.h"
#include "vtkGlyph2D.h"
#include "vtkGlyph3D.h"
#include "vtkGhostLevelToScalarFilter.h"
#include "vtkHedgeHog.h"
#include "vtkHull.h"
#include "vtkHyperStreamline.h"
#include "vtkIdFilter.h"
#include "vtkImageActor.h"
#include "vtkImplicitBoolean.h"
#include "vtkImplicitDataSet.h"
#include "vtkImplicitModeller.h"
#include "vtkImplicitSelectionLoop.h"
#include "vtkImplicitTextureCoords.h"
#include "vtkImplicitVolume.h"
#include "vtkImplicitWindowFunction.h"
#include "vtkInteractorStyle.h"
#include "vtkInteractorStyleFlight.h"
#include "vtkInteractorStyleJoystickActor.h"
#include "vtkInteractorStyleJoystickCamera.h"
#include "vtkInteractorStyleSwitch.h"
#include "vtkInteractorStyleTrackball.h"
#include "vtkInteractorStyleTrackballActor.h"
#include "vtkInteractorStyleTrackballCamera.h"
#include "vtkInteractorStyleUser.h"
#include "vtkInterpolateDataSetAttributes.h"
#include "vtkIVExporter.h"
#include "vtkKochanekSpline.h"
#include "vtkLODActor.h"
#include "vtkLODProp3D.h"
#include "vtkLight.h"
#include "vtkLightCollection.h"
#include "vtkLineSource.h"
#include "vtkLinearExtrusionFilter.h"
#include "vtkLinearSubdivisionFilter.h"
#include "vtkLinkEdgels.h"
#include "vtkLoopSubdivisionFilter.h"
#include "vtkMCubesReader.h"
#include "vtkMCubesWriter.h"
#include "vtkMapperCollection.h"
#include "vtkMaskPoints.h"
#include "vtkMaskPolyData.h"
#include "vtkMergeFilter.h"
#include "vtkMergeDataObjectFilter.h"
#include "vtkMergePoints.h"
#include "vtkOBBDicer.h"
#include "vtkOBBTree.h"
#include "vtkOBJExporter.h"
#include "vtkOutlineFilter.h"
#include "vtkOutlineSource.h"
#include "vtkPLOT3DReader.h"
#include "vtkPicker.h"
#include "vtkPiecewiseFunction.h"
#include "vtkPlaneSource.h"
#include "vtkPlanes.h"
#include "vtkPointDataToCellData.h"
#include "vtkPointLoad.h"
#include "vtkPointPicker.h"
#include "vtkPointSetSource.h"
#include "vtkPointSource.h"
#include "vtkPolyDataCollection.h"
#include "vtkPolyDataConnectivityFilter.h"
#include "vtkPolyDataMapper.h"
#include "vtkPolyDataNormals.h"
#include "vtkPolyDataReader.h"
#include "vtkPolyDataStreamer.h"
#include "vtkPolyDataWriter.h"
#include "vtkProbeFilter.h"
#include "vtkProgrammableAttributeDataFilter.h"
#include "vtkProgrammableDataObjectSource.h"
#include "vtkProgrammableFilter.h"
#include "vtkProgrammableGlyphFilter.h"
#include "vtkProgrammableSource.h"
#include "vtkProjectedPolyDataRayBounder.h"
#include "vtkProperty.h"
#include "vtkPropPicker.h"
#include "vtkProp3DCollection.h"
#include "vtkQuadricClustering.h"
#include "vtkQuadricDecimation.h"
#include "vtkQuantizePolyDataPoints.h"
#include "vtkRayCaster.h"
#include "vtkRectilinearGridGeometryFilter.h"
#include "vtkRectilinearGridReader.h"
#include "vtkRectilinearGridSource.h"
#include "vtkRectilinearGridWriter.h"
#include "vtkRecursiveDividingCubes.h"
#include "vtkRecursiveSphereDirectionEncoder.h"
#include "vtkRemoveGhostCells.h"
#include "vtkRenderWindow.h"
#include "vtkRenderWindowCollection.h"
#include "vtkRenderWindowInteractor.h"
#include "vtkRenderer.h"
#include "vtkRendererCollection.h"
#include "vtkRendererSource.h"
#include "vtkReverseSense.h"
#include "vtkRibbonFilter.h"
#include "vtkRotationalExtrusionFilter.h"
#include "vtkRuledSurfaceFilter.h"
#include "vtkSLCReader.h"
#include "vtkSTLReader.h"
#include "vtkSTLWriter.h"
#include "vtkSampleFunction.h"
#include "vtkScalarTree.h"
#include "vtkSelectPolyData.h"
#include "vtkSelectVisiblePoints.h"
#include "vtkShepardMethod.h"
#include "vtkShrinkFilter.h"
#include "vtkShrinkPolyData.h"
#include "vtkSimpleElevationFilter.h"
#include "vtkSmoothPolyDataFilter.h"
#include "vtkSpatialRepresentationFilter.h"
#include "vtkSphere.h"
#include "vtkSphereSource.h"
#include "vtkStreamLine.h"
#include "vtkStreamPoints.h"
#include "vtkStreamer.h"
#include "vtkStripper.h"
#include "vtkStructuredGridGeometryFilter.h"
#include "vtkStructuredGridOutlineFilter.h"
#include "vtkStructuredGridReader.h"
#include "vtkStructuredGridSource.h"
#include "vtkStructuredGridWriter.h"
#include "vtkStructuredPointsGeometryFilter.h"
#include "vtkStructuredPointsCollection.h"
#include "vtkStructuredPointsReader.h"
#include "vtkStructuredPointsSource.h"
#include "vtkStructuredPointsWriter.h"
#include "vtkSubPixelPositionEdgels.h"
#include "vtkTensorGlyph.h"
#include "vtkTextSource.h"
#include "vtkTexture.h"
#include "vtkTextureMapToCylinder.h"
#include "vtkTextureMapToPlane.h"
#include "vtkTextureMapToSphere.h"
#include "vtkTexturedSphereSource.h"
#include "vtkThreshold.h"
#include "vtkThresholdPoints.h"
#include "vtkThresholdTextureCoords.h"
#include "vtkTransformFilter.h"
#include "vtkTransformPolyDataFilter.h"
#include "vtkTransformTextureCoords.h"
#include "vtkTriangleFilter.h"
#include "vtkTriangularTexture.h"
#include "vtkTriangularTCoords.h"
#include "vtkTubeFilter.h"
#include "vtkUGFacetReader.h"
#include "vtkUnstructuredGridReader.h"
#include "vtkUnstructuredGridSource.h"
#include "vtkUnstructuredGridWriter.h"
#include "vtkVRMLExporter.h"
#include "vtkVectorDot.h"
#include "vtkVectorNorm.h"
#include "vtkVectorText.h"
#include "vtkViewRays.h"
#include "vtkVolume.h"
#include "vtkVolumeCollection.h"
#include "vtkVolumeProperty.h"
#include "vtkVolumeRayCastCompositeFunction.h"
#include "vtkVolumeRayCastIsosurfaceFunction.h"
#include "vtkVolumeRayCastMapper.h"
#include "vtkVolumeRayCastMIPFunction.h"
#include "vtkVolumeTextureMapper2D.h"
#include "vtkVolume16Reader.h"
#include "vtkVoxelContoursToSurfaceFilter.h"
#include "vtkVoxelModeller.h"
#include "vtkWarpLens.h"
#include "vtkWarpScalar.h"
#include "vtkWarpTo.h"
#include "vtkWindowedSincPolyDataFilter.h"
#include "vtkWorldPointPicker.h"
#include "vtkWarpVector.h"
#ifdef USE_MESA
#include "vtkMesaActor.h"
#include "vtkMesaCamera.h"
#include "vtkMesaImageActor.h"
#include "vtkMesaLight.h"
#include "vtkMesaPolyDataMapper.h"
#include "vtkMesaProperty.h"
#include "vtkMesaProjectedPolyDataRayBounder.h"
#include "vtkMesaRenderWindow.h"
#include "vtkMesaRenderer.h"
#include "vtkMesaTexture.h"
#include "vtkMesaVolumeTextureMapper2D.h"
#endif
#ifndef USE_MESA
#include "vtkOpenGLActor.h"
#include "vtkOpenGLCamera.h"
#include "vtkOpenGLImageActor.h"
#include "vtkOpenGLLight.h"
#include "vtkOpenGLPolyDataMapper.h"
#include "vtkOpenGLProjectedPolyDataRayBounder.h"
#include "vtkOpenGLProperty.h"
#include "vtkOpenGLRenderer.h"
#include "vtkOpenGLTexture.h"
#include "vtkOpenGLVolumeTextureMapper2D.h"
#endif
#ifndef WIN32
#include "vtkXRenderWindowInteractor.h"
#endif
#ifdef WIN32
#include "vtkWin32OpenGLRenderWindow.h"
#include "vtkWin32RenderWindowInteractor.h"
#endif
#include "vtkPropAssembly.h"
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

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Culler PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkCuller::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::DirectionEncoder PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkDirectionEncoder::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkDirectionEncoder::GetNumberOfEncodedDirections()
		CODE:
		RETVAL = THIS->GetNumberOfEncodedDirections();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::RayBounder PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkRayBounder::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


void
vtkRayBounder::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::AbstractMapper3D PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkAbstractMapper3D::AddClippingPlane(plane)
		vtkPlane *	plane
		CODE:
		THIS->AddClippingPlane(plane);
		XSRETURN_EMPTY;


float *
vtkAbstractMapper3D::GetBounds()
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


float *
vtkAbstractMapper3D::GetCenter()
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetCenter();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


const char *
vtkAbstractMapper3D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkPlaneCollection *
vtkAbstractMapper3D::GetClippingPlanes()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPlaneCollection";
		CODE:
		RETVAL = THIS->GetClippingPlanes();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float
vtkAbstractMapper3D::GetLength()
		CODE:
		RETVAL = THIS->GetLength();
		OUTPUT:
		RETVAL


int
vtkAbstractMapper3D::IsARayCastMapper()
		CODE:
		RETVAL = THIS->IsARayCastMapper();
		OUTPUT:
		RETVAL


int
vtkAbstractMapper3D::IsARenderIntoImageMapper()
		CODE:
		RETVAL = THIS->IsARenderIntoImageMapper();
		OUTPUT:
		RETVAL


void
vtkAbstractMapper3D::RemoveAllClippingPlanes()
		CODE:
		THIS->RemoveAllClippingPlanes();
		XSRETURN_EMPTY;


void
vtkAbstractMapper3D::RemoveClippingPlane(plane)
		vtkPlane *	plane
		CODE:
		THIS->RemoveClippingPlane(plane);
		XSRETURN_EMPTY;


void
vtkAbstractMapper3D::SetClippingPlanes(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::Planes")
		vtkPlanes *	arg1
		CODE:
		THIS->SetClippingPlanes(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::PlaneCollection")
		vtkPlaneCollection *	arg1
		CODE:
		THIS->SetClippingPlanes(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkAbstractMapper3D::SetClippingPlanes\n");



void
vtkAbstractMapper3D::Update()
		CODE:
		THIS->Update();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::AbstractPicker PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkAbstractPicker::AddPickList(arg1)
		vtkProp *	arg1
		CODE:
		THIS->AddPickList(arg1);
		XSRETURN_EMPTY;


void
vtkAbstractPicker::DeletePickList(arg1)
		vtkProp *	arg1
		CODE:
		THIS->DeletePickList(arg1);
		XSRETURN_EMPTY;


const char *
vtkAbstractPicker::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkAbstractPicker::GetPickFromList()
		CODE:
		RETVAL = THIS->GetPickFromList();
		OUTPUT:
		RETVAL


vtkPropCollection *
vtkAbstractPicker::GetPickList()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPropCollection";
		CODE:
		RETVAL = THIS->GetPickList();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float  *
vtkAbstractPicker::GetPickPosition()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetPickPosition();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


vtkRenderer *
vtkAbstractPicker::GetRenderer()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkRenderer";
		CODE:
		RETVAL = THIS->GetRenderer();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float  *
vtkAbstractPicker::GetSelectionPoint()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetSelectionPoint();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


void
vtkAbstractPicker::InitializePickList()
		CODE:
		THIS->InitializePickList();
		XSRETURN_EMPTY;


int
vtkAbstractPicker::Pick(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		float 	arg1
		float 	arg2
		float 	arg3
		vtkRenderer *	arg4
		CODE:
		RETVAL = THIS->Pick(arg1, arg2, arg3, arg4);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkAbstractPicker::Pick\n");



void
vtkAbstractPicker::PickFromListOff()
		CODE:
		THIS->PickFromListOff();
		XSRETURN_EMPTY;


void
vtkAbstractPicker::PickFromListOn()
		CODE:
		THIS->PickFromListOn();
		XSRETURN_EMPTY;


void
vtkAbstractPicker::SetEndPickMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetEndPickMethod",0), newRV(func), 0);
		}
		THIS->SetEndPickMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkAbstractPicker::SetPickFromList(arg1)
		int 	arg1
		CODE:
		THIS->SetPickFromList(arg1);
		XSRETURN_EMPTY;


void
vtkAbstractPicker::SetPickMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetPickMethod",0), newRV(func), 0);
		}
		THIS->SetPickMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkAbstractPicker::SetStartPickMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetStartPickMethod",0), newRV(func), 0);
		}
		THIS->SetStartPickMethod(callperlsub, func);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::AbstractPropPicker PREFIX = vtk

PROTOTYPES: DISABLE



vtkActor *
vtkAbstractPropPicker::GetActor()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkActor";
		CODE:
		RETVAL = THIS->GetActor();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkActor2D *
vtkAbstractPropPicker::GetActor2D()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkActor2D";
		CODE:
		RETVAL = THIS->GetActor2D();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkAssembly *
vtkAbstractPropPicker::GetAssembly()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkAssembly";
		CODE:
		RETVAL = THIS->GetAssembly();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


const char *
vtkAbstractPropPicker::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkAssemblyPath *
vtkAbstractPropPicker::GetPath()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkAssemblyPath";
		CODE:
		RETVAL = THIS->GetPath();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkProp *
vtkAbstractPropPicker::GetProp()
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


vtkProp3D *
vtkAbstractPropPicker::GetProp3D()
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


vtkPropAssembly *
vtkAbstractPropPicker::GetPropAssembly()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPropAssembly";
		CODE:
		RETVAL = THIS->GetPropAssembly();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkVolume *
vtkAbstractPropPicker::GetVolume()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkVolume";
		CODE:
		RETVAL = THIS->GetVolume();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkAbstractPropPicker::SetPath(arg1)
		vtkAssemblyPath *	arg1
		CODE:
		THIS->SetPath(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ApproximatingSubdivisionFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkApproximatingSubdivisionFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkApproximatingSubdivisionFilter::GetNumberOfSubdivisions()
		CODE:
		RETVAL = THIS->GetNumberOfSubdivisions();
		OUTPUT:
		RETVAL


void
vtkApproximatingSubdivisionFilter::SetNumberOfSubdivisions(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfSubdivisions(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::DataSetToDataSetFilter PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkDataSetToDataSetFilter::ComputeInputUpdateExtents(output)
		vtkDataObject *	output
		CODE:
		THIS->ComputeInputUpdateExtents(output);
		XSRETURN_EMPTY;


const char *
vtkDataSetToDataSetFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkDataSetToDataSetFilter::GetInput()
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


vtkDataSet *
vtkDataSetToDataSetFilter::GetOutput(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetOutput(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE: items == 1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataSetToDataSetFilter::GetOutput\n");



vtkPolyData *
vtkDataSetToDataSetFilter::GetPolyDataOutput()
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
vtkDataSetToDataSetFilter::GetRectilinearGridOutput()
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


vtkStructuredGrid *
vtkDataSetToDataSetFilter::GetStructuredGridOutput()
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
vtkDataSetToDataSetFilter::GetStructuredPointsOutput()
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


vtkUnstructuredGrid *
vtkDataSetToDataSetFilter::GetUnstructuredGridOutput()
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


void
vtkDataSetToDataSetFilter::SetInput(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::ImageData")
		vtkImageData *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataSet")
		vtkDataSet *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataSetToDataSetFilter::SetInput\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::DataSetToPolyDataFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkDataSetToPolyDataFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkDataSetToPolyDataFilter::GetInput()
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


void
vtkDataSetToPolyDataFilter::SetInput(input)
		vtkDataSet *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::DataSetToStructuredGridFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkDataSetToStructuredGridFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkDataSetToStructuredGridFilter::GetInput()
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


void
vtkDataSetToStructuredGridFilter::SetInput(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::ImageData")
		vtkImageData *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataSet")
		vtkDataSet *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataSetToStructuredGridFilter::SetInput\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::DataSetToStructuredPointsFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkDataSetToStructuredPointsFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkDataSetToStructuredPointsFilter::GetInput()
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


void
vtkDataSetToStructuredPointsFilter::SetInput(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::ImageData")
		vtkImageData *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataSet")
		vtkDataSet *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataSetToStructuredPointsFilter::SetInput\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::DataSetToUnstructuredGridFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkDataSetToUnstructuredGridFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkDataSetToUnstructuredGridFilter::GetInput()
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


void
vtkDataSetToUnstructuredGridFilter::SetInput(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::ImageData")
		vtkImageData *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataSet")
		vtkDataSet *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataSetToUnstructuredGridFilter::SetInput\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Dicer PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkDicer::FieldDataOff()
		CODE:
		THIS->FieldDataOff();
		XSRETURN_EMPTY;


void
vtkDicer::FieldDataOn()
		CODE:
		THIS->FieldDataOn();
		XSRETURN_EMPTY;


const char *
vtkDicer::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkDicer::GetDiceMode()
		CODE:
		RETVAL = THIS->GetDiceMode();
		OUTPUT:
		RETVAL


int
vtkDicer::GetFieldData()
		CODE:
		RETVAL = THIS->GetFieldData();
		OUTPUT:
		RETVAL


unsigned long
vtkDicer::GetMemoryLimit()
		CODE:
		RETVAL = THIS->GetMemoryLimit();
		OUTPUT:
		RETVAL


int
vtkDicer::GetNumberOfActualPieces()
		CODE:
		RETVAL = THIS->GetNumberOfActualPieces();
		OUTPUT:
		RETVAL


int
vtkDicer::GetNumberOfPieces()
		CODE:
		RETVAL = THIS->GetNumberOfPieces();
		OUTPUT:
		RETVAL


int
vtkDicer::GetNumberOfPointsPerPiece()
		CODE:
		RETVAL = THIS->GetNumberOfPointsPerPiece();
		OUTPUT:
		RETVAL


void
vtkDicer::SetDiceMode(arg1)
		int 	arg1
		CODE:
		THIS->SetDiceMode(arg1);
		XSRETURN_EMPTY;


void
vtkDicer::SetDiceModeToMemoryLimitPerPiece()
		CODE:
		THIS->SetDiceModeToMemoryLimitPerPiece();
		XSRETURN_EMPTY;


void
vtkDicer::SetDiceModeToNumberOfPointsPerPiece()
		CODE:
		THIS->SetDiceModeToNumberOfPointsPerPiece();
		XSRETURN_EMPTY;


void
vtkDicer::SetDiceModeToSpecifiedNumberOfPieces()
		CODE:
		THIS->SetDiceModeToSpecifiedNumberOfPieces();
		XSRETURN_EMPTY;


void
vtkDicer::SetFieldData(arg1)
		int 	arg1
		CODE:
		THIS->SetFieldData(arg1);
		XSRETURN_EMPTY;


void
vtkDicer::SetMemoryLimit(arg1)
		unsigned long 	arg1
		CODE:
		THIS->SetMemoryLimit(arg1);
		XSRETURN_EMPTY;


void
vtkDicer::SetNumberOfPieces(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfPieces(arg1);
		XSRETURN_EMPTY;


void
vtkDicer::SetNumberOfPointsPerPiece(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfPointsPerPiece(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::EncodedGradientEstimator PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkEncodedGradientEstimator::BoundsClipOff()
		CODE:
		THIS->BoundsClipOff();
		XSRETURN_EMPTY;


void
vtkEncodedGradientEstimator::BoundsClipOn()
		CODE:
		THIS->BoundsClipOn();
		XSRETURN_EMPTY;


void
vtkEncodedGradientEstimator::ComputeGradientMagnitudesOff()
		CODE:
		THIS->ComputeGradientMagnitudesOff();
		XSRETURN_EMPTY;


void
vtkEncodedGradientEstimator::ComputeGradientMagnitudesOn()
		CODE:
		THIS->ComputeGradientMagnitudesOn();
		XSRETURN_EMPTY;


void
vtkEncodedGradientEstimator::CylinderClipOff()
		CODE:
		THIS->CylinderClipOff();
		XSRETURN_EMPTY;


void
vtkEncodedGradientEstimator::CylinderClipOn()
		CODE:
		THIS->CylinderClipOn();
		XSRETURN_EMPTY;


int  *
vtkEncodedGradientEstimator::GetBounds()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetBounds();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


int
vtkEncodedGradientEstimator::GetBoundsClip()
		CODE:
		RETVAL = THIS->GetBoundsClip();
		OUTPUT:
		RETVAL


const char *
vtkEncodedGradientEstimator::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkEncodedGradientEstimator::GetComputeGradientMagnitudes()
		CODE:
		RETVAL = THIS->GetComputeGradientMagnitudes();
		OUTPUT:
		RETVAL


int
vtkEncodedGradientEstimator::GetCylinderClip()
		CODE:
		RETVAL = THIS->GetCylinderClip();
		OUTPUT:
		RETVAL


vtkDirectionEncoder *
vtkEncodedGradientEstimator::GetDirectionEncoder()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDirectionEncoder";
		CODE:
		RETVAL = THIS->GetDirectionEncoder();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkEncodedGradientEstimator::GetEncodedNormalIndex(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		RETVAL = THIS->GetEncodedNormalIndex(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE: items == 2
		int 	arg1
		CODE:
		RETVAL = THIS->GetEncodedNormalIndex(arg1);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkEncodedGradientEstimator::GetEncodedNormalIndex\n");



float
vtkEncodedGradientEstimator::GetGradientMagnitudeBias()
		CODE:
		RETVAL = THIS->GetGradientMagnitudeBias();
		OUTPUT:
		RETVAL


float
vtkEncodedGradientEstimator::GetGradientMagnitudeScale()
		CODE:
		RETVAL = THIS->GetGradientMagnitudeScale();
		OUTPUT:
		RETVAL


vtkImageData *
vtkEncodedGradientEstimator::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImageData";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float  *
vtkEncodedGradientEstimator::GetInputAspect()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetInputAspect();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float
vtkEncodedGradientEstimator::GetLastUpdateTimeInCPUSeconds()
		CODE:
		RETVAL = THIS->GetLastUpdateTimeInCPUSeconds();
		OUTPUT:
		RETVAL


float
vtkEncodedGradientEstimator::GetLastUpdateTimeInSeconds()
		CODE:
		RETVAL = THIS->GetLastUpdateTimeInSeconds();
		OUTPUT:
		RETVAL


int
vtkEncodedGradientEstimator::GetNumberOfThreads()
		CODE:
		RETVAL = THIS->GetNumberOfThreads();
		OUTPUT:
		RETVAL


int
vtkEncodedGradientEstimator::GetUseCylinderClip()
		CODE:
		RETVAL = THIS->GetUseCylinderClip();
		OUTPUT:
		RETVAL


float
vtkEncodedGradientEstimator::GetZeroNormalThreshold()
		CODE:
		RETVAL = THIS->GetZeroNormalThreshold();
		OUTPUT:
		RETVAL


int
vtkEncodedGradientEstimator::GetZeroPad()
		CODE:
		RETVAL = THIS->GetZeroPad();
		OUTPUT:
		RETVAL


void
vtkEncodedGradientEstimator::SetBounds(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int  	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetBounds(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkEncodedGradientEstimator::SetBounds\n");



void
vtkEncodedGradientEstimator::SetBoundsClip(arg1)
		int 	arg1
		CODE:
		THIS->SetBoundsClip(arg1);
		XSRETURN_EMPTY;


void
vtkEncodedGradientEstimator::SetComputeGradientMagnitudes(arg1)
		int 	arg1
		CODE:
		THIS->SetComputeGradientMagnitudes(arg1);
		XSRETURN_EMPTY;


void
vtkEncodedGradientEstimator::SetCylinderClip(arg1)
		int 	arg1
		CODE:
		THIS->SetCylinderClip(arg1);
		XSRETURN_EMPTY;


void
vtkEncodedGradientEstimator::SetDirectionEncoder(direnc)
		vtkDirectionEncoder *	direnc
		CODE:
		THIS->SetDirectionEncoder(direnc);
		XSRETURN_EMPTY;


void
vtkEncodedGradientEstimator::SetGradientMagnitudeBias(arg1)
		float 	arg1
		CODE:
		THIS->SetGradientMagnitudeBias(arg1);
		XSRETURN_EMPTY;


void
vtkEncodedGradientEstimator::SetGradientMagnitudeScale(arg1)
		float 	arg1
		CODE:
		THIS->SetGradientMagnitudeScale(arg1);
		XSRETURN_EMPTY;


void
vtkEncodedGradientEstimator::SetInput(arg1)
		vtkImageData *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;


void
vtkEncodedGradientEstimator::SetNumberOfThreads(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfThreads(arg1);
		XSRETURN_EMPTY;


void
vtkEncodedGradientEstimator::SetZeroNormalThreshold(v)
		float 	v
		CODE:
		THIS->SetZeroNormalThreshold(v);
		XSRETURN_EMPTY;


void
vtkEncodedGradientEstimator::SetZeroPad(arg1)
		int 	arg1
		CODE:
		THIS->SetZeroPad(arg1);
		XSRETURN_EMPTY;


void
vtkEncodedGradientEstimator::Update()
		CODE:
		THIS->Update();
		XSRETURN_EMPTY;


void
vtkEncodedGradientEstimator::ZeroPadOff()
		CODE:
		THIS->ZeroPadOff();
		XSRETURN_EMPTY;


void
vtkEncodedGradientEstimator::ZeroPadOn()
		CODE:
		THIS->ZeroPadOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Exporter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkExporter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkRenderWindow *
vtkExporter::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkRenderWindow";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkExporter::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


vtkRenderWindow *
vtkExporter::GetRenderWindow()
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
vtkExporter::SetEndWrite(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetEndWrite",0), newRV(func), 0);
		}
		THIS->SetEndWrite(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkExporter::SetInput(renWin)
		vtkRenderWindow *	renWin
		CODE:
		THIS->SetInput(renWin);
		XSRETURN_EMPTY;


void
vtkExporter::SetRenderWindow(arg1)
		vtkRenderWindow *	arg1
		CODE:
		THIS->SetRenderWindow(arg1);
		XSRETURN_EMPTY;


void
vtkExporter::SetStartWrite(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetStartWrite",0), newRV(func), 0);
		}
		THIS->SetStartWrite(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkExporter::Update()
		CODE:
		THIS->Update();
		XSRETURN_EMPTY;


void
vtkExporter::Write()
		CODE:
		THIS->Write();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::GraphicsFactory PREFIX = vtk

PROTOTYPES: DISABLE



vtkObject *
vtkGraphicsFactory::CreateInstance(vtkclassname)
		char *	vtkclassname
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkObject";
		CODE:
		RETVAL = THIS->CreateInstance(vtkclassname);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


const char *
vtkGraphicsFactory::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


const char *
vtkGraphicsFactory::GetRenderLibrary()
		CODE:
		RETVAL = THIS->GetRenderLibrary();
		OUTPUT:
		RETVAL


static vtkGraphicsFactory*
vtkGraphicsFactory::New()
		CODE:
		RETVAL = vtkGraphicsFactory::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Importer PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImporter::ComputeNormalsOff()
		CODE:
		THIS->ComputeNormalsOff();
		XSRETURN_EMPTY;


void
vtkImporter::ComputeNormalsOn()
		CODE:
		THIS->ComputeNormalsOn();
		XSRETURN_EMPTY;


const char *
vtkImporter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImporter::GetComputeNormals()
		CODE:
		RETVAL = THIS->GetComputeNormals();
		OUTPUT:
		RETVAL


FILE *
vtkImporter::GetFileFD()
		CODE:
		RETVAL = THIS->GetFileFD();
		OUTPUT:
		RETVAL


char *
vtkImporter::GetFileName()
		CODE:
		RETVAL = THIS->GetFileName();
		OUTPUT:
		RETVAL


vtkRenderWindow *
vtkImporter::GetRenderWindow()
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


vtkRenderer *
vtkImporter::GetRenderer()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkRenderer";
		CODE:
		RETVAL = THIS->GetRenderer();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkImporter::Read()
		CODE:
		THIS->Read();
		XSRETURN_EMPTY;


void
vtkImporter::SetComputeNormals(arg1)
		int 	arg1
		CODE:
		THIS->SetComputeNormals(arg1);
		XSRETURN_EMPTY;


void
vtkImporter::SetFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetFileName(arg1);
		XSRETURN_EMPTY;


void
vtkImporter::SetRenderWindow(arg1)
		vtkRenderWindow *	arg1
		CODE:
		THIS->SetRenderWindow(arg1);
		XSRETURN_EMPTY;


void
vtkImporter::Update()
		CODE:
		THIS->Update();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::InterpolatingSubdivisionFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkInterpolatingSubdivisionFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkInterpolatingSubdivisionFilter::GetNumberOfSubdivisions()
		CODE:
		RETVAL = THIS->GetNumberOfSubdivisions();
		OUTPUT:
		RETVAL


void
vtkInterpolatingSubdivisionFilter::SetNumberOfSubdivisions(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfSubdivisions(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Mapper PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkMapper::CreateDefaultLookupTable()
		CODE:
		THIS->CreateDefaultLookupTable();
		XSRETURN_EMPTY;


const char *
vtkMapper::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkMapper::GetColorMode()
		CODE:
		RETVAL = THIS->GetColorMode();
		OUTPUT:
		RETVAL


const char *
vtkMapper::GetColorModeAsString()
		CODE:
		RETVAL = THIS->GetColorModeAsString();
		OUTPUT:
		RETVAL


vtkScalars *
vtkMapper::GetColors()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkScalars";
		CODE:
		RETVAL = THIS->GetColors();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkMapper::GetGlobalImmediateModeRendering()
		CODE:
		RETVAL = THIS->GetGlobalImmediateModeRendering();
		OUTPUT:
		RETVAL


int
vtkMapper::GetImmediateModeRendering()
		CODE:
		RETVAL = THIS->GetImmediateModeRendering();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkMapper::GetInputAsDataSet()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetInputAsDataSet();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkScalarsToColors *
vtkMapper::GetLookupTable()
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


unsigned long
vtkMapper::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


float
vtkMapper::GetRenderTime()
		CODE:
		RETVAL = THIS->GetRenderTime();
		OUTPUT:
		RETVAL


int
vtkMapper::GetResolveCoincidentTopology()
		CODE:
		RETVAL = THIS->GetResolveCoincidentTopology();
		OUTPUT:
		RETVAL


double
vtkMapper::GetResolveCoincidentTopologyZShift()
		CODE:
		RETVAL = THIS->GetResolveCoincidentTopologyZShift();
		OUTPUT:
		RETVAL


int
vtkMapper::GetScalarMode()
		CODE:
		RETVAL = THIS->GetScalarMode();
		OUTPUT:
		RETVAL


const char *
vtkMapper::GetScalarModeAsString()
		CODE:
		RETVAL = THIS->GetScalarModeAsString();
		OUTPUT:
		RETVAL


float  *
vtkMapper::GetScalarRange()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetScalarRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


int
vtkMapper::GetScalarVisibility()
		CODE:
		RETVAL = THIS->GetScalarVisibility();
		OUTPUT:
		RETVAL


void
vtkMapper::GlobalImmediateModeRenderingOff()
		CODE:
		THIS->GlobalImmediateModeRenderingOff();
		XSRETURN_EMPTY;


void
vtkMapper::GlobalImmediateModeRenderingOn()
		CODE:
		THIS->GlobalImmediateModeRenderingOn();
		XSRETURN_EMPTY;


void
vtkMapper::ImmediateModeRenderingOff()
		CODE:
		THIS->ImmediateModeRenderingOff();
		XSRETURN_EMPTY;


void
vtkMapper::ImmediateModeRenderingOn()
		CODE:
		THIS->ImmediateModeRenderingOn();
		XSRETURN_EMPTY;


void
vtkMapper::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;


void
vtkMapper::Render(ren, a)
		vtkRenderer *	ren
		vtkActor *	a
		CODE:
		THIS->Render(ren, a);
		XSRETURN_EMPTY;


void
vtkMapper::ScalarVisibilityOff()
		CODE:
		THIS->ScalarVisibilityOff();
		XSRETURN_EMPTY;


void
vtkMapper::ScalarVisibilityOn()
		CODE:
		THIS->ScalarVisibilityOn();
		XSRETURN_EMPTY;


void
vtkMapper::SetColorMode(arg1)
		int 	arg1
		CODE:
		THIS->SetColorMode(arg1);
		XSRETURN_EMPTY;


void
vtkMapper::SetColorModeToDefault()
		CODE:
		THIS->SetColorModeToDefault();
		XSRETURN_EMPTY;


void
vtkMapper::SetColorModeToLuminance()
		CODE:
		THIS->SetColorModeToLuminance();
		XSRETURN_EMPTY;


void
vtkMapper::SetColorModeToMapScalars()
		CODE:
		THIS->SetColorModeToMapScalars();
		XSRETURN_EMPTY;


void
vtkMapper::SetGlobalImmediateModeRendering(val)
		int 	val
		CODE:
		THIS->SetGlobalImmediateModeRendering(val);
		XSRETURN_EMPTY;


void
vtkMapper::SetImmediateModeRendering(arg1)
		int 	arg1
		CODE:
		THIS->SetImmediateModeRendering(arg1);
		XSRETURN_EMPTY;


void
vtkMapper::SetLookupTable(lut)
		vtkScalarsToColors *	lut
		CODE:
		THIS->SetLookupTable(lut);
		XSRETURN_EMPTY;


void
vtkMapper::SetRenderTime(time)
		float 	time
		CODE:
		THIS->SetRenderTime(time);
		XSRETURN_EMPTY;


void
vtkMapper::SetResolveCoincidentTopology(val)
		int 	val
		CODE:
		THIS->SetResolveCoincidentTopology(val);
		XSRETURN_EMPTY;


void
vtkMapper::SetResolveCoincidentTopologyToDefault()
		CODE:
		THIS->SetResolveCoincidentTopologyToDefault();
		XSRETURN_EMPTY;


void
vtkMapper::SetResolveCoincidentTopologyToOff()
		CODE:
		THIS->SetResolveCoincidentTopologyToOff();
		XSRETURN_EMPTY;


void
vtkMapper::SetResolveCoincidentTopologyToPolygonOffset()
		CODE:
		THIS->SetResolveCoincidentTopologyToPolygonOffset();
		XSRETURN_EMPTY;


void
vtkMapper::SetResolveCoincidentTopologyToShiftZBuffer()
		CODE:
		THIS->SetResolveCoincidentTopologyToShiftZBuffer();
		XSRETURN_EMPTY;


void
vtkMapper::SetResolveCoincidentTopologyZShift(val)
		double 	val
		CODE:
		THIS->SetResolveCoincidentTopologyZShift(val);
		XSRETURN_EMPTY;


void
vtkMapper::SetScalarMode(arg1)
		int 	arg1
		CODE:
		THIS->SetScalarMode(arg1);
		XSRETURN_EMPTY;


void
vtkMapper::SetScalarModeToDefault()
		CODE:
		THIS->SetScalarModeToDefault();
		XSRETURN_EMPTY;


void
vtkMapper::SetScalarModeToUseCellData()
		CODE:
		THIS->SetScalarModeToUseCellData();
		XSRETURN_EMPTY;


void
vtkMapper::SetScalarModeToUsePointData()
		CODE:
		THIS->SetScalarModeToUsePointData();
		XSRETURN_EMPTY;


void
vtkMapper::SetScalarRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetScalarRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkMapper::SetScalarRange\n");



void
vtkMapper::SetScalarVisibility(arg1)
		int 	arg1
		CODE:
		THIS->SetScalarVisibility(arg1);
		XSRETURN_EMPTY;


void
vtkMapper::ShallowCopy(m)
		vtkMapper *	m
		CODE:
		THIS->ShallowCopy(m);
		XSRETURN_EMPTY;


void
vtkMapper::Update()
		CODE:
		THIS->Update();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::PointSetToPointSetFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkPointSetToPointSetFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkPointSet *
vtkPointSetToPointSetFilter::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPointSet";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkPointSet *
vtkPointSetToPointSetFilter::GetOutput(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPointSet";
		CODE:
		RETVAL = THIS->GetOutput(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE: items == 1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPointSet";
		CODE:
		RETVAL = THIS->GetOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPointSetToPointSetFilter::GetOutput\n");



vtkPolyData *
vtkPointSetToPointSetFilter::GetPolyDataOutput()
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


vtkStructuredGrid *
vtkPointSetToPointSetFilter::GetStructuredGridOutput()
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


vtkUnstructuredGrid *
vtkPointSetToPointSetFilter::GetUnstructuredGridOutput()
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


void
vtkPointSetToPointSetFilter::SetInput(input)
		vtkPointSet *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::PolyDataToPolyDataFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkPolyDataToPolyDataFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkPolyData *
vtkPolyDataToPolyDataFilter::GetInput()
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


void
vtkPolyDataToPolyDataFilter::SetInput(input)
		vtkPolyData *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Prop3D PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkProp3D::AddOrientation(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->AddOrientation(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProp3D::AddOrientation\n");



void
vtkProp3D::AddPosition(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->AddPosition(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProp3D::AddPosition\n");



float *
vtkProp3D::GetBounds()
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


float *
vtkProp3D::GetCenter()
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetCenter();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


const char *
vtkProp3D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkProp3D::GetLength()
		CODE:
		RETVAL = THIS->GetLength();
		OUTPUT:
		RETVAL


void
vtkProp3D::GetMatrix(arg1 = 0)
	CASE: items == 2
		vtkMatrix4x4 *	arg1
		CODE:
		THIS->GetMatrix(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProp3D::GetMatrix\n");



float *
vtkProp3D::GetOrientation()
	CASE: items == 1
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetOrientation();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float *
vtkProp3D::GetOrientationWXYZ()
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetOrientationWXYZ();
		EXTEND(SP, 4);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));


float  *
vtkProp3D::GetOrigin()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetOrigin();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkProp3D::GetPosition()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetPosition();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkProp3D::GetScale()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetScale();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


vtkMatrix4x4 *
vtkProp3D::GetUserMatrix()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkMatrix4x4";
		CODE:
		RETVAL = THIS->GetUserMatrix();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkLinearTransform *
vtkProp3D::GetUserTransform()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkLinearTransform";
		CODE:
		RETVAL = THIS->GetUserTransform();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float *
vtkProp3D::GetXRange()
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetXRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


float *
vtkProp3D::GetYRange()
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetYRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


float *
vtkProp3D::GetZRange()
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetZRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


void
vtkProp3D::InitPathTraversal()
		CODE:
		THIS->InitPathTraversal();
		XSRETURN_EMPTY;


void
vtkProp3D::PokeMatrix(matrix)
		vtkMatrix4x4 *	matrix
		CODE:
		THIS->PokeMatrix(matrix);
		XSRETURN_EMPTY;


void
vtkProp3D::RotateWXYZ(arg1, arg2, arg3, arg4)
		float 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		CODE:
		THIS->RotateWXYZ(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;


void
vtkProp3D::RotateX(arg1)
		float 	arg1
		CODE:
		THIS->RotateX(arg1);
		XSRETURN_EMPTY;


void
vtkProp3D::RotateY(arg1)
		float 	arg1
		CODE:
		THIS->RotateY(arg1);
		XSRETURN_EMPTY;


void
vtkProp3D::RotateZ(arg1)
		float 	arg1
		CODE:
		THIS->RotateZ(arg1);
		XSRETURN_EMPTY;


void
vtkProp3D::SetOrientation(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetOrientation(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProp3D::SetOrientation\n");



void
vtkProp3D::SetOrigin(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetOrigin(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProp3D::SetOrigin\n");



void
vtkProp3D::SetPosition(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetPosition(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProp3D::SetPosition\n");



void
vtkProp3D::SetScale(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetScale(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 2
		float 	arg1
		CODE:
		THIS->SetScale(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProp3D::SetScale\n");



void
vtkProp3D::SetUserMatrix(matrix)
		vtkMatrix4x4 *	matrix
		CODE:
		THIS->SetUserMatrix(matrix);
		XSRETURN_EMPTY;


void
vtkProp3D::SetUserTransform(transform)
		vtkLinearTransform *	transform
		CODE:
		THIS->SetUserTransform(transform);
		XSRETURN_EMPTY;


void
vtkProp3D::ShallowCopy(prop)
		vtkProp *	prop
		CODE:
		THIS->ShallowCopy(prop);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::RectilinearGridToPolyDataFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkRectilinearGridToPolyDataFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkRectilinearGrid *
vtkRectilinearGridToPolyDataFilter::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkRectilinearGrid";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkRectilinearGridToPolyDataFilter::SetInput(input)
		vtkRectilinearGrid *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Spline PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkSpline::AddPoint(t, x)
		float 	t
		float 	x
		CODE:
		THIS->AddPoint(t, x);
		XSRETURN_EMPTY;


void
vtkSpline::ClampValueOff()
		CODE:
		THIS->ClampValueOff();
		XSRETURN_EMPTY;


void
vtkSpline::ClampValueOn()
		CODE:
		THIS->ClampValueOn();
		XSRETURN_EMPTY;


void
vtkSpline::ClosedOff()
		CODE:
		THIS->ClosedOff();
		XSRETURN_EMPTY;


void
vtkSpline::ClosedOn()
		CODE:
		THIS->ClosedOn();
		XSRETURN_EMPTY;


void
vtkSpline::Compute()
		CODE:
		THIS->Compute();
		XSRETURN_EMPTY;


int
vtkSpline::GetClampValue()
		CODE:
		RETVAL = THIS->GetClampValue();
		OUTPUT:
		RETVAL


const char *
vtkSpline::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkSpline::GetClosed()
		CODE:
		RETVAL = THIS->GetClosed();
		OUTPUT:
		RETVAL


int
vtkSpline::GetLeftConstraint()
		CODE:
		RETVAL = THIS->GetLeftConstraint();
		OUTPUT:
		RETVAL


float
vtkSpline::GetLeftValue()
		CODE:
		RETVAL = THIS->GetLeftValue();
		OUTPUT:
		RETVAL


unsigned long
vtkSpline::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


int
vtkSpline::GetRightConstraint()
		CODE:
		RETVAL = THIS->GetRightConstraint();
		OUTPUT:
		RETVAL


float
vtkSpline::GetRightValue()
		CODE:
		RETVAL = THIS->GetRightValue();
		OUTPUT:
		RETVAL


void
vtkSpline::RemoveAllPoints()
		CODE:
		THIS->RemoveAllPoints();
		XSRETURN_EMPTY;


void
vtkSpline::RemovePoint(t)
		float 	t
		CODE:
		THIS->RemovePoint(t);
		XSRETURN_EMPTY;


void
vtkSpline::SetClampValue(arg1)
		int 	arg1
		CODE:
		THIS->SetClampValue(arg1);
		XSRETURN_EMPTY;


void
vtkSpline::SetClosed(arg1)
		int 	arg1
		CODE:
		THIS->SetClosed(arg1);
		XSRETURN_EMPTY;


void
vtkSpline::SetLeftConstraint(arg1)
		int 	arg1
		CODE:
		THIS->SetLeftConstraint(arg1);
		XSRETURN_EMPTY;


void
vtkSpline::SetLeftValue(arg1)
		float 	arg1
		CODE:
		THIS->SetLeftValue(arg1);
		XSRETURN_EMPTY;


void
vtkSpline::SetRightConstraint(arg1)
		int 	arg1
		CODE:
		THIS->SetRightConstraint(arg1);
		XSRETURN_EMPTY;


void
vtkSpline::SetRightValue(arg1)
		float 	arg1
		CODE:
		THIS->SetRightValue(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::StructuredGridToPolyDataFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkStructuredGridToPolyDataFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkStructuredGrid *
vtkStructuredGridToPolyDataFilter::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredGrid";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkStructuredGridToPolyDataFilter::SetInput(input)
		vtkStructuredGrid *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::StructuredGridToStructuredGridFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkStructuredGridToStructuredGridFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkStructuredGrid *
vtkStructuredGridToStructuredGridFilter::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredGrid";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkStructuredGridToStructuredGridFilter::SetInput(input)
		vtkStructuredGrid *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::StructuredPointsToPolyDataFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkStructuredPointsToPolyDataFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkStructuredPoints *
vtkStructuredPointsToPolyDataFilter::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredPoints";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkStructuredPointsToPolyDataFilter::SetInput(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::StructuredPoints")
		vtkStructuredPoints *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::ImageData")
		vtkImageData *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkStructuredPointsToPolyDataFilter::SetInput\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::StructuredPointsToStructuredPointsFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkStructuredPointsToStructuredPointsFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkStructuredPoints *
vtkStructuredPointsToStructuredPointsFilter::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredPoints";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkStructuredPointsToStructuredPointsFilter::SetInput(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::StructuredPoints")
		vtkStructuredPoints *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::ImageData")
		vtkImageData *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkStructuredPointsToStructuredPointsFilter::SetInput\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::StructuredPointsToUnstructuredGridFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkStructuredPointsToUnstructuredGridFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkStructuredPoints *
vtkStructuredPointsToUnstructuredGridFilter::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredPoints";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkStructuredPointsToUnstructuredGridFilter::SetInput(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::StructuredPoints")
		vtkStructuredPoints *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::ImageData")
		vtkImageData *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkStructuredPointsToUnstructuredGridFilter::SetInput\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::UnstructuredGridToUnstructuredGridFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkUnstructuredGridToUnstructuredGridFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkUnstructuredGrid *
vtkUnstructuredGridToUnstructuredGridFilter::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkUnstructuredGrid";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkUnstructuredGridToUnstructuredGridFilter::SetInput(input)
		vtkUnstructuredGrid *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::VolumeMapper PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkVolumeMapper::CroppingOff()
		CODE:
		THIS->CroppingOff();
		XSRETURN_EMPTY;


void
vtkVolumeMapper::CroppingOn()
		CODE:
		THIS->CroppingOn();
		XSRETURN_EMPTY;


const char *
vtkVolumeMapper::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkVolumeMapper::GetCropping()
		CODE:
		RETVAL = THIS->GetCropping();
		OUTPUT:
		RETVAL


int
vtkVolumeMapper::GetCroppingRegionFlags()
		CODE:
		RETVAL = THIS->GetCroppingRegionFlags();
		OUTPUT:
		RETVAL


float  *
vtkVolumeMapper::GetCroppingRegionPlanes()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetCroppingRegionPlanes();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


vtkImageData *
vtkVolumeMapper::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImageData";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkImageData *
vtkVolumeMapper::GetRGBTextureInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImageData";
		CODE:
		RETVAL = THIS->GetRGBTextureInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkVolumeMapper::SetCropping(arg1)
		int 	arg1
		CODE:
		THIS->SetCropping(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeMapper::SetCroppingRegionFlags(arg1)
		int 	arg1
		CODE:
		THIS->SetCroppingRegionFlags(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeMapper::SetCroppingRegionFlagsToCross()
		CODE:
		THIS->SetCroppingRegionFlagsToCross();
		XSRETURN_EMPTY;


void
vtkVolumeMapper::SetCroppingRegionFlagsToFence()
		CODE:
		THIS->SetCroppingRegionFlagsToFence();
		XSRETURN_EMPTY;


void
vtkVolumeMapper::SetCroppingRegionFlagsToInvertedCross()
		CODE:
		THIS->SetCroppingRegionFlagsToInvertedCross();
		XSRETURN_EMPTY;


void
vtkVolumeMapper::SetCroppingRegionFlagsToInvertedFence()
		CODE:
		THIS->SetCroppingRegionFlagsToInvertedFence();
		XSRETURN_EMPTY;


void
vtkVolumeMapper::SetCroppingRegionFlagsToSubVolume()
		CODE:
		THIS->SetCroppingRegionFlagsToSubVolume();
		XSRETURN_EMPTY;


void
vtkVolumeMapper::SetCroppingRegionPlanes(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		float  	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		float 	arg6
		CODE:
		THIS->SetCroppingRegionPlanes(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVolumeMapper::SetCroppingRegionPlanes\n");



void
vtkVolumeMapper::SetInput(arg1)
		vtkImageData *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeMapper::SetRGBTextureInput(rgbTexture)
		vtkImageData *	rgbTexture
		CODE:
		THIS->SetRGBTextureInput(rgbTexture);
		XSRETURN_EMPTY;


void
vtkVolumeMapper::Update()
		CODE:
		THIS->Update();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::VolumeRayCastFunction PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkVolumeRayCastFunction::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkVolumeRayCastFunction::GetZeroOpacityThreshold(vol)
		vtkVolume *	vol
		CODE:
		RETVAL = THIS->GetZeroOpacityThreshold(vol);
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::VolumeReader PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkVolumeReader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkVolumeReader::GetDataOrigin()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetDataOrigin();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkVolumeReader::GetDataSpacing()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetDataSpacing();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


char *
vtkVolumeReader::GetFilePattern()
		CODE:
		RETVAL = THIS->GetFilePattern();
		OUTPUT:
		RETVAL


char *
vtkVolumeReader::GetFilePrefix()
		CODE:
		RETVAL = THIS->GetFilePrefix();
		OUTPUT:
		RETVAL


vtkStructuredPoints *
vtkVolumeReader::GetImage(ImageNumber)
		int 	ImageNumber
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredPoints";
		CODE:
		RETVAL = THIS->GetImage(ImageNumber);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int  *
vtkVolumeReader::GetImageRange()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetImageRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


void
vtkVolumeReader::SetDataOrigin(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetDataOrigin(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVolumeReader::SetDataOrigin\n");



void
vtkVolumeReader::SetDataSpacing(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetDataSpacing(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVolumeReader::SetDataSpacing\n");



void
vtkVolumeReader::SetFilePattern(arg1)
		char *	arg1
		CODE:
		THIS->SetFilePattern(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeReader::SetFilePrefix(arg1)
		char *	arg1
		CODE:
		THIS->SetFilePrefix(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeReader::SetImageRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int  	arg1
		int 	arg2
		CODE:
		THIS->SetImageRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVolumeReader::SetImageRange\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::VolumeTextureMapper PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkVolumeTextureMapper::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkEncodedGradientEstimator *
vtkVolumeTextureMapper::GetGradientEstimator()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkEncodedGradientEstimator";
		CODE:
		RETVAL = THIS->GetGradientEstimator();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkEncodedGradientShader *
vtkVolumeTextureMapper::GetGradientShader()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkEncodedGradientShader";
		CODE:
		RETVAL = THIS->GetGradientShader();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkVolumeTextureMapper::SetGradientEstimator(gradest)
		vtkEncodedGradientEstimator *	gradest
		CODE:
		THIS->SetGradientEstimator(gradest);
		XSRETURN_EMPTY;


void
vtkVolumeTextureMapper::Update()
		CODE:
		THIS->Update();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Writer PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkWriter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


void
vtkWriter::Update()
		CODE:
		THIS->Update();
		XSRETURN_EMPTY;


void
vtkWriter::Write()
		CODE:
		THIS->Write();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::3DSImporter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtk3DSImporter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtk3DSImporter*
vtk3DSImporter::New()
		CODE:
		RETVAL = vtk3DSImporter::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Actor PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkActor::ApplyProperties()
		CODE:
		THIS->ApplyProperties();
		XSRETURN_EMPTY;


void
vtkActor::GetActors(arg1)
		vtkPropCollection *	arg1
		CODE:
		THIS->GetActors(arg1);
		XSRETURN_EMPTY;


vtkProperty *
vtkActor::GetBackfaceProperty()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkProperty";
		CODE:
		RETVAL = THIS->GetBackfaceProperty();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


const char *
vtkActor::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


unsigned long
vtkActor::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


vtkMapper *
vtkActor::GetMapper()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkMapper";
		CODE:
		RETVAL = THIS->GetMapper();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkActor *
vtkActor::GetNextPart()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkActor";
		CODE:
		RETVAL = THIS->GetNextPart();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkActor::GetNumberOfParts()
		CODE:
		RETVAL = THIS->GetNumberOfParts();
		OUTPUT:
		RETVAL


vtkProperty *
vtkActor::GetProperty()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkProperty";
		CODE:
		RETVAL = THIS->GetProperty();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkActor::GetRedrawMTime()
		CODE:
		RETVAL = THIS->GetRedrawMTime();
		OUTPUT:
		RETVAL


vtkTexture *
vtkActor::GetTexture()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkTexture";
		CODE:
		RETVAL = THIS->GetTexture();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkActor::InitPartTraversal()
		CODE:
		THIS->InitPartTraversal();
		XSRETURN_EMPTY;


static vtkActor*
vtkActor::New()
		CODE:
		RETVAL = vtkActor::New();
		OUTPUT:
		RETVAL


void
vtkActor::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;


void
vtkActor::Render(arg1, arg2)
		vtkRenderer *	arg1
		vtkMapper *	arg2
		CODE:
		THIS->Render(arg1, arg2);
		XSRETURN_EMPTY;


int
vtkActor::RenderOpaqueGeometry(viewport)
		vtkViewport *	viewport
		CODE:
		RETVAL = THIS->RenderOpaqueGeometry(viewport);
		OUTPUT:
		RETVAL


int
vtkActor::RenderTranslucentGeometry(viewport)
		vtkViewport *	viewport
		CODE:
		RETVAL = THIS->RenderTranslucentGeometry(viewport);
		OUTPUT:
		RETVAL


void
vtkActor::SetBackfaceProperty(arg1 = 0)
	CASE: items == 2
		vtkProperty *	arg1
		CODE:
		THIS->SetBackfaceProperty(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkActor::SetBackfaceProperty\n");



void
vtkActor::SetMapper(arg1)
		vtkMapper *	arg1
		CODE:
		THIS->SetMapper(arg1);
		XSRETURN_EMPTY;


void
vtkActor::SetProperty(arg1 = 0)
	CASE: items == 2
		vtkProperty *	arg1
		CODE:
		THIS->SetProperty(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkActor::SetProperty\n");



void
vtkActor::SetTexture(arg1)
		vtkTexture *	arg1
		CODE:
		THIS->SetTexture(arg1);
		XSRETURN_EMPTY;


void
vtkActor::ShallowCopy(prop)
		vtkProp *	prop
		CODE:
		THIS->ShallowCopy(prop);
		XSRETURN_EMPTY;


void
vtkActor::Update()
		CODE:
		THIS->Update();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ActorCollection PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkActorCollection::AddItem(arg1 = 0)
	CASE: items == 2
		vtkActor *	arg1
		CODE:
		THIS->AddItem(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkActorCollection::AddItem\n");



void
vtkActorCollection::ApplyProperties(p)
		vtkProperty *	p
		CODE:
		THIS->ApplyProperties(p);
		XSRETURN_EMPTY;


const char *
vtkActorCollection::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkActor *
vtkActorCollection::GetLastActor()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkActor";
		CODE:
		RETVAL = THIS->GetLastActor();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkActor *
vtkActorCollection::GetLastItem()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkActor";
		CODE:
		RETVAL = THIS->GetLastItem();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkActor *
vtkActorCollection::GetNextActor()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkActor";
		CODE:
		RETVAL = THIS->GetNextActor();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkActor *
vtkActorCollection::GetNextItem()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkActor";
		CODE:
		RETVAL = THIS->GetNextItem();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkActorCollection*
vtkActorCollection::New()
		CODE:
		RETVAL = vtkActorCollection::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::AppendFilter PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkAppendFilter::AddInput(arg1 = 0)
	CASE: items == 2
		vtkDataSet *	arg1
		CODE:
		THIS->AddInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkAppendFilter::AddInput\n");



const char *
vtkAppendFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkAppendFilter::GetInput(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetInput(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE: items == 1
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
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkAppendFilter::GetInput\n");



vtkDataSetCollection *
vtkAppendFilter::GetInputList()
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


static vtkAppendFilter*
vtkAppendFilter::New()
		CODE:
		RETVAL = vtkAppendFilter::New();
		OUTPUT:
		RETVAL


void
vtkAppendFilter::RemoveInput(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataSet")
		vtkDataSet *	arg1
		CODE:
		THIS->RemoveInput(* arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataSet")
		vtkDataSet *	arg1
		CODE:
		THIS->RemoveInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkAppendFilter::RemoveInput\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::AppendPolyData PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkAppendPolyData::AddInput(arg1 = 0)
	CASE: items == 2
		vtkPolyData *	arg1
		CODE:
		THIS->AddInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkAppendPolyData::AddInput\n");



const char *
vtkAppendPolyData::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkPolyData *
vtkAppendPolyData::GetInput(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPolyData";
		CODE:
		RETVAL = THIS->GetInput(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE: items == 1
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
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkAppendPolyData::GetInput\n");



int
vtkAppendPolyData::GetParallelStreaming()
		CODE:
		RETVAL = THIS->GetParallelStreaming();
		OUTPUT:
		RETVAL


int
vtkAppendPolyData::GetUserManagedInputs()
		CODE:
		RETVAL = THIS->GetUserManagedInputs();
		OUTPUT:
		RETVAL


static vtkAppendPolyData*
vtkAppendPolyData::New()
		CODE:
		RETVAL = vtkAppendPolyData::New();
		OUTPUT:
		RETVAL


void
vtkAppendPolyData::ParallelStreamingOff()
		CODE:
		THIS->ParallelStreamingOff();
		XSRETURN_EMPTY;


void
vtkAppendPolyData::ParallelStreamingOn()
		CODE:
		THIS->ParallelStreamingOn();
		XSRETURN_EMPTY;


void
vtkAppendPolyData::RemoveInput(arg1 = 0)
	CASE: items == 2
		vtkPolyData *	arg1
		CODE:
		THIS->RemoveInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkAppendPolyData::RemoveInput\n");



void
vtkAppendPolyData::SetInputByNumber(num, input)
		int 	num
		vtkPolyData *	input
		CODE:
		THIS->SetInputByNumber(num, input);
		XSRETURN_EMPTY;


void
vtkAppendPolyData::SetNumberOfInputs(num)
		int 	num
		CODE:
		THIS->SetNumberOfInputs(num);
		XSRETURN_EMPTY;


void
vtkAppendPolyData::SetParallelStreaming(arg1)
		int 	arg1
		CODE:
		THIS->SetParallelStreaming(arg1);
		XSRETURN_EMPTY;


void
vtkAppendPolyData::SetUserManagedInputs(arg1)
		int 	arg1
		CODE:
		THIS->SetUserManagedInputs(arg1);
		XSRETURN_EMPTY;


void
vtkAppendPolyData::UserManagedInputsOff()
		CODE:
		THIS->UserManagedInputsOff();
		XSRETURN_EMPTY;


void
vtkAppendPolyData::UserManagedInputsOn()
		CODE:
		THIS->UserManagedInputsOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Assembly PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkAssembly::AddPart(arg1)
		vtkProp3D *	arg1
		CODE:
		THIS->AddPart(arg1);
		XSRETURN_EMPTY;


void
vtkAssembly::GetActors(arg1)
		vtkPropCollection *	arg1
		CODE:
		THIS->GetActors(arg1);
		XSRETURN_EMPTY;


const char *
vtkAssembly::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


unsigned long
vtkAssembly::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


vtkAssemblyPath *
vtkAssembly::GetNextPath()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkAssemblyPath";
		CODE:
		RETVAL = THIS->GetNextPath();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkAssembly::GetNumberOfPaths()
		CODE:
		RETVAL = THIS->GetNumberOfPaths();
		OUTPUT:
		RETVAL


vtkProp3DCollection *
vtkAssembly::GetParts()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkProp3DCollection";
		CODE:
		RETVAL = THIS->GetParts();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkAssembly::GetVolumes(arg1)
		vtkPropCollection *	arg1
		CODE:
		THIS->GetVolumes(arg1);
		XSRETURN_EMPTY;


void
vtkAssembly::InitPathTraversal()
		CODE:
		THIS->InitPathTraversal();
		XSRETURN_EMPTY;


static vtkAssembly*
vtkAssembly::New()
		CODE:
		RETVAL = vtkAssembly::New();
		OUTPUT:
		RETVAL


void
vtkAssembly::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;


void
vtkAssembly::RemovePart(arg1)
		vtkProp3D *	arg1
		CODE:
		THIS->RemovePart(arg1);
		XSRETURN_EMPTY;


int
vtkAssembly::RenderOpaqueGeometry(ren)
		vtkViewport *	ren
		CODE:
		RETVAL = THIS->RenderOpaqueGeometry(ren);
		OUTPUT:
		RETVAL


int
vtkAssembly::RenderTranslucentGeometry(ren)
		vtkViewport *	ren
		CODE:
		RETVAL = THIS->RenderTranslucentGeometry(ren);
		OUTPUT:
		RETVAL


void
vtkAssembly::ShallowCopy(prop)
		vtkProp *	prop
		CODE:
		THIS->ShallowCopy(prop);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::AttributeDataToFieldDataFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkAttributeDataToFieldDataFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkAttributeDataToFieldDataFilter::GetPassAttributeData()
		CODE:
		RETVAL = THIS->GetPassAttributeData();
		OUTPUT:
		RETVAL


static vtkAttributeDataToFieldDataFilter*
vtkAttributeDataToFieldDataFilter::New()
		CODE:
		RETVAL = vtkAttributeDataToFieldDataFilter::New();
		OUTPUT:
		RETVAL


void
vtkAttributeDataToFieldDataFilter::PassAttributeDataOff()
		CODE:
		THIS->PassAttributeDataOff();
		XSRETURN_EMPTY;


void
vtkAttributeDataToFieldDataFilter::PassAttributeDataOn()
		CODE:
		THIS->PassAttributeDataOn();
		XSRETURN_EMPTY;


void
vtkAttributeDataToFieldDataFilter::SetPassAttributeData(arg1)
		int 	arg1
		CODE:
		THIS->SetPassAttributeData(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Axes PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkAxes::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkAxes::GetOrigin()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetOrigin();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float
vtkAxes::GetScaleFactor()
		CODE:
		RETVAL = THIS->GetScaleFactor();
		OUTPUT:
		RETVAL


int
vtkAxes::GetSymmetric()
		CODE:
		RETVAL = THIS->GetSymmetric();
		OUTPUT:
		RETVAL


static vtkAxes*
vtkAxes::New()
		CODE:
		RETVAL = vtkAxes::New();
		OUTPUT:
		RETVAL


void
vtkAxes::SetOrigin(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetOrigin(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkAxes::SetOrigin\n");



void
vtkAxes::SetScaleFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetScaleFactor(arg1);
		XSRETURN_EMPTY;


void
vtkAxes::SetSymmetric(arg1)
		int 	arg1
		CODE:
		THIS->SetSymmetric(arg1);
		XSRETURN_EMPTY;


void
vtkAxes::SymmetricOff()
		CODE:
		THIS->SymmetricOff();
		XSRETURN_EMPTY;


void
vtkAxes::SymmetricOn()
		CODE:
		THIS->SymmetricOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::BYUReader PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkBYUReader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


char *
vtkBYUReader::GetDisplacementFileName()
		CODE:
		RETVAL = THIS->GetDisplacementFileName();
		OUTPUT:
		RETVAL


char *
vtkBYUReader::GetGeometryFileName()
		CODE:
		RETVAL = THIS->GetGeometryFileName();
		OUTPUT:
		RETVAL


int
vtkBYUReader::GetPartNumber()
		CODE:
		RETVAL = THIS->GetPartNumber();
		OUTPUT:
		RETVAL


int
vtkBYUReader::GetReadDisplacement()
		CODE:
		RETVAL = THIS->GetReadDisplacement();
		OUTPUT:
		RETVAL


int
vtkBYUReader::GetReadScalar()
		CODE:
		RETVAL = THIS->GetReadScalar();
		OUTPUT:
		RETVAL


int
vtkBYUReader::GetReadTexture()
		CODE:
		RETVAL = THIS->GetReadTexture();
		OUTPUT:
		RETVAL


char *
vtkBYUReader::GetScalarFileName()
		CODE:
		RETVAL = THIS->GetScalarFileName();
		OUTPUT:
		RETVAL


char *
vtkBYUReader::GetTextureFileName()
		CODE:
		RETVAL = THIS->GetTextureFileName();
		OUTPUT:
		RETVAL


static vtkBYUReader*
vtkBYUReader::New()
		CODE:
		RETVAL = vtkBYUReader::New();
		OUTPUT:
		RETVAL


void
vtkBYUReader::ReadDisplacementOff()
		CODE:
		THIS->ReadDisplacementOff();
		XSRETURN_EMPTY;


void
vtkBYUReader::ReadDisplacementOn()
		CODE:
		THIS->ReadDisplacementOn();
		XSRETURN_EMPTY;


void
vtkBYUReader::ReadScalarOff()
		CODE:
		THIS->ReadScalarOff();
		XSRETURN_EMPTY;


void
vtkBYUReader::ReadScalarOn()
		CODE:
		THIS->ReadScalarOn();
		XSRETURN_EMPTY;


void
vtkBYUReader::ReadTextureOff()
		CODE:
		THIS->ReadTextureOff();
		XSRETURN_EMPTY;


void
vtkBYUReader::ReadTextureOn()
		CODE:
		THIS->ReadTextureOn();
		XSRETURN_EMPTY;


void
vtkBYUReader::SetDisplacementFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetDisplacementFileName(arg1);
		XSRETURN_EMPTY;


void
vtkBYUReader::SetGeometryFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetGeometryFileName(arg1);
		XSRETURN_EMPTY;


void
vtkBYUReader::SetPartNumber(arg1)
		int 	arg1
		CODE:
		THIS->SetPartNumber(arg1);
		XSRETURN_EMPTY;


void
vtkBYUReader::SetReadDisplacement(arg1)
		int 	arg1
		CODE:
		THIS->SetReadDisplacement(arg1);
		XSRETURN_EMPTY;


void
vtkBYUReader::SetReadScalar(arg1)
		int 	arg1
		CODE:
		THIS->SetReadScalar(arg1);
		XSRETURN_EMPTY;


void
vtkBYUReader::SetReadTexture(arg1)
		int 	arg1
		CODE:
		THIS->SetReadTexture(arg1);
		XSRETURN_EMPTY;


void
vtkBYUReader::SetScalarFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetScalarFileName(arg1);
		XSRETURN_EMPTY;


void
vtkBYUReader::SetTextureFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetTextureFileName(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::BYUWriter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkBYUWriter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


char *
vtkBYUWriter::GetDisplacementFileName()
		CODE:
		RETVAL = THIS->GetDisplacementFileName();
		OUTPUT:
		RETVAL


char *
vtkBYUWriter::GetGeometryFileName()
		CODE:
		RETVAL = THIS->GetGeometryFileName();
		OUTPUT:
		RETVAL


char *
vtkBYUWriter::GetScalarFileName()
		CODE:
		RETVAL = THIS->GetScalarFileName();
		OUTPUT:
		RETVAL


char *
vtkBYUWriter::GetTextureFileName()
		CODE:
		RETVAL = THIS->GetTextureFileName();
		OUTPUT:
		RETVAL


int
vtkBYUWriter::GetWriteDisplacement()
		CODE:
		RETVAL = THIS->GetWriteDisplacement();
		OUTPUT:
		RETVAL


int
vtkBYUWriter::GetWriteScalar()
		CODE:
		RETVAL = THIS->GetWriteScalar();
		OUTPUT:
		RETVAL


int
vtkBYUWriter::GetWriteTexture()
		CODE:
		RETVAL = THIS->GetWriteTexture();
		OUTPUT:
		RETVAL


static vtkBYUWriter*
vtkBYUWriter::New()
		CODE:
		RETVAL = vtkBYUWriter::New();
		OUTPUT:
		RETVAL


void
vtkBYUWriter::SetDisplacementFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetDisplacementFileName(arg1);
		XSRETURN_EMPTY;


void
vtkBYUWriter::SetGeometryFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetGeometryFileName(arg1);
		XSRETURN_EMPTY;


void
vtkBYUWriter::SetScalarFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetScalarFileName(arg1);
		XSRETURN_EMPTY;


void
vtkBYUWriter::SetTextureFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetTextureFileName(arg1);
		XSRETURN_EMPTY;


void
vtkBYUWriter::SetWriteDisplacement(arg1)
		int 	arg1
		CODE:
		THIS->SetWriteDisplacement(arg1);
		XSRETURN_EMPTY;


void
vtkBYUWriter::SetWriteScalar(arg1)
		int 	arg1
		CODE:
		THIS->SetWriteScalar(arg1);
		XSRETURN_EMPTY;


void
vtkBYUWriter::SetWriteTexture(arg1)
		int 	arg1
		CODE:
		THIS->SetWriteTexture(arg1);
		XSRETURN_EMPTY;


void
vtkBYUWriter::WriteDisplacementOff()
		CODE:
		THIS->WriteDisplacementOff();
		XSRETURN_EMPTY;


void
vtkBYUWriter::WriteDisplacementOn()
		CODE:
		THIS->WriteDisplacementOn();
		XSRETURN_EMPTY;


void
vtkBYUWriter::WriteScalarOff()
		CODE:
		THIS->WriteScalarOff();
		XSRETURN_EMPTY;


void
vtkBYUWriter::WriteScalarOn()
		CODE:
		THIS->WriteScalarOn();
		XSRETURN_EMPTY;


void
vtkBYUWriter::WriteTextureOff()
		CODE:
		THIS->WriteTextureOff();
		XSRETURN_EMPTY;


void
vtkBYUWriter::WriteTextureOn()
		CODE:
		THIS->WriteTextureOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::BooleanTexture PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkBooleanTexture::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


unsigned char  *
vtkBooleanTexture::GetInIn()
		PREINIT:
		unsigned char  * retval;
		PPCODE:
		retval = THIS->GetInIn();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


unsigned char  *
vtkBooleanTexture::GetInOn()
		PREINIT:
		unsigned char  * retval;
		PPCODE:
		retval = THIS->GetInOn();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


unsigned char  *
vtkBooleanTexture::GetInOut()
		PREINIT:
		unsigned char  * retval;
		PPCODE:
		retval = THIS->GetInOut();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


unsigned char  *
vtkBooleanTexture::GetOnIn()
		PREINIT:
		unsigned char  * retval;
		PPCODE:
		retval = THIS->GetOnIn();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


unsigned char  *
vtkBooleanTexture::GetOnOn()
		PREINIT:
		unsigned char  * retval;
		PPCODE:
		retval = THIS->GetOnOn();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


unsigned char  *
vtkBooleanTexture::GetOnOut()
		PREINIT:
		unsigned char  * retval;
		PPCODE:
		retval = THIS->GetOnOut();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


unsigned char  *
vtkBooleanTexture::GetOutIn()
		PREINIT:
		unsigned char  * retval;
		PPCODE:
		retval = THIS->GetOutIn();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


unsigned char  *
vtkBooleanTexture::GetOutOn()
		PREINIT:
		unsigned char  * retval;
		PPCODE:
		retval = THIS->GetOutOn();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


unsigned char  *
vtkBooleanTexture::GetOutOut()
		PREINIT:
		unsigned char  * retval;
		PPCODE:
		retval = THIS->GetOutOut();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


int
vtkBooleanTexture::GetThickness()
		CODE:
		RETVAL = THIS->GetThickness();
		OUTPUT:
		RETVAL


int
vtkBooleanTexture::GetXSize()
		CODE:
		RETVAL = THIS->GetXSize();
		OUTPUT:
		RETVAL


int
vtkBooleanTexture::GetYSize()
		CODE:
		RETVAL = THIS->GetYSize();
		OUTPUT:
		RETVAL


static vtkBooleanTexture*
vtkBooleanTexture::New()
		CODE:
		RETVAL = vtkBooleanTexture::New();
		OUTPUT:
		RETVAL


void
vtkBooleanTexture::SetInIn(arg1 = 0, arg2 = 0)
	CASE: items == 3
		unsigned char  	arg1
		unsigned char 	arg2
		CODE:
		THIS->SetInIn(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkBooleanTexture::SetInIn\n");



void
vtkBooleanTexture::SetInOn(arg1 = 0, arg2 = 0)
	CASE: items == 3
		unsigned char  	arg1
		unsigned char 	arg2
		CODE:
		THIS->SetInOn(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkBooleanTexture::SetInOn\n");



void
vtkBooleanTexture::SetInOut(arg1 = 0, arg2 = 0)
	CASE: items == 3
		unsigned char  	arg1
		unsigned char 	arg2
		CODE:
		THIS->SetInOut(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkBooleanTexture::SetInOut\n");



void
vtkBooleanTexture::SetOnIn(arg1 = 0, arg2 = 0)
	CASE: items == 3
		unsigned char  	arg1
		unsigned char 	arg2
		CODE:
		THIS->SetOnIn(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkBooleanTexture::SetOnIn\n");



void
vtkBooleanTexture::SetOnOn(arg1 = 0, arg2 = 0)
	CASE: items == 3
		unsigned char  	arg1
		unsigned char 	arg2
		CODE:
		THIS->SetOnOn(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkBooleanTexture::SetOnOn\n");



void
vtkBooleanTexture::SetOnOut(arg1 = 0, arg2 = 0)
	CASE: items == 3
		unsigned char  	arg1
		unsigned char 	arg2
		CODE:
		THIS->SetOnOut(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkBooleanTexture::SetOnOut\n");



void
vtkBooleanTexture::SetOutIn(arg1 = 0, arg2 = 0)
	CASE: items == 3
		unsigned char  	arg1
		unsigned char 	arg2
		CODE:
		THIS->SetOutIn(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkBooleanTexture::SetOutIn\n");



void
vtkBooleanTexture::SetOutOn(arg1 = 0, arg2 = 0)
	CASE: items == 3
		unsigned char  	arg1
		unsigned char 	arg2
		CODE:
		THIS->SetOutOn(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkBooleanTexture::SetOutOn\n");



void
vtkBooleanTexture::SetOutOut(arg1 = 0, arg2 = 0)
	CASE: items == 3
		unsigned char  	arg1
		unsigned char 	arg2
		CODE:
		THIS->SetOutOut(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkBooleanTexture::SetOutOut\n");



void
vtkBooleanTexture::SetThickness(arg1)
		int 	arg1
		CODE:
		THIS->SetThickness(arg1);
		XSRETURN_EMPTY;


void
vtkBooleanTexture::SetXSize(arg1)
		int 	arg1
		CODE:
		THIS->SetXSize(arg1);
		XSRETURN_EMPTY;


void
vtkBooleanTexture::SetYSize(arg1)
		int 	arg1
		CODE:
		THIS->SetYSize(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::BrownianPoints PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkBrownianPoints::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkBrownianPoints::GetMaximumSpeed()
		CODE:
		RETVAL = THIS->GetMaximumSpeed();
		OUTPUT:
		RETVAL


float
vtkBrownianPoints::GetMinimumSpeed()
		CODE:
		RETVAL = THIS->GetMinimumSpeed();
		OUTPUT:
		RETVAL


static vtkBrownianPoints*
vtkBrownianPoints::New()
		CODE:
		RETVAL = vtkBrownianPoints::New();
		OUTPUT:
		RETVAL


void
vtkBrownianPoints::SetMaximumSpeed(arg1)
		float 	arg1
		CODE:
		THIS->SetMaximumSpeed(arg1);
		XSRETURN_EMPTY;


void
vtkBrownianPoints::SetMinimumSpeed(arg1)
		float 	arg1
		CODE:
		THIS->SetMinimumSpeed(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ButterflySubdivisionFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkButterflySubdivisionFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkButterflySubdivisionFilter*
vtkButterflySubdivisionFilter::New()
		CODE:
		RETVAL = vtkButterflySubdivisionFilter::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Camera PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkCamera::Azimuth(angle)
		double 	angle
		CODE:
		THIS->Azimuth(angle);
		XSRETURN_EMPTY;


void
vtkCamera::ComputeViewPlaneNormal()
		CODE:
		THIS->ComputeViewPlaneNormal();
		XSRETURN_EMPTY;


void
vtkCamera::Dolly(distance)
		double 	distance
		CODE:
		THIS->Dolly(distance);
		XSRETURN_EMPTY;


void
vtkCamera::Elevation(angle)
		double 	angle
		CODE:
		THIS->Elevation(angle);
		XSRETURN_EMPTY;


vtkMatrix4x4 *
vtkCamera::GetCameraLightTransformMatrix()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkMatrix4x4";
		CODE:
		RETVAL = THIS->GetCameraLightTransformMatrix();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


const char *
vtkCamera::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


double  *
vtkCamera::GetClippingRange()
	CASE: items == 1
		PREINIT:
		double  * retval;
		PPCODE:
		retval = THIS->GetClippingRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


vtkMatrix4x4  *
vtkCamera::GetCompositePerspectiveTransform(aspect, nearz, farz)
		double 	aspect
		double 	nearz
		double 	farz
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkMatrix4x4";
		CODE:
		RETVAL = &(THIS)->GetCompositePerspectiveTransform(aspect, nearz, farz);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkMatrix4x4 *
vtkCamera::GetCompositePerspectiveTransformMatrix(aspect, nearz, farz)
		double 	aspect
		double 	nearz
		double 	farz
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkMatrix4x4";
		CODE:
		RETVAL = THIS->GetCompositePerspectiveTransformMatrix(aspect, nearz, farz);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


double  *
vtkCamera::GetDirectionOfProjection()
	CASE: items == 1
		PREINIT:
		double  * retval;
		PPCODE:
		retval = THIS->GetDirectionOfProjection();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


double
vtkCamera::GetDistance()
		CODE:
		RETVAL = THIS->GetDistance();
		OUTPUT:
		RETVAL


double
vtkCamera::GetEyeAngle()
		CODE:
		RETVAL = THIS->GetEyeAngle();
		OUTPUT:
		RETVAL


double
vtkCamera::GetFocalDisk()
		CODE:
		RETVAL = THIS->GetFocalDisk();
		OUTPUT:
		RETVAL


double  *
vtkCamera::GetFocalPoint()
	CASE: items == 1
		PREINIT:
		double  * retval;
		PPCODE:
		retval = THIS->GetFocalPoint();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


double  *
vtkCamera::GetObliqueAngles()
		PREINIT:
		double  * retval;
		PPCODE:
		retval = THIS->GetObliqueAngles();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


float *
vtkCamera::GetOrientation()
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetOrientation();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float *
vtkCamera::GetOrientationWXYZ()
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetOrientationWXYZ();
		EXTEND(SP, 4);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));


int
vtkCamera::GetParallelProjection()
		CODE:
		RETVAL = THIS->GetParallelProjection();
		OUTPUT:
		RETVAL


double
vtkCamera::GetParallelScale()
		CODE:
		RETVAL = THIS->GetParallelScale();
		OUTPUT:
		RETVAL


vtkMatrix4x4 *
vtkCamera::GetPerspectiveTransformMatrix(aspect, nearz, farz)
		double 	aspect
		double 	nearz
		double 	farz
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkMatrix4x4";
		CODE:
		RETVAL = THIS->GetPerspectiveTransformMatrix(aspect, nearz, farz);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


double  *
vtkCamera::GetPosition()
	CASE: items == 1
		PREINIT:
		double  * retval;
		PPCODE:
		retval = THIS->GetPosition();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


double
vtkCamera::GetRoll()
		CODE:
		RETVAL = THIS->GetRoll();
		OUTPUT:
		RETVAL


double
vtkCamera::GetThickness()
		CODE:
		RETVAL = THIS->GetThickness();
		OUTPUT:
		RETVAL


double
vtkCamera::GetViewAngle()
		CODE:
		RETVAL = THIS->GetViewAngle();
		OUTPUT:
		RETVAL


double  *
vtkCamera::GetViewPlaneNormal()
	CASE: items == 1
		PREINIT:
		double  * retval;
		PPCODE:
		retval = THIS->GetViewPlaneNormal();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


vtkMatrix4x4 *
vtkCamera::GetViewTransformMatrix()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkMatrix4x4";
		CODE:
		RETVAL = THIS->GetViewTransformMatrix();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


double  *
vtkCamera::GetViewUp()
	CASE: items == 1
		PREINIT:
		double  * retval;
		PPCODE:
		retval = THIS->GetViewUp();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


unsigned long
vtkCamera::GetViewingRaysMTime()
		CODE:
		RETVAL = THIS->GetViewingRaysMTime();
		OUTPUT:
		RETVAL


double  *
vtkCamera::GetWindowCenter()
		PREINIT:
		double  * retval;
		PPCODE:
		retval = THIS->GetWindowCenter();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


static vtkCamera*
vtkCamera::New()
		CODE:
		RETVAL = vtkCamera::New();
		OUTPUT:
		RETVAL


void
vtkCamera::OrthogonalizeViewUp()
		CODE:
		THIS->OrthogonalizeViewUp();
		XSRETURN_EMPTY;


void
vtkCamera::ParallelProjectionOff()
		CODE:
		THIS->ParallelProjectionOff();
		XSRETURN_EMPTY;


void
vtkCamera::ParallelProjectionOn()
		CODE:
		THIS->ParallelProjectionOn();
		XSRETURN_EMPTY;


void
vtkCamera::Pitch(angle)
		double 	angle
		CODE:
		THIS->Pitch(angle);
		XSRETURN_EMPTY;


void
vtkCamera::Render(arg1)
		vtkRenderer *	arg1
		CODE:
		THIS->Render(arg1);
		XSRETURN_EMPTY;


void
vtkCamera::Roll(angle)
		double 	angle
		CODE:
		THIS->Roll(angle);
		XSRETURN_EMPTY;


void
vtkCamera::SetClippingRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		double 	arg1
		double 	arg2
		CODE:
		THIS->SetClippingRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkCamera::SetClippingRange\n");



void
vtkCamera::SetDistance(arg1)
		double 	arg1
		CODE:
		THIS->SetDistance(arg1);
		XSRETURN_EMPTY;


void
vtkCamera::SetEyeAngle(arg1)
		double 	arg1
		CODE:
		THIS->SetEyeAngle(arg1);
		XSRETURN_EMPTY;


void
vtkCamera::SetFocalDisk(arg1)
		double 	arg1
		CODE:
		THIS->SetFocalDisk(arg1);
		XSRETURN_EMPTY;


void
vtkCamera::SetFocalPoint(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double 	arg1
		double 	arg2
		double 	arg3
		CODE:
		THIS->SetFocalPoint(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkCamera::SetFocalPoint\n");



void
vtkCamera::SetObliqueAngles(alpha, beta)
		double 	alpha
		double 	beta
		CODE:
		THIS->SetObliqueAngles(alpha, beta);
		XSRETURN_EMPTY;


void
vtkCamera::SetParallelProjection(flag)
		int 	flag
		CODE:
		THIS->SetParallelProjection(flag);
		XSRETURN_EMPTY;


void
vtkCamera::SetParallelScale(scale)
		double 	scale
		CODE:
		THIS->SetParallelScale(scale);
		XSRETURN_EMPTY;


void
vtkCamera::SetPosition(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double 	arg1
		double 	arg2
		double 	arg3
		CODE:
		THIS->SetPosition(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkCamera::SetPosition\n");



void
vtkCamera::SetRoll(angle)
		double 	angle
		CODE:
		THIS->SetRoll(angle);
		XSRETURN_EMPTY;


void
vtkCamera::SetThickness(arg1)
		double 	arg1
		CODE:
		THIS->SetThickness(arg1);
		XSRETURN_EMPTY;


void
vtkCamera::SetViewAngle(angle)
		double 	angle
		CODE:
		THIS->SetViewAngle(angle);
		XSRETURN_EMPTY;


void
vtkCamera::SetViewPlaneNormal(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double 	arg1
		double 	arg2
		double 	arg3
		CODE:
		THIS->SetViewPlaneNormal(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkCamera::SetViewPlaneNormal\n");



void
vtkCamera::SetViewUp(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double 	arg1
		double 	arg2
		double 	arg3
		CODE:
		THIS->SetViewUp(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkCamera::SetViewUp\n");



void
vtkCamera::SetWindowCenter(x, y)
		double 	x
		double 	y
		CODE:
		THIS->SetWindowCenter(x, y);
		XSRETURN_EMPTY;


void
vtkCamera::ViewingRaysModified()
		CODE:
		THIS->ViewingRaysModified();
		XSRETURN_EMPTY;


void
vtkCamera::Yaw(angle)
		double 	angle
		CODE:
		THIS->Yaw(angle);
		XSRETURN_EMPTY;


void
vtkCamera::Zoom(factor)
		double 	factor
		CODE:
		THIS->Zoom(factor);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::CardinalSpline PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkCardinalSpline::Compute()
		CODE:
		THIS->Compute();
		XSRETURN_EMPTY;


float
vtkCardinalSpline::Evaluate(t)
		float 	t
		CODE:
		RETVAL = THIS->Evaluate(t);
		OUTPUT:
		RETVAL


const char *
vtkCardinalSpline::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkCardinalSpline*
vtkCardinalSpline::New()
		CODE:
		RETVAL = vtkCardinalSpline::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::CastToConcrete PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkCastToConcrete::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkCastToConcrete*
vtkCastToConcrete::New()
		CODE:
		RETVAL = vtkCastToConcrete::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::CellCenters PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkCellCenters::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkCellCenters::GetVertexCells()
		CODE:
		RETVAL = THIS->GetVertexCells();
		OUTPUT:
		RETVAL


static vtkCellCenters*
vtkCellCenters::New()
		CODE:
		RETVAL = vtkCellCenters::New();
		OUTPUT:
		RETVAL


void
vtkCellCenters::SetVertexCells(arg1)
		int 	arg1
		CODE:
		THIS->SetVertexCells(arg1);
		XSRETURN_EMPTY;


void
vtkCellCenters::VertexCellsOff()
		CODE:
		THIS->VertexCellsOff();
		XSRETURN_EMPTY;


void
vtkCellCenters::VertexCellsOn()
		CODE:
		THIS->VertexCellsOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::CellDataToPointData PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkCellDataToPointData::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkCellDataToPointData::GetPassCellData()
		CODE:
		RETVAL = THIS->GetPassCellData();
		OUTPUT:
		RETVAL


static vtkCellDataToPointData*
vtkCellDataToPointData::New()
		CODE:
		RETVAL = vtkCellDataToPointData::New();
		OUTPUT:
		RETVAL


void
vtkCellDataToPointData::PassCellDataOff()
		CODE:
		THIS->PassCellDataOff();
		XSRETURN_EMPTY;


void
vtkCellDataToPointData::PassCellDataOn()
		CODE:
		THIS->PassCellDataOn();
		XSRETURN_EMPTY;


void
vtkCellDataToPointData::SetPassCellData(arg1)
		int 	arg1
		CODE:
		THIS->SetPassCellData(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::CellLocator PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkCellLocator::BuildLocator()
		CODE:
		THIS->BuildLocator();
		XSRETURN_EMPTY;


void
vtkCellLocator::CacheCellBoundsOff()
		CODE:
		THIS->CacheCellBoundsOff();
		XSRETURN_EMPTY;


void
vtkCellLocator::CacheCellBoundsOn()
		CODE:
		THIS->CacheCellBoundsOn();
		XSRETURN_EMPTY;


void
vtkCellLocator::FreeSearchStructure()
		CODE:
		THIS->FreeSearchStructure();
		XSRETURN_EMPTY;


void
vtkCellLocator::GenerateRepresentation(level, pd)
		int 	level
		vtkPolyData *	pd
		CODE:
		THIS->GenerateRepresentation(level, pd);
		XSRETURN_EMPTY;


int
vtkCellLocator::GetCacheCellBounds()
		CODE:
		RETVAL = THIS->GetCacheCellBounds();
		OUTPUT:
		RETVAL


vtkIdList *
vtkCellLocator::GetCells(bucket)
		int 	bucket
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkIdList";
		CODE:
		RETVAL = THIS->GetCells(bucket);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


const char *
vtkCellLocator::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkCellLocator::GetNumberOfBuckets()
		CODE:
		RETVAL = THIS->GetNumberOfBuckets();
		OUTPUT:
		RETVAL


int
vtkCellLocator::GetNumberOfCellsPerBucket()
		CODE:
		RETVAL = THIS->GetNumberOfCellsPerBucket();
		OUTPUT:
		RETVAL


static vtkCellLocator*
vtkCellLocator::New()
		CODE:
		RETVAL = vtkCellLocator::New();
		OUTPUT:
		RETVAL


void
vtkCellLocator::SetCacheCellBounds(arg1)
		int 	arg1
		CODE:
		THIS->SetCacheCellBounds(arg1);
		XSRETURN_EMPTY;


void
vtkCellLocator::SetNumberOfCellsPerBucket(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfCellsPerBucket(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::CellPicker PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkCellPicker::GetCellId()
		CODE:
		RETVAL = THIS->GetCellId();
		OUTPUT:
		RETVAL


const char *
vtkCellPicker::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkCellPicker::GetPCoords()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetPCoords();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkCellPicker::GetSubId()
		CODE:
		RETVAL = THIS->GetSubId();
		OUTPUT:
		RETVAL


static vtkCellPicker*
vtkCellPicker::New()
		CODE:
		RETVAL = vtkCellPicker::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::CleanPolyData PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkCleanPolyData::ConvertLinesToPointsOff()
		CODE:
		THIS->ConvertLinesToPointsOff();
		XSRETURN_EMPTY;


void
vtkCleanPolyData::ConvertLinesToPointsOn()
		CODE:
		THIS->ConvertLinesToPointsOn();
		XSRETURN_EMPTY;


void
vtkCleanPolyData::ConvertPolysToLinesOff()
		CODE:
		THIS->ConvertPolysToLinesOff();
		XSRETURN_EMPTY;


void
vtkCleanPolyData::ConvertPolysToLinesOn()
		CODE:
		THIS->ConvertPolysToLinesOn();
		XSRETURN_EMPTY;


void
vtkCleanPolyData::ConvertStripsToPolysOff()
		CODE:
		THIS->ConvertStripsToPolysOff();
		XSRETURN_EMPTY;


void
vtkCleanPolyData::ConvertStripsToPolysOn()
		CODE:
		THIS->ConvertStripsToPolysOn();
		XSRETURN_EMPTY;


void
vtkCleanPolyData::CreateDefaultLocator()
		CODE:
		THIS->CreateDefaultLocator();
		XSRETURN_EMPTY;


float
vtkCleanPolyData::GetAbsoluteTolerance()
		CODE:
		RETVAL = THIS->GetAbsoluteTolerance();
		OUTPUT:
		RETVAL


const char *
vtkCleanPolyData::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkCleanPolyData::GetConvertLinesToPoints()
		CODE:
		RETVAL = THIS->GetConvertLinesToPoints();
		OUTPUT:
		RETVAL


int
vtkCleanPolyData::GetConvertPolysToLines()
		CODE:
		RETVAL = THIS->GetConvertPolysToLines();
		OUTPUT:
		RETVAL


int
vtkCleanPolyData::GetConvertStripsToPolys()
		CODE:
		RETVAL = THIS->GetConvertStripsToPolys();
		OUTPUT:
		RETVAL


vtkPointLocator *
vtkCleanPolyData::GetLocator()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPointLocator";
		CODE:
		RETVAL = THIS->GetLocator();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkCleanPolyData::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


float
vtkCleanPolyData::GetTolerance()
		CODE:
		RETVAL = THIS->GetTolerance();
		OUTPUT:
		RETVAL


int
vtkCleanPolyData::GetToleranceIsAbsolute()
		CODE:
		RETVAL = THIS->GetToleranceIsAbsolute();
		OUTPUT:
		RETVAL


static vtkCleanPolyData*
vtkCleanPolyData::New()
		CODE:
		RETVAL = vtkCleanPolyData::New();
		OUTPUT:
		RETVAL


void
vtkCleanPolyData::ReleaseLocator()
		CODE:
		THIS->ReleaseLocator();
		XSRETURN_EMPTY;


void
vtkCleanPolyData::SetAbsoluteTolerance(arg1)
		float 	arg1
		CODE:
		THIS->SetAbsoluteTolerance(arg1);
		XSRETURN_EMPTY;


void
vtkCleanPolyData::SetConvertLinesToPoints(arg1)
		int 	arg1
		CODE:
		THIS->SetConvertLinesToPoints(arg1);
		XSRETURN_EMPTY;


void
vtkCleanPolyData::SetConvertPolysToLines(arg1)
		int 	arg1
		CODE:
		THIS->SetConvertPolysToLines(arg1);
		XSRETURN_EMPTY;


void
vtkCleanPolyData::SetConvertStripsToPolys(arg1)
		int 	arg1
		CODE:
		THIS->SetConvertStripsToPolys(arg1);
		XSRETURN_EMPTY;


void
vtkCleanPolyData::SetLocator(locator)
		vtkPointLocator *	locator
		CODE:
		THIS->SetLocator(locator);
		XSRETURN_EMPTY;


void
vtkCleanPolyData::SetTolerance(arg1)
		float 	arg1
		CODE:
		THIS->SetTolerance(arg1);
		XSRETURN_EMPTY;


void
vtkCleanPolyData::SetToleranceIsAbsolute(arg1)
		int 	arg1
		CODE:
		THIS->SetToleranceIsAbsolute(arg1);
		XSRETURN_EMPTY;


void
vtkCleanPolyData::ToleranceIsAbsoluteOff()
		CODE:
		THIS->ToleranceIsAbsoluteOff();
		XSRETURN_EMPTY;


void
vtkCleanPolyData::ToleranceIsAbsoluteOn()
		CODE:
		THIS->ToleranceIsAbsoluteOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ClipPolyData PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkClipPolyData::CreateDefaultLocator()
		CODE:
		THIS->CreateDefaultLocator();
		XSRETURN_EMPTY;


void
vtkClipPolyData::GenerateClipScalarsOff()
		CODE:
		THIS->GenerateClipScalarsOff();
		XSRETURN_EMPTY;


void
vtkClipPolyData::GenerateClipScalarsOn()
		CODE:
		THIS->GenerateClipScalarsOn();
		XSRETURN_EMPTY;


void
vtkClipPolyData::GenerateClippedOutputOff()
		CODE:
		THIS->GenerateClippedOutputOff();
		XSRETURN_EMPTY;


void
vtkClipPolyData::GenerateClippedOutputOn()
		CODE:
		THIS->GenerateClippedOutputOn();
		XSRETURN_EMPTY;


const char *
vtkClipPolyData::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkImplicitFunction *
vtkClipPolyData::GetClipFunction()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImplicitFunction";
		CODE:
		RETVAL = THIS->GetClipFunction();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkPolyData *
vtkClipPolyData::GetClippedOutput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPolyData";
		CODE:
		RETVAL = THIS->GetClippedOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkClipPolyData::GetGenerateClipScalars()
		CODE:
		RETVAL = THIS->GetGenerateClipScalars();
		OUTPUT:
		RETVAL


int
vtkClipPolyData::GetGenerateClippedOutput()
		CODE:
		RETVAL = THIS->GetGenerateClippedOutput();
		OUTPUT:
		RETVAL


int
vtkClipPolyData::GetInsideOut()
		CODE:
		RETVAL = THIS->GetInsideOut();
		OUTPUT:
		RETVAL


vtkPointLocator *
vtkClipPolyData::GetLocator()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPointLocator";
		CODE:
		RETVAL = THIS->GetLocator();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkClipPolyData::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


float
vtkClipPolyData::GetValue()
		CODE:
		RETVAL = THIS->GetValue();
		OUTPUT:
		RETVAL


void
vtkClipPolyData::InsideOutOff()
		CODE:
		THIS->InsideOutOff();
		XSRETURN_EMPTY;


void
vtkClipPolyData::InsideOutOn()
		CODE:
		THIS->InsideOutOn();
		XSRETURN_EMPTY;


static vtkClipPolyData*
vtkClipPolyData::New()
		CODE:
		RETVAL = vtkClipPolyData::New();
		OUTPUT:
		RETVAL


void
vtkClipPolyData::SetClipFunction(arg1)
		vtkImplicitFunction *	arg1
		CODE:
		THIS->SetClipFunction(arg1);
		XSRETURN_EMPTY;


void
vtkClipPolyData::SetGenerateClipScalars(arg1)
		int 	arg1
		CODE:
		THIS->SetGenerateClipScalars(arg1);
		XSRETURN_EMPTY;


void
vtkClipPolyData::SetGenerateClippedOutput(arg1)
		int 	arg1
		CODE:
		THIS->SetGenerateClippedOutput(arg1);
		XSRETURN_EMPTY;


void
vtkClipPolyData::SetInsideOut(arg1)
		int 	arg1
		CODE:
		THIS->SetInsideOut(arg1);
		XSRETURN_EMPTY;


void
vtkClipPolyData::SetLocator(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::PointLocator")
		vtkPointLocator *	arg1
		CODE:
		THIS->SetLocator(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::PointLocator")
		vtkPointLocator *	arg1
		CODE:
		THIS->SetLocator(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkClipPolyData::SetLocator\n");



void
vtkClipPolyData::SetValue(arg1)
		float 	arg1
		CODE:
		THIS->SetValue(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ClipVolume PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkClipVolume::CreateDefaultLocator()
		CODE:
		THIS->CreateDefaultLocator();
		XSRETURN_EMPTY;


void
vtkClipVolume::GenerateClipScalarsOff()
		CODE:
		THIS->GenerateClipScalarsOff();
		XSRETURN_EMPTY;


void
vtkClipVolume::GenerateClipScalarsOn()
		CODE:
		THIS->GenerateClipScalarsOn();
		XSRETURN_EMPTY;


void
vtkClipVolume::GenerateClippedOutputOff()
		CODE:
		THIS->GenerateClippedOutputOff();
		XSRETURN_EMPTY;


void
vtkClipVolume::GenerateClippedOutputOn()
		CODE:
		THIS->GenerateClippedOutputOn();
		XSRETURN_EMPTY;


const char *
vtkClipVolume::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkImplicitFunction *
vtkClipVolume::GetClipFunction()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImplicitFunction";
		CODE:
		RETVAL = THIS->GetClipFunction();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkUnstructuredGrid *
vtkClipVolume::GetClippedOutput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkUnstructuredGrid";
		CODE:
		RETVAL = THIS->GetClippedOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkClipVolume::GetGenerateClipScalars()
		CODE:
		RETVAL = THIS->GetGenerateClipScalars();
		OUTPUT:
		RETVAL


int
vtkClipVolume::GetGenerateClippedOutput()
		CODE:
		RETVAL = THIS->GetGenerateClippedOutput();
		OUTPUT:
		RETVAL


int
vtkClipVolume::GetInsideOut()
		CODE:
		RETVAL = THIS->GetInsideOut();
		OUTPUT:
		RETVAL


vtkPointLocator *
vtkClipVolume::GetLocator()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPointLocator";
		CODE:
		RETVAL = THIS->GetLocator();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkClipVolume::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


float
vtkClipVolume::GetMergeTolerance()
		CODE:
		RETVAL = THIS->GetMergeTolerance();
		OUTPUT:
		RETVAL


float
vtkClipVolume::GetValue()
		CODE:
		RETVAL = THIS->GetValue();
		OUTPUT:
		RETVAL


void
vtkClipVolume::InsideOutOff()
		CODE:
		THIS->InsideOutOff();
		XSRETURN_EMPTY;


void
vtkClipVolume::InsideOutOn()
		CODE:
		THIS->InsideOutOn();
		XSRETURN_EMPTY;


static vtkClipVolume*
vtkClipVolume::New()
		CODE:
		RETVAL = vtkClipVolume::New();
		OUTPUT:
		RETVAL


void
vtkClipVolume::SetClipFunction(arg1)
		vtkImplicitFunction *	arg1
		CODE:
		THIS->SetClipFunction(arg1);
		XSRETURN_EMPTY;


void
vtkClipVolume::SetGenerateClipScalars(arg1)
		int 	arg1
		CODE:
		THIS->SetGenerateClipScalars(arg1);
		XSRETURN_EMPTY;


void
vtkClipVolume::SetGenerateClippedOutput(arg1)
		int 	arg1
		CODE:
		THIS->SetGenerateClippedOutput(arg1);
		XSRETURN_EMPTY;


void
vtkClipVolume::SetInsideOut(arg1)
		int 	arg1
		CODE:
		THIS->SetInsideOut(arg1);
		XSRETURN_EMPTY;


void
vtkClipVolume::SetLocator(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::PointLocator")
		vtkPointLocator *	arg1
		CODE:
		THIS->SetLocator(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::PointLocator")
		vtkPointLocator *	arg1
		CODE:
		THIS->SetLocator(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkClipVolume::SetLocator\n");



void
vtkClipVolume::SetMergeTolerance(arg1)
		float 	arg1
		CODE:
		THIS->SetMergeTolerance(arg1);
		XSRETURN_EMPTY;


void
vtkClipVolume::SetValue(arg1)
		float 	arg1
		CODE:
		THIS->SetValue(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ColorTransferFunction PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkColorTransferFunction::AddBluePoint(x, b)
		float 	x
		float 	b
		CODE:
		THIS->AddBluePoint(x, b);
		XSRETURN_EMPTY;


void
vtkColorTransferFunction::AddBlueSegment(x1, b1, x2, b2)
		float 	x1
		float 	b1
		float 	x2
		float 	b2
		CODE:
		THIS->AddBlueSegment(x1, b1, x2, b2);
		XSRETURN_EMPTY;


void
vtkColorTransferFunction::AddGreenPoint(x, g)
		float 	x
		float 	g
		CODE:
		THIS->AddGreenPoint(x, g);
		XSRETURN_EMPTY;


void
vtkColorTransferFunction::AddGreenSegment(x1, g1, x2, g2)
		float 	x1
		float 	g1
		float 	x2
		float 	g2
		CODE:
		THIS->AddGreenSegment(x1, g1, x2, g2);
		XSRETURN_EMPTY;


void
vtkColorTransferFunction::AddHSVPoint(x, h, s, v)
		float 	x
		float 	h
		float 	s
		float 	v
		CODE:
		THIS->AddHSVPoint(x, h, s, v);
		XSRETURN_EMPTY;


void
vtkColorTransferFunction::AddHSVSegment(x1, h1, s1, v1, x2, h2, s2, v2)
		float 	x1
		float 	h1
		float 	s1
		float 	v1
		float 	x2
		float 	h2
		float 	s2
		float 	v2
		CODE:
		THIS->AddHSVSegment(x1, h1, s1, v1, x2, h2, s2, v2);
		XSRETURN_EMPTY;


void
vtkColorTransferFunction::AddRGBPoint(x, r, g, b)
		float 	x
		float 	r
		float 	g
		float 	b
		CODE:
		THIS->AddRGBPoint(x, r, g, b);
		XSRETURN_EMPTY;


void
vtkColorTransferFunction::AddRGBSegment(x1, r1, g1, b1, x2, r2, g2, b2)
		float 	x1
		float 	r1
		float 	g1
		float 	b1
		float 	x2
		float 	r2
		float 	g2
		float 	b2
		CODE:
		THIS->AddRGBSegment(x1, r1, g1, b1, x2, r2, g2, b2);
		XSRETURN_EMPTY;


void
vtkColorTransferFunction::AddRedPoint(x, r)
		float 	x
		float 	r
		CODE:
		THIS->AddRedPoint(x, r);
		XSRETURN_EMPTY;


void
vtkColorTransferFunction::AddRedSegment(x1, r1, x2, r2)
		float 	x1
		float 	r1
		float 	x2
		float 	r2
		CODE:
		THIS->AddRedSegment(x1, r1, x2, r2);
		XSRETURN_EMPTY;


void
vtkColorTransferFunction::ClampingOff()
		CODE:
		THIS->ClampingOff();
		XSRETURN_EMPTY;


void
vtkColorTransferFunction::ClampingOn()
		CODE:
		THIS->ClampingOn();
		XSRETURN_EMPTY;


void
vtkColorTransferFunction::DeepCopy(f)
		vtkColorTransferFunction *	f
		CODE:
		THIS->DeepCopy(f);
		XSRETURN_EMPTY;


vtkPiecewiseFunction *
vtkColorTransferFunction::GetBlueFunction()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPiecewiseFunction";
		CODE:
		RETVAL = THIS->GetBlueFunction();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkColorTransferFunction::GetBlueSize()
		CODE:
		RETVAL = THIS->GetBlueSize();
		OUTPUT:
		RETVAL


float
vtkColorTransferFunction::GetBlueValue(x)
		float 	x
		CODE:
		RETVAL = THIS->GetBlueValue(x);
		OUTPUT:
		RETVAL


int
vtkColorTransferFunction::GetClamping()
		CODE:
		RETVAL = THIS->GetClamping();
		OUTPUT:
		RETVAL


const char *
vtkColorTransferFunction::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float *
vtkColorTransferFunction::GetColor(arg1 = 0)
	CASE: items == 2
		float 	arg1
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetColor(arg1);
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkColorTransferFunction::GetColorSpace()
		CODE:
		RETVAL = THIS->GetColorSpace();
		OUTPUT:
		RETVAL


vtkPiecewiseFunction *
vtkColorTransferFunction::GetGreenFunction()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPiecewiseFunction";
		CODE:
		RETVAL = THIS->GetGreenFunction();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkColorTransferFunction::GetGreenSize()
		CODE:
		RETVAL = THIS->GetGreenSize();
		OUTPUT:
		RETVAL


float
vtkColorTransferFunction::GetGreenValue(x)
		float 	x
		CODE:
		RETVAL = THIS->GetGreenValue(x);
		OUTPUT:
		RETVAL


float  *
vtkColorTransferFunction::GetRange()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


vtkPiecewiseFunction *
vtkColorTransferFunction::GetRedFunction()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPiecewiseFunction";
		CODE:
		RETVAL = THIS->GetRedFunction();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkColorTransferFunction::GetRedSize()
		CODE:
		RETVAL = THIS->GetRedSize();
		OUTPUT:
		RETVAL


float
vtkColorTransferFunction::GetRedValue(x)
		float 	x
		CODE:
		RETVAL = THIS->GetRedValue(x);
		OUTPUT:
		RETVAL


int
vtkColorTransferFunction::GetSize()
		CODE:
		RETVAL = THIS->GetSize();
		OUTPUT:
		RETVAL


int
vtkColorTransferFunction::GetTotalSize()
		CODE:
		RETVAL = THIS->GetTotalSize();
		OUTPUT:
		RETVAL


float *
vtkColorTransferFunction::GetValue(x)
		float 	x
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetValue(x);
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


static vtkColorTransferFunction*
vtkColorTransferFunction::New()
		CODE:
		RETVAL = vtkColorTransferFunction::New();
		OUTPUT:
		RETVAL


void
vtkColorTransferFunction::RemoveAllPoints()
		CODE:
		THIS->RemoveAllPoints();
		XSRETURN_EMPTY;


void
vtkColorTransferFunction::RemoveBluePoint(x)
		float 	x
		CODE:
		THIS->RemoveBluePoint(x);
		XSRETURN_EMPTY;


void
vtkColorTransferFunction::RemoveGreenPoint(x)
		float 	x
		CODE:
		THIS->RemoveGreenPoint(x);
		XSRETURN_EMPTY;


void
vtkColorTransferFunction::RemovePoint(x)
		float 	x
		CODE:
		THIS->RemovePoint(x);
		XSRETURN_EMPTY;


void
vtkColorTransferFunction::RemoveRGBPoint(x)
		float 	x
		CODE:
		THIS->RemoveRGBPoint(x);
		XSRETURN_EMPTY;


void
vtkColorTransferFunction::RemoveRedPoint(x)
		float 	x
		CODE:
		THIS->RemoveRedPoint(x);
		XSRETURN_EMPTY;


void
vtkColorTransferFunction::SetClamping(arg1)
		int 	arg1
		CODE:
		THIS->SetClamping(arg1);
		XSRETURN_EMPTY;


void
vtkColorTransferFunction::SetColorSpace(arg1)
		int 	arg1
		CODE:
		THIS->SetColorSpace(arg1);
		XSRETURN_EMPTY;


void
vtkColorTransferFunction::SetColorSpaceToHSV()
		CODE:
		THIS->SetColorSpaceToHSV();
		XSRETURN_EMPTY;


void
vtkColorTransferFunction::SetColorSpaceToRGB()
		CODE:
		THIS->SetColorSpaceToRGB();
		XSRETURN_EMPTY;


void
vtkColorTransferFunction::SetRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float 	arg1
		float 	arg2
		CODE:
		THIS->SetRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkColorTransferFunction::SetRange\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Cone PREFIX = vtk

PROTOTYPES: DISABLE



float
vtkCone::EvaluateFunction(arg1 = 0, arg2 = 0, arg3 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkCone::EvaluateFunction\n");



float
vtkCone::GetAngle()
		CODE:
		RETVAL = THIS->GetAngle();
		OUTPUT:
		RETVAL


const char *
vtkCone::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkCone*
vtkCone::New()
		CODE:
		RETVAL = vtkCone::New();
		OUTPUT:
		RETVAL


void
vtkCone::SetAngle(arg1)
		float 	arg1
		CODE:
		THIS->SetAngle(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ConeSource PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkConeSource::CappingOff()
		CODE:
		THIS->CappingOff();
		XSRETURN_EMPTY;


void
vtkConeSource::CappingOn()
		CODE:
		THIS->CappingOn();
		XSRETURN_EMPTY;


float
vtkConeSource::GetAngle()
		CODE:
		RETVAL = THIS->GetAngle();
		OUTPUT:
		RETVAL


int
vtkConeSource::GetCapping()
		CODE:
		RETVAL = THIS->GetCapping();
		OUTPUT:
		RETVAL


const char *
vtkConeSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkConeSource::GetHeight()
		CODE:
		RETVAL = THIS->GetHeight();
		OUTPUT:
		RETVAL


float
vtkConeSource::GetRadius()
		CODE:
		RETVAL = THIS->GetRadius();
		OUTPUT:
		RETVAL


int
vtkConeSource::GetResolution()
		CODE:
		RETVAL = THIS->GetResolution();
		OUTPUT:
		RETVAL


static vtkConeSource*
vtkConeSource::New()
		CODE:
		RETVAL = vtkConeSource::New();
		OUTPUT:
		RETVAL


void
vtkConeSource::SetAngle(angle)
		float 	angle
		CODE:
		THIS->SetAngle(angle);
		XSRETURN_EMPTY;


void
vtkConeSource::SetCapping(arg1)
		int 	arg1
		CODE:
		THIS->SetCapping(arg1);
		XSRETURN_EMPTY;


void
vtkConeSource::SetHeight(arg1)
		float 	arg1
		CODE:
		THIS->SetHeight(arg1);
		XSRETURN_EMPTY;


void
vtkConeSource::SetRadius(arg1)
		float 	arg1
		CODE:
		THIS->SetRadius(arg1);
		XSRETURN_EMPTY;


void
vtkConeSource::SetResolution(arg1)
		int 	arg1
		CODE:
		THIS->SetResolution(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ConnectivityFilter PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkConnectivityFilter::AddSeed(id)
		int 	id
		CODE:
		THIS->AddSeed(id);
		XSRETURN_EMPTY;


void
vtkConnectivityFilter::AddSpecifiedRegion(id)
		int 	id
		CODE:
		THIS->AddSpecifiedRegion(id);
		XSRETURN_EMPTY;


void
vtkConnectivityFilter::ColorRegionsOff()
		CODE:
		THIS->ColorRegionsOff();
		XSRETURN_EMPTY;


void
vtkConnectivityFilter::ColorRegionsOn()
		CODE:
		THIS->ColorRegionsOn();
		XSRETURN_EMPTY;


void
vtkConnectivityFilter::DeleteSeed(id)
		int 	id
		CODE:
		THIS->DeleteSeed(id);
		XSRETURN_EMPTY;


void
vtkConnectivityFilter::DeleteSpecifiedRegion(id)
		int 	id
		CODE:
		THIS->DeleteSpecifiedRegion(id);
		XSRETURN_EMPTY;


const char *
vtkConnectivityFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkConnectivityFilter::GetClosestPoint()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetClosestPoint();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkConnectivityFilter::GetColorRegions()
		CODE:
		RETVAL = THIS->GetColorRegions();
		OUTPUT:
		RETVAL


int
vtkConnectivityFilter::GetExtractionMode()
		CODE:
		RETVAL = THIS->GetExtractionMode();
		OUTPUT:
		RETVAL


const char *
vtkConnectivityFilter::GetExtractionModeAsString()
		CODE:
		RETVAL = THIS->GetExtractionModeAsString();
		OUTPUT:
		RETVAL


int
vtkConnectivityFilter::GetMaxRecursionDepth()
		CODE:
		RETVAL = THIS->GetMaxRecursionDepth();
		OUTPUT:
		RETVAL


int
vtkConnectivityFilter::GetNumberOfExtractedRegions()
		CODE:
		RETVAL = THIS->GetNumberOfExtractedRegions();
		OUTPUT:
		RETVAL


int
vtkConnectivityFilter::GetScalarConnectivity()
		CODE:
		RETVAL = THIS->GetScalarConnectivity();
		OUTPUT:
		RETVAL


float  *
vtkConnectivityFilter::GetScalarRange()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetScalarRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


void
vtkConnectivityFilter::InitializeSeedList()
		CODE:
		THIS->InitializeSeedList();
		XSRETURN_EMPTY;


void
vtkConnectivityFilter::InitializeSpecifiedRegionList()
		CODE:
		THIS->InitializeSpecifiedRegionList();
		XSRETURN_EMPTY;


static vtkConnectivityFilter*
vtkConnectivityFilter::New()
		CODE:
		RETVAL = vtkConnectivityFilter::New();
		OUTPUT:
		RETVAL


void
vtkConnectivityFilter::ScalarConnectivityOff()
		CODE:
		THIS->ScalarConnectivityOff();
		XSRETURN_EMPTY;


void
vtkConnectivityFilter::ScalarConnectivityOn()
		CODE:
		THIS->ScalarConnectivityOn();
		XSRETURN_EMPTY;


void
vtkConnectivityFilter::SetClosestPoint(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetClosestPoint(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkConnectivityFilter::SetClosestPoint\n");



void
vtkConnectivityFilter::SetColorRegions(arg1)
		int 	arg1
		CODE:
		THIS->SetColorRegions(arg1);
		XSRETURN_EMPTY;


void
vtkConnectivityFilter::SetExtractionMode(arg1)
		int 	arg1
		CODE:
		THIS->SetExtractionMode(arg1);
		XSRETURN_EMPTY;


void
vtkConnectivityFilter::SetExtractionModeToAllRegions()
		CODE:
		THIS->SetExtractionModeToAllRegions();
		XSRETURN_EMPTY;


void
vtkConnectivityFilter::SetExtractionModeToCellSeededRegions()
		CODE:
		THIS->SetExtractionModeToCellSeededRegions();
		XSRETURN_EMPTY;


void
vtkConnectivityFilter::SetExtractionModeToClosestPointRegion()
		CODE:
		THIS->SetExtractionModeToClosestPointRegion();
		XSRETURN_EMPTY;


void
vtkConnectivityFilter::SetExtractionModeToLargestRegion()
		CODE:
		THIS->SetExtractionModeToLargestRegion();
		XSRETURN_EMPTY;


void
vtkConnectivityFilter::SetExtractionModeToPointSeededRegions()
		CODE:
		THIS->SetExtractionModeToPointSeededRegions();
		XSRETURN_EMPTY;


void
vtkConnectivityFilter::SetExtractionModeToSpecifiedRegions()
		CODE:
		THIS->SetExtractionModeToSpecifiedRegions();
		XSRETURN_EMPTY;


void
vtkConnectivityFilter::SetScalarConnectivity(arg1)
		int 	arg1
		CODE:
		THIS->SetScalarConnectivity(arg1);
		XSRETURN_EMPTY;


void
vtkConnectivityFilter::SetScalarRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetScalarRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkConnectivityFilter::SetScalarRange\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ContourFilter PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkContourFilter::ComputeGradientsOff()
		CODE:
		THIS->ComputeGradientsOff();
		XSRETURN_EMPTY;


void
vtkContourFilter::ComputeGradientsOn()
		CODE:
		THIS->ComputeGradientsOn();
		XSRETURN_EMPTY;


void
vtkContourFilter::ComputeNormalsOff()
		CODE:
		THIS->ComputeNormalsOff();
		XSRETURN_EMPTY;


void
vtkContourFilter::ComputeNormalsOn()
		CODE:
		THIS->ComputeNormalsOn();
		XSRETURN_EMPTY;


void
vtkContourFilter::ComputeScalarsOff()
		CODE:
		THIS->ComputeScalarsOff();
		XSRETURN_EMPTY;


void
vtkContourFilter::ComputeScalarsOn()
		CODE:
		THIS->ComputeScalarsOn();
		XSRETURN_EMPTY;


void
vtkContourFilter::CreateDefaultLocator()
		CODE:
		THIS->CreateDefaultLocator();
		XSRETURN_EMPTY;


void
vtkContourFilter::GenerateValues(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->GenerateValues(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkContourFilter::GenerateValues\n");



const char *
vtkContourFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkContourFilter::GetComputeGradients()
		CODE:
		RETVAL = THIS->GetComputeGradients();
		OUTPUT:
		RETVAL


int
vtkContourFilter::GetComputeNormals()
		CODE:
		RETVAL = THIS->GetComputeNormals();
		OUTPUT:
		RETVAL


int
vtkContourFilter::GetComputeScalars()
		CODE:
		RETVAL = THIS->GetComputeScalars();
		OUTPUT:
		RETVAL


vtkPointLocator *
vtkContourFilter::GetLocator()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPointLocator";
		CODE:
		RETVAL = THIS->GetLocator();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkContourFilter::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


int
vtkContourFilter::GetNumberOfContours()
		CODE:
		RETVAL = THIS->GetNumberOfContours();
		OUTPUT:
		RETVAL


int
vtkContourFilter::GetUseScalarTree()
		CODE:
		RETVAL = THIS->GetUseScalarTree();
		OUTPUT:
		RETVAL


float
vtkContourFilter::GetValue(i)
		int 	i
		CODE:
		RETVAL = THIS->GetValue(i);
		OUTPUT:
		RETVAL


static vtkContourFilter*
vtkContourFilter::New()
		CODE:
		RETVAL = vtkContourFilter::New();
		OUTPUT:
		RETVAL


void
vtkContourFilter::SetComputeGradients(arg1)
		int 	arg1
		CODE:
		THIS->SetComputeGradients(arg1);
		XSRETURN_EMPTY;


void
vtkContourFilter::SetComputeNormals(arg1)
		int 	arg1
		CODE:
		THIS->SetComputeNormals(arg1);
		XSRETURN_EMPTY;


void
vtkContourFilter::SetComputeScalars(arg1)
		int 	arg1
		CODE:
		THIS->SetComputeScalars(arg1);
		XSRETURN_EMPTY;


void
vtkContourFilter::SetLocator(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::PointLocator")
		vtkPointLocator *	arg1
		CODE:
		THIS->SetLocator(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::PointLocator")
		vtkPointLocator *	arg1
		CODE:
		THIS->SetLocator(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkContourFilter::SetLocator\n");



void
vtkContourFilter::SetNumberOfContours(number)
		int 	number
		CODE:
		THIS->SetNumberOfContours(number);
		XSRETURN_EMPTY;


void
vtkContourFilter::SetUseScalarTree(arg1)
		int 	arg1
		CODE:
		THIS->SetUseScalarTree(arg1);
		XSRETURN_EMPTY;


void
vtkContourFilter::SetValue(i, value)
		int 	i
		float 	value
		CODE:
		THIS->SetValue(i, value);
		XSRETURN_EMPTY;


void
vtkContourFilter::UseScalarTreeOff()
		CODE:
		THIS->UseScalarTreeOff();
		XSRETURN_EMPTY;


void
vtkContourFilter::UseScalarTreeOn()
		CODE:
		THIS->UseScalarTreeOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ContourGrid PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkContourGrid::ComputeGradientsOff()
		CODE:
		THIS->ComputeGradientsOff();
		XSRETURN_EMPTY;


void
vtkContourGrid::ComputeGradientsOn()
		CODE:
		THIS->ComputeGradientsOn();
		XSRETURN_EMPTY;


void
vtkContourGrid::ComputeNormalsOff()
		CODE:
		THIS->ComputeNormalsOff();
		XSRETURN_EMPTY;


void
vtkContourGrid::ComputeNormalsOn()
		CODE:
		THIS->ComputeNormalsOn();
		XSRETURN_EMPTY;


void
vtkContourGrid::ComputeScalarsOff()
		CODE:
		THIS->ComputeScalarsOff();
		XSRETURN_EMPTY;


void
vtkContourGrid::ComputeScalarsOn()
		CODE:
		THIS->ComputeScalarsOn();
		XSRETURN_EMPTY;


void
vtkContourGrid::CreateDefaultLocator()
		CODE:
		THIS->CreateDefaultLocator();
		XSRETURN_EMPTY;


void
vtkContourGrid::GenerateValues(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->GenerateValues(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkContourGrid::GenerateValues\n");



const char *
vtkContourGrid::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkContourGrid::GetComputeGradients()
		CODE:
		RETVAL = THIS->GetComputeGradients();
		OUTPUT:
		RETVAL


int
vtkContourGrid::GetComputeNormals()
		CODE:
		RETVAL = THIS->GetComputeNormals();
		OUTPUT:
		RETVAL


int
vtkContourGrid::GetComputeScalars()
		CODE:
		RETVAL = THIS->GetComputeScalars();
		OUTPUT:
		RETVAL


vtkPointLocator *
vtkContourGrid::GetLocator()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPointLocator";
		CODE:
		RETVAL = THIS->GetLocator();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkContourGrid::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


int
vtkContourGrid::GetNumberOfContours()
		CODE:
		RETVAL = THIS->GetNumberOfContours();
		OUTPUT:
		RETVAL


int
vtkContourGrid::GetUseScalarTree()
		CODE:
		RETVAL = THIS->GetUseScalarTree();
		OUTPUT:
		RETVAL


float
vtkContourGrid::GetValue(i)
		int 	i
		CODE:
		RETVAL = THIS->GetValue(i);
		OUTPUT:
		RETVAL


static vtkContourGrid*
vtkContourGrid::New()
		CODE:
		RETVAL = vtkContourGrid::New();
		OUTPUT:
		RETVAL


void
vtkContourGrid::SetComputeGradients(arg1)
		int 	arg1
		CODE:
		THIS->SetComputeGradients(arg1);
		XSRETURN_EMPTY;


void
vtkContourGrid::SetComputeNormals(arg1)
		int 	arg1
		CODE:
		THIS->SetComputeNormals(arg1);
		XSRETURN_EMPTY;


void
vtkContourGrid::SetComputeScalars(arg1)
		int 	arg1
		CODE:
		THIS->SetComputeScalars(arg1);
		XSRETURN_EMPTY;


void
vtkContourGrid::SetLocator(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::PointLocator")
		vtkPointLocator *	arg1
		CODE:
		THIS->SetLocator(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::PointLocator")
		vtkPointLocator *	arg1
		CODE:
		THIS->SetLocator(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkContourGrid::SetLocator\n");



void
vtkContourGrid::SetNumberOfContours(number)
		int 	number
		CODE:
		THIS->SetNumberOfContours(number);
		XSRETURN_EMPTY;


void
vtkContourGrid::SetUseScalarTree(arg1)
		int 	arg1
		CODE:
		THIS->SetUseScalarTree(arg1);
		XSRETURN_EMPTY;


void
vtkContourGrid::SetValue(i, value)
		int 	i
		float 	value
		CODE:
		THIS->SetValue(i, value);
		XSRETURN_EMPTY;


void
vtkContourGrid::UseScalarTreeOff()
		CODE:
		THIS->UseScalarTreeOff();
		XSRETURN_EMPTY;


void
vtkContourGrid::UseScalarTreeOn()
		CODE:
		THIS->UseScalarTreeOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::CubeSource PREFIX = vtk

PROTOTYPES: DISABLE



float  *
vtkCubeSource::GetCenter()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetCenter();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


const char *
vtkCubeSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkCubeSource::GetXLength()
		CODE:
		RETVAL = THIS->GetXLength();
		OUTPUT:
		RETVAL


float
vtkCubeSource::GetYLength()
		CODE:
		RETVAL = THIS->GetYLength();
		OUTPUT:
		RETVAL


float
vtkCubeSource::GetZLength()
		CODE:
		RETVAL = THIS->GetZLength();
		OUTPUT:
		RETVAL


static vtkCubeSource*
vtkCubeSource::New()
		CODE:
		RETVAL = vtkCubeSource::New();
		OUTPUT:
		RETVAL


void
vtkCubeSource::SetBounds(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		float 	arg1
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
		croak("Unsupported number of args and/or types supplied to vtkCubeSource::SetBounds\n");



void
vtkCubeSource::SetCenter(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetCenter(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkCubeSource::SetCenter\n");



void
vtkCubeSource::SetXLength(arg1)
		float 	arg1
		CODE:
		THIS->SetXLength(arg1);
		XSRETURN_EMPTY;


void
vtkCubeSource::SetYLength(arg1)
		float 	arg1
		CODE:
		THIS->SetYLength(arg1);
		XSRETURN_EMPTY;


void
vtkCubeSource::SetZLength(arg1)
		float 	arg1
		CODE:
		THIS->SetZLength(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Cursor3D PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkCursor3D::AllOff()
		CODE:
		THIS->AllOff();
		XSRETURN_EMPTY;


void
vtkCursor3D::AllOn()
		CODE:
		THIS->AllOn();
		XSRETURN_EMPTY;


void
vtkCursor3D::AxesOff()
		CODE:
		THIS->AxesOff();
		XSRETURN_EMPTY;


void
vtkCursor3D::AxesOn()
		CODE:
		THIS->AxesOn();
		XSRETURN_EMPTY;


int
vtkCursor3D::GetAxes()
		CODE:
		RETVAL = THIS->GetAxes();
		OUTPUT:
		RETVAL


const char *
vtkCursor3D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkCursor3D::GetFocalPoint()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetFocalPoint();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


vtkPolyData *
vtkCursor3D::GetFocus()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPolyData";
		CODE:
		RETVAL = THIS->GetFocus();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float  *
vtkCursor3D::GetModelBounds()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetModelBounds();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


int
vtkCursor3D::GetOutline()
		CODE:
		RETVAL = THIS->GetOutline();
		OUTPUT:
		RETVAL


int
vtkCursor3D::GetWrap()
		CODE:
		RETVAL = THIS->GetWrap();
		OUTPUT:
		RETVAL


int
vtkCursor3D::GetXShadows()
		CODE:
		RETVAL = THIS->GetXShadows();
		OUTPUT:
		RETVAL


int
vtkCursor3D::GetYShadows()
		CODE:
		RETVAL = THIS->GetYShadows();
		OUTPUT:
		RETVAL


int
vtkCursor3D::GetZShadows()
		CODE:
		RETVAL = THIS->GetZShadows();
		OUTPUT:
		RETVAL


static vtkCursor3D*
vtkCursor3D::New()
		CODE:
		RETVAL = vtkCursor3D::New();
		OUTPUT:
		RETVAL


void
vtkCursor3D::OutlineOff()
		CODE:
		THIS->OutlineOff();
		XSRETURN_EMPTY;


void
vtkCursor3D::OutlineOn()
		CODE:
		THIS->OutlineOn();
		XSRETURN_EMPTY;


void
vtkCursor3D::SetAxes(arg1)
		int 	arg1
		CODE:
		THIS->SetAxes(arg1);
		XSRETURN_EMPTY;


void
vtkCursor3D::SetFocalPoint(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetFocalPoint(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkCursor3D::SetFocalPoint\n");



void
vtkCursor3D::SetModelBounds(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		float 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		float 	arg6
		CODE:
		THIS->SetModelBounds(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkCursor3D::SetModelBounds\n");



void
vtkCursor3D::SetOutline(arg1)
		int 	arg1
		CODE:
		THIS->SetOutline(arg1);
		XSRETURN_EMPTY;


void
vtkCursor3D::SetWrap(arg1)
		int 	arg1
		CODE:
		THIS->SetWrap(arg1);
		XSRETURN_EMPTY;


void
vtkCursor3D::SetXShadows(arg1)
		int 	arg1
		CODE:
		THIS->SetXShadows(arg1);
		XSRETURN_EMPTY;


void
vtkCursor3D::SetYShadows(arg1)
		int 	arg1
		CODE:
		THIS->SetYShadows(arg1);
		XSRETURN_EMPTY;


void
vtkCursor3D::SetZShadows(arg1)
		int 	arg1
		CODE:
		THIS->SetZShadows(arg1);
		XSRETURN_EMPTY;


void
vtkCursor3D::WrapOff()
		CODE:
		THIS->WrapOff();
		XSRETURN_EMPTY;


void
vtkCursor3D::WrapOn()
		CODE:
		THIS->WrapOn();
		XSRETURN_EMPTY;


void
vtkCursor3D::XShadowsOff()
		CODE:
		THIS->XShadowsOff();
		XSRETURN_EMPTY;


void
vtkCursor3D::XShadowsOn()
		CODE:
		THIS->XShadowsOn();
		XSRETURN_EMPTY;


void
vtkCursor3D::YShadowsOff()
		CODE:
		THIS->YShadowsOff();
		XSRETURN_EMPTY;


void
vtkCursor3D::YShadowsOn()
		CODE:
		THIS->YShadowsOn();
		XSRETURN_EMPTY;


void
vtkCursor3D::ZShadowsOff()
		CODE:
		THIS->ZShadowsOff();
		XSRETURN_EMPTY;


void
vtkCursor3D::ZShadowsOn()
		CODE:
		THIS->ZShadowsOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::CullerCollection PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkCullerCollection::AddItem(arg1 = 0)
	CASE: items == 2
		vtkCuller *	arg1
		CODE:
		THIS->AddItem(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkCullerCollection::AddItem\n");



const char *
vtkCullerCollection::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkCuller *
vtkCullerCollection::GetLastItem()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCuller";
		CODE:
		RETVAL = THIS->GetLastItem();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkCuller *
vtkCullerCollection::GetNextItem()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCuller";
		CODE:
		RETVAL = THIS->GetNextItem();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkCullerCollection*
vtkCullerCollection::New()
		CODE:
		RETVAL = vtkCullerCollection::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Cutter PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkCutter::CreateDefaultLocator()
		CODE:
		THIS->CreateDefaultLocator();
		XSRETURN_EMPTY;


void
vtkCutter::GenerateCutScalarsOff()
		CODE:
		THIS->GenerateCutScalarsOff();
		XSRETURN_EMPTY;


void
vtkCutter::GenerateCutScalarsOn()
		CODE:
		THIS->GenerateCutScalarsOn();
		XSRETURN_EMPTY;


void
vtkCutter::GenerateValues(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->GenerateValues(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkCutter::GenerateValues\n");



const char *
vtkCutter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkImplicitFunction *
vtkCutter::GetCutFunction()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImplicitFunction";
		CODE:
		RETVAL = THIS->GetCutFunction();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkCutter::GetGenerateCutScalars()
		CODE:
		RETVAL = THIS->GetGenerateCutScalars();
		OUTPUT:
		RETVAL


vtkPointLocator *
vtkCutter::GetLocator()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPointLocator";
		CODE:
		RETVAL = THIS->GetLocator();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkCutter::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


int
vtkCutter::GetNumberOfContours()
		CODE:
		RETVAL = THIS->GetNumberOfContours();
		OUTPUT:
		RETVAL


int
vtkCutter::GetSortBy()
		CODE:
		RETVAL = THIS->GetSortBy();
		OUTPUT:
		RETVAL


const char *
vtkCutter::GetSortByAsString()
		CODE:
		RETVAL = THIS->GetSortByAsString();
		OUTPUT:
		RETVAL


float
vtkCutter::GetValue(i)
		int 	i
		CODE:
		RETVAL = THIS->GetValue(i);
		OUTPUT:
		RETVAL


static vtkCutter*
vtkCutter::New()
		CODE:
		RETVAL = vtkCutter::New();
		OUTPUT:
		RETVAL


void
vtkCutter::SetCutFunction(arg1)
		vtkImplicitFunction *	arg1
		CODE:
		THIS->SetCutFunction(arg1);
		XSRETURN_EMPTY;


void
vtkCutter::SetGenerateCutScalars(arg1)
		int 	arg1
		CODE:
		THIS->SetGenerateCutScalars(arg1);
		XSRETURN_EMPTY;


void
vtkCutter::SetLocator(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::PointLocator")
		vtkPointLocator *	arg1
		CODE:
		THIS->SetLocator(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::PointLocator")
		vtkPointLocator *	arg1
		CODE:
		THIS->SetLocator(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkCutter::SetLocator\n");



void
vtkCutter::SetNumberOfContours(number)
		int 	number
		CODE:
		THIS->SetNumberOfContours(number);
		XSRETURN_EMPTY;


void
vtkCutter::SetSortBy(arg1)
		int 	arg1
		CODE:
		THIS->SetSortBy(arg1);
		XSRETURN_EMPTY;


void
vtkCutter::SetSortByToSortByCell()
		CODE:
		THIS->SetSortByToSortByCell();
		XSRETURN_EMPTY;


void
vtkCutter::SetSortByToSortByValue()
		CODE:
		THIS->SetSortByToSortByValue();
		XSRETURN_EMPTY;


void
vtkCutter::SetValue(i, value)
		int 	i
		float 	value
		CODE:
		THIS->SetValue(i, value);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Cylinder PREFIX = vtk

PROTOTYPES: DISABLE



float
vtkCylinder::EvaluateFunction(arg1 = 0, arg2 = 0, arg3 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkCylinder::EvaluateFunction\n");



float  *
vtkCylinder::GetCenter()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetCenter();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


const char *
vtkCylinder::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkCylinder::GetRadius()
		CODE:
		RETVAL = THIS->GetRadius();
		OUTPUT:
		RETVAL


static vtkCylinder*
vtkCylinder::New()
		CODE:
		RETVAL = vtkCylinder::New();
		OUTPUT:
		RETVAL


void
vtkCylinder::SetCenter(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetCenter(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkCylinder::SetCenter\n");



void
vtkCylinder::SetRadius(arg1)
		float 	arg1
		CODE:
		THIS->SetRadius(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::CylinderSource PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkCylinderSource::CappingOff()
		CODE:
		THIS->CappingOff();
		XSRETURN_EMPTY;


void
vtkCylinderSource::CappingOn()
		CODE:
		THIS->CappingOn();
		XSRETURN_EMPTY;


int
vtkCylinderSource::GetCapping()
		CODE:
		RETVAL = THIS->GetCapping();
		OUTPUT:
		RETVAL


float  *
vtkCylinderSource::GetCenter()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetCenter();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


const char *
vtkCylinderSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkCylinderSource::GetHeight()
		CODE:
		RETVAL = THIS->GetHeight();
		OUTPUT:
		RETVAL


float
vtkCylinderSource::GetRadius()
		CODE:
		RETVAL = THIS->GetRadius();
		OUTPUT:
		RETVAL


int
vtkCylinderSource::GetResolution()
		CODE:
		RETVAL = THIS->GetResolution();
		OUTPUT:
		RETVAL


static vtkCylinderSource*
vtkCylinderSource::New()
		CODE:
		RETVAL = vtkCylinderSource::New();
		OUTPUT:
		RETVAL


void
vtkCylinderSource::SetCapping(arg1)
		int 	arg1
		CODE:
		THIS->SetCapping(arg1);
		XSRETURN_EMPTY;


void
vtkCylinderSource::SetCenter(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetCenter(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkCylinderSource::SetCenter\n");



void
vtkCylinderSource::SetHeight(arg1)
		float 	arg1
		CODE:
		THIS->SetHeight(arg1);
		XSRETURN_EMPTY;


void
vtkCylinderSource::SetRadius(arg1)
		float 	arg1
		CODE:
		THIS->SetRadius(arg1);
		XSRETURN_EMPTY;


void
vtkCylinderSource::SetResolution(arg1)
		int 	arg1
		CODE:
		THIS->SetResolution(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::DashedStreamLine PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkDashedStreamLine::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkDashedStreamLine::GetDashFactor()
		CODE:
		RETVAL = THIS->GetDashFactor();
		OUTPUT:
		RETVAL


static vtkDashedStreamLine*
vtkDashedStreamLine::New()
		CODE:
		RETVAL = vtkDashedStreamLine::New();
		OUTPUT:
		RETVAL


void
vtkDashedStreamLine::SetDashFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetDashFactor(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::DataObjectReader PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkDataObjectReader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataObject *
vtkDataObjectReader::GetOutput(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataObject";
		CODE:
		RETVAL = THIS->GetOutput(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE: items == 1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataObject";
		CODE:
		RETVAL = THIS->GetOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataObjectReader::GetOutput\n");



static vtkDataObjectReader*
vtkDataObjectReader::New()
		CODE:
		RETVAL = vtkDataObjectReader::New();
		OUTPUT:
		RETVAL


void
vtkDataObjectReader::SetOutput(arg1)
		vtkDataObject *	arg1
		CODE:
		THIS->SetOutput(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::DataObjectSource PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkDataObjectSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataObject *
vtkDataObjectSource::GetOutput(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataObject";
		CODE:
		RETVAL = THIS->GetOutput(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE: items == 1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataObject";
		CODE:
		RETVAL = THIS->GetOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataObjectSource::GetOutput\n");



static vtkDataObjectSource*
vtkDataObjectSource::New()
		CODE:
		RETVAL = vtkDataObjectSource::New();
		OUTPUT:
		RETVAL


void
vtkDataObjectSource::SetOutput(arg1)
		vtkDataObject *	arg1
		CODE:
		THIS->SetOutput(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::DataObjectToDataSetFilter PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkDataObjectToDataSetFilter::DefaultNormalizeOff()
		CODE:
		THIS->DefaultNormalizeOff();
		XSRETURN_EMPTY;


void
vtkDataObjectToDataSetFilter::DefaultNormalizeOn()
		CODE:
		THIS->DefaultNormalizeOn();
		XSRETURN_EMPTY;


int
vtkDataObjectToDataSetFilter::GetCellConnectivityComponentArrayComponent()
		CODE:
		RETVAL = THIS->GetCellConnectivityComponentArrayComponent();
		OUTPUT:
		RETVAL


const char *
vtkDataObjectToDataSetFilter::GetCellConnectivityComponentArrayName()
		CODE:
		RETVAL = THIS->GetCellConnectivityComponentArrayName();
		OUTPUT:
		RETVAL


int
vtkDataObjectToDataSetFilter::GetCellConnectivityComponentMaxRange()
		CODE:
		RETVAL = THIS->GetCellConnectivityComponentMaxRange();
		OUTPUT:
		RETVAL


int
vtkDataObjectToDataSetFilter::GetCellConnectivityComponentMinRange()
		CODE:
		RETVAL = THIS->GetCellConnectivityComponentMinRange();
		OUTPUT:
		RETVAL


int
vtkDataObjectToDataSetFilter::GetCellTypeComponentArrayComponent()
		CODE:
		RETVAL = THIS->GetCellTypeComponentArrayComponent();
		OUTPUT:
		RETVAL


const char *
vtkDataObjectToDataSetFilter::GetCellTypeComponentArrayName()
		CODE:
		RETVAL = THIS->GetCellTypeComponentArrayName();
		OUTPUT:
		RETVAL


int
vtkDataObjectToDataSetFilter::GetCellTypeComponentMaxRange()
		CODE:
		RETVAL = THIS->GetCellTypeComponentMaxRange();
		OUTPUT:
		RETVAL


int
vtkDataObjectToDataSetFilter::GetCellTypeComponentMinRange()
		CODE:
		RETVAL = THIS->GetCellTypeComponentMinRange();
		OUTPUT:
		RETVAL


const char *
vtkDataObjectToDataSetFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkDataObjectToDataSetFilter::GetDataSetType()
		CODE:
		RETVAL = THIS->GetDataSetType();
		OUTPUT:
		RETVAL


int
vtkDataObjectToDataSetFilter::GetDefaultNormalize()
		CODE:
		RETVAL = THIS->GetDefaultNormalize();
		OUTPUT:
		RETVAL


int  *
vtkDataObjectToDataSetFilter::GetDimensions()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetDimensions();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


vtkDataObject *
vtkDataObjectToDataSetFilter::GetInput()
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
vtkDataObjectToDataSetFilter::GetLinesComponentArrayComponent()
		CODE:
		RETVAL = THIS->GetLinesComponentArrayComponent();
		OUTPUT:
		RETVAL


const char *
vtkDataObjectToDataSetFilter::GetLinesComponentArrayName()
		CODE:
		RETVAL = THIS->GetLinesComponentArrayName();
		OUTPUT:
		RETVAL


int
vtkDataObjectToDataSetFilter::GetLinesComponentMaxRange()
		CODE:
		RETVAL = THIS->GetLinesComponentMaxRange();
		OUTPUT:
		RETVAL


int
vtkDataObjectToDataSetFilter::GetLinesComponentMinRange()
		CODE:
		RETVAL = THIS->GetLinesComponentMinRange();
		OUTPUT:
		RETVAL


float  *
vtkDataObjectToDataSetFilter::GetOrigin()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetOrigin();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


vtkDataSet *
vtkDataObjectToDataSetFilter::GetOutput(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetOutput(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE: items == 1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataObjectToDataSetFilter::GetOutput\n");



int
vtkDataObjectToDataSetFilter::GetPointComponentArrayComponent(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetPointComponentArrayComponent(comp);
		OUTPUT:
		RETVAL


const char *
vtkDataObjectToDataSetFilter::GetPointComponentArrayName(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetPointComponentArrayName(comp);
		OUTPUT:
		RETVAL


int
vtkDataObjectToDataSetFilter::GetPointComponentMaxRange(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetPointComponentMaxRange(comp);
		OUTPUT:
		RETVAL


int
vtkDataObjectToDataSetFilter::GetPointComponentMinRange(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetPointComponentMinRange(comp);
		OUTPUT:
		RETVAL


int
vtkDataObjectToDataSetFilter::GetPointComponentNormailzeFlag(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetPointComponentNormailzeFlag(comp);
		OUTPUT:
		RETVAL


vtkPolyData *
vtkDataObjectToDataSetFilter::GetPolyDataOutput()
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


int
vtkDataObjectToDataSetFilter::GetPolysComponentArrayComponent()
		CODE:
		RETVAL = THIS->GetPolysComponentArrayComponent();
		OUTPUT:
		RETVAL


const char *
vtkDataObjectToDataSetFilter::GetPolysComponentArrayName()
		CODE:
		RETVAL = THIS->GetPolysComponentArrayName();
		OUTPUT:
		RETVAL


int
vtkDataObjectToDataSetFilter::GetPolysComponentMaxRange()
		CODE:
		RETVAL = THIS->GetPolysComponentMaxRange();
		OUTPUT:
		RETVAL


int
vtkDataObjectToDataSetFilter::GetPolysComponentMinRange()
		CODE:
		RETVAL = THIS->GetPolysComponentMinRange();
		OUTPUT:
		RETVAL


vtkRectilinearGrid *
vtkDataObjectToDataSetFilter::GetRectilinearGridOutput()
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


float  *
vtkDataObjectToDataSetFilter::GetSpacing()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetSpacing();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkDataObjectToDataSetFilter::GetStripsComponentArrayComponent()
		CODE:
		RETVAL = THIS->GetStripsComponentArrayComponent();
		OUTPUT:
		RETVAL


const char *
vtkDataObjectToDataSetFilter::GetStripsComponentArrayName()
		CODE:
		RETVAL = THIS->GetStripsComponentArrayName();
		OUTPUT:
		RETVAL


int
vtkDataObjectToDataSetFilter::GetStripsComponentMaxRange()
		CODE:
		RETVAL = THIS->GetStripsComponentMaxRange();
		OUTPUT:
		RETVAL


int
vtkDataObjectToDataSetFilter::GetStripsComponentMinRange()
		CODE:
		RETVAL = THIS->GetStripsComponentMinRange();
		OUTPUT:
		RETVAL


vtkStructuredGrid *
vtkDataObjectToDataSetFilter::GetStructuredGridOutput()
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
vtkDataObjectToDataSetFilter::GetStructuredPointsOutput()
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


vtkUnstructuredGrid *
vtkDataObjectToDataSetFilter::GetUnstructuredGridOutput()
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


int
vtkDataObjectToDataSetFilter::GetVertsComponentArrayComponent()
		CODE:
		RETVAL = THIS->GetVertsComponentArrayComponent();
		OUTPUT:
		RETVAL


const char *
vtkDataObjectToDataSetFilter::GetVertsComponentArrayName()
		CODE:
		RETVAL = THIS->GetVertsComponentArrayName();
		OUTPUT:
		RETVAL


int
vtkDataObjectToDataSetFilter::GetVertsComponentMaxRange()
		CODE:
		RETVAL = THIS->GetVertsComponentMaxRange();
		OUTPUT:
		RETVAL


int
vtkDataObjectToDataSetFilter::GetVertsComponentMinRange()
		CODE:
		RETVAL = THIS->GetVertsComponentMinRange();
		OUTPUT:
		RETVAL


static vtkDataObjectToDataSetFilter*
vtkDataObjectToDataSetFilter::New()
		CODE:
		RETVAL = vtkDataObjectToDataSetFilter::New();
		OUTPUT:
		RETVAL


void
vtkDataObjectToDataSetFilter::SetCellConnectivityComponent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		char *	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		CODE:
		THIS->SetCellConnectivityComponent(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE: items == 3
		char *	arg1
		int 	arg2
		CODE:
		THIS->SetCellConnectivityComponent(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataObjectToDataSetFilter::SetCellConnectivityComponent\n");



void
vtkDataObjectToDataSetFilter::SetCellTypeComponent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		char *	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		CODE:
		THIS->SetCellTypeComponent(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE: items == 3
		char *	arg1
		int 	arg2
		CODE:
		THIS->SetCellTypeComponent(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataObjectToDataSetFilter::SetCellTypeComponent\n");



void
vtkDataObjectToDataSetFilter::SetDataSetType(arg1)
		int 	arg1
		CODE:
		THIS->SetDataSetType(arg1);
		XSRETURN_EMPTY;


void
vtkDataObjectToDataSetFilter::SetDataSetTypeToPolyData()
		CODE:
		THIS->SetDataSetTypeToPolyData();
		XSRETURN_EMPTY;


void
vtkDataObjectToDataSetFilter::SetDataSetTypeToRectilinearGrid()
		CODE:
		THIS->SetDataSetTypeToRectilinearGrid();
		XSRETURN_EMPTY;


void
vtkDataObjectToDataSetFilter::SetDataSetTypeToStructuredGrid()
		CODE:
		THIS->SetDataSetTypeToStructuredGrid();
		XSRETURN_EMPTY;


void
vtkDataObjectToDataSetFilter::SetDataSetTypeToStructuredPoints()
		CODE:
		THIS->SetDataSetTypeToStructuredPoints();
		XSRETURN_EMPTY;


void
vtkDataObjectToDataSetFilter::SetDataSetTypeToUnstructuredGrid()
		CODE:
		THIS->SetDataSetTypeToUnstructuredGrid();
		XSRETURN_EMPTY;


void
vtkDataObjectToDataSetFilter::SetDefaultNormalize(arg1)
		int 	arg1
		CODE:
		THIS->SetDefaultNormalize(arg1);
		XSRETURN_EMPTY;


void
vtkDataObjectToDataSetFilter::SetDimensions(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int  	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetDimensions(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataObjectToDataSetFilter::SetDimensions\n");



void
vtkDataObjectToDataSetFilter::SetDimensionsComponent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		char *	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		CODE:
		THIS->SetDimensionsComponent(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE: items == 3
		char *	arg1
		int 	arg2
		CODE:
		THIS->SetDimensionsComponent(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataObjectToDataSetFilter::SetDimensionsComponent\n");



void
vtkDataObjectToDataSetFilter::SetInput(input)
		vtkDataObject *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;


void
vtkDataObjectToDataSetFilter::SetLinesComponent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		char *	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		CODE:
		THIS->SetLinesComponent(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE: items == 3
		char *	arg1
		int 	arg2
		CODE:
		THIS->SetLinesComponent(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataObjectToDataSetFilter::SetLinesComponent\n");



void
vtkDataObjectToDataSetFilter::SetOrigin(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetOrigin(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataObjectToDataSetFilter::SetOrigin\n");



void
vtkDataObjectToDataSetFilter::SetOriginComponent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		char *	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		CODE:
		THIS->SetOriginComponent(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE: items == 3
		char *	arg1
		int 	arg2
		CODE:
		THIS->SetOriginComponent(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataObjectToDataSetFilter::SetOriginComponent\n");



void
vtkDataObjectToDataSetFilter::SetPointComponent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int 	arg1
		char *	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetPointComponent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE: items == 4
		int 	arg1
		char *	arg2
		int 	arg3
		CODE:
		THIS->SetPointComponent(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataObjectToDataSetFilter::SetPointComponent\n");



void
vtkDataObjectToDataSetFilter::SetPolysComponent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		char *	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		CODE:
		THIS->SetPolysComponent(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE: items == 3
		char *	arg1
		int 	arg2
		CODE:
		THIS->SetPolysComponent(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataObjectToDataSetFilter::SetPolysComponent\n");



void
vtkDataObjectToDataSetFilter::SetSpacing(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetSpacing(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataObjectToDataSetFilter::SetSpacing\n");



void
vtkDataObjectToDataSetFilter::SetSpacingComponent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		char *	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		CODE:
		THIS->SetSpacingComponent(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE: items == 3
		char *	arg1
		int 	arg2
		CODE:
		THIS->SetSpacingComponent(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataObjectToDataSetFilter::SetSpacingComponent\n");



void
vtkDataObjectToDataSetFilter::SetStripsComponent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		char *	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		CODE:
		THIS->SetStripsComponent(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE: items == 3
		char *	arg1
		int 	arg2
		CODE:
		THIS->SetStripsComponent(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataObjectToDataSetFilter::SetStripsComponent\n");



void
vtkDataObjectToDataSetFilter::SetVertsComponent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		char *	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		CODE:
		THIS->SetVertsComponent(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE: items == 3
		char *	arg1
		int 	arg2
		CODE:
		THIS->SetVertsComponent(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataObjectToDataSetFilter::SetVertsComponent\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::DataObjectWriter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkDataObjectWriter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


char *
vtkDataObjectWriter::GetFieldDataName()
		CODE:
		RETVAL = THIS->GetFieldDataName();
		OUTPUT:
		RETVAL


char *
vtkDataObjectWriter::GetFileName()
		CODE:
		RETVAL = THIS->GetFileName();
		OUTPUT:
		RETVAL


int
vtkDataObjectWriter::GetFileType()
		CODE:
		RETVAL = THIS->GetFileType();
		OUTPUT:
		RETVAL


char *
vtkDataObjectWriter::GetHeader()
		CODE:
		RETVAL = THIS->GetHeader();
		OUTPUT:
		RETVAL


vtkDataObject *
vtkDataObjectWriter::GetInput()
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


static vtkDataObjectWriter*
vtkDataObjectWriter::New()
		CODE:
		RETVAL = vtkDataObjectWriter::New();
		OUTPUT:
		RETVAL


void
vtkDataObjectWriter::SetFieldDataName(fieldname)
		char *	fieldname
		CODE:
		THIS->SetFieldDataName(fieldname);
		XSRETURN_EMPTY;


void
vtkDataObjectWriter::SetFileName(filename)
		char *	filename
		CODE:
		THIS->SetFileName(filename);
		XSRETURN_EMPTY;


void
vtkDataObjectWriter::SetFileType(type)
		int 	type
		CODE:
		THIS->SetFileType(type);
		XSRETURN_EMPTY;


void
vtkDataObjectWriter::SetFileTypeToASCII()
		CODE:
		THIS->SetFileTypeToASCII();
		XSRETURN_EMPTY;


void
vtkDataObjectWriter::SetFileTypeToBinary()
		CODE:
		THIS->SetFileTypeToBinary();
		XSRETURN_EMPTY;


void
vtkDataObjectWriter::SetHeader(header)
		char *	header
		CODE:
		THIS->SetHeader(header);
		XSRETURN_EMPTY;


void
vtkDataObjectWriter::SetInput(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataObject")
		vtkDataObject *	arg1
		CODE:
		THIS->SetInput(* arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataObject")
		vtkDataObject *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataObjectWriter::SetInput\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::DataReader PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkDataReader::CloseVTKFile()
		CODE:
		THIS->CloseVTKFile();
		XSRETURN_EMPTY;


const char *
vtkDataReader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


char *
vtkDataReader::GetFieldDataName()
		CODE:
		RETVAL = THIS->GetFieldDataName();
		OUTPUT:
		RETVAL


const char *
vtkDataReader::GetFieldDataNameInFile(i)
		int 	i
		CODE:
		RETVAL = THIS->GetFieldDataNameInFile(i);
		OUTPUT:
		RETVAL


char *
vtkDataReader::GetFileName()
		CODE:
		RETVAL = THIS->GetFileName();
		OUTPUT:
		RETVAL


int
vtkDataReader::GetFileType()
		CODE:
		RETVAL = THIS->GetFileType();
		OUTPUT:
		RETVAL


char *
vtkDataReader::GetGhostLevelsName()
		CODE:
		RETVAL = THIS->GetGhostLevelsName();
		OUTPUT:
		RETVAL


const char *
vtkDataReader::GetGhostLevelsNameInFile(i)
		int 	i
		CODE:
		RETVAL = THIS->GetGhostLevelsNameInFile(i);
		OUTPUT:
		RETVAL


char *
vtkDataReader::GetHeader()
		CODE:
		RETVAL = THIS->GetHeader();
		OUTPUT:
		RETVAL


char *
vtkDataReader::GetInputString()
		CODE:
		RETVAL = THIS->GetInputString();
		OUTPUT:
		RETVAL


int
vtkDataReader::GetInputStringLength()
		CODE:
		RETVAL = THIS->GetInputStringLength();
		OUTPUT:
		RETVAL


char *
vtkDataReader::GetLookupTableName()
		CODE:
		RETVAL = THIS->GetLookupTableName();
		OUTPUT:
		RETVAL


char *
vtkDataReader::GetNormalsName()
		CODE:
		RETVAL = THIS->GetNormalsName();
		OUTPUT:
		RETVAL


const char *
vtkDataReader::GetNormalsNameInFile(i)
		int 	i
		CODE:
		RETVAL = THIS->GetNormalsNameInFile(i);
		OUTPUT:
		RETVAL


int
vtkDataReader::GetNumberOfFieldDataInFile()
		CODE:
		RETVAL = THIS->GetNumberOfFieldDataInFile();
		OUTPUT:
		RETVAL


int
vtkDataReader::GetNumberOfGhostLevelsInFile()
		CODE:
		RETVAL = THIS->GetNumberOfGhostLevelsInFile();
		OUTPUT:
		RETVAL


int
vtkDataReader::GetNumberOfNormalsInFile()
		CODE:
		RETVAL = THIS->GetNumberOfNormalsInFile();
		OUTPUT:
		RETVAL


int
vtkDataReader::GetNumberOfScalarsInFile()
		CODE:
		RETVAL = THIS->GetNumberOfScalarsInFile();
		OUTPUT:
		RETVAL


int
vtkDataReader::GetNumberOfTCoordsInFile()
		CODE:
		RETVAL = THIS->GetNumberOfTCoordsInFile();
		OUTPUT:
		RETVAL


int
vtkDataReader::GetNumberOfTensorsInFile()
		CODE:
		RETVAL = THIS->GetNumberOfTensorsInFile();
		OUTPUT:
		RETVAL


int
vtkDataReader::GetNumberOfVectorsInFile()
		CODE:
		RETVAL = THIS->GetNumberOfVectorsInFile();
		OUTPUT:
		RETVAL


int
vtkDataReader::GetReadFromInputString()
		CODE:
		RETVAL = THIS->GetReadFromInputString();
		OUTPUT:
		RETVAL


char *
vtkDataReader::GetScalarsName()
		CODE:
		RETVAL = THIS->GetScalarsName();
		OUTPUT:
		RETVAL


const char *
vtkDataReader::GetScalarsNameInFile(i)
		int 	i
		CODE:
		RETVAL = THIS->GetScalarsNameInFile(i);
		OUTPUT:
		RETVAL


char *
vtkDataReader::GetTCoordsName()
		CODE:
		RETVAL = THIS->GetTCoordsName();
		OUTPUT:
		RETVAL


const char *
vtkDataReader::GetTCoordsNameInFile(i)
		int 	i
		CODE:
		RETVAL = THIS->GetTCoordsNameInFile(i);
		OUTPUT:
		RETVAL


char *
vtkDataReader::GetTensorsName()
		CODE:
		RETVAL = THIS->GetTensorsName();
		OUTPUT:
		RETVAL


const char *
vtkDataReader::GetTensorsNameInFile(i)
		int 	i
		CODE:
		RETVAL = THIS->GetTensorsNameInFile(i);
		OUTPUT:
		RETVAL


char *
vtkDataReader::GetVectorsName()
		CODE:
		RETVAL = THIS->GetVectorsName();
		OUTPUT:
		RETVAL


const char *
vtkDataReader::GetVectorsNameInFile(i)
		int 	i
		CODE:
		RETVAL = THIS->GetVectorsNameInFile(i);
		OUTPUT:
		RETVAL


int
vtkDataReader::IsFilePolyData()
		CODE:
		RETVAL = THIS->IsFilePolyData();
		OUTPUT:
		RETVAL


int
vtkDataReader::IsFileRectilinearGrid()
		CODE:
		RETVAL = THIS->IsFileRectilinearGrid();
		OUTPUT:
		RETVAL


int
vtkDataReader::IsFileStructuredGrid()
		CODE:
		RETVAL = THIS->IsFileStructuredGrid();
		OUTPUT:
		RETVAL


int
vtkDataReader::IsFileStructuredPoints()
		CODE:
		RETVAL = THIS->IsFileStructuredPoints();
		OUTPUT:
		RETVAL


int
vtkDataReader::IsFileUnstructuredGrid()
		CODE:
		RETVAL = THIS->IsFileUnstructuredGrid();
		OUTPUT:
		RETVAL


int
vtkDataReader::IsFileValid(dstype)
		char *	dstype
		CODE:
		RETVAL = THIS->IsFileValid(dstype);
		OUTPUT:
		RETVAL


char *
vtkDataReader::LowerCase(arg1)
		char *	arg1
		CODE:
		RETVAL = THIS->LowerCase(arg1);
		OUTPUT:
		RETVAL


static vtkDataReader*
vtkDataReader::New()
		CODE:
		RETVAL = vtkDataReader::New();
		OUTPUT:
		RETVAL


int
vtkDataReader::OpenVTKFile()
		CODE:
		RETVAL = THIS->OpenVTKFile();
		OUTPUT:
		RETVAL


int
vtkDataReader::Read(arg1 = 0)
	CASE: items == 2
		char *	arg1
		CODE:
		RETVAL = THIS->Read(arg1);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataReader::Read\n");



vtkDataArray *
vtkDataReader::ReadArray(dataType, numTuples, numComp)
		char *	dataType
		int 	numTuples
		int 	numComp
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataArray";
		CODE:
		RETVAL = THIS->ReadArray(dataType, numTuples, numComp);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkDataReader::ReadCellData(ds, numCells)
		vtkDataSet *	ds
		int 	numCells
		CODE:
		RETVAL = THIS->ReadCellData(ds, numCells);
		OUTPUT:
		RETVAL


int
vtkDataReader::ReadCoordinates(rg, axes, numCoords)
		vtkRectilinearGrid *	rg
		int 	axes
		int 	numCoords
		CODE:
		RETVAL = THIS->ReadCoordinates(rg, axes, numCoords);
		OUTPUT:
		RETVAL


vtkFieldData *
vtkDataReader::ReadFieldData()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkFieldData";
		CODE:
		RETVAL = THIS->ReadFieldData();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkDataReader::ReadFromInputStringOff()
		CODE:
		THIS->ReadFromInputStringOff();
		XSRETURN_EMPTY;


void
vtkDataReader::ReadFromInputStringOn()
		CODE:
		THIS->ReadFromInputStringOn();
		XSRETURN_EMPTY;


int
vtkDataReader::ReadHeader()
		CODE:
		RETVAL = THIS->ReadHeader();
		OUTPUT:
		RETVAL


int
vtkDataReader::ReadPointData(ds, numPts)
		vtkDataSet *	ds
		int 	numPts
		CODE:
		RETVAL = THIS->ReadPointData(ds, numPts);
		OUTPUT:
		RETVAL


int
vtkDataReader::ReadPoints(ps, numPts)
		vtkPointSet *	ps
		int 	numPts
		CODE:
		RETVAL = THIS->ReadPoints(ps, numPts);
		OUTPUT:
		RETVAL


void
vtkDataReader::SetBinaryInputString(arg1, len)
		char *	arg1
		int 	len
		CODE:
		THIS->SetBinaryInputString(arg1, len);
		XSRETURN_EMPTY;


void
vtkDataReader::SetFieldDataName(arg1)
		char *	arg1
		CODE:
		THIS->SetFieldDataName(arg1);
		XSRETURN_EMPTY;


void
vtkDataReader::SetFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetFileName(arg1);
		XSRETURN_EMPTY;


void
vtkDataReader::SetGhostLevelsName(arg1)
		char *	arg1
		CODE:
		THIS->SetGhostLevelsName(arg1);
		XSRETURN_EMPTY;


void
vtkDataReader::SetInputString(arg1 = 0, arg2 = 0)
	CASE: items == 3
		char *	arg1
		int 	arg2
		CODE:
		THIS->SetInputString(arg1, arg2);
		XSRETURN_EMPTY;
	CASE: items == 2
		char *	arg1
		CODE:
		THIS->SetInputString(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataReader::SetInputString\n");



void
vtkDataReader::SetLookupTableName(arg1)
		char *	arg1
		CODE:
		THIS->SetLookupTableName(arg1);
		XSRETURN_EMPTY;


void
vtkDataReader::SetNormalsName(arg1)
		char *	arg1
		CODE:
		THIS->SetNormalsName(arg1);
		XSRETURN_EMPTY;


void
vtkDataReader::SetReadFromInputString(arg1)
		int 	arg1
		CODE:
		THIS->SetReadFromInputString(arg1);
		XSRETURN_EMPTY;


void
vtkDataReader::SetScalarsName(arg1)
		char *	arg1
		CODE:
		THIS->SetScalarsName(arg1);
		XSRETURN_EMPTY;


void
vtkDataReader::SetTCoordsName(arg1)
		char *	arg1
		CODE:
		THIS->SetTCoordsName(arg1);
		XSRETURN_EMPTY;


void
vtkDataReader::SetTensorsName(arg1)
		char *	arg1
		CODE:
		THIS->SetTensorsName(arg1);
		XSRETURN_EMPTY;


void
vtkDataReader::SetVectorsName(arg1)
		char *	arg1
		CODE:
		THIS->SetVectorsName(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::DataSetMapper PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkDataSetMapper::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkDataSetMapper::GetInput()
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


unsigned long
vtkDataSetMapper::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


vtkPolyDataMapper *
vtkDataSetMapper::GetPolyDataMapper()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPolyDataMapper";
		CODE:
		RETVAL = THIS->GetPolyDataMapper();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkDataSetMapper*
vtkDataSetMapper::New()
		CODE:
		RETVAL = vtkDataSetMapper::New();
		OUTPUT:
		RETVAL


void
vtkDataSetMapper::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;


void
vtkDataSetMapper::Render(ren, act)
		vtkRenderer *	ren
		vtkActor *	act
		CODE:
		THIS->Render(ren, act);
		XSRETURN_EMPTY;


void
vtkDataSetMapper::SetInput(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::ImageData")
		vtkImageData *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataSet")
		vtkDataSet *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataSetMapper::SetInput\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::DataSetReader PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkDataSetReader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkDataSetReader::GetOutput(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetOutput(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE: items == 1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataSetReader::GetOutput\n");



vtkPolyData *
vtkDataSetReader::GetPolyDataOutput()
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
vtkDataSetReader::GetRectilinearGridOutput()
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


vtkStructuredGrid *
vtkDataSetReader::GetStructuredGridOutput()
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
vtkDataSetReader::GetStructuredPointsOutput()
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


vtkUnstructuredGrid *
vtkDataSetReader::GetUnstructuredGridOutput()
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


static vtkDataSetReader*
vtkDataSetReader::New()
		CODE:
		RETVAL = vtkDataSetReader::New();
		OUTPUT:
		RETVAL


void
vtkDataSetReader::Update()
		CODE:
		THIS->Update();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::DataSetSource PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkDataSetSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkDataSetSource::GetOutput(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetOutput(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE: items == 1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataSetSource::GetOutput\n");



static vtkDataSetSource*
vtkDataSetSource::New()
		CODE:
		RETVAL = vtkDataSetSource::New();
		OUTPUT:
		RETVAL


void
vtkDataSetSource::SetOutput(arg1)
		vtkDataSet *	arg1
		CODE:
		THIS->SetOutput(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::DataSetToDataObjectFilter PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkDataSetToDataObjectFilter::CellDataOff()
		CODE:
		THIS->CellDataOff();
		XSRETURN_EMPTY;


void
vtkDataSetToDataObjectFilter::CellDataOn()
		CODE:
		THIS->CellDataOn();
		XSRETURN_EMPTY;


void
vtkDataSetToDataObjectFilter::FieldDataOff()
		CODE:
		THIS->FieldDataOff();
		XSRETURN_EMPTY;


void
vtkDataSetToDataObjectFilter::FieldDataOn()
		CODE:
		THIS->FieldDataOn();
		XSRETURN_EMPTY;


void
vtkDataSetToDataObjectFilter::GeometryOff()
		CODE:
		THIS->GeometryOff();
		XSRETURN_EMPTY;


void
vtkDataSetToDataObjectFilter::GeometryOn()
		CODE:
		THIS->GeometryOn();
		XSRETURN_EMPTY;


int
vtkDataSetToDataObjectFilter::GetCellData()
		CODE:
		RETVAL = THIS->GetCellData();
		OUTPUT:
		RETVAL


const char *
vtkDataSetToDataObjectFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkDataSetToDataObjectFilter::GetFieldData()
		CODE:
		RETVAL = THIS->GetFieldData();
		OUTPUT:
		RETVAL


int
vtkDataSetToDataObjectFilter::GetGeometry()
		CODE:
		RETVAL = THIS->GetGeometry();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkDataSetToDataObjectFilter::GetInput()
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
vtkDataSetToDataObjectFilter::GetPointData()
		CODE:
		RETVAL = THIS->GetPointData();
		OUTPUT:
		RETVAL


int
vtkDataSetToDataObjectFilter::GetTopology()
		CODE:
		RETVAL = THIS->GetTopology();
		OUTPUT:
		RETVAL


static vtkDataSetToDataObjectFilter*
vtkDataSetToDataObjectFilter::New()
		CODE:
		RETVAL = vtkDataSetToDataObjectFilter::New();
		OUTPUT:
		RETVAL


void
vtkDataSetToDataObjectFilter::PointDataOff()
		CODE:
		THIS->PointDataOff();
		XSRETURN_EMPTY;


void
vtkDataSetToDataObjectFilter::PointDataOn()
		CODE:
		THIS->PointDataOn();
		XSRETURN_EMPTY;


void
vtkDataSetToDataObjectFilter::SetCellData(arg1)
		int 	arg1
		CODE:
		THIS->SetCellData(arg1);
		XSRETURN_EMPTY;


void
vtkDataSetToDataObjectFilter::SetFieldData(arg1)
		int 	arg1
		CODE:
		THIS->SetFieldData(arg1);
		XSRETURN_EMPTY;


void
vtkDataSetToDataObjectFilter::SetGeometry(arg1)
		int 	arg1
		CODE:
		THIS->SetGeometry(arg1);
		XSRETURN_EMPTY;


void
vtkDataSetToDataObjectFilter::SetInput(input)
		vtkDataSet *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;


void
vtkDataSetToDataObjectFilter::SetPointData(arg1)
		int 	arg1
		CODE:
		THIS->SetPointData(arg1);
		XSRETURN_EMPTY;


void
vtkDataSetToDataObjectFilter::SetTopology(arg1)
		int 	arg1
		CODE:
		THIS->SetTopology(arg1);
		XSRETURN_EMPTY;


void
vtkDataSetToDataObjectFilter::TopologyOff()
		CODE:
		THIS->TopologyOff();
		XSRETURN_EMPTY;


void
vtkDataSetToDataObjectFilter::TopologyOn()
		CODE:
		THIS->TopologyOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::DataSetTriangleFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkDataSetTriangleFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkDataSetTriangleFilter*
vtkDataSetTriangleFilter::New()
		CODE:
		RETVAL = vtkDataSetTriangleFilter::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::DataSetWriter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkDataSetWriter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkDataSetWriter::GetInput()
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


static vtkDataSetWriter*
vtkDataSetWriter::New()
		CODE:
		RETVAL = vtkDataSetWriter::New();
		OUTPUT:
		RETVAL


void
vtkDataSetWriter::SetInput(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::ImageData")
		vtkImageData *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataSet")
		vtkDataSet *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataSetWriter::SetInput\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::DataWriter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkDataWriter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


char *
vtkDataWriter::GetFieldDataName()
		CODE:
		RETVAL = THIS->GetFieldDataName();
		OUTPUT:
		RETVAL


char *
vtkDataWriter::GetFileName()
		CODE:
		RETVAL = THIS->GetFileName();
		OUTPUT:
		RETVAL


int
vtkDataWriter::GetFileType()
		CODE:
		RETVAL = THIS->GetFileType();
		OUTPUT:
		RETVAL


char *
vtkDataWriter::GetGhostLevelsName()
		CODE:
		RETVAL = THIS->GetGhostLevelsName();
		OUTPUT:
		RETVAL


char *
vtkDataWriter::GetHeader()
		CODE:
		RETVAL = THIS->GetHeader();
		OUTPUT:
		RETVAL


char *
vtkDataWriter::GetLookupTableName()
		CODE:
		RETVAL = THIS->GetLookupTableName();
		OUTPUT:
		RETVAL


char *
vtkDataWriter::GetNormalsName()
		CODE:
		RETVAL = THIS->GetNormalsName();
		OUTPUT:
		RETVAL


char *
vtkDataWriter::GetOutputString()
		CODE:
		RETVAL = THIS->GetOutputString();
		OUTPUT:
		RETVAL


int
vtkDataWriter::GetOutputStringLength()
		CODE:
		RETVAL = THIS->GetOutputStringLength();
		OUTPUT:
		RETVAL


char *
vtkDataWriter::GetScalarsName()
		CODE:
		RETVAL = THIS->GetScalarsName();
		OUTPUT:
		RETVAL


char *
vtkDataWriter::GetTCoordsName()
		CODE:
		RETVAL = THIS->GetTCoordsName();
		OUTPUT:
		RETVAL


char *
vtkDataWriter::GetTensorsName()
		CODE:
		RETVAL = THIS->GetTensorsName();
		OUTPUT:
		RETVAL


char *
vtkDataWriter::GetVectorsName()
		CODE:
		RETVAL = THIS->GetVectorsName();
		OUTPUT:
		RETVAL


int
vtkDataWriter::GetWriteToOutputString()
		CODE:
		RETVAL = THIS->GetWriteToOutputString();
		OUTPUT:
		RETVAL


static vtkDataWriter*
vtkDataWriter::New()
		CODE:
		RETVAL = vtkDataWriter::New();
		OUTPUT:
		RETVAL


char *
vtkDataWriter::RegisterAndGetOutputString()
		CODE:
		RETVAL = THIS->RegisterAndGetOutputString();
		OUTPUT:
		RETVAL


void
vtkDataWriter::SetFieldDataName(arg1)
		char *	arg1
		CODE:
		THIS->SetFieldDataName(arg1);
		XSRETURN_EMPTY;


void
vtkDataWriter::SetFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetFileName(arg1);
		XSRETURN_EMPTY;


void
vtkDataWriter::SetFileType(arg1)
		int 	arg1
		CODE:
		THIS->SetFileType(arg1);
		XSRETURN_EMPTY;


void
vtkDataWriter::SetFileTypeToASCII()
		CODE:
		THIS->SetFileTypeToASCII();
		XSRETURN_EMPTY;


void
vtkDataWriter::SetFileTypeToBinary()
		CODE:
		THIS->SetFileTypeToBinary();
		XSRETURN_EMPTY;


void
vtkDataWriter::SetGhostLevelsName(arg1)
		char *	arg1
		CODE:
		THIS->SetGhostLevelsName(arg1);
		XSRETURN_EMPTY;


void
vtkDataWriter::SetHeader(arg1)
		char *	arg1
		CODE:
		THIS->SetHeader(arg1);
		XSRETURN_EMPTY;


void
vtkDataWriter::SetLookupTableName(arg1)
		char *	arg1
		CODE:
		THIS->SetLookupTableName(arg1);
		XSRETURN_EMPTY;


void
vtkDataWriter::SetNormalsName(arg1)
		char *	arg1
		CODE:
		THIS->SetNormalsName(arg1);
		XSRETURN_EMPTY;


void
vtkDataWriter::SetScalarsName(arg1)
		char *	arg1
		CODE:
		THIS->SetScalarsName(arg1);
		XSRETURN_EMPTY;


void
vtkDataWriter::SetTCoordsName(arg1)
		char *	arg1
		CODE:
		THIS->SetTCoordsName(arg1);
		XSRETURN_EMPTY;


void
vtkDataWriter::SetTensorsName(arg1)
		char *	arg1
		CODE:
		THIS->SetTensorsName(arg1);
		XSRETURN_EMPTY;


void
vtkDataWriter::SetVectorsName(arg1)
		char *	arg1
		CODE:
		THIS->SetVectorsName(arg1);
		XSRETURN_EMPTY;


void
vtkDataWriter::SetWriteToOutputString(arg1)
		int 	arg1
		CODE:
		THIS->SetWriteToOutputString(arg1);
		XSRETURN_EMPTY;


void
vtkDataWriter::WriteToOutputStringOff()
		CODE:
		THIS->WriteToOutputStringOff();
		XSRETURN_EMPTY;


void
vtkDataWriter::WriteToOutputStringOn()
		CODE:
		THIS->WriteToOutputStringOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::DecimatePro PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkDecimatePro::AccumulateErrorOff()
		CODE:
		THIS->AccumulateErrorOff();
		XSRETURN_EMPTY;


void
vtkDecimatePro::AccumulateErrorOn()
		CODE:
		THIS->AccumulateErrorOn();
		XSRETURN_EMPTY;


void
vtkDecimatePro::BoundaryVertexDeletionOff()
		CODE:
		THIS->BoundaryVertexDeletionOff();
		XSRETURN_EMPTY;


void
vtkDecimatePro::BoundaryVertexDeletionOn()
		CODE:
		THIS->BoundaryVertexDeletionOn();
		XSRETURN_EMPTY;


float
vtkDecimatePro::GetAbsoluteError()
		CODE:
		RETVAL = THIS->GetAbsoluteError();
		OUTPUT:
		RETVAL


int
vtkDecimatePro::GetAccumulateError()
		CODE:
		RETVAL = THIS->GetAccumulateError();
		OUTPUT:
		RETVAL


int
vtkDecimatePro::GetBoundaryVertexDeletion()
		CODE:
		RETVAL = THIS->GetBoundaryVertexDeletion();
		OUTPUT:
		RETVAL


const char *
vtkDecimatePro::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkDecimatePro::GetDegree()
		CODE:
		RETVAL = THIS->GetDegree();
		OUTPUT:
		RETVAL


int
vtkDecimatePro::GetErrorIsAbsolute()
		CODE:
		RETVAL = THIS->GetErrorIsAbsolute();
		OUTPUT:
		RETVAL


float
vtkDecimatePro::GetFeatureAngle()
		CODE:
		RETVAL = THIS->GetFeatureAngle();
		OUTPUT:
		RETVAL


float
vtkDecimatePro::GetInflectionPointRatio()
		CODE:
		RETVAL = THIS->GetInflectionPointRatio();
		OUTPUT:
		RETVAL


float
vtkDecimatePro::GetMaximumError()
		CODE:
		RETVAL = THIS->GetMaximumError();
		OUTPUT:
		RETVAL


int
vtkDecimatePro::GetNumberOfInflectionPoints()
		CODE:
		RETVAL = THIS->GetNumberOfInflectionPoints();
		OUTPUT:
		RETVAL


int
vtkDecimatePro::GetPreSplitMesh()
		CODE:
		RETVAL = THIS->GetPreSplitMesh();
		OUTPUT:
		RETVAL


int
vtkDecimatePro::GetPreserveTopology()
		CODE:
		RETVAL = THIS->GetPreserveTopology();
		OUTPUT:
		RETVAL


float
vtkDecimatePro::GetSplitAngle()
		CODE:
		RETVAL = THIS->GetSplitAngle();
		OUTPUT:
		RETVAL


int
vtkDecimatePro::GetSplitting()
		CODE:
		RETVAL = THIS->GetSplitting();
		OUTPUT:
		RETVAL


float
vtkDecimatePro::GetTargetReduction()
		CODE:
		RETVAL = THIS->GetTargetReduction();
		OUTPUT:
		RETVAL


static vtkDecimatePro*
vtkDecimatePro::New()
		CODE:
		RETVAL = vtkDecimatePro::New();
		OUTPUT:
		RETVAL


void
vtkDecimatePro::PreSplitMeshOff()
		CODE:
		THIS->PreSplitMeshOff();
		XSRETURN_EMPTY;


void
vtkDecimatePro::PreSplitMeshOn()
		CODE:
		THIS->PreSplitMeshOn();
		XSRETURN_EMPTY;


void
vtkDecimatePro::PreserveTopologyOff()
		CODE:
		THIS->PreserveTopologyOff();
		XSRETURN_EMPTY;


void
vtkDecimatePro::PreserveTopologyOn()
		CODE:
		THIS->PreserveTopologyOn();
		XSRETURN_EMPTY;


void
vtkDecimatePro::SetAbsoluteError(arg1)
		float 	arg1
		CODE:
		THIS->SetAbsoluteError(arg1);
		XSRETURN_EMPTY;


void
vtkDecimatePro::SetAccumulateError(arg1)
		int 	arg1
		CODE:
		THIS->SetAccumulateError(arg1);
		XSRETURN_EMPTY;


void
vtkDecimatePro::SetBoundaryVertexDeletion(arg1)
		int 	arg1
		CODE:
		THIS->SetBoundaryVertexDeletion(arg1);
		XSRETURN_EMPTY;


void
vtkDecimatePro::SetDegree(arg1)
		int 	arg1
		CODE:
		THIS->SetDegree(arg1);
		XSRETURN_EMPTY;


void
vtkDecimatePro::SetErrorIsAbsolute(arg1)
		int 	arg1
		CODE:
		THIS->SetErrorIsAbsolute(arg1);
		XSRETURN_EMPTY;


void
vtkDecimatePro::SetFeatureAngle(arg1)
		float 	arg1
		CODE:
		THIS->SetFeatureAngle(arg1);
		XSRETURN_EMPTY;


void
vtkDecimatePro::SetInflectionPointRatio(arg1)
		float 	arg1
		CODE:
		THIS->SetInflectionPointRatio(arg1);
		XSRETURN_EMPTY;


void
vtkDecimatePro::SetMaximumError(arg1)
		float 	arg1
		CODE:
		THIS->SetMaximumError(arg1);
		XSRETURN_EMPTY;


void
vtkDecimatePro::SetPreSplitMesh(arg1)
		int 	arg1
		CODE:
		THIS->SetPreSplitMesh(arg1);
		XSRETURN_EMPTY;


void
vtkDecimatePro::SetPreserveTopology(arg1)
		int 	arg1
		CODE:
		THIS->SetPreserveTopology(arg1);
		XSRETURN_EMPTY;


void
vtkDecimatePro::SetSplitAngle(arg1)
		float 	arg1
		CODE:
		THIS->SetSplitAngle(arg1);
		XSRETURN_EMPTY;


void
vtkDecimatePro::SetSplitting(arg1)
		int 	arg1
		CODE:
		THIS->SetSplitting(arg1);
		XSRETURN_EMPTY;


void
vtkDecimatePro::SetTargetReduction(arg1)
		float 	arg1
		CODE:
		THIS->SetTargetReduction(arg1);
		XSRETURN_EMPTY;


void
vtkDecimatePro::SplittingOff()
		CODE:
		THIS->SplittingOff();
		XSRETURN_EMPTY;


void
vtkDecimatePro::SplittingOn()
		CODE:
		THIS->SplittingOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Delaunay2D PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkDelaunay2D::BoundingTriangulationOff()
		CODE:
		THIS->BoundingTriangulationOff();
		XSRETURN_EMPTY;


void
vtkDelaunay2D::BoundingTriangulationOn()
		CODE:
		THIS->BoundingTriangulationOn();
		XSRETURN_EMPTY;


double
vtkDelaunay2D::GetAlpha()
		CODE:
		RETVAL = THIS->GetAlpha();
		OUTPUT:
		RETVAL


int
vtkDelaunay2D::GetBoundingTriangulation()
		CODE:
		RETVAL = THIS->GetBoundingTriangulation();
		OUTPUT:
		RETVAL


const char *
vtkDelaunay2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkPointSet *
vtkDelaunay2D::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPointSet";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


double
vtkDelaunay2D::GetOffset()
		CODE:
		RETVAL = THIS->GetOffset();
		OUTPUT:
		RETVAL


vtkPolyData *
vtkDelaunay2D::GetSource()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPolyData";
		CODE:
		RETVAL = THIS->GetSource();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


double
vtkDelaunay2D::GetTolerance()
		CODE:
		RETVAL = THIS->GetTolerance();
		OUTPUT:
		RETVAL


static vtkDelaunay2D*
vtkDelaunay2D::New()
		CODE:
		RETVAL = vtkDelaunay2D::New();
		OUTPUT:
		RETVAL


void
vtkDelaunay2D::SetAlpha(arg1)
		double 	arg1
		CODE:
		THIS->SetAlpha(arg1);
		XSRETURN_EMPTY;


void
vtkDelaunay2D::SetBoundingTriangulation(arg1)
		int 	arg1
		CODE:
		THIS->SetBoundingTriangulation(arg1);
		XSRETURN_EMPTY;


void
vtkDelaunay2D::SetInput(input)
		vtkPointSet *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;


void
vtkDelaunay2D::SetOffset(arg1)
		double 	arg1
		CODE:
		THIS->SetOffset(arg1);
		XSRETURN_EMPTY;


void
vtkDelaunay2D::SetSource(arg1)
		vtkPolyData *	arg1
		CODE:
		THIS->SetSource(arg1);
		XSRETURN_EMPTY;


void
vtkDelaunay2D::SetTolerance(arg1)
		double 	arg1
		CODE:
		THIS->SetTolerance(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Delaunay3D PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkDelaunay3D::BoundingTriangulationOff()
		CODE:
		THIS->BoundingTriangulationOff();
		XSRETURN_EMPTY;


void
vtkDelaunay3D::BoundingTriangulationOn()
		CODE:
		THIS->BoundingTriangulationOn();
		XSRETURN_EMPTY;


void
vtkDelaunay3D::CreateDefaultLocator()
		CODE:
		THIS->CreateDefaultLocator();
		XSRETURN_EMPTY;


void
vtkDelaunay3D::EndPointInsertion()
		CODE:
		THIS->EndPointInsertion();
		XSRETURN_EMPTY;


float
vtkDelaunay3D::GetAlpha()
		CODE:
		RETVAL = THIS->GetAlpha();
		OUTPUT:
		RETVAL


int
vtkDelaunay3D::GetBoundingTriangulation()
		CODE:
		RETVAL = THIS->GetBoundingTriangulation();
		OUTPUT:
		RETVAL


const char *
vtkDelaunay3D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkPointSet *
vtkDelaunay3D::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPointSet";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkPointLocator *
vtkDelaunay3D::GetLocator()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPointLocator";
		CODE:
		RETVAL = THIS->GetLocator();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkDelaunay3D::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


float
vtkDelaunay3D::GetOffset()
		CODE:
		RETVAL = THIS->GetOffset();
		OUTPUT:
		RETVAL


float
vtkDelaunay3D::GetTolerance()
		CODE:
		RETVAL = THIS->GetTolerance();
		OUTPUT:
		RETVAL


static vtkDelaunay3D*
vtkDelaunay3D::New()
		CODE:
		RETVAL = vtkDelaunay3D::New();
		OUTPUT:
		RETVAL


void
vtkDelaunay3D::SetAlpha(arg1)
		float 	arg1
		CODE:
		THIS->SetAlpha(arg1);
		XSRETURN_EMPTY;


void
vtkDelaunay3D::SetBoundingTriangulation(arg1)
		int 	arg1
		CODE:
		THIS->SetBoundingTriangulation(arg1);
		XSRETURN_EMPTY;


void
vtkDelaunay3D::SetInput(input)
		vtkPointSet *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;


void
vtkDelaunay3D::SetLocator(arg1 = 0)
	CASE: items == 2
		vtkPointLocator *	arg1
		CODE:
		THIS->SetLocator(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDelaunay3D::SetLocator\n");



void
vtkDelaunay3D::SetOffset(arg1)
		float 	arg1
		CODE:
		THIS->SetOffset(arg1);
		XSRETURN_EMPTY;


void
vtkDelaunay3D::SetTolerance(arg1)
		float 	arg1
		CODE:
		THIS->SetTolerance(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::DiskSource PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkDiskSource::GetCircumferentialResolution()
		CODE:
		RETVAL = THIS->GetCircumferentialResolution();
		OUTPUT:
		RETVAL


const char *
vtkDiskSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkDiskSource::GetInnerRadius()
		CODE:
		RETVAL = THIS->GetInnerRadius();
		OUTPUT:
		RETVAL


float
vtkDiskSource::GetOuterRadius()
		CODE:
		RETVAL = THIS->GetOuterRadius();
		OUTPUT:
		RETVAL


int
vtkDiskSource::GetRadialResolution()
		CODE:
		RETVAL = THIS->GetRadialResolution();
		OUTPUT:
		RETVAL


static vtkDiskSource*
vtkDiskSource::New()
		CODE:
		RETVAL = vtkDiskSource::New();
		OUTPUT:
		RETVAL


void
vtkDiskSource::SetCircumferentialResolution(arg1)
		int 	arg1
		CODE:
		THIS->SetCircumferentialResolution(arg1);
		XSRETURN_EMPTY;


void
vtkDiskSource::SetInnerRadius(arg1)
		float 	arg1
		CODE:
		THIS->SetInnerRadius(arg1);
		XSRETURN_EMPTY;


void
vtkDiskSource::SetOuterRadius(arg1)
		float 	arg1
		CODE:
		THIS->SetOuterRadius(arg1);
		XSRETURN_EMPTY;


void
vtkDiskSource::SetRadialResolution(arg1)
		int 	arg1
		CODE:
		THIS->SetRadialResolution(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::EdgePoints PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkEdgePoints::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkEdgePoints::GetValue()
		CODE:
		RETVAL = THIS->GetValue();
		OUTPUT:
		RETVAL


static vtkEdgePoints*
vtkEdgePoints::New()
		CODE:
		RETVAL = vtkEdgePoints::New();
		OUTPUT:
		RETVAL


void
vtkEdgePoints::SetValue(arg1)
		float 	arg1
		CODE:
		THIS->SetValue(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ElevationFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkElevationFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkElevationFilter::GetHighPoint()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetHighPoint();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkElevationFilter::GetLowPoint()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetLowPoint();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkElevationFilter::GetScalarRange()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetScalarRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


static vtkElevationFilter*
vtkElevationFilter::New()
		CODE:
		RETVAL = vtkElevationFilter::New();
		OUTPUT:
		RETVAL


void
vtkElevationFilter::SetHighPoint(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetHighPoint(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkElevationFilter::SetHighPoint\n");



void
vtkElevationFilter::SetLowPoint(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetLowPoint(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkElevationFilter::SetLowPoint\n");



void
vtkElevationFilter::SetScalarRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetScalarRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkElevationFilter::SetScalarRange\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::EncodedGradientShader PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkEncodedGradientShader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkEncodedGradientShader::GetZeroNormalDiffuseIntensity()
		CODE:
		RETVAL = THIS->GetZeroNormalDiffuseIntensity();
		OUTPUT:
		RETVAL


float
vtkEncodedGradientShader::GetZeroNormalSpecularIntensity()
		CODE:
		RETVAL = THIS->GetZeroNormalSpecularIntensity();
		OUTPUT:
		RETVAL


static vtkEncodedGradientShader*
vtkEncodedGradientShader::New()
		CODE:
		RETVAL = vtkEncodedGradientShader::New();
		OUTPUT:
		RETVAL


void
vtkEncodedGradientShader::SetZeroNormalDiffuseIntensity(arg1)
		float 	arg1
		CODE:
		THIS->SetZeroNormalDiffuseIntensity(arg1);
		XSRETURN_EMPTY;


void
vtkEncodedGradientShader::SetZeroNormalSpecularIntensity(arg1)
		float 	arg1
		CODE:
		THIS->SetZeroNormalSpecularIntensity(arg1);
		XSRETURN_EMPTY;


void
vtkEncodedGradientShader::UpdateShadingTable(ren, vol, gradest)
		vtkRenderer *	ren
		vtkVolume *	vol
		vtkEncodedGradientEstimator *	gradest
		CODE:
		THIS->UpdateShadingTable(ren, vol, gradest);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ExtractEdges PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkExtractEdges::CreateDefaultLocator()
		CODE:
		THIS->CreateDefaultLocator();
		XSRETURN_EMPTY;


const char *
vtkExtractEdges::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkPointLocator *
vtkExtractEdges::GetLocator()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPointLocator";
		CODE:
		RETVAL = THIS->GetLocator();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkExtractEdges::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


static vtkExtractEdges*
vtkExtractEdges::New()
		CODE:
		RETVAL = vtkExtractEdges::New();
		OUTPUT:
		RETVAL


void
vtkExtractEdges::SetLocator(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::PointLocator")
		vtkPointLocator *	arg1
		CODE:
		THIS->SetLocator(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::PointLocator")
		vtkPointLocator *	arg1
		CODE:
		THIS->SetLocator(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkExtractEdges::SetLocator\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ExtractGeometry PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkExtractGeometry::ExtractInsideOff()
		CODE:
		THIS->ExtractInsideOff();
		XSRETURN_EMPTY;


void
vtkExtractGeometry::ExtractInsideOn()
		CODE:
		THIS->ExtractInsideOn();
		XSRETURN_EMPTY;


const char *
vtkExtractGeometry::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkExtractGeometry::GetExtractInside()
		CODE:
		RETVAL = THIS->GetExtractInside();
		OUTPUT:
		RETVAL


vtkImplicitFunction *
vtkExtractGeometry::GetImplicitFunction()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImplicitFunction";
		CODE:
		RETVAL = THIS->GetImplicitFunction();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkExtractGeometry::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


static vtkExtractGeometry*
vtkExtractGeometry::New()
		CODE:
		RETVAL = vtkExtractGeometry::New();
		OUTPUT:
		RETVAL


void
vtkExtractGeometry::SetExtractInside(arg1)
		int 	arg1
		CODE:
		THIS->SetExtractInside(arg1);
		XSRETURN_EMPTY;


void
vtkExtractGeometry::SetImplicitFunction(arg1)
		vtkImplicitFunction *	arg1
		CODE:
		THIS->SetImplicitFunction(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ExtractPolyDataGeometry PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkExtractPolyDataGeometry::ExtractInsideOff()
		CODE:
		THIS->ExtractInsideOff();
		XSRETURN_EMPTY;


void
vtkExtractPolyDataGeometry::ExtractInsideOn()
		CODE:
		THIS->ExtractInsideOn();
		XSRETURN_EMPTY;


const char *
vtkExtractPolyDataGeometry::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkExtractPolyDataGeometry::GetExtractInside()
		CODE:
		RETVAL = THIS->GetExtractInside();
		OUTPUT:
		RETVAL


vtkImplicitFunction *
vtkExtractPolyDataGeometry::GetImplicitFunction()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImplicitFunction";
		CODE:
		RETVAL = THIS->GetImplicitFunction();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkExtractPolyDataGeometry::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


static vtkExtractPolyDataGeometry*
vtkExtractPolyDataGeometry::New()
		CODE:
		RETVAL = vtkExtractPolyDataGeometry::New();
		OUTPUT:
		RETVAL


void
vtkExtractPolyDataGeometry::SetExtractInside(arg1)
		int 	arg1
		CODE:
		THIS->SetExtractInside(arg1);
		XSRETURN_EMPTY;


void
vtkExtractPolyDataGeometry::SetImplicitFunction(arg1)
		vtkImplicitFunction *	arg1
		CODE:
		THIS->SetImplicitFunction(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ExtractPolyDataPiece PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkExtractPolyDataPiece::CreateGhostCellsOff()
		CODE:
		THIS->CreateGhostCellsOff();
		XSRETURN_EMPTY;


void
vtkExtractPolyDataPiece::CreateGhostCellsOn()
		CODE:
		THIS->CreateGhostCellsOn();
		XSRETURN_EMPTY;


const char *
vtkExtractPolyDataPiece::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkExtractPolyDataPiece::GetCreateGhostCells()
		CODE:
		RETVAL = THIS->GetCreateGhostCells();
		OUTPUT:
		RETVAL


static vtkExtractPolyDataPiece*
vtkExtractPolyDataPiece::New()
		CODE:
		RETVAL = vtkExtractPolyDataPiece::New();
		OUTPUT:
		RETVAL


void
vtkExtractPolyDataPiece::SetCreateGhostCells(arg1)
		int 	arg1
		CODE:
		THIS->SetCreateGhostCells(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ExtractGrid PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkExtractGrid::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkExtractGrid::GetIncludeBoundary()
		CODE:
		RETVAL = THIS->GetIncludeBoundary();
		OUTPUT:
		RETVAL


int  *
vtkExtractGrid::GetSampleRate()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetSampleRate();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int  *
vtkExtractGrid::GetVOI()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetVOI();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


void
vtkExtractGrid::IncludeBoundaryOff()
		CODE:
		THIS->IncludeBoundaryOff();
		XSRETURN_EMPTY;


void
vtkExtractGrid::IncludeBoundaryOn()
		CODE:
		THIS->IncludeBoundaryOn();
		XSRETURN_EMPTY;


static vtkExtractGrid*
vtkExtractGrid::New()
		CODE:
		RETVAL = vtkExtractGrid::New();
		OUTPUT:
		RETVAL


void
vtkExtractGrid::SetIncludeBoundary(arg1)
		int 	arg1
		CODE:
		THIS->SetIncludeBoundary(arg1);
		XSRETURN_EMPTY;


void
vtkExtractGrid::SetSampleRate(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int  	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetSampleRate(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkExtractGrid::SetSampleRate\n");



void
vtkExtractGrid::SetVOI(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int  	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetVOI(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkExtractGrid::SetVOI\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ExtractTensorComponents PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkExtractTensorComponents::ExtractNormalsOff()
		CODE:
		THIS->ExtractNormalsOff();
		XSRETURN_EMPTY;


void
vtkExtractTensorComponents::ExtractNormalsOn()
		CODE:
		THIS->ExtractNormalsOn();
		XSRETURN_EMPTY;


void
vtkExtractTensorComponents::ExtractScalarsOff()
		CODE:
		THIS->ExtractScalarsOff();
		XSRETURN_EMPTY;


void
vtkExtractTensorComponents::ExtractScalarsOn()
		CODE:
		THIS->ExtractScalarsOn();
		XSRETURN_EMPTY;


void
vtkExtractTensorComponents::ExtractTCoordsOff()
		CODE:
		THIS->ExtractTCoordsOff();
		XSRETURN_EMPTY;


void
vtkExtractTensorComponents::ExtractTCoordsOn()
		CODE:
		THIS->ExtractTCoordsOn();
		XSRETURN_EMPTY;


void
vtkExtractTensorComponents::ExtractVectorsOff()
		CODE:
		THIS->ExtractVectorsOff();
		XSRETURN_EMPTY;


void
vtkExtractTensorComponents::ExtractVectorsOn()
		CODE:
		THIS->ExtractVectorsOn();
		XSRETURN_EMPTY;


const char *
vtkExtractTensorComponents::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkExtractTensorComponents::GetExtractNormals()
		CODE:
		RETVAL = THIS->GetExtractNormals();
		OUTPUT:
		RETVAL


int
vtkExtractTensorComponents::GetExtractScalars()
		CODE:
		RETVAL = THIS->GetExtractScalars();
		OUTPUT:
		RETVAL


int
vtkExtractTensorComponents::GetExtractTCoords()
		CODE:
		RETVAL = THIS->GetExtractTCoords();
		OUTPUT:
		RETVAL


int
vtkExtractTensorComponents::GetExtractVectors()
		CODE:
		RETVAL = THIS->GetExtractVectors();
		OUTPUT:
		RETVAL


int  *
vtkExtractTensorComponents::GetNormalComponents()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetNormalComponents();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


int
vtkExtractTensorComponents::GetNormalizeNormals()
		CODE:
		RETVAL = THIS->GetNormalizeNormals();
		OUTPUT:
		RETVAL


int
vtkExtractTensorComponents::GetNumberOfTCoords()
		CODE:
		RETVAL = THIS->GetNumberOfTCoords();
		OUTPUT:
		RETVAL


int
vtkExtractTensorComponents::GetPassTensorsToOutput()
		CODE:
		RETVAL = THIS->GetPassTensorsToOutput();
		OUTPUT:
		RETVAL


int  *
vtkExtractTensorComponents::GetScalarComponents()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetScalarComponents();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


int
vtkExtractTensorComponents::GetScalarMode()
		CODE:
		RETVAL = THIS->GetScalarMode();
		OUTPUT:
		RETVAL


int  *
vtkExtractTensorComponents::GetTCoordComponents()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetTCoordComponents();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


int  *
vtkExtractTensorComponents::GetVectorComponents()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetVectorComponents();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


static vtkExtractTensorComponents*
vtkExtractTensorComponents::New()
		CODE:
		RETVAL = vtkExtractTensorComponents::New();
		OUTPUT:
		RETVAL


void
vtkExtractTensorComponents::NormalizeNormalsOff()
		CODE:
		THIS->NormalizeNormalsOff();
		XSRETURN_EMPTY;


void
vtkExtractTensorComponents::NormalizeNormalsOn()
		CODE:
		THIS->NormalizeNormalsOn();
		XSRETURN_EMPTY;


void
vtkExtractTensorComponents::PassTensorsToOutputOff()
		CODE:
		THIS->PassTensorsToOutputOff();
		XSRETURN_EMPTY;


void
vtkExtractTensorComponents::PassTensorsToOutputOn()
		CODE:
		THIS->PassTensorsToOutputOn();
		XSRETURN_EMPTY;


void
vtkExtractTensorComponents::ScalarIsComponent()
		CODE:
		THIS->ScalarIsComponent();
		XSRETURN_EMPTY;


void
vtkExtractTensorComponents::ScalarIsDeterminant()
		CODE:
		THIS->ScalarIsDeterminant();
		XSRETURN_EMPTY;


void
vtkExtractTensorComponents::ScalarIsEffectiveStress()
		CODE:
		THIS->ScalarIsEffectiveStress();
		XSRETURN_EMPTY;


void
vtkExtractTensorComponents::SetExtractNormals(arg1)
		int 	arg1
		CODE:
		THIS->SetExtractNormals(arg1);
		XSRETURN_EMPTY;


void
vtkExtractTensorComponents::SetExtractScalars(arg1)
		int 	arg1
		CODE:
		THIS->SetExtractScalars(arg1);
		XSRETURN_EMPTY;


void
vtkExtractTensorComponents::SetExtractTCoords(arg1)
		int 	arg1
		CODE:
		THIS->SetExtractTCoords(arg1);
		XSRETURN_EMPTY;


void
vtkExtractTensorComponents::SetExtractVectors(arg1)
		int 	arg1
		CODE:
		THIS->SetExtractVectors(arg1);
		XSRETURN_EMPTY;


void
vtkExtractTensorComponents::SetNormalComponents(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int  	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetNormalComponents(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkExtractTensorComponents::SetNormalComponents\n");



void
vtkExtractTensorComponents::SetNormalizeNormals(arg1)
		int 	arg1
		CODE:
		THIS->SetNormalizeNormals(arg1);
		XSRETURN_EMPTY;


void
vtkExtractTensorComponents::SetNumberOfTCoords(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfTCoords(arg1);
		XSRETURN_EMPTY;


void
vtkExtractTensorComponents::SetPassTensorsToOutput(arg1)
		int 	arg1
		CODE:
		THIS->SetPassTensorsToOutput(arg1);
		XSRETURN_EMPTY;


void
vtkExtractTensorComponents::SetScalarComponents(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int  	arg1
		int 	arg2
		CODE:
		THIS->SetScalarComponents(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkExtractTensorComponents::SetScalarComponents\n");



void
vtkExtractTensorComponents::SetScalarMode(arg1)
		int 	arg1
		CODE:
		THIS->SetScalarMode(arg1);
		XSRETURN_EMPTY;


void
vtkExtractTensorComponents::SetTCoordComponents(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int  	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetTCoordComponents(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkExtractTensorComponents::SetTCoordComponents\n");



void
vtkExtractTensorComponents::SetVectorComponents(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int  	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetVectorComponents(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkExtractTensorComponents::SetVectorComponents\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ExtractUnstructuredGrid PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkExtractUnstructuredGrid::CellClippingOff()
		CODE:
		THIS->CellClippingOff();
		XSRETURN_EMPTY;


void
vtkExtractUnstructuredGrid::CellClippingOn()
		CODE:
		THIS->CellClippingOn();
		XSRETURN_EMPTY;


void
vtkExtractUnstructuredGrid::ExtentClippingOff()
		CODE:
		THIS->ExtentClippingOff();
		XSRETURN_EMPTY;


void
vtkExtractUnstructuredGrid::ExtentClippingOn()
		CODE:
		THIS->ExtentClippingOn();
		XSRETURN_EMPTY;


int
vtkExtractUnstructuredGrid::GetCellClipping()
		CODE:
		RETVAL = THIS->GetCellClipping();
		OUTPUT:
		RETVAL


int
vtkExtractUnstructuredGrid::GetCellMaximum()
		CODE:
		RETVAL = THIS->GetCellMaximum();
		OUTPUT:
		RETVAL


int
vtkExtractUnstructuredGrid::GetCellMinimum()
		CODE:
		RETVAL = THIS->GetCellMinimum();
		OUTPUT:
		RETVAL


const char *
vtkExtractUnstructuredGrid::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkExtractUnstructuredGrid::GetExtentClipping()
		CODE:
		RETVAL = THIS->GetExtentClipping();
		OUTPUT:
		RETVAL


int
vtkExtractUnstructuredGrid::GetPointClipping()
		CODE:
		RETVAL = THIS->GetPointClipping();
		OUTPUT:
		RETVAL


int
vtkExtractUnstructuredGrid::GetPointMaximum()
		CODE:
		RETVAL = THIS->GetPointMaximum();
		OUTPUT:
		RETVAL


int
vtkExtractUnstructuredGrid::GetPointMinimum()
		CODE:
		RETVAL = THIS->GetPointMinimum();
		OUTPUT:
		RETVAL


static vtkExtractUnstructuredGrid*
vtkExtractUnstructuredGrid::New()
		CODE:
		RETVAL = vtkExtractUnstructuredGrid::New();
		OUTPUT:
		RETVAL


void
vtkExtractUnstructuredGrid::PointClippingOff()
		CODE:
		THIS->PointClippingOff();
		XSRETURN_EMPTY;


void
vtkExtractUnstructuredGrid::PointClippingOn()
		CODE:
		THIS->PointClippingOn();
		XSRETURN_EMPTY;


void
vtkExtractUnstructuredGrid::SetCellClipping(arg1)
		int 	arg1
		CODE:
		THIS->SetCellClipping(arg1);
		XSRETURN_EMPTY;


void
vtkExtractUnstructuredGrid::SetCellMaximum(arg1)
		int 	arg1
		CODE:
		THIS->SetCellMaximum(arg1);
		XSRETURN_EMPTY;


void
vtkExtractUnstructuredGrid::SetCellMinimum(arg1)
		int 	arg1
		CODE:
		THIS->SetCellMinimum(arg1);
		XSRETURN_EMPTY;


void
vtkExtractUnstructuredGrid::SetExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		float 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		float 	arg6
		CODE:
		THIS->SetExtent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkExtractUnstructuredGrid::SetExtent\n");



void
vtkExtractUnstructuredGrid::SetExtentClipping(arg1)
		int 	arg1
		CODE:
		THIS->SetExtentClipping(arg1);
		XSRETURN_EMPTY;


void
vtkExtractUnstructuredGrid::SetPointClipping(arg1)
		int 	arg1
		CODE:
		THIS->SetPointClipping(arg1);
		XSRETURN_EMPTY;


void
vtkExtractUnstructuredGrid::SetPointMaximum(arg1)
		int 	arg1
		CODE:
		THIS->SetPointMaximum(arg1);
		XSRETURN_EMPTY;


void
vtkExtractUnstructuredGrid::SetPointMinimum(arg1)
		int 	arg1
		CODE:
		THIS->SetPointMinimum(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ExtractVOI PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkExtractVOI::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int  *
vtkExtractVOI::GetSampleRate()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetSampleRate();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int  *
vtkExtractVOI::GetVOI()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetVOI();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


static vtkExtractVOI*
vtkExtractVOI::New()
		CODE:
		RETVAL = vtkExtractVOI::New();
		OUTPUT:
		RETVAL


void
vtkExtractVOI::SetSampleRate(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int  	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetSampleRate(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkExtractVOI::SetSampleRate\n");



void
vtkExtractVOI::SetVOI(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int  	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetVOI(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkExtractVOI::SetVOI\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ExtractVectorComponents PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkExtractVectorComponents::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkExtractVectorComponents::GetInput()
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


vtkDataSet *
vtkExtractVectorComponents::GetOutput(i)
		int 	i
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetOutput(i);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkDataSet *
vtkExtractVectorComponents::GetVxComponent()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetVxComponent();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkDataSet *
vtkExtractVectorComponents::GetVyComponent()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetVyComponent();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkDataSet *
vtkExtractVectorComponents::GetVzComponent()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetVzComponent();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkExtractVectorComponents*
vtkExtractVectorComponents::New()
		CODE:
		RETVAL = vtkExtractVectorComponents::New();
		OUTPUT:
		RETVAL


void
vtkExtractVectorComponents::SetInput(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataSet")
		vtkDataSet *	arg1
		CODE:
		THIS->SetInput(* arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataSet")
		vtkDataSet *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkExtractVectorComponents::SetInput\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::FeatureEdges PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkFeatureEdges::BoundaryEdgesOff()
		CODE:
		THIS->BoundaryEdgesOff();
		XSRETURN_EMPTY;


void
vtkFeatureEdges::BoundaryEdgesOn()
		CODE:
		THIS->BoundaryEdgesOn();
		XSRETURN_EMPTY;


void
vtkFeatureEdges::ColoringOff()
		CODE:
		THIS->ColoringOff();
		XSRETURN_EMPTY;


void
vtkFeatureEdges::ColoringOn()
		CODE:
		THIS->ColoringOn();
		XSRETURN_EMPTY;


void
vtkFeatureEdges::CreateDefaultLocator()
		CODE:
		THIS->CreateDefaultLocator();
		XSRETURN_EMPTY;


void
vtkFeatureEdges::FeatureEdgesOff()
		CODE:
		THIS->FeatureEdgesOff();
		XSRETURN_EMPTY;


void
vtkFeatureEdges::FeatureEdgesOn()
		CODE:
		THIS->FeatureEdgesOn();
		XSRETURN_EMPTY;


int
vtkFeatureEdges::GetBoundaryEdges()
		CODE:
		RETVAL = THIS->GetBoundaryEdges();
		OUTPUT:
		RETVAL


const char *
vtkFeatureEdges::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkFeatureEdges::GetColoring()
		CODE:
		RETVAL = THIS->GetColoring();
		OUTPUT:
		RETVAL


float
vtkFeatureEdges::GetFeatureAngle()
		CODE:
		RETVAL = THIS->GetFeatureAngle();
		OUTPUT:
		RETVAL


int
vtkFeatureEdges::GetFeatureEdges()
		CODE:
		RETVAL = THIS->GetFeatureEdges();
		OUTPUT:
		RETVAL


vtkPointLocator *
vtkFeatureEdges::GetLocator()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPointLocator";
		CODE:
		RETVAL = THIS->GetLocator();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkFeatureEdges::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


int
vtkFeatureEdges::GetManifoldEdges()
		CODE:
		RETVAL = THIS->GetManifoldEdges();
		OUTPUT:
		RETVAL


int
vtkFeatureEdges::GetNonManifoldEdges()
		CODE:
		RETVAL = THIS->GetNonManifoldEdges();
		OUTPUT:
		RETVAL


void
vtkFeatureEdges::ManifoldEdgesOff()
		CODE:
		THIS->ManifoldEdgesOff();
		XSRETURN_EMPTY;


void
vtkFeatureEdges::ManifoldEdgesOn()
		CODE:
		THIS->ManifoldEdgesOn();
		XSRETURN_EMPTY;


static vtkFeatureEdges*
vtkFeatureEdges::New()
		CODE:
		RETVAL = vtkFeatureEdges::New();
		OUTPUT:
		RETVAL


void
vtkFeatureEdges::NonManifoldEdgesOff()
		CODE:
		THIS->NonManifoldEdgesOff();
		XSRETURN_EMPTY;


void
vtkFeatureEdges::NonManifoldEdgesOn()
		CODE:
		THIS->NonManifoldEdgesOn();
		XSRETURN_EMPTY;


void
vtkFeatureEdges::SetBoundaryEdges(arg1)
		int 	arg1
		CODE:
		THIS->SetBoundaryEdges(arg1);
		XSRETURN_EMPTY;


void
vtkFeatureEdges::SetColoring(arg1)
		int 	arg1
		CODE:
		THIS->SetColoring(arg1);
		XSRETURN_EMPTY;


void
vtkFeatureEdges::SetFeatureAngle(arg1)
		float 	arg1
		CODE:
		THIS->SetFeatureAngle(arg1);
		XSRETURN_EMPTY;


void
vtkFeatureEdges::SetFeatureEdges(arg1)
		int 	arg1
		CODE:
		THIS->SetFeatureEdges(arg1);
		XSRETURN_EMPTY;


void
vtkFeatureEdges::SetLocator(locator)
		vtkPointLocator *	locator
		CODE:
		THIS->SetLocator(locator);
		XSRETURN_EMPTY;


void
vtkFeatureEdges::SetManifoldEdges(arg1)
		int 	arg1
		CODE:
		THIS->SetManifoldEdges(arg1);
		XSRETURN_EMPTY;


void
vtkFeatureEdges::SetNonManifoldEdges(arg1)
		int 	arg1
		CODE:
		THIS->SetNonManifoldEdges(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::FieldDataToAttributeDataFilter PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkFieldDataToAttributeDataFilter::ConstructArray(da, comp, frray, fieldComp, min, max, normalize)
		vtkDataArray *	da
		int 	comp
		vtkDataArray *	frray
		int 	fieldComp
		int 	min
		int 	max
		int 	normalize
		CODE:
		RETVAL = THIS->ConstructArray(da, comp, frray, fieldComp, min, max, normalize);
		OUTPUT:
		RETVAL


void
vtkFieldDataToAttributeDataFilter::DefaultNormalizeOff()
		CODE:
		THIS->DefaultNormalizeOff();
		XSRETURN_EMPTY;


void
vtkFieldDataToAttributeDataFilter::DefaultNormalizeOn()
		CODE:
		THIS->DefaultNormalizeOn();
		XSRETURN_EMPTY;


const char *
vtkFieldDataToAttributeDataFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetDefaultNormalize()
		CODE:
		RETVAL = THIS->GetDefaultNormalize();
		OUTPUT:
		RETVAL


vtkDataArray *
vtkFieldDataToAttributeDataFilter::GetFieldArray(fd, name, comp)
		vtkFieldData *	fd
		char *	name
		int 	comp
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataArray";
		CODE:
		RETVAL = THIS->GetFieldArray(fd, name, comp);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetGhostLevelComponentArrayComponent()
		CODE:
		RETVAL = THIS->GetGhostLevelComponentArrayComponent();
		OUTPUT:
		RETVAL


const char *
vtkFieldDataToAttributeDataFilter::GetGhostLevelComponentArrayName()
		CODE:
		RETVAL = THIS->GetGhostLevelComponentArrayName();
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetGhostLevelComponentMaxRange()
		CODE:
		RETVAL = THIS->GetGhostLevelComponentMaxRange();
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetGhostLevelComponentMinRange()
		CODE:
		RETVAL = THIS->GetGhostLevelComponentMinRange();
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetGhostLevelComponentNormalizeFlag()
		CODE:
		RETVAL = THIS->GetGhostLevelComponentNormalizeFlag();
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetInputField()
		CODE:
		RETVAL = THIS->GetInputField();
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetNormalComponentArrayComponent(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetNormalComponentArrayComponent(comp);
		OUTPUT:
		RETVAL


const char *
vtkFieldDataToAttributeDataFilter::GetNormalComponentArrayName(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetNormalComponentArrayName(comp);
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetNormalComponentMaxRange(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetNormalComponentMaxRange(comp);
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetNormalComponentMinRange(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetNormalComponentMinRange(comp);
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetNormalComponentNormalizeFlag(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetNormalComponentNormalizeFlag(comp);
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetOutputAttributeData()
		CODE:
		RETVAL = THIS->GetOutputAttributeData();
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetScalarComponentArrayComponent(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetScalarComponentArrayComponent(comp);
		OUTPUT:
		RETVAL


const char *
vtkFieldDataToAttributeDataFilter::GetScalarComponentArrayName(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetScalarComponentArrayName(comp);
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetScalarComponentMaxRange(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetScalarComponentMaxRange(comp);
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetScalarComponentMinRange(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetScalarComponentMinRange(comp);
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetScalarComponentNormalizeFlag(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetScalarComponentNormalizeFlag(comp);
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetTCoordComponentArrayComponent(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetTCoordComponentArrayComponent(comp);
		OUTPUT:
		RETVAL


const char *
vtkFieldDataToAttributeDataFilter::GetTCoordComponentArrayName(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetTCoordComponentArrayName(comp);
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetTCoordComponentMaxRange(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetTCoordComponentMaxRange(comp);
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetTCoordComponentMinRange(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetTCoordComponentMinRange(comp);
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetTCoordComponentNormalizeFlag(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetTCoordComponentNormalizeFlag(comp);
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetTensorComponentArrayComponent(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetTensorComponentArrayComponent(comp);
		OUTPUT:
		RETVAL


const char *
vtkFieldDataToAttributeDataFilter::GetTensorComponentArrayName(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetTensorComponentArrayName(comp);
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetTensorComponentMaxRange(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetTensorComponentMaxRange(comp);
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetTensorComponentMinRange(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetTensorComponentMinRange(comp);
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetTensorComponentNormalizeFlag(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetTensorComponentNormalizeFlag(comp);
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetVectorComponentArrayComponent(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetVectorComponentArrayComponent(comp);
		OUTPUT:
		RETVAL


const char *
vtkFieldDataToAttributeDataFilter::GetVectorComponentArrayName(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetVectorComponentArrayName(comp);
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetVectorComponentMaxRange(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetVectorComponentMaxRange(comp);
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetVectorComponentMinRange(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetVectorComponentMinRange(comp);
		OUTPUT:
		RETVAL


int
vtkFieldDataToAttributeDataFilter::GetVectorComponentNormalizeFlag(comp)
		int 	comp
		CODE:
		RETVAL = THIS->GetVectorComponentNormalizeFlag(comp);
		OUTPUT:
		RETVAL


static vtkFieldDataToAttributeDataFilter*
vtkFieldDataToAttributeDataFilter::New()
		CODE:
		RETVAL = vtkFieldDataToAttributeDataFilter::New();
		OUTPUT:
		RETVAL


void
vtkFieldDataToAttributeDataFilter::SetDefaultNormalize(arg1)
		int 	arg1
		CODE:
		THIS->SetDefaultNormalize(arg1);
		XSRETURN_EMPTY;


void
vtkFieldDataToAttributeDataFilter::SetGhostLevelComponent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0)
	CASE: items == 6
		char *	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		CODE:
		THIS->SetGhostLevelComponent(arg1, arg2, arg3, arg4, arg5);
		XSRETURN_EMPTY;
	CASE: items == 3
		char *	arg1
		int 	arg2
		CODE:
		THIS->SetGhostLevelComponent(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkFieldDataToAttributeDataFilter::SetGhostLevelComponent\n");



void
vtkFieldDataToAttributeDataFilter::SetInputField(arg1)
		int 	arg1
		CODE:
		THIS->SetInputField(arg1);
		XSRETURN_EMPTY;


void
vtkFieldDataToAttributeDataFilter::SetInputFieldToCellDataField()
		CODE:
		THIS->SetInputFieldToCellDataField();
		XSRETURN_EMPTY;


void
vtkFieldDataToAttributeDataFilter::SetInputFieldToDataObjectField()
		CODE:
		THIS->SetInputFieldToDataObjectField();
		XSRETURN_EMPTY;


void
vtkFieldDataToAttributeDataFilter::SetInputFieldToPointDataField()
		CODE:
		THIS->SetInputFieldToPointDataField();
		XSRETURN_EMPTY;


void
vtkFieldDataToAttributeDataFilter::SetNormalComponent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int 	arg1
		char *	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetNormalComponent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE: items == 4
		int 	arg1
		char *	arg2
		int 	arg3
		CODE:
		THIS->SetNormalComponent(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkFieldDataToAttributeDataFilter::SetNormalComponent\n");



void
vtkFieldDataToAttributeDataFilter::SetOutputAttributeData(arg1)
		int 	arg1
		CODE:
		THIS->SetOutputAttributeData(arg1);
		XSRETURN_EMPTY;


void
vtkFieldDataToAttributeDataFilter::SetOutputAttributeDataToCellData()
		CODE:
		THIS->SetOutputAttributeDataToCellData();
		XSRETURN_EMPTY;


void
vtkFieldDataToAttributeDataFilter::SetOutputAttributeDataToPointData()
		CODE:
		THIS->SetOutputAttributeDataToPointData();
		XSRETURN_EMPTY;


void
vtkFieldDataToAttributeDataFilter::SetScalarComponent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int 	arg1
		char *	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetScalarComponent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE: items == 4
		int 	arg1
		char *	arg2
		int 	arg3
		CODE:
		THIS->SetScalarComponent(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkFieldDataToAttributeDataFilter::SetScalarComponent\n");



void
vtkFieldDataToAttributeDataFilter::SetTCoordComponent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int 	arg1
		char *	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetTCoordComponent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE: items == 4
		int 	arg1
		char *	arg2
		int 	arg3
		CODE:
		THIS->SetTCoordComponent(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkFieldDataToAttributeDataFilter::SetTCoordComponent\n");



void
vtkFieldDataToAttributeDataFilter::SetTensorComponent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int 	arg1
		char *	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetTensorComponent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE: items == 4
		int 	arg1
		char *	arg2
		int 	arg3
		CODE:
		THIS->SetTensorComponent(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkFieldDataToAttributeDataFilter::SetTensorComponent\n");



void
vtkFieldDataToAttributeDataFilter::SetVectorComponent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int 	arg1
		char *	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetVectorComponent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE: items == 4
		int 	arg1
		char *	arg2
		int 	arg3
		CODE:
		THIS->SetVectorComponent(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkFieldDataToAttributeDataFilter::SetVectorComponent\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::FiniteDifferenceGradientEstimator PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkFiniteDifferenceGradientEstimator::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkFiniteDifferenceGradientEstimator::GetSampleSpacingInVoxels()
		CODE:
		RETVAL = THIS->GetSampleSpacingInVoxels();
		OUTPUT:
		RETVAL


static vtkFiniteDifferenceGradientEstimator*
vtkFiniteDifferenceGradientEstimator::New()
		CODE:
		RETVAL = vtkFiniteDifferenceGradientEstimator::New();
		OUTPUT:
		RETVAL


void
vtkFiniteDifferenceGradientEstimator::SetSampleSpacingInVoxels(arg1)
		int 	arg1
		CODE:
		THIS->SetSampleSpacingInVoxels(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Follower PREFIX = vtk

PROTOTYPES: DISABLE



vtkCamera *
vtkFollower::GetCamera()
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
vtkFollower::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkMatrix4x4 *
vtkFollower::GetMatrix(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::Matrix4x4")
		vtkMatrix4x4 *	arg1
		CODE:
		THIS->GetMatrix(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::Matrix4x4")
		vtkMatrix4x4 *	arg1
		CODE:
		THIS->GetMatrix(* arg1);
		XSRETURN_EMPTY;
	CASE: items == 1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkMatrix4x4";
		CODE:
		RETVAL = THIS->GetMatrix();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkFollower::GetMatrix\n");



static vtkFollower*
vtkFollower::New()
		CODE:
		RETVAL = vtkFollower::New();
		OUTPUT:
		RETVAL


void
vtkFollower::Render(arg1 = 0)
	CASE: items == 2
		vtkRenderer *	arg1
		CODE:
		THIS->Render(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkFollower::Render\n");



int
vtkFollower::RenderOpaqueGeometry(viewport)
		vtkViewport *	viewport
		CODE:
		RETVAL = THIS->RenderOpaqueGeometry(viewport);
		OUTPUT:
		RETVAL


int
vtkFollower::RenderTranslucentGeometry(viewport)
		vtkViewport *	viewport
		CODE:
		RETVAL = THIS->RenderTranslucentGeometry(viewport);
		OUTPUT:
		RETVAL


void
vtkFollower::SetCamera(arg1)
		vtkCamera *	arg1
		CODE:
		THIS->SetCamera(arg1);
		XSRETURN_EMPTY;


void
vtkFollower::ShallowCopy(prop)
		vtkProp *	prop
		CODE:
		THIS->ShallowCopy(prop);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::FrustumCoverageCuller PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkFrustumCoverageCuller::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkFrustumCoverageCuller::GetMaximumCoverage()
		CODE:
		RETVAL = THIS->GetMaximumCoverage();
		OUTPUT:
		RETVAL


float
vtkFrustumCoverageCuller::GetMinimumCoverage()
		CODE:
		RETVAL = THIS->GetMinimumCoverage();
		OUTPUT:
		RETVAL


int
vtkFrustumCoverageCuller::GetSortingStyle()
		CODE:
		RETVAL = THIS->GetSortingStyle();
		OUTPUT:
		RETVAL


const char *
vtkFrustumCoverageCuller::GetSortingStyleAsString()
		CODE:
		RETVAL = THIS->GetSortingStyleAsString();
		OUTPUT:
		RETVAL


static vtkFrustumCoverageCuller*
vtkFrustumCoverageCuller::New()
		CODE:
		RETVAL = vtkFrustumCoverageCuller::New();
		OUTPUT:
		RETVAL


void
vtkFrustumCoverageCuller::SetMaximumCoverage(arg1)
		float 	arg1
		CODE:
		THIS->SetMaximumCoverage(arg1);
		XSRETURN_EMPTY;


void
vtkFrustumCoverageCuller::SetMinimumCoverage(arg1)
		float 	arg1
		CODE:
		THIS->SetMinimumCoverage(arg1);
		XSRETURN_EMPTY;


void
vtkFrustumCoverageCuller::SetSortingStyle(arg1)
		int 	arg1
		CODE:
		THIS->SetSortingStyle(arg1);
		XSRETURN_EMPTY;


void
vtkFrustumCoverageCuller::SetSortingStyleToBackToFront()
		CODE:
		THIS->SetSortingStyleToBackToFront();
		XSRETURN_EMPTY;


void
vtkFrustumCoverageCuller::SetSortingStyleToFrontToBack()
		CODE:
		THIS->SetSortingStyleToFrontToBack();
		XSRETURN_EMPTY;


void
vtkFrustumCoverageCuller::SetSortingStyleToNone()
		CODE:
		THIS->SetSortingStyleToNone();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::GaussianSplatter PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkGaussianSplatter::CappingOff()
		CODE:
		THIS->CappingOff();
		XSRETURN_EMPTY;


void
vtkGaussianSplatter::CappingOn()
		CODE:
		THIS->CappingOn();
		XSRETURN_EMPTY;


void
vtkGaussianSplatter::ComputeModelBounds()
		CODE:
		THIS->ComputeModelBounds();
		XSRETURN_EMPTY;


int
vtkGaussianSplatter::GetAccumulationMode()
		CODE:
		RETVAL = THIS->GetAccumulationMode();
		OUTPUT:
		RETVAL


const char *
vtkGaussianSplatter::GetAccumulationModeAsString()
		CODE:
		RETVAL = THIS->GetAccumulationModeAsString();
		OUTPUT:
		RETVAL


float
vtkGaussianSplatter::GetCapValue()
		CODE:
		RETVAL = THIS->GetCapValue();
		OUTPUT:
		RETVAL


int
vtkGaussianSplatter::GetCapping()
		CODE:
		RETVAL = THIS->GetCapping();
		OUTPUT:
		RETVAL


const char *
vtkGaussianSplatter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkGaussianSplatter::GetEccentricity()
		CODE:
		RETVAL = THIS->GetEccentricity();
		OUTPUT:
		RETVAL


float
vtkGaussianSplatter::GetExponentFactor()
		CODE:
		RETVAL = THIS->GetExponentFactor();
		OUTPUT:
		RETVAL


float  *
vtkGaussianSplatter::GetModelBounds()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetModelBounds();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


int
vtkGaussianSplatter::GetNormalWarping()
		CODE:
		RETVAL = THIS->GetNormalWarping();
		OUTPUT:
		RETVAL


float
vtkGaussianSplatter::GetRadius()
		CODE:
		RETVAL = THIS->GetRadius();
		OUTPUT:
		RETVAL


int  *
vtkGaussianSplatter::GetSampleDimensions()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetSampleDimensions();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkGaussianSplatter::GetScalarWarping()
		CODE:
		RETVAL = THIS->GetScalarWarping();
		OUTPUT:
		RETVAL


float
vtkGaussianSplatter::GetScaleFactor()
		CODE:
		RETVAL = THIS->GetScaleFactor();
		OUTPUT:
		RETVAL


static vtkGaussianSplatter*
vtkGaussianSplatter::New()
		CODE:
		RETVAL = vtkGaussianSplatter::New();
		OUTPUT:
		RETVAL


void
vtkGaussianSplatter::NormalWarpingOff()
		CODE:
		THIS->NormalWarpingOff();
		XSRETURN_EMPTY;


void
vtkGaussianSplatter::NormalWarpingOn()
		CODE:
		THIS->NormalWarpingOn();
		XSRETURN_EMPTY;


void
vtkGaussianSplatter::ScalarWarpingOff()
		CODE:
		THIS->ScalarWarpingOff();
		XSRETURN_EMPTY;


void
vtkGaussianSplatter::ScalarWarpingOn()
		CODE:
		THIS->ScalarWarpingOn();
		XSRETURN_EMPTY;


void
vtkGaussianSplatter::SetAccumulationMode(arg1)
		int 	arg1
		CODE:
		THIS->SetAccumulationMode(arg1);
		XSRETURN_EMPTY;


void
vtkGaussianSplatter::SetAccumulationModeToMax()
		CODE:
		THIS->SetAccumulationModeToMax();
		XSRETURN_EMPTY;


void
vtkGaussianSplatter::SetAccumulationModeToMin()
		CODE:
		THIS->SetAccumulationModeToMin();
		XSRETURN_EMPTY;


void
vtkGaussianSplatter::SetAccumulationModeToSum()
		CODE:
		THIS->SetAccumulationModeToSum();
		XSRETURN_EMPTY;


void
vtkGaussianSplatter::SetCapValue(arg1)
		float 	arg1
		CODE:
		THIS->SetCapValue(arg1);
		XSRETURN_EMPTY;


void
vtkGaussianSplatter::SetCapping(arg1)
		int 	arg1
		CODE:
		THIS->SetCapping(arg1);
		XSRETURN_EMPTY;


void
vtkGaussianSplatter::SetEccentricity(arg1)
		float 	arg1
		CODE:
		THIS->SetEccentricity(arg1);
		XSRETURN_EMPTY;


void
vtkGaussianSplatter::SetExponentFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetExponentFactor(arg1);
		XSRETURN_EMPTY;


void
vtkGaussianSplatter::SetModelBounds(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		float  	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		float 	arg6
		CODE:
		THIS->SetModelBounds(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkGaussianSplatter::SetModelBounds\n");



void
vtkGaussianSplatter::SetNormalWarping(arg1)
		int 	arg1
		CODE:
		THIS->SetNormalWarping(arg1);
		XSRETURN_EMPTY;


void
vtkGaussianSplatter::SetRadius(arg1)
		float 	arg1
		CODE:
		THIS->SetRadius(arg1);
		XSRETURN_EMPTY;


void
vtkGaussianSplatter::SetSampleDimensions(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetSampleDimensions(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkGaussianSplatter::SetSampleDimensions\n");



void
vtkGaussianSplatter::SetScalarWarping(arg1)
		int 	arg1
		CODE:
		THIS->SetScalarWarping(arg1);
		XSRETURN_EMPTY;


void
vtkGaussianSplatter::SetScaleFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetScaleFactor(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::GeometryFilter PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkGeometryFilter::CellClippingOff()
		CODE:
		THIS->CellClippingOff();
		XSRETURN_EMPTY;


void
vtkGeometryFilter::CellClippingOn()
		CODE:
		THIS->CellClippingOn();
		XSRETURN_EMPTY;


void
vtkGeometryFilter::CreateDefaultLocator()
		CODE:
		THIS->CreateDefaultLocator();
		XSRETURN_EMPTY;


void
vtkGeometryFilter::ExtentClippingOff()
		CODE:
		THIS->ExtentClippingOff();
		XSRETURN_EMPTY;


void
vtkGeometryFilter::ExtentClippingOn()
		CODE:
		THIS->ExtentClippingOn();
		XSRETURN_EMPTY;


int
vtkGeometryFilter::GetCellClipping()
		CODE:
		RETVAL = THIS->GetCellClipping();
		OUTPUT:
		RETVAL


int
vtkGeometryFilter::GetCellMaximum()
		CODE:
		RETVAL = THIS->GetCellMaximum();
		OUTPUT:
		RETVAL


int
vtkGeometryFilter::GetCellMinimum()
		CODE:
		RETVAL = THIS->GetCellMinimum();
		OUTPUT:
		RETVAL


const char *
vtkGeometryFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float *
vtkGeometryFilter::GetExtent()
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetExtent();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


int
vtkGeometryFilter::GetExtentClipping()
		CODE:
		RETVAL = THIS->GetExtentClipping();
		OUTPUT:
		RETVAL


vtkPointLocator *
vtkGeometryFilter::GetLocator()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPointLocator";
		CODE:
		RETVAL = THIS->GetLocator();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkGeometryFilter::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


int
vtkGeometryFilter::GetMerging()
		CODE:
		RETVAL = THIS->GetMerging();
		OUTPUT:
		RETVAL


int
vtkGeometryFilter::GetPointClipping()
		CODE:
		RETVAL = THIS->GetPointClipping();
		OUTPUT:
		RETVAL


int
vtkGeometryFilter::GetPointMaximum()
		CODE:
		RETVAL = THIS->GetPointMaximum();
		OUTPUT:
		RETVAL


int
vtkGeometryFilter::GetPointMinimum()
		CODE:
		RETVAL = THIS->GetPointMinimum();
		OUTPUT:
		RETVAL


void
vtkGeometryFilter::MergingOff()
		CODE:
		THIS->MergingOff();
		XSRETURN_EMPTY;


void
vtkGeometryFilter::MergingOn()
		CODE:
		THIS->MergingOn();
		XSRETURN_EMPTY;


static vtkGeometryFilter*
vtkGeometryFilter::New()
		CODE:
		RETVAL = vtkGeometryFilter::New();
		OUTPUT:
		RETVAL


void
vtkGeometryFilter::PointClippingOff()
		CODE:
		THIS->PointClippingOff();
		XSRETURN_EMPTY;


void
vtkGeometryFilter::PointClippingOn()
		CODE:
		THIS->PointClippingOn();
		XSRETURN_EMPTY;


void
vtkGeometryFilter::SetCellClipping(arg1)
		int 	arg1
		CODE:
		THIS->SetCellClipping(arg1);
		XSRETURN_EMPTY;


void
vtkGeometryFilter::SetCellMaximum(arg1)
		int 	arg1
		CODE:
		THIS->SetCellMaximum(arg1);
		XSRETURN_EMPTY;


void
vtkGeometryFilter::SetCellMinimum(arg1)
		int 	arg1
		CODE:
		THIS->SetCellMinimum(arg1);
		XSRETURN_EMPTY;


void
vtkGeometryFilter::SetExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		float 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		float 	arg6
		CODE:
		THIS->SetExtent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkGeometryFilter::SetExtent\n");



void
vtkGeometryFilter::SetExtentClipping(arg1)
		int 	arg1
		CODE:
		THIS->SetExtentClipping(arg1);
		XSRETURN_EMPTY;


void
vtkGeometryFilter::SetLocator(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::PointLocator")
		vtkPointLocator *	arg1
		CODE:
		THIS->SetLocator(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::PointLocator")
		vtkPointLocator *	arg1
		CODE:
		THIS->SetLocator(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkGeometryFilter::SetLocator\n");



void
vtkGeometryFilter::SetMerging(arg1)
		int 	arg1
		CODE:
		THIS->SetMerging(arg1);
		XSRETURN_EMPTY;


void
vtkGeometryFilter::SetPointClipping(arg1)
		int 	arg1
		CODE:
		THIS->SetPointClipping(arg1);
		XSRETURN_EMPTY;


void
vtkGeometryFilter::SetPointMaximum(arg1)
		int 	arg1
		CODE:
		THIS->SetPointMaximum(arg1);
		XSRETURN_EMPTY;


void
vtkGeometryFilter::SetPointMinimum(arg1)
		int 	arg1
		CODE:
		THIS->SetPointMinimum(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Glyph2D PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkGlyph2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkGlyph2D*
vtkGlyph2D::New()
		CODE:
		RETVAL = vtkGlyph2D::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Glyph3D PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkGlyph3D::ClampingOff()
		CODE:
		THIS->ClampingOff();
		XSRETURN_EMPTY;


void
vtkGlyph3D::ClampingOn()
		CODE:
		THIS->ClampingOn();
		XSRETURN_EMPTY;


int
vtkGlyph3D::GetClamping()
		CODE:
		RETVAL = THIS->GetClamping();
		OUTPUT:
		RETVAL


const char *
vtkGlyph3D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkGlyph3D::GetColorMode()
		CODE:
		RETVAL = THIS->GetColorMode();
		OUTPUT:
		RETVAL


const char *
vtkGlyph3D::GetColorModeAsString()
		CODE:
		RETVAL = THIS->GetColorModeAsString();
		OUTPUT:
		RETVAL


int
vtkGlyph3D::GetIndexMode()
		CODE:
		RETVAL = THIS->GetIndexMode();
		OUTPUT:
		RETVAL


const char *
vtkGlyph3D::GetIndexModeAsString()
		CODE:
		RETVAL = THIS->GetIndexModeAsString();
		OUTPUT:
		RETVAL


int
vtkGlyph3D::GetNumberOfSources()
		CODE:
		RETVAL = THIS->GetNumberOfSources();
		OUTPUT:
		RETVAL


int
vtkGlyph3D::GetOrient()
		CODE:
		RETVAL = THIS->GetOrient();
		OUTPUT:
		RETVAL


float  *
vtkGlyph3D::GetRange()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


float
vtkGlyph3D::GetScaleFactor()
		CODE:
		RETVAL = THIS->GetScaleFactor();
		OUTPUT:
		RETVAL


int
vtkGlyph3D::GetScaleMode()
		CODE:
		RETVAL = THIS->GetScaleMode();
		OUTPUT:
		RETVAL


const char *
vtkGlyph3D::GetScaleModeAsString()
		CODE:
		RETVAL = THIS->GetScaleModeAsString();
		OUTPUT:
		RETVAL


int
vtkGlyph3D::GetScaling()
		CODE:
		RETVAL = THIS->GetScaling();
		OUTPUT:
		RETVAL


vtkPolyData *
vtkGlyph3D::GetSource(id)
		int 	id
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPolyData";
		CODE:
		RETVAL = THIS->GetSource(id);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkGlyph3D::GetVectorMode()
		CODE:
		RETVAL = THIS->GetVectorMode();
		OUTPUT:
		RETVAL


const char *
vtkGlyph3D::GetVectorModeAsString()
		CODE:
		RETVAL = THIS->GetVectorModeAsString();
		OUTPUT:
		RETVAL


static vtkGlyph3D*
vtkGlyph3D::New()
		CODE:
		RETVAL = vtkGlyph3D::New();
		OUTPUT:
		RETVAL


void
vtkGlyph3D::OrientOff()
		CODE:
		THIS->OrientOff();
		XSRETURN_EMPTY;


void
vtkGlyph3D::OrientOn()
		CODE:
		THIS->OrientOn();
		XSRETURN_EMPTY;


void
vtkGlyph3D::ScalingOff()
		CODE:
		THIS->ScalingOff();
		XSRETURN_EMPTY;


void
vtkGlyph3D::ScalingOn()
		CODE:
		THIS->ScalingOn();
		XSRETURN_EMPTY;


void
vtkGlyph3D::SetClamping(arg1)
		int 	arg1
		CODE:
		THIS->SetClamping(arg1);
		XSRETURN_EMPTY;


void
vtkGlyph3D::SetColorMode(arg1)
		int 	arg1
		CODE:
		THIS->SetColorMode(arg1);
		XSRETURN_EMPTY;


void
vtkGlyph3D::SetColorModeToColorByScalar()
		CODE:
		THIS->SetColorModeToColorByScalar();
		XSRETURN_EMPTY;


void
vtkGlyph3D::SetColorModeToColorByScale()
		CODE:
		THIS->SetColorModeToColorByScale();
		XSRETURN_EMPTY;


void
vtkGlyph3D::SetColorModeToColorByVector()
		CODE:
		THIS->SetColorModeToColorByVector();
		XSRETURN_EMPTY;


void
vtkGlyph3D::SetIndexMode(arg1)
		int 	arg1
		CODE:
		THIS->SetIndexMode(arg1);
		XSRETURN_EMPTY;


void
vtkGlyph3D::SetIndexModeToOff()
		CODE:
		THIS->SetIndexModeToOff();
		XSRETURN_EMPTY;


void
vtkGlyph3D::SetIndexModeToScalar()
		CODE:
		THIS->SetIndexModeToScalar();
		XSRETURN_EMPTY;


void
vtkGlyph3D::SetIndexModeToVector()
		CODE:
		THIS->SetIndexModeToVector();
		XSRETURN_EMPTY;


void
vtkGlyph3D::SetNumberOfSources(num)
		int 	num
		CODE:
		THIS->SetNumberOfSources(num);
		XSRETURN_EMPTY;


void
vtkGlyph3D::SetOrient(arg1)
		int 	arg1
		CODE:
		THIS->SetOrient(arg1);
		XSRETURN_EMPTY;


void
vtkGlyph3D::SetRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkGlyph3D::SetRange\n");



void
vtkGlyph3D::SetScaleFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetScaleFactor(arg1);
		XSRETURN_EMPTY;


void
vtkGlyph3D::SetScaleMode(arg1)
		int 	arg1
		CODE:
		THIS->SetScaleMode(arg1);
		XSRETURN_EMPTY;


void
vtkGlyph3D::SetScaleModeToDataScalingOff()
		CODE:
		THIS->SetScaleModeToDataScalingOff();
		XSRETURN_EMPTY;


void
vtkGlyph3D::SetScaleModeToScaleByScalar()
		CODE:
		THIS->SetScaleModeToScaleByScalar();
		XSRETURN_EMPTY;


void
vtkGlyph3D::SetScaleModeToScaleByVector()
		CODE:
		THIS->SetScaleModeToScaleByVector();
		XSRETURN_EMPTY;


void
vtkGlyph3D::SetScaleModeToScaleByVectorComponents()
		CODE:
		THIS->SetScaleModeToScaleByVectorComponents();
		XSRETURN_EMPTY;


void
vtkGlyph3D::SetScaling(arg1)
		int 	arg1
		CODE:
		THIS->SetScaling(arg1);
		XSRETURN_EMPTY;


void
vtkGlyph3D::SetSource(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		vtkPolyData *	arg2
		CODE:
		THIS->SetSource(arg1, arg2);
		XSRETURN_EMPTY;
	CASE: items == 2
		vtkPolyData *	arg1
		CODE:
		THIS->SetSource(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkGlyph3D::SetSource\n");



void
vtkGlyph3D::SetVectorMode(arg1)
		int 	arg1
		CODE:
		THIS->SetVectorMode(arg1);
		XSRETURN_EMPTY;


void
vtkGlyph3D::SetVectorModeToUseNormal()
		CODE:
		THIS->SetVectorModeToUseNormal();
		XSRETURN_EMPTY;


void
vtkGlyph3D::SetVectorModeToUseVector()
		CODE:
		THIS->SetVectorModeToUseVector();
		XSRETURN_EMPTY;


void
vtkGlyph3D::SetVectorModeToVectorRotationOff()
		CODE:
		THIS->SetVectorModeToVectorRotationOff();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::GhostLevelToScalarFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkGhostLevelToScalarFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkGhostLevelToScalarFilter*
vtkGhostLevelToScalarFilter::New()
		CODE:
		RETVAL = vtkGhostLevelToScalarFilter::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::HedgeHog PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkHedgeHog::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkHedgeHog::GetScaleFactor()
		CODE:
		RETVAL = THIS->GetScaleFactor();
		OUTPUT:
		RETVAL


int
vtkHedgeHog::GetVectorMode()
		CODE:
		RETVAL = THIS->GetVectorMode();
		OUTPUT:
		RETVAL


const char *
vtkHedgeHog::GetVectorModeAsString()
		CODE:
		RETVAL = THIS->GetVectorModeAsString();
		OUTPUT:
		RETVAL


static vtkHedgeHog*
vtkHedgeHog::New()
		CODE:
		RETVAL = vtkHedgeHog::New();
		OUTPUT:
		RETVAL


void
vtkHedgeHog::SetScaleFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetScaleFactor(arg1);
		XSRETURN_EMPTY;


void
vtkHedgeHog::SetVectorMode(arg1)
		int 	arg1
		CODE:
		THIS->SetVectorMode(arg1);
		XSRETURN_EMPTY;


void
vtkHedgeHog::SetVectorModeToUseNormal()
		CODE:
		THIS->SetVectorModeToUseNormal();
		XSRETURN_EMPTY;


void
vtkHedgeHog::SetVectorModeToUseVector()
		CODE:
		THIS->SetVectorModeToUseVector();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Hull PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkHull::AddCubeEdgePlanes()
		CODE:
		THIS->AddCubeEdgePlanes();
		XSRETURN_EMPTY;


void
vtkHull::AddCubeFacePlanes()
		CODE:
		THIS->AddCubeFacePlanes();
		XSRETURN_EMPTY;


void
vtkHull::AddCubeVertexPlanes()
		CODE:
		THIS->AddCubeVertexPlanes();
		XSRETURN_EMPTY;


int
vtkHull::AddPlane(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		float 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		CODE:
		RETVAL = THIS->AddPlane(arg1, arg2, arg3, arg4);
		OUTPUT:
		RETVAL
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		RETVAL = THIS->AddPlane(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkHull::AddPlane\n");



void
vtkHull::AddRecursiveSpherePlanes(level)
		int 	level
		CODE:
		THIS->AddRecursiveSpherePlanes(level);
		XSRETURN_EMPTY;


void
vtkHull::GenerateHull(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0, arg7 = 0)
	CASE: items == 8
		vtkPolyData *	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		float 	arg6
		float 	arg7
		CODE:
		THIS->GenerateHull(arg1, arg2, arg3, arg4, arg5, arg6, arg7);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkHull::GenerateHull\n");



const char *
vtkHull::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkHull::GetNumberOfPlanes()
		CODE:
		RETVAL = THIS->GetNumberOfPlanes();
		OUTPUT:
		RETVAL


static vtkHull*
vtkHull::New()
		CODE:
		RETVAL = vtkHull::New();
		OUTPUT:
		RETVAL


void
vtkHull::RemoveAllPlanes()
		CODE:
		THIS->RemoveAllPlanes();
		XSRETURN_EMPTY;


void
vtkHull::SetPlane(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0)
	CASE: items == 6
		int 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		CODE:
		THIS->SetPlane(arg1, arg2, arg3, arg4, arg5);
		XSRETURN_EMPTY;
	CASE: items == 5
		int 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		CODE:
		THIS->SetPlane(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkHull::SetPlane\n");



void
vtkHull::SetPlanes(planes)
		vtkPlanes *	planes
		CODE:
		THIS->SetPlanes(planes);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::HyperStreamline PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkHyperStreamline::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkHyperStreamline::GetIntegrationDirection()
		CODE:
		RETVAL = THIS->GetIntegrationDirection();
		OUTPUT:
		RETVAL


float
vtkHyperStreamline::GetIntegrationStepLength()
		CODE:
		RETVAL = THIS->GetIntegrationStepLength();
		OUTPUT:
		RETVAL


int
vtkHyperStreamline::GetLogScaling()
		CODE:
		RETVAL = THIS->GetLogScaling();
		OUTPUT:
		RETVAL


float
vtkHyperStreamline::GetMaximumPropagationDistance()
		CODE:
		RETVAL = THIS->GetMaximumPropagationDistance();
		OUTPUT:
		RETVAL


int
vtkHyperStreamline::GetNumberOfSides()
		CODE:
		RETVAL = THIS->GetNumberOfSides();
		OUTPUT:
		RETVAL


float
vtkHyperStreamline::GetRadius()
		CODE:
		RETVAL = THIS->GetRadius();
		OUTPUT:
		RETVAL


float
vtkHyperStreamline::GetStepLength()
		CODE:
		RETVAL = THIS->GetStepLength();
		OUTPUT:
		RETVAL


float
vtkHyperStreamline::GetTerminalEigenvalue()
		CODE:
		RETVAL = THIS->GetTerminalEigenvalue();
		OUTPUT:
		RETVAL


void
vtkHyperStreamline::IntegrateMajorEigenvector()
		CODE:
		THIS->IntegrateMajorEigenvector();
		XSRETURN_EMPTY;


void
vtkHyperStreamline::IntegrateMediumEigenvector()
		CODE:
		THIS->IntegrateMediumEigenvector();
		XSRETURN_EMPTY;


void
vtkHyperStreamline::IntegrateMinorEigenvector()
		CODE:
		THIS->IntegrateMinorEigenvector();
		XSRETURN_EMPTY;


void
vtkHyperStreamline::LogScalingOff()
		CODE:
		THIS->LogScalingOff();
		XSRETURN_EMPTY;


void
vtkHyperStreamline::LogScalingOn()
		CODE:
		THIS->LogScalingOn();
		XSRETURN_EMPTY;


static vtkHyperStreamline*
vtkHyperStreamline::New()
		CODE:
		RETVAL = vtkHyperStreamline::New();
		OUTPUT:
		RETVAL


void
vtkHyperStreamline::SetIntegrationDirection(arg1)
		int 	arg1
		CODE:
		THIS->SetIntegrationDirection(arg1);
		XSRETURN_EMPTY;


void
vtkHyperStreamline::SetIntegrationDirectionToBackward()
		CODE:
		THIS->SetIntegrationDirectionToBackward();
		XSRETURN_EMPTY;


void
vtkHyperStreamline::SetIntegrationDirectionToForward()
		CODE:
		THIS->SetIntegrationDirectionToForward();
		XSRETURN_EMPTY;


void
vtkHyperStreamline::SetIntegrationDirectionToIntegrateBothDirections()
		CODE:
		THIS->SetIntegrationDirectionToIntegrateBothDirections();
		XSRETURN_EMPTY;


void
vtkHyperStreamline::SetIntegrationStepLength(arg1)
		float 	arg1
		CODE:
		THIS->SetIntegrationStepLength(arg1);
		XSRETURN_EMPTY;


void
vtkHyperStreamline::SetLogScaling(arg1)
		int 	arg1
		CODE:
		THIS->SetLogScaling(arg1);
		XSRETURN_EMPTY;


void
vtkHyperStreamline::SetMaximumPropagationDistance(arg1)
		float 	arg1
		CODE:
		THIS->SetMaximumPropagationDistance(arg1);
		XSRETURN_EMPTY;


void
vtkHyperStreamline::SetNumberOfSides(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfSides(arg1);
		XSRETURN_EMPTY;


void
vtkHyperStreamline::SetRadius(arg1)
		float 	arg1
		CODE:
		THIS->SetRadius(arg1);
		XSRETURN_EMPTY;


void
vtkHyperStreamline::SetStartLocation(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0)
	CASE: items == 6
		int 	arg1
		int 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		CODE:
		THIS->SetStartLocation(arg1, arg2, arg3, arg4, arg5);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkHyperStreamline::SetStartLocation\n");



void
vtkHyperStreamline::SetStartPosition(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetStartPosition(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkHyperStreamline::SetStartPosition\n");



void
vtkHyperStreamline::SetStepLength(arg1)
		float 	arg1
		CODE:
		THIS->SetStepLength(arg1);
		XSRETURN_EMPTY;


void
vtkHyperStreamline::SetTerminalEigenvalue(arg1)
		float 	arg1
		CODE:
		THIS->SetTerminalEigenvalue(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::IdFilter PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkIdFilter::CellIdsOff()
		CODE:
		THIS->CellIdsOff();
		XSRETURN_EMPTY;


void
vtkIdFilter::CellIdsOn()
		CODE:
		THIS->CellIdsOn();
		XSRETURN_EMPTY;


void
vtkIdFilter::FieldDataOff()
		CODE:
		THIS->FieldDataOff();
		XSRETURN_EMPTY;


void
vtkIdFilter::FieldDataOn()
		CODE:
		THIS->FieldDataOn();
		XSRETURN_EMPTY;


int
vtkIdFilter::GetCellIds()
		CODE:
		RETVAL = THIS->GetCellIds();
		OUTPUT:
		RETVAL


const char *
vtkIdFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkIdFilter::GetFieldData()
		CODE:
		RETVAL = THIS->GetFieldData();
		OUTPUT:
		RETVAL


int
vtkIdFilter::GetPointIds()
		CODE:
		RETVAL = THIS->GetPointIds();
		OUTPUT:
		RETVAL


static vtkIdFilter*
vtkIdFilter::New()
		CODE:
		RETVAL = vtkIdFilter::New();
		OUTPUT:
		RETVAL


void
vtkIdFilter::PointIdsOff()
		CODE:
		THIS->PointIdsOff();
		XSRETURN_EMPTY;


void
vtkIdFilter::PointIdsOn()
		CODE:
		THIS->PointIdsOn();
		XSRETURN_EMPTY;


void
vtkIdFilter::SetCellIds(arg1)
		int 	arg1
		CODE:
		THIS->SetCellIds(arg1);
		XSRETURN_EMPTY;


void
vtkIdFilter::SetFieldData(arg1)
		int 	arg1
		CODE:
		THIS->SetFieldData(arg1);
		XSRETURN_EMPTY;


void
vtkIdFilter::SetPointIds(arg1)
		int 	arg1
		CODE:
		THIS->SetPointIds(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ImageActor PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageActor::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkImageData *
vtkImageActor::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImageData";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkImageActor::GetInterpolate()
		CODE:
		RETVAL = THIS->GetInterpolate();
		OUTPUT:
		RETVAL


int
vtkImageActor::GetSliceNumber()
		CODE:
		RETVAL = THIS->GetSliceNumber();
		OUTPUT:
		RETVAL


void
vtkImageActor::InterpolateOff()
		CODE:
		THIS->InterpolateOff();
		XSRETURN_EMPTY;


void
vtkImageActor::InterpolateOn()
		CODE:
		THIS->InterpolateOn();
		XSRETURN_EMPTY;


static vtkImageActor*
vtkImageActor::New()
		CODE:
		RETVAL = vtkImageActor::New();
		OUTPUT:
		RETVAL


void
vtkImageActor::SetDisplayExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int 	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetDisplayExtent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageActor::SetDisplayExtent\n");



void
vtkImageActor::SetInput(arg1)
		vtkImageData *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;


void
vtkImageActor::SetInterpolate(arg1)
		int 	arg1
		CODE:
		THIS->SetInterpolate(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ImplicitBoolean PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImplicitBoolean::AddFunction(arg1 = 0)
	CASE: items == 2
		vtkImplicitFunction *	arg1
		CODE:
		THIS->AddFunction(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImplicitBoolean::AddFunction\n");



float
vtkImplicitBoolean::EvaluateFunction(arg1 = 0, arg2 = 0, arg3 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkImplicitBoolean::EvaluateFunction\n");



const char *
vtkImplicitBoolean::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkImplicitFunctionCollection *
vtkImplicitBoolean::GetFunction()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImplicitFunctionCollection";
		CODE:
		RETVAL = THIS->GetFunction();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkImplicitBoolean::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


int
vtkImplicitBoolean::GetOperationType()
		CODE:
		RETVAL = THIS->GetOperationType();
		OUTPUT:
		RETVAL


const char *
vtkImplicitBoolean::GetOperationTypeAsString()
		CODE:
		RETVAL = THIS->GetOperationTypeAsString();
		OUTPUT:
		RETVAL


static vtkImplicitBoolean*
vtkImplicitBoolean::New()
		CODE:
		RETVAL = vtkImplicitBoolean::New();
		OUTPUT:
		RETVAL


void
vtkImplicitBoolean::RemoveFunction(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::ImplicitFunction")
		vtkImplicitFunction *	arg1
		CODE:
		THIS->RemoveFunction(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::ImplicitFunction")
		vtkImplicitFunction *	arg1
		CODE:
		THIS->RemoveFunction(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImplicitBoolean::RemoveFunction\n");



void
vtkImplicitBoolean::SetOperationType(arg1)
		int 	arg1
		CODE:
		THIS->SetOperationType(arg1);
		XSRETURN_EMPTY;


void
vtkImplicitBoolean::SetOperationTypeToDifference()
		CODE:
		THIS->SetOperationTypeToDifference();
		XSRETURN_EMPTY;


void
vtkImplicitBoolean::SetOperationTypeToIntersection()
		CODE:
		THIS->SetOperationTypeToIntersection();
		XSRETURN_EMPTY;


void
vtkImplicitBoolean::SetOperationTypeToUnion()
		CODE:
		THIS->SetOperationTypeToUnion();
		XSRETURN_EMPTY;


void
vtkImplicitBoolean::SetOperationTypeToUnionOfMagnitudes()
		CODE:
		THIS->SetOperationTypeToUnionOfMagnitudes();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ImplicitDataSet PREFIX = vtk

PROTOTYPES: DISABLE



float
vtkImplicitDataSet::EvaluateFunction(arg1 = 0, arg2 = 0, arg3 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkImplicitDataSet::EvaluateFunction\n");



const char *
vtkImplicitDataSet::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkImplicitDataSet::GetDataSet()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetDataSet();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkImplicitDataSet::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


float  *
vtkImplicitDataSet::GetOutGradient()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetOutGradient();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float
vtkImplicitDataSet::GetOutValue()
		CODE:
		RETVAL = THIS->GetOutValue();
		OUTPUT:
		RETVAL


static vtkImplicitDataSet*
vtkImplicitDataSet::New()
		CODE:
		RETVAL = vtkImplicitDataSet::New();
		OUTPUT:
		RETVAL


void
vtkImplicitDataSet::SetDataSet(arg1)
		vtkDataSet *	arg1
		CODE:
		THIS->SetDataSet(arg1);
		XSRETURN_EMPTY;


void
vtkImplicitDataSet::SetOutGradient(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetOutGradient(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImplicitDataSet::SetOutGradient\n");



void
vtkImplicitDataSet::SetOutValue(arg1)
		float 	arg1
		CODE:
		THIS->SetOutValue(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ImplicitModeller PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImplicitModeller::AdjustBoundsOff()
		CODE:
		THIS->AdjustBoundsOff();
		XSRETURN_EMPTY;


void
vtkImplicitModeller::AdjustBoundsOn()
		CODE:
		THIS->AdjustBoundsOn();
		XSRETURN_EMPTY;


void
vtkImplicitModeller::Append(input)
		vtkDataSet *	input
		CODE:
		THIS->Append(input);
		XSRETURN_EMPTY;


void
vtkImplicitModeller::CappingOff()
		CODE:
		THIS->CappingOff();
		XSRETURN_EMPTY;


void
vtkImplicitModeller::CappingOn()
		CODE:
		THIS->CappingOn();
		XSRETURN_EMPTY;


float
vtkImplicitModeller::ComputeModelBounds(inputNULL)
		vtkDataSet *	inputNULL
		CODE:
		RETVAL = THIS->ComputeModelBounds(inputNULL);
		OUTPUT:
		RETVAL


void
vtkImplicitModeller::EndAppend()
		CODE:
		THIS->EndAppend();
		XSRETURN_EMPTY;


int
vtkImplicitModeller::GetAdjustBounds()
		CODE:
		RETVAL = THIS->GetAdjustBounds();
		OUTPUT:
		RETVAL


float
vtkImplicitModeller::GetAdjustDistance()
		CODE:
		RETVAL = THIS->GetAdjustDistance();
		OUTPUT:
		RETVAL


float
vtkImplicitModeller::GetCapValue()
		CODE:
		RETVAL = THIS->GetCapValue();
		OUTPUT:
		RETVAL


int
vtkImplicitModeller::GetCapping()
		CODE:
		RETVAL = THIS->GetCapping();
		OUTPUT:
		RETVAL


const char *
vtkImplicitModeller::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImplicitModeller::GetLocatorMaxLevel()
		CODE:
		RETVAL = THIS->GetLocatorMaxLevel();
		OUTPUT:
		RETVAL


float
vtkImplicitModeller::GetMaximumDistance()
		CODE:
		RETVAL = THIS->GetMaximumDistance();
		OUTPUT:
		RETVAL


float  *
vtkImplicitModeller::GetModelBounds()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetModelBounds();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


int
vtkImplicitModeller::GetNumberOfThreads()
		CODE:
		RETVAL = THIS->GetNumberOfThreads();
		OUTPUT:
		RETVAL


int
vtkImplicitModeller::GetProcessMode()
		CODE:
		RETVAL = THIS->GetProcessMode();
		OUTPUT:
		RETVAL


const char *
vtkImplicitModeller::GetProcessModeAsString()
		CODE:
		RETVAL = THIS->GetProcessModeAsString();
		OUTPUT:
		RETVAL


int  *
vtkImplicitModeller::GetSampleDimensions()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetSampleDimensions();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


static vtkImplicitModeller*
vtkImplicitModeller::New()
		CODE:
		RETVAL = vtkImplicitModeller::New();
		OUTPUT:
		RETVAL


void
vtkImplicitModeller::SetAdjustBounds(arg1)
		int 	arg1
		CODE:
		THIS->SetAdjustBounds(arg1);
		XSRETURN_EMPTY;


void
vtkImplicitModeller::SetAdjustDistance(arg1)
		float 	arg1
		CODE:
		THIS->SetAdjustDistance(arg1);
		XSRETURN_EMPTY;


void
vtkImplicitModeller::SetCapValue(arg1)
		float 	arg1
		CODE:
		THIS->SetCapValue(arg1);
		XSRETURN_EMPTY;


void
vtkImplicitModeller::SetCapping(arg1)
		int 	arg1
		CODE:
		THIS->SetCapping(arg1);
		XSRETURN_EMPTY;


void
vtkImplicitModeller::SetLocatorMaxLevel(arg1)
		int 	arg1
		CODE:
		THIS->SetLocatorMaxLevel(arg1);
		XSRETURN_EMPTY;


void
vtkImplicitModeller::SetMaximumDistance(arg1)
		float 	arg1
		CODE:
		THIS->SetMaximumDistance(arg1);
		XSRETURN_EMPTY;


void
vtkImplicitModeller::SetModelBounds(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		float  	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		float 	arg6
		CODE:
		THIS->SetModelBounds(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImplicitModeller::SetModelBounds\n");



void
vtkImplicitModeller::SetNumberOfThreads(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfThreads(arg1);
		XSRETURN_EMPTY;


void
vtkImplicitModeller::SetProcessMode(arg1)
		int 	arg1
		CODE:
		THIS->SetProcessMode(arg1);
		XSRETURN_EMPTY;


void
vtkImplicitModeller::SetProcessModeToPerCell()
		CODE:
		THIS->SetProcessModeToPerCell();
		XSRETURN_EMPTY;


void
vtkImplicitModeller::SetProcessModeToPerVoxel()
		CODE:
		THIS->SetProcessModeToPerVoxel();
		XSRETURN_EMPTY;


void
vtkImplicitModeller::SetSampleDimensions(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetSampleDimensions(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImplicitModeller::SetSampleDimensions\n");



void
vtkImplicitModeller::StartAppend()
		CODE:
		THIS->StartAppend();
		XSRETURN_EMPTY;


void
vtkImplicitModeller::UpdateData(output)
		vtkDataObject *	output
		CODE:
		THIS->UpdateData(output);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ImplicitSelectionLoop PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImplicitSelectionLoop::AutomaticNormalGenerationOff()
		CODE:
		THIS->AutomaticNormalGenerationOff();
		XSRETURN_EMPTY;


void
vtkImplicitSelectionLoop::AutomaticNormalGenerationOn()
		CODE:
		THIS->AutomaticNormalGenerationOn();
		XSRETURN_EMPTY;


float
vtkImplicitSelectionLoop::EvaluateFunction(arg1 = 0, arg2 = 0, arg3 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkImplicitSelectionLoop::EvaluateFunction\n");



int
vtkImplicitSelectionLoop::GetAutomaticNormalGeneration()
		CODE:
		RETVAL = THIS->GetAutomaticNormalGeneration();
		OUTPUT:
		RETVAL


const char *
vtkImplicitSelectionLoop::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkPoints *
vtkImplicitSelectionLoop::GetLoop()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPoints";
		CODE:
		RETVAL = THIS->GetLoop();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkImplicitSelectionLoop::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


float  *
vtkImplicitSelectionLoop::GetNormal()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetNormal();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


static vtkImplicitSelectionLoop*
vtkImplicitSelectionLoop::New()
		CODE:
		RETVAL = vtkImplicitSelectionLoop::New();
		OUTPUT:
		RETVAL


void
vtkImplicitSelectionLoop::SetAutomaticNormalGeneration(arg1)
		int 	arg1
		CODE:
		THIS->SetAutomaticNormalGeneration(arg1);
		XSRETURN_EMPTY;


void
vtkImplicitSelectionLoop::SetLoop(arg1)
		vtkPoints *	arg1
		CODE:
		THIS->SetLoop(arg1);
		XSRETURN_EMPTY;


void
vtkImplicitSelectionLoop::SetNormal(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetNormal(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImplicitSelectionLoop::SetNormal\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ImplicitTextureCoords PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImplicitTextureCoords::FlipTextureOff()
		CODE:
		THIS->FlipTextureOff();
		XSRETURN_EMPTY;


void
vtkImplicitTextureCoords::FlipTextureOn()
		CODE:
		THIS->FlipTextureOn();
		XSRETURN_EMPTY;


const char *
vtkImplicitTextureCoords::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImplicitTextureCoords::GetFlipTexture()
		CODE:
		RETVAL = THIS->GetFlipTexture();
		OUTPUT:
		RETVAL


vtkImplicitFunction *
vtkImplicitTextureCoords::GetRFunction()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImplicitFunction";
		CODE:
		RETVAL = THIS->GetRFunction();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkImplicitFunction *
vtkImplicitTextureCoords::GetSFunction()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImplicitFunction";
		CODE:
		RETVAL = THIS->GetSFunction();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkImplicitFunction *
vtkImplicitTextureCoords::GetTFunction()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImplicitFunction";
		CODE:
		RETVAL = THIS->GetTFunction();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkImplicitTextureCoords*
vtkImplicitTextureCoords::New()
		CODE:
		RETVAL = vtkImplicitTextureCoords::New();
		OUTPUT:
		RETVAL


void
vtkImplicitTextureCoords::SetFlipTexture(arg1)
		int 	arg1
		CODE:
		THIS->SetFlipTexture(arg1);
		XSRETURN_EMPTY;


void
vtkImplicitTextureCoords::SetRFunction(arg1)
		vtkImplicitFunction *	arg1
		CODE:
		THIS->SetRFunction(arg1);
		XSRETURN_EMPTY;


void
vtkImplicitTextureCoords::SetSFunction(arg1)
		vtkImplicitFunction *	arg1
		CODE:
		THIS->SetSFunction(arg1);
		XSRETURN_EMPTY;


void
vtkImplicitTextureCoords::SetTFunction(arg1)
		vtkImplicitFunction *	arg1
		CODE:
		THIS->SetTFunction(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ImplicitVolume PREFIX = vtk

PROTOTYPES: DISABLE



float
vtkImplicitVolume::EvaluateFunction(arg1 = 0, arg2 = 0, arg3 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkImplicitVolume::EvaluateFunction\n");



const char *
vtkImplicitVolume::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


unsigned long
vtkImplicitVolume::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


float  *
vtkImplicitVolume::GetOutGradient()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetOutGradient();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float
vtkImplicitVolume::GetOutValue()
		CODE:
		RETVAL = THIS->GetOutValue();
		OUTPUT:
		RETVAL


vtkStructuredPoints *
vtkImplicitVolume::GetVolume()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredPoints";
		CODE:
		RETVAL = THIS->GetVolume();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkImplicitVolume*
vtkImplicitVolume::New()
		CODE:
		RETVAL = vtkImplicitVolume::New();
		OUTPUT:
		RETVAL


void
vtkImplicitVolume::SetOutGradient(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetOutGradient(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImplicitVolume::SetOutGradient\n");



void
vtkImplicitVolume::SetOutValue(arg1)
		float 	arg1
		CODE:
		THIS->SetOutValue(arg1);
		XSRETURN_EMPTY;


void
vtkImplicitVolume::SetVolume(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::StructuredPoints")
		vtkStructuredPoints *	arg1
		CODE:
		THIS->SetVolume(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::ImageData")
		vtkImageData *	arg1
		CODE:
		THIS->SetVolume(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImplicitVolume::SetVolume\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ImplicitWindowFunction PREFIX = vtk

PROTOTYPES: DISABLE



float
vtkImplicitWindowFunction::EvaluateFunction(arg1 = 0, arg2 = 0, arg3 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkImplicitWindowFunction::EvaluateFunction\n");



const char *
vtkImplicitWindowFunction::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkImplicitFunction *
vtkImplicitWindowFunction::GetImplicitFunction()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImplicitFunction";
		CODE:
		RETVAL = THIS->GetImplicitFunction();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkImplicitWindowFunction::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


float  *
vtkImplicitWindowFunction::GetWindowRange()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetWindowRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


float  *
vtkImplicitWindowFunction::GetWindowValues()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetWindowValues();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


static vtkImplicitWindowFunction*
vtkImplicitWindowFunction::New()
		CODE:
		RETVAL = vtkImplicitWindowFunction::New();
		OUTPUT:
		RETVAL


void
vtkImplicitWindowFunction::SetImplicitFunction(arg1)
		vtkImplicitFunction *	arg1
		CODE:
		THIS->SetImplicitFunction(arg1);
		XSRETURN_EMPTY;


void
vtkImplicitWindowFunction::SetWindowRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetWindowRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImplicitWindowFunction::SetWindowRange\n");



void
vtkImplicitWindowFunction::SetWindowValues(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetWindowValues(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImplicitWindowFunction::SetWindowValues\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::InteractorStyle PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkInteractorStyle::FindPokedCamera(arg1, arg2)
		int 	arg1
		int 	arg2
		CODE:
		THIS->FindPokedCamera(arg1, arg2);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::FindPokedRenderer(arg1, arg2)
		int 	arg1
		int 	arg2
		CODE:
		THIS->FindPokedRenderer(arg1, arg2);
		XSRETURN_EMPTY;


const char *
vtkInteractorStyle::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkRenderWindowInteractor *
vtkInteractorStyle::GetInteractor()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkRenderWindowInteractor";
		CODE:
		RETVAL = THIS->GetInteractor();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float  *
vtkInteractorStyle::GetPickColor()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetPickColor();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


void
vtkInteractorStyle::HighlightActor2D(actor2D)
		vtkActor2D *	actor2D
		CODE:
		THIS->HighlightActor2D(actor2D);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::HighlightProp(prop)
		vtkProp *	prop
		CODE:
		THIS->HighlightProp(prop);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::HighlightProp3D(prop3D)
		vtkProp3D *	prop3D
		CODE:
		THIS->HighlightProp3D(prop3D);
		XSRETURN_EMPTY;


static vtkInteractorStyle*
vtkInteractorStyle::New()
		CODE:
		RETVAL = vtkInteractorStyle::New();
		OUTPUT:
		RETVAL


void
vtkInteractorStyle::OnChar(ctrl, shift, keycode, repeatcount)
		int 	ctrl
		int 	shift
		char 	keycode
		int 	repeatcount
		CODE:
		THIS->OnChar(ctrl, shift, keycode, repeatcount);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::OnConfigure(width, height)
		int 	width
		int 	height
		CODE:
		THIS->OnConfigure(width, height);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::OnEnter(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnEnter(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::OnKeyDown(ctrl, shift, keycode, repeatcount)
		int 	ctrl
		int 	shift
		char 	keycode
		int 	repeatcount
		CODE:
		THIS->OnKeyDown(ctrl, shift, keycode, repeatcount);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::OnKeyPress(ctrl, shift, keycode, keysym, repeatcount)
		int 	ctrl
		int 	shift
		char 	keycode
		char *	keysym
		int 	repeatcount
		CODE:
		THIS->OnKeyPress(ctrl, shift, keycode, keysym, repeatcount);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::OnKeyRelease(ctrl, shift, keycode, keysym, repeatcount)
		int 	ctrl
		int 	shift
		char 	keycode
		char *	keysym
		int 	repeatcount
		CODE:
		THIS->OnKeyRelease(ctrl, shift, keycode, keysym, repeatcount);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::OnKeyUp(ctrl, shift, keycode, repeatcount)
		int 	ctrl
		int 	shift
		char 	keycode
		int 	repeatcount
		CODE:
		THIS->OnKeyUp(ctrl, shift, keycode, repeatcount);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::OnLeave(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnLeave(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::OnLeftButtonDown(ctrl, shift, X, Y)
		int 	ctrl
		int 	shift
		int 	X
		int 	Y
		CODE:
		THIS->OnLeftButtonDown(ctrl, shift, X, Y);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::OnLeftButtonUp(ctrl, shift, X, Y)
		int 	ctrl
		int 	shift
		int 	X
		int 	Y
		CODE:
		THIS->OnLeftButtonUp(ctrl, shift, X, Y);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::OnMiddleButtonDown(ctrl, shift, X, Y)
		int 	ctrl
		int 	shift
		int 	X
		int 	Y
		CODE:
		THIS->OnMiddleButtonDown(ctrl, shift, X, Y);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::OnMiddleButtonUp(ctrl, shift, X, Y)
		int 	ctrl
		int 	shift
		int 	X
		int 	Y
		CODE:
		THIS->OnMiddleButtonUp(ctrl, shift, X, Y);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::OnMouseMove(ctrl, shift, X, Y)
		int 	ctrl
		int 	shift
		int 	X
		int 	Y
		CODE:
		THIS->OnMouseMove(ctrl, shift, X, Y);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::OnRightButtonDown(ctrl, shift, X, Y)
		int 	ctrl
		int 	shift
		int 	X
		int 	Y
		CODE:
		THIS->OnRightButtonDown(ctrl, shift, X, Y);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::OnRightButtonUp(ctrl, shift, X, Y)
		int 	ctrl
		int 	shift
		int 	X
		int 	Y
		CODE:
		THIS->OnRightButtonUp(ctrl, shift, X, Y);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::OnTimer()
		CODE:
		THIS->OnTimer();
		XSRETURN_EMPTY;


void
vtkInteractorStyle::SetInteractor(interactor)
		vtkRenderWindowInteractor *	interactor
		CODE:
		THIS->SetInteractor(interactor);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::SetLeftButtonPressMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetLeftButtonPressMethod",0), newRV(func), 0);
		}
		THIS->SetLeftButtonPressMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::SetLeftButtonReleaseMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetLeftButtonReleaseMethod",0), newRV(func), 0);
		}
		THIS->SetLeftButtonReleaseMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::SetMiddleButtonPressMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetMiddleButtonPressMethod",0), newRV(func), 0);
		}
		THIS->SetMiddleButtonPressMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::SetMiddleButtonReleaseMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetMiddleButtonReleaseMethod",0), newRV(func), 0);
		}
		THIS->SetMiddleButtonReleaseMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::SetPickColor(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetPickColor(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkInteractorStyle::SetPickColor\n");



void
vtkInteractorStyle::SetRightButtonPressMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetRightButtonPressMethod",0), newRV(func), 0);
		}
		THIS->SetRightButtonPressMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkInteractorStyle::SetRightButtonReleaseMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetRightButtonReleaseMethod",0), newRV(func), 0);
		}
		THIS->SetRightButtonReleaseMethod(callperlsub, func);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::InteractorStyleFlight PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkInteractorStyleFlight::DisableMotionOff()
		CODE:
		THIS->DisableMotionOff();
		XSRETURN_EMPTY;


void
vtkInteractorStyleFlight::DisableMotionOn()
		CODE:
		THIS->DisableMotionOn();
		XSRETURN_EMPTY;


void
vtkInteractorStyleFlight::FixUpVectorOff()
		CODE:
		THIS->FixUpVectorOff();
		XSRETURN_EMPTY;


void
vtkInteractorStyleFlight::FixUpVectorOn()
		CODE:
		THIS->FixUpVectorOn();
		XSRETURN_EMPTY;


double
vtkInteractorStyleFlight::GetAngleAccelerationFactor()
		CODE:
		RETVAL = THIS->GetAngleAccelerationFactor();
		OUTPUT:
		RETVAL


double
vtkInteractorStyleFlight::GetAngleStepSize()
		CODE:
		RETVAL = THIS->GetAngleStepSize();
		OUTPUT:
		RETVAL


const char *
vtkInteractorStyleFlight::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkInteractorStyleFlight::GetDisableMotion()
		CODE:
		RETVAL = THIS->GetDisableMotion();
		OUTPUT:
		RETVAL


int
vtkInteractorStyleFlight::GetFixUpVector()
		CODE:
		RETVAL = THIS->GetFixUpVector();
		OUTPUT:
		RETVAL


double  *
vtkInteractorStyleFlight::GetFixedUpVector()
		PREINIT:
		double  * retval;
		PPCODE:
		retval = THIS->GetFixedUpVector();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


double
vtkInteractorStyleFlight::GetMotionAccelerationFactor()
		CODE:
		RETVAL = THIS->GetMotionAccelerationFactor();
		OUTPUT:
		RETVAL


double
vtkInteractorStyleFlight::GetMotionStepSize()
		CODE:
		RETVAL = THIS->GetMotionStepSize();
		OUTPUT:
		RETVAL


static vtkInteractorStyleFlight*
vtkInteractorStyleFlight::New()
		CODE:
		RETVAL = vtkInteractorStyleFlight::New();
		OUTPUT:
		RETVAL


void
vtkInteractorStyleFlight::OnChar(ctrl, shift, keycode, repeatcount)
		int 	ctrl
		int 	shift
		char 	keycode
		int 	repeatcount
		CODE:
		THIS->OnChar(ctrl, shift, keycode, repeatcount);
		XSRETURN_EMPTY;


void
vtkInteractorStyleFlight::OnKeyDown(ctrl, shift, keycode, repeatcount)
		int 	ctrl
		int 	shift
		char 	keycode
		int 	repeatcount
		CODE:
		THIS->OnKeyDown(ctrl, shift, keycode, repeatcount);
		XSRETURN_EMPTY;


void
vtkInteractorStyleFlight::OnKeyUp(ctrl, shift, keycode, repeatcount)
		int 	ctrl
		int 	shift
		char 	keycode
		int 	repeatcount
		CODE:
		THIS->OnKeyUp(ctrl, shift, keycode, repeatcount);
		XSRETURN_EMPTY;


void
vtkInteractorStyleFlight::OnLeftButtonDown(ctrl, shift, X, Y)
		int 	ctrl
		int 	shift
		int 	X
		int 	Y
		CODE:
		THIS->OnLeftButtonDown(ctrl, shift, X, Y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleFlight::OnLeftButtonUp(ctrl, shift, X, Y)
		int 	ctrl
		int 	shift
		int 	X
		int 	Y
		CODE:
		THIS->OnLeftButtonUp(ctrl, shift, X, Y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleFlight::OnMiddleButtonDown(ctrl, shift, X, Y)
		int 	ctrl
		int 	shift
		int 	X
		int 	Y
		CODE:
		THIS->OnMiddleButtonDown(ctrl, shift, X, Y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleFlight::OnMiddleButtonUp(ctrl, shift, X, Y)
		int 	ctrl
		int 	shift
		int 	X
		int 	Y
		CODE:
		THIS->OnMiddleButtonUp(ctrl, shift, X, Y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleFlight::OnMouseMove(ctrl, shift, X, Y)
		int 	ctrl
		int 	shift
		int 	X
		int 	Y
		CODE:
		THIS->OnMouseMove(ctrl, shift, X, Y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleFlight::OnRightButtonDown(ctrl, shift, X, Y)
		int 	ctrl
		int 	shift
		int 	X
		int 	Y
		CODE:
		THIS->OnRightButtonDown(ctrl, shift, X, Y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleFlight::OnRightButtonUp(ctrl, shift, X, Y)
		int 	ctrl
		int 	shift
		int 	X
		int 	Y
		CODE:
		THIS->OnRightButtonUp(ctrl, shift, X, Y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleFlight::OnTimer()
		CODE:
		THIS->OnTimer();
		XSRETURN_EMPTY;


void
vtkInteractorStyleFlight::PerformAzimuthalScan(numsteps)
		int 	numsteps
		CODE:
		THIS->PerformAzimuthalScan(numsteps);
		XSRETURN_EMPTY;


void
vtkInteractorStyleFlight::SetAngleAccelerationFactor(arg1)
		double 	arg1
		CODE:
		THIS->SetAngleAccelerationFactor(arg1);
		XSRETURN_EMPTY;


void
vtkInteractorStyleFlight::SetAngleStepSize(arg1)
		double 	arg1
		CODE:
		THIS->SetAngleStepSize(arg1);
		XSRETURN_EMPTY;


void
vtkInteractorStyleFlight::SetDisableMotion(arg1)
		int 	arg1
		CODE:
		THIS->SetDisableMotion(arg1);
		XSRETURN_EMPTY;


void
vtkInteractorStyleFlight::SetFixUpVector(arg1)
		int 	arg1
		CODE:
		THIS->SetFixUpVector(arg1);
		XSRETURN_EMPTY;


void
vtkInteractorStyleFlight::SetFixedUpVector(arg1_0, arg1_1, arg1_2)
		double	arg1_0
		double	arg1_1
		double	arg1_2
		CODE:
		double arg1[] = { arg1_0, arg1_1, arg1_2};
		THIS->SetFixedUpVector(arg1);
		XSRETURN_EMPTY;


void
vtkInteractorStyleFlight::SetMotionAccelerationFactor(arg1)
		double 	arg1
		CODE:
		THIS->SetMotionAccelerationFactor(arg1);
		XSRETURN_EMPTY;


void
vtkInteractorStyleFlight::SetMotionStepSize(arg1)
		double 	arg1
		CODE:
		THIS->SetMotionStepSize(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::InteractorStyleJoystickActor PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkInteractorStyleJoystickActor::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkInteractorStyleJoystickActor*
vtkInteractorStyleJoystickActor::New()
		CODE:
		RETVAL = vtkInteractorStyleJoystickActor::New();
		OUTPUT:
		RETVAL


void
vtkInteractorStyleJoystickActor::OnLeftButtonDown(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnLeftButtonDown(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleJoystickActor::OnLeftButtonUp(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnLeftButtonUp(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleJoystickActor::OnMiddleButtonDown(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnMiddleButtonDown(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleJoystickActor::OnMiddleButtonUp(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnMiddleButtonUp(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleJoystickActor::OnMouseMove(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnMouseMove(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleJoystickActor::OnRightButtonDown(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnRightButtonDown(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleJoystickActor::OnRightButtonUp(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnRightButtonUp(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleJoystickActor::OnTimer()
		CODE:
		THIS->OnTimer();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::InteractorStyleJoystickCamera PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkInteractorStyleJoystickCamera::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkInteractorStyleJoystickCamera*
vtkInteractorStyleJoystickCamera::New()
		CODE:
		RETVAL = vtkInteractorStyleJoystickCamera::New();
		OUTPUT:
		RETVAL


void
vtkInteractorStyleJoystickCamera::OnLeftButtonDown(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnLeftButtonDown(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleJoystickCamera::OnLeftButtonUp(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnLeftButtonUp(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleJoystickCamera::OnMiddleButtonDown(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnMiddleButtonDown(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleJoystickCamera::OnMiddleButtonUp(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnMiddleButtonUp(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleJoystickCamera::OnMouseMove(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnMouseMove(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleJoystickCamera::OnRightButtonDown(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnRightButtonDown(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleJoystickCamera::OnRightButtonUp(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnRightButtonUp(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleJoystickCamera::OnTimer()
		CODE:
		THIS->OnTimer();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::InteractorStyleSwitch PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkInteractorStyleSwitch::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkInteractorStyleSwitch*
vtkInteractorStyleSwitch::New()
		CODE:
		RETVAL = vtkInteractorStyleSwitch::New();
		OUTPUT:
		RETVAL


void
vtkInteractorStyleSwitch::OnChar(ctrl, shift, keycode, repeatcount)
		int 	ctrl
		int 	shift
		char 	keycode
		int 	repeatcount
		CODE:
		THIS->OnChar(ctrl, shift, keycode, repeatcount);
		XSRETURN_EMPTY;


void
vtkInteractorStyleSwitch::OnLeftButtonDown(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnLeftButtonDown(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleSwitch::OnLeftButtonUp(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnLeftButtonUp(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleSwitch::OnMiddleButtonDown(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnMiddleButtonDown(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleSwitch::OnMiddleButtonUp(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnMiddleButtonUp(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleSwitch::OnMouseMove(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnMouseMove(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleSwitch::OnRightButtonDown(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnRightButtonDown(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleSwitch::OnRightButtonUp(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnRightButtonUp(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleSwitch::OnTimer()
		CODE:
		THIS->OnTimer();
		XSRETURN_EMPTY;


void
vtkInteractorStyleSwitch::SetActorModeToActor()
		CODE:
		THIS->SetActorModeToActor();
		XSRETURN_EMPTY;


void
vtkInteractorStyleSwitch::SetActorModeToCamera()
		CODE:
		THIS->SetActorModeToCamera();
		XSRETURN_EMPTY;


void
vtkInteractorStyleSwitch::SetInteractor(iren)
		vtkRenderWindowInteractor *	iren
		CODE:
		THIS->SetInteractor(iren);
		XSRETURN_EMPTY;


void
vtkInteractorStyleSwitch::SetTrackballModeToJoystick()
		CODE:
		THIS->SetTrackballModeToJoystick();
		XSRETURN_EMPTY;


void
vtkInteractorStyleSwitch::SetTrackballModeToTrackball()
		CODE:
		THIS->SetTrackballModeToTrackball();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::InteractorStyleTrackball PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkInteractorStyleTrackball::GetActorMode()
		CODE:
		RETVAL = THIS->GetActorMode();
		OUTPUT:
		RETVAL


const char *
vtkInteractorStyleTrackball::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkInteractorStyleTrackball::GetTrackballMode()
		CODE:
		RETVAL = THIS->GetTrackballMode();
		OUTPUT:
		RETVAL


static vtkInteractorStyleTrackball*
vtkInteractorStyleTrackball::New()
		CODE:
		RETVAL = vtkInteractorStyleTrackball::New();
		OUTPUT:
		RETVAL


void
vtkInteractorStyleTrackball::OnChar(ctrl, shift, keycode, repeatcount)
		int 	ctrl
		int 	shift
		char 	keycode
		int 	repeatcount
		CODE:
		THIS->OnChar(ctrl, shift, keycode, repeatcount);
		XSRETURN_EMPTY;


void
vtkInteractorStyleTrackball::OnLeftButtonDown(ctrl, shift, X, Y)
		int 	ctrl
		int 	shift
		int 	X
		int 	Y
		CODE:
		THIS->OnLeftButtonDown(ctrl, shift, X, Y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleTrackball::OnLeftButtonUp(ctrl, shift, X, Y)
		int 	ctrl
		int 	shift
		int 	X
		int 	Y
		CODE:
		THIS->OnLeftButtonUp(ctrl, shift, X, Y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleTrackball::OnMiddleButtonDown(ctrl, shift, X, Y)
		int 	ctrl
		int 	shift
		int 	X
		int 	Y
		CODE:
		THIS->OnMiddleButtonDown(ctrl, shift, X, Y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleTrackball::OnMiddleButtonUp(ctrl, shift, X, Y)
		int 	ctrl
		int 	shift
		int 	X
		int 	Y
		CODE:
		THIS->OnMiddleButtonUp(ctrl, shift, X, Y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleTrackball::OnRightButtonDown(ctrl, shift, X, Y)
		int 	ctrl
		int 	shift
		int 	X
		int 	Y
		CODE:
		THIS->OnRightButtonDown(ctrl, shift, X, Y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleTrackball::OnRightButtonUp(ctrl, shift, X, Y)
		int 	ctrl
		int 	shift
		int 	X
		int 	Y
		CODE:
		THIS->OnRightButtonUp(ctrl, shift, X, Y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleTrackball::OnTimer()
		CODE:
		THIS->OnTimer();
		XSRETURN_EMPTY;


void
vtkInteractorStyleTrackball::SetActorModeToActor()
		CODE:
		THIS->SetActorModeToActor();
		XSRETURN_EMPTY;


void
vtkInteractorStyleTrackball::SetActorModeToCamera()
		CODE:
		THIS->SetActorModeToCamera();
		XSRETURN_EMPTY;


void
vtkInteractorStyleTrackball::SetTrackballModeToJoystick()
		CODE:
		THIS->SetTrackballModeToJoystick();
		XSRETURN_EMPTY;


void
vtkInteractorStyleTrackball::SetTrackballModeToTrackball()
		CODE:
		THIS->SetTrackballModeToTrackball();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::InteractorStyleTrackballActor PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkInteractorStyleTrackballActor::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkInteractorStyleTrackballActor*
vtkInteractorStyleTrackballActor::New()
		CODE:
		RETVAL = vtkInteractorStyleTrackballActor::New();
		OUTPUT:
		RETVAL


void
vtkInteractorStyleTrackballActor::OnLeftButtonDown(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnLeftButtonDown(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleTrackballActor::OnLeftButtonUp(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnLeftButtonUp(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleTrackballActor::OnMiddleButtonDown(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnMiddleButtonDown(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleTrackballActor::OnMiddleButtonUp(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnMiddleButtonUp(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleTrackballActor::OnMouseMove(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnMouseMove(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleTrackballActor::OnRightButtonDown(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnRightButtonDown(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleTrackballActor::OnRightButtonUp(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnRightButtonUp(ctrl, shift, x, y);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::InteractorStyleTrackballCamera PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkInteractorStyleTrackballCamera::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkInteractorStyleTrackballCamera*
vtkInteractorStyleTrackballCamera::New()
		CODE:
		RETVAL = vtkInteractorStyleTrackballCamera::New();
		OUTPUT:
		RETVAL


void
vtkInteractorStyleTrackballCamera::OnLeftButtonDown(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnLeftButtonDown(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleTrackballCamera::OnLeftButtonUp(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnLeftButtonUp(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleTrackballCamera::OnMiddleButtonDown(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnMiddleButtonDown(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleTrackballCamera::OnMiddleButtonUp(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnMiddleButtonUp(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleTrackballCamera::OnMouseMove(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnMouseMove(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleTrackballCamera::OnRightButtonDown(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnRightButtonDown(ctrl, shift, x, y);
		XSRETURN_EMPTY;


void
vtkInteractorStyleTrackballCamera::OnRightButtonUp(ctrl, shift, x, y)
		int 	ctrl
		int 	shift
		int 	x
		int 	y
		CODE:
		THIS->OnRightButtonUp(ctrl, shift, x, y);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::InteractorStyleUser PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkInteractorStyleUser::GetButton()
		CODE:
		RETVAL = THIS->GetButton();
		OUTPUT:
		RETVAL


int
vtkInteractorStyleUser::GetChar()
		CODE:
		RETVAL = THIS->GetChar();
		OUTPUT:
		RETVAL


const char *
vtkInteractorStyleUser::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkInteractorStyleUser::GetCtrlKey()
		CODE:
		RETVAL = THIS->GetCtrlKey();
		OUTPUT:
		RETVAL


char *
vtkInteractorStyleUser::GetKeySym()
		CODE:
		RETVAL = THIS->GetKeySym();
		OUTPUT:
		RETVAL


int  *
vtkInteractorStyleUser::GetOldPos()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetOldPos();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


int
vtkInteractorStyleUser::GetShiftKey()
		CODE:
		RETVAL = THIS->GetShiftKey();
		OUTPUT:
		RETVAL


static vtkInteractorStyleUser*
vtkInteractorStyleUser::New()
		CODE:
		RETVAL = vtkInteractorStyleUser::New();
		OUTPUT:
		RETVAL


void
vtkInteractorStyleUser::SetButtonPressMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetButtonPressMethod",0), newRV(func), 0);
		}
		THIS->SetButtonPressMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkInteractorStyleUser::SetButtonReleaseMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetButtonReleaseMethod",0), newRV(func), 0);
		}
		THIS->SetButtonReleaseMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkInteractorStyleUser::SetCharMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetCharMethod",0), newRV(func), 0);
		}
		THIS->SetCharMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkInteractorStyleUser::SetConfigureMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetConfigureMethod",0), newRV(func), 0);
		}
		THIS->SetConfigureMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkInteractorStyleUser::SetEnterMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetEnterMethod",0), newRV(func), 0);
		}
		THIS->SetEnterMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkInteractorStyleUser::SetKeyPressMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetKeyPressMethod",0), newRV(func), 0);
		}
		THIS->SetKeyPressMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkInteractorStyleUser::SetKeyReleaseMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetKeyReleaseMethod",0), newRV(func), 0);
		}
		THIS->SetKeyReleaseMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkInteractorStyleUser::SetLeaveMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetLeaveMethod",0), newRV(func), 0);
		}
		THIS->SetLeaveMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkInteractorStyleUser::SetMouseMoveMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetMouseMoveMethod",0), newRV(func), 0);
		}
		THIS->SetMouseMoveMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkInteractorStyleUser::SetTimerMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetTimerMethod",0), newRV(func), 0);
		}
		THIS->SetTimerMethod(callperlsub, func);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::InterpolateDataSetAttributes PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkInterpolateDataSetAttributes::AddInput(arg1 = 0)
	CASE: items == 2
		vtkDataSet *	arg1
		CODE:
		THIS->AddInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkInterpolateDataSetAttributes::AddInput\n");



const char *
vtkInterpolateDataSetAttributes::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataSetCollection *
vtkInterpolateDataSetAttributes::GetInputList()
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


float
vtkInterpolateDataSetAttributes::GetT()
		CODE:
		RETVAL = THIS->GetT();
		OUTPUT:
		RETVAL


static vtkInterpolateDataSetAttributes*
vtkInterpolateDataSetAttributes::New()
		CODE:
		RETVAL = vtkInterpolateDataSetAttributes::New();
		OUTPUT:
		RETVAL


void
vtkInterpolateDataSetAttributes::SetT(arg1)
		float 	arg1
		CODE:
		THIS->SetT(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::IVExporter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkIVExporter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


char *
vtkIVExporter::GetFileName()
		CODE:
		RETVAL = THIS->GetFileName();
		OUTPUT:
		RETVAL


static vtkIVExporter*
vtkIVExporter::New()
		CODE:
		RETVAL = vtkIVExporter::New();
		OUTPUT:
		RETVAL


void
vtkIVExporter::SetFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetFileName(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::KochanekSpline PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkKochanekSpline::Compute()
		CODE:
		THIS->Compute();
		XSRETURN_EMPTY;


float
vtkKochanekSpline::Evaluate(t)
		float 	t
		CODE:
		RETVAL = THIS->Evaluate(t);
		OUTPUT:
		RETVAL


const char *
vtkKochanekSpline::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkKochanekSpline::GetDefaultBias()
		CODE:
		RETVAL = THIS->GetDefaultBias();
		OUTPUT:
		RETVAL


float
vtkKochanekSpline::GetDefaultContinuity()
		CODE:
		RETVAL = THIS->GetDefaultContinuity();
		OUTPUT:
		RETVAL


float
vtkKochanekSpline::GetDefaultTension()
		CODE:
		RETVAL = THIS->GetDefaultTension();
		OUTPUT:
		RETVAL


static vtkKochanekSpline*
vtkKochanekSpline::New()
		CODE:
		RETVAL = vtkKochanekSpline::New();
		OUTPUT:
		RETVAL


void
vtkKochanekSpline::SetDefaultBias(arg1)
		float 	arg1
		CODE:
		THIS->SetDefaultBias(arg1);
		XSRETURN_EMPTY;


void
vtkKochanekSpline::SetDefaultContinuity(arg1)
		float 	arg1
		CODE:
		THIS->SetDefaultContinuity(arg1);
		XSRETURN_EMPTY;


void
vtkKochanekSpline::SetDefaultTension(arg1)
		float 	arg1
		CODE:
		THIS->SetDefaultTension(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::LODActor PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkLODActor::AddLODMapper(mapper)
		vtkMapper *	mapper
		CODE:
		THIS->AddLODMapper(mapper);
		XSRETURN_EMPTY;


const char *
vtkLODActor::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkMapperCollection *
vtkLODActor::GetLODMappers()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkMapperCollection";
		CODE:
		RETVAL = THIS->GetLODMappers();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkLODActor::GetNumberOfCloudPoints()
		CODE:
		RETVAL = THIS->GetNumberOfCloudPoints();
		OUTPUT:
		RETVAL


void
vtkLODActor::Modified()
		CODE:
		THIS->Modified();
		XSRETURN_EMPTY;


static vtkLODActor*
vtkLODActor::New()
		CODE:
		RETVAL = vtkLODActor::New();
		OUTPUT:
		RETVAL


void
vtkLODActor::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;


void
vtkLODActor::Render(arg1, arg2)
		vtkRenderer *	arg1
		vtkMapper *	arg2
		CODE:
		THIS->Render(arg1, arg2);
		XSRETURN_EMPTY;


int
vtkLODActor::RenderOpaqueGeometry(viewport)
		vtkViewport *	viewport
		CODE:
		RETVAL = THIS->RenderOpaqueGeometry(viewport);
		OUTPUT:
		RETVAL


void
vtkLODActor::SetNumberOfCloudPoints(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfCloudPoints(arg1);
		XSRETURN_EMPTY;


void
vtkLODActor::ShallowCopy(prop)
		vtkProp *	prop
		CODE:
		THIS->ShallowCopy(prop);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::LODProp3D PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkLODProp3D::AddLOD(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		vtkMapper *	arg1
		vtkProperty *	arg2
		vtkTexture *	arg3
		float 	arg4
		CODE:
		RETVAL = THIS->AddLOD(arg1, arg2, arg3, arg4);
		OUTPUT:
		RETVAL
	CASE: items == 4 && sv_isobject(ST(2)) && sv_derived_from(ST(2),"Graphics::VTK::VolumeProperty")
		vtkVolumeMapper *	arg1
		vtkVolumeProperty *	arg2
		float 	arg3
		CODE:
		RETVAL = THIS->AddLOD(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE: items == 4 && sv_isobject(ST(2)) && sv_derived_from(ST(2),"Graphics::VTK::Texture")
		vtkMapper *	arg1
		vtkTexture *	arg2
		float 	arg3
		CODE:
		RETVAL = THIS->AddLOD(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE: items == 4 && sv_isobject(ST(2)) && sv_derived_from(ST(2),"Graphics::VTK::Property")
		vtkMapper *	arg1
		vtkProperty *	arg2
		float 	arg3
		CODE:
		RETVAL = THIS->AddLOD(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE: items == 3 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::VolumeMapper")
		vtkVolumeMapper *	arg1
		float 	arg2
		CODE:
		RETVAL = THIS->AddLOD(arg1, arg2);
		OUTPUT:
		RETVAL
	CASE: items == 3 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::Mapper")
		vtkMapper *	arg1
		float 	arg2
		CODE:
		RETVAL = THIS->AddLOD(arg1, arg2);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLODProp3D::AddLOD\n");



void
vtkLODProp3D::AutomaticLODSelectionOff()
		CODE:
		THIS->AutomaticLODSelectionOff();
		XSRETURN_EMPTY;


void
vtkLODProp3D::AutomaticLODSelectionOn()
		CODE:
		THIS->AutomaticLODSelectionOn();
		XSRETURN_EMPTY;


void
vtkLODProp3D::AutomaticPickLODSelectionOff()
		CODE:
		THIS->AutomaticPickLODSelectionOff();
		XSRETURN_EMPTY;


void
vtkLODProp3D::AutomaticPickLODSelectionOn()
		CODE:
		THIS->AutomaticPickLODSelectionOn();
		XSRETURN_EMPTY;


void
vtkLODProp3D::DisableLOD(id)
		int 	id
		CODE:
		THIS->DisableLOD(id);
		XSRETURN_EMPTY;


void
vtkLODProp3D::EnableLOD(id)
		int 	id
		CODE:
		THIS->EnableLOD(id);
		XSRETURN_EMPTY;


void
vtkLODProp3D::GetActors(arg1)
		vtkPropCollection *	arg1
		CODE:
		THIS->GetActors(arg1);
		XSRETURN_EMPTY;


int
vtkLODProp3D::GetAutomaticLODSelection()
		CODE:
		RETVAL = THIS->GetAutomaticLODSelection();
		OUTPUT:
		RETVAL


int
vtkLODProp3D::GetAutomaticPickLODSelection()
		CODE:
		RETVAL = THIS->GetAutomaticPickLODSelection();
		OUTPUT:
		RETVAL


float *
vtkLODProp3D::GetBounds()
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


const char *
vtkLODProp3D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkLODProp3D::GetLODEstimatedRenderTime(id)
		int 	id
		CODE:
		RETVAL = THIS->GetLODEstimatedRenderTime(id);
		OUTPUT:
		RETVAL


float
vtkLODProp3D::GetLODIndexEstimatedRenderTime(index)
		int 	index
		CODE:
		RETVAL = THIS->GetLODIndexEstimatedRenderTime(index);
		OUTPUT:
		RETVAL


float
vtkLODProp3D::GetLODIndexLevel(index)
		int 	index
		CODE:
		RETVAL = THIS->GetLODIndexLevel(index);
		OUTPUT:
		RETVAL


float
vtkLODProp3D::GetLODLevel(id)
		int 	id
		CODE:
		RETVAL = THIS->GetLODLevel(id);
		OUTPUT:
		RETVAL


int
vtkLODProp3D::GetLastRenderedLODID()
		CODE:
		RETVAL = THIS->GetLastRenderedLODID();
		OUTPUT:
		RETVAL


int
vtkLODProp3D::GetSelectedLODID()
		CODE:
		RETVAL = THIS->GetSelectedLODID();
		OUTPUT:
		RETVAL


int
vtkLODProp3D::GetSelectedPickLODID()
		CODE:
		RETVAL = THIS->GetSelectedPickLODID();
		OUTPUT:
		RETVAL


static vtkLODProp3D*
vtkLODProp3D::New()
		CODE:
		RETVAL = vtkLODProp3D::New();
		OUTPUT:
		RETVAL


void
vtkLODProp3D::RemoveLOD(id)
		int 	id
		CODE:
		THIS->RemoveLOD(id);
		XSRETURN_EMPTY;


int
vtkLODProp3D::RequiresRayCasting()
		CODE:
		RETVAL = THIS->RequiresRayCasting();
		OUTPUT:
		RETVAL


int
vtkLODProp3D::RequiresRenderingIntoImage()
		CODE:
		RETVAL = THIS->RequiresRenderingIntoImage();
		OUTPUT:
		RETVAL


void
vtkLODProp3D::SetAutomaticLODSelection(arg1)
		int 	arg1
		CODE:
		THIS->SetAutomaticLODSelection(arg1);
		XSRETURN_EMPTY;


void
vtkLODProp3D::SetAutomaticPickLODSelection(arg1)
		int 	arg1
		CODE:
		THIS->SetAutomaticPickLODSelection(arg1);
		XSRETURN_EMPTY;


void
vtkLODProp3D::SetLODLevel(id, level)
		int 	id
		float 	level
		CODE:
		THIS->SetLODLevel(id, level);
		XSRETURN_EMPTY;


void
vtkLODProp3D::SetLODMapper(arg1 = 0, arg2 = 0)
	CASE: items == 3 && sv_isobject(ST(2)) && sv_derived_from(ST(2),"Graphics::VTK::VolumeMapper")
		int 	arg1
		vtkVolumeMapper *	arg2
		CODE:
		THIS->SetLODMapper(arg1, arg2);
		XSRETURN_EMPTY;
	CASE: items == 3 && sv_isobject(ST(2)) && sv_derived_from(ST(2),"Graphics::VTK::Mapper")
		int 	arg1
		vtkMapper *	arg2
		CODE:
		THIS->SetLODMapper(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLODProp3D::SetLODMapper\n");



void
vtkLODProp3D::SetLODProperty(arg1 = 0, arg2 = 0)
	CASE: items == 3 && sv_isobject(ST(2)) && sv_derived_from(ST(2),"Graphics::VTK::VolumeProperty")
		int 	arg1
		vtkVolumeProperty *	arg2
		CODE:
		THIS->SetLODProperty(arg1, arg2);
		XSRETURN_EMPTY;
	CASE: items == 3 && sv_isobject(ST(2)) && sv_derived_from(ST(2),"Graphics::VTK::Property")
		int 	arg1
		vtkProperty *	arg2
		CODE:
		THIS->SetLODProperty(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLODProp3D::SetLODProperty\n");



void
vtkLODProp3D::SetLODTexture(id, t)
		int 	id
		vtkTexture *	t
		CODE:
		THIS->SetLODTexture(id, t);
		XSRETURN_EMPTY;


void
vtkLODProp3D::SetPickMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetPickMethod",0), newRV(func), 0);
		}
		THIS->SetPickMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkLODProp3D::SetSelectedLODID(arg1)
		int 	arg1
		CODE:
		THIS->SetSelectedLODID(arg1);
		XSRETURN_EMPTY;


void
vtkLODProp3D::SetSelectedPickLODID(id)
		int 	id
		CODE:
		THIS->SetSelectedPickLODID(id);
		XSRETURN_EMPTY;


void
vtkLODProp3D::ShallowCopy(prop)
		vtkProp *	prop
		CODE:
		THIS->ShallowCopy(prop);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Light PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkLight::DeepCopy(light)
		vtkLight *	light
		CODE:
		THIS->DeepCopy(light);
		XSRETURN_EMPTY;


float  *
vtkLight::GetAttenuationValues()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetAttenuationValues();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


const char *
vtkLight::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkLight::GetColor()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetColor();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float
vtkLight::GetConeAngle()
		CODE:
		RETVAL = THIS->GetConeAngle();
		OUTPUT:
		RETVAL


float
vtkLight::GetExponent()
		CODE:
		RETVAL = THIS->GetExponent();
		OUTPUT:
		RETVAL


float  *
vtkLight::GetFocalPoint()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetFocalPoint();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float
vtkLight::GetIntensity()
		CODE:
		RETVAL = THIS->GetIntensity();
		OUTPUT:
		RETVAL


int
vtkLight::GetLightType()
		CODE:
		RETVAL = THIS->GetLightType();
		OUTPUT:
		RETVAL


float  *
vtkLight::GetPosition()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetPosition();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkLight::GetPositional()
		CODE:
		RETVAL = THIS->GetPositional();
		OUTPUT:
		RETVAL


int
vtkLight::GetSwitch()
		CODE:
		RETVAL = THIS->GetSwitch();
		OUTPUT:
		RETVAL


vtkMatrix4x4 *
vtkLight::GetTransformMatrix()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkMatrix4x4";
		CODE:
		RETVAL = THIS->GetTransformMatrix();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float *
vtkLight::GetTransformedFocalPoint(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->GetTransformedFocalPoint(arg1, arg2, arg3);
		XSRETURN_EMPTY;
		OUTPUT:
		arg1
		arg2
		arg3
	CASE: items == 1
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetTransformedFocalPoint();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float *
vtkLight::GetTransformedPosition(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->GetTransformedPosition(arg1, arg2, arg3);
		XSRETURN_EMPTY;
		OUTPUT:
		arg1
		arg2
		arg3
	CASE: items == 1
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetTransformedPosition();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkLight::LightTypeIsCameraLight()
		CODE:
		RETVAL = THIS->LightTypeIsCameraLight();
		OUTPUT:
		RETVAL


int
vtkLight::LightTypeIsHeadlight()
		CODE:
		RETVAL = THIS->LightTypeIsHeadlight();
		OUTPUT:
		RETVAL


int
vtkLight::LightTypeIsSceneLight()
		CODE:
		RETVAL = THIS->LightTypeIsSceneLight();
		OUTPUT:
		RETVAL


static vtkLight*
vtkLight::New()
		CODE:
		RETVAL = vtkLight::New();
		OUTPUT:
		RETVAL


void
vtkLight::PositionalOff()
		CODE:
		THIS->PositionalOff();
		XSRETURN_EMPTY;


void
vtkLight::PositionalOn()
		CODE:
		THIS->PositionalOn();
		XSRETURN_EMPTY;


void
vtkLight::Render(arg1, arg2)
		vtkRenderer *	arg1
		int 	arg2
		CODE:
		THIS->Render(arg1, arg2);
		XSRETURN_EMPTY;


void
vtkLight::SetAttenuationValues(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetAttenuationValues(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLight::SetAttenuationValues\n");



void
vtkLight::SetColor(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetColor(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLight::SetColor\n");



void
vtkLight::SetConeAngle(arg1)
		float 	arg1
		CODE:
		THIS->SetConeAngle(arg1);
		XSRETURN_EMPTY;


void
vtkLight::SetDirectionAngle(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float 	arg1
		float 	arg2
		CODE:
		THIS->SetDirectionAngle(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLight::SetDirectionAngle\n");



void
vtkLight::SetExponent(arg1)
		float 	arg1
		CODE:
		THIS->SetExponent(arg1);
		XSRETURN_EMPTY;


void
vtkLight::SetFocalPoint(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetFocalPoint(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLight::SetFocalPoint\n");



void
vtkLight::SetIntensity(arg1)
		float 	arg1
		CODE:
		THIS->SetIntensity(arg1);
		XSRETURN_EMPTY;


void
vtkLight::SetLightType(arg1)
		int 	arg1
		CODE:
		THIS->SetLightType(arg1);
		XSRETURN_EMPTY;


void
vtkLight::SetLightTypeToCameraLight()
		CODE:
		THIS->SetLightTypeToCameraLight();
		XSRETURN_EMPTY;


void
vtkLight::SetLightTypeToHeadlight()
		CODE:
		THIS->SetLightTypeToHeadlight();
		XSRETURN_EMPTY;


void
vtkLight::SetLightTypeToSceneLight()
		CODE:
		THIS->SetLightTypeToSceneLight();
		XSRETURN_EMPTY;


void
vtkLight::SetPosition(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetPosition(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLight::SetPosition\n");



void
vtkLight::SetPositional(arg1)
		int 	arg1
		CODE:
		THIS->SetPositional(arg1);
		XSRETURN_EMPTY;


void
vtkLight::SetSwitch(arg1)
		int 	arg1
		CODE:
		THIS->SetSwitch(arg1);
		XSRETURN_EMPTY;


void
vtkLight::SetTransformMatrix(arg1)
		vtkMatrix4x4 *	arg1
		CODE:
		THIS->SetTransformMatrix(arg1);
		XSRETURN_EMPTY;


void
vtkLight::SwitchOff()
		CODE:
		THIS->SwitchOff();
		XSRETURN_EMPTY;


void
vtkLight::SwitchOn()
		CODE:
		THIS->SwitchOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::LightCollection PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkLightCollection::AddItem(arg1 = 0)
	CASE: items == 2
		vtkLight *	arg1
		CODE:
		THIS->AddItem(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLightCollection::AddItem\n");



const char *
vtkLightCollection::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkLight *
vtkLightCollection::GetNextItem()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkLight";
		CODE:
		RETVAL = THIS->GetNextItem();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkLightCollection*
vtkLightCollection::New()
		CODE:
		RETVAL = vtkLightCollection::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::LineSource PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkLineSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkLineSource::GetPoint1()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetPoint1();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkLineSource::GetPoint2()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetPoint2();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkLineSource::GetResolution()
		CODE:
		RETVAL = THIS->GetResolution();
		OUTPUT:
		RETVAL


static vtkLineSource*
vtkLineSource::New()
		CODE:
		RETVAL = vtkLineSource::New();
		OUTPUT:
		RETVAL


void
vtkLineSource::SetPoint1(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetPoint1(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLineSource::SetPoint1\n");



void
vtkLineSource::SetPoint2(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetPoint2(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLineSource::SetPoint2\n");



void
vtkLineSource::SetResolution(arg1)
		int 	arg1
		CODE:
		THIS->SetResolution(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::LinearExtrusionFilter PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkLinearExtrusionFilter::CappingOff()
		CODE:
		THIS->CappingOff();
		XSRETURN_EMPTY;


void
vtkLinearExtrusionFilter::CappingOn()
		CODE:
		THIS->CappingOn();
		XSRETURN_EMPTY;


int
vtkLinearExtrusionFilter::GetCapping()
		CODE:
		RETVAL = THIS->GetCapping();
		OUTPUT:
		RETVAL


const char *
vtkLinearExtrusionFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkLinearExtrusionFilter::GetExtrusionPoint()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetExtrusionPoint();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkLinearExtrusionFilter::GetExtrusionType()
		CODE:
		RETVAL = THIS->GetExtrusionType();
		OUTPUT:
		RETVAL


int
vtkLinearExtrusionFilter::GetLowerCap()
		CODE:
		RETVAL = THIS->GetLowerCap();
		OUTPUT:
		RETVAL


float
vtkLinearExtrusionFilter::GetScaleFactor()
		CODE:
		RETVAL = THIS->GetScaleFactor();
		OUTPUT:
		RETVAL


int
vtkLinearExtrusionFilter::GetUpperCap()
		CODE:
		RETVAL = THIS->GetUpperCap();
		OUTPUT:
		RETVAL


float  *
vtkLinearExtrusionFilter::GetVector()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetVector();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


void
vtkLinearExtrusionFilter::LowerCapOff()
		CODE:
		THIS->LowerCapOff();
		XSRETURN_EMPTY;


void
vtkLinearExtrusionFilter::LowerCapOn()
		CODE:
		THIS->LowerCapOn();
		XSRETURN_EMPTY;


static vtkLinearExtrusionFilter*
vtkLinearExtrusionFilter::New()
		CODE:
		RETVAL = vtkLinearExtrusionFilter::New();
		OUTPUT:
		RETVAL


void
vtkLinearExtrusionFilter::SetCapping(arg1)
		int 	arg1
		CODE:
		THIS->SetCapping(arg1);
		XSRETURN_EMPTY;


void
vtkLinearExtrusionFilter::SetExtrusionPoint(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetExtrusionPoint(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLinearExtrusionFilter::SetExtrusionPoint\n");



void
vtkLinearExtrusionFilter::SetExtrusionType(arg1)
		int 	arg1
		CODE:
		THIS->SetExtrusionType(arg1);
		XSRETURN_EMPTY;


void
vtkLinearExtrusionFilter::SetExtrusionTypeToNormalExtrusion()
		CODE:
		THIS->SetExtrusionTypeToNormalExtrusion();
		XSRETURN_EMPTY;


void
vtkLinearExtrusionFilter::SetExtrusionTypeToPointExtrusion()
		CODE:
		THIS->SetExtrusionTypeToPointExtrusion();
		XSRETURN_EMPTY;


void
vtkLinearExtrusionFilter::SetExtrusionTypeToVectorExtrusion()
		CODE:
		THIS->SetExtrusionTypeToVectorExtrusion();
		XSRETURN_EMPTY;


void
vtkLinearExtrusionFilter::SetLowerCap(arg1)
		int 	arg1
		CODE:
		THIS->SetLowerCap(arg1);
		XSRETURN_EMPTY;


void
vtkLinearExtrusionFilter::SetScaleFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetScaleFactor(arg1);
		XSRETURN_EMPTY;


void
vtkLinearExtrusionFilter::SetUpperCap(arg1)
		int 	arg1
		CODE:
		THIS->SetUpperCap(arg1);
		XSRETURN_EMPTY;


void
vtkLinearExtrusionFilter::SetVector(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetVector(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLinearExtrusionFilter::SetVector\n");



void
vtkLinearExtrusionFilter::UpperCapOff()
		CODE:
		THIS->UpperCapOff();
		XSRETURN_EMPTY;


void
vtkLinearExtrusionFilter::UpperCapOn()
		CODE:
		THIS->UpperCapOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::LinearSubdivisionFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkLinearSubdivisionFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkLinearSubdivisionFilter*
vtkLinearSubdivisionFilter::New()
		CODE:
		RETVAL = vtkLinearSubdivisionFilter::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::LinkEdgels PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkLinkEdgels::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkLinkEdgels::GetGradientThreshold()
		CODE:
		RETVAL = THIS->GetGradientThreshold();
		OUTPUT:
		RETVAL


float
vtkLinkEdgels::GetLinkThreshold()
		CODE:
		RETVAL = THIS->GetLinkThreshold();
		OUTPUT:
		RETVAL


float
vtkLinkEdgels::GetPhiThreshold()
		CODE:
		RETVAL = THIS->GetPhiThreshold();
		OUTPUT:
		RETVAL


static vtkLinkEdgels*
vtkLinkEdgels::New()
		CODE:
		RETVAL = vtkLinkEdgels::New();
		OUTPUT:
		RETVAL


void
vtkLinkEdgels::SetGradientThreshold(arg1)
		float 	arg1
		CODE:
		THIS->SetGradientThreshold(arg1);
		XSRETURN_EMPTY;


void
vtkLinkEdgels::SetLinkThreshold(arg1)
		float 	arg1
		CODE:
		THIS->SetLinkThreshold(arg1);
		XSRETURN_EMPTY;


void
vtkLinkEdgels::SetPhiThreshold(arg1)
		float 	arg1
		CODE:
		THIS->SetPhiThreshold(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::LoopSubdivisionFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkLoopSubdivisionFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkLoopSubdivisionFilter*
vtkLoopSubdivisionFilter::New()
		CODE:
		RETVAL = vtkLoopSubdivisionFilter::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::MCubesReader PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkMCubesReader::CreateDefaultLocator()
		CODE:
		THIS->CreateDefaultLocator();
		XSRETURN_EMPTY;


void
vtkMCubesReader::FlipNormalsOff()
		CODE:
		THIS->FlipNormalsOff();
		XSRETURN_EMPTY;


void
vtkMCubesReader::FlipNormalsOn()
		CODE:
		THIS->FlipNormalsOn();
		XSRETURN_EMPTY;


const char *
vtkMCubesReader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


char *
vtkMCubesReader::GetFileName()
		CODE:
		RETVAL = THIS->GetFileName();
		OUTPUT:
		RETVAL


int
vtkMCubesReader::GetFlipNormals()
		CODE:
		RETVAL = THIS->GetFlipNormals();
		OUTPUT:
		RETVAL


char *
vtkMCubesReader::GetLimitsFileName()
		CODE:
		RETVAL = THIS->GetLimitsFileName();
		OUTPUT:
		RETVAL


vtkPointLocator *
vtkMCubesReader::GetLocator()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPointLocator";
		CODE:
		RETVAL = THIS->GetLocator();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkMCubesReader::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


int
vtkMCubesReader::GetNormals()
		CODE:
		RETVAL = THIS->GetNormals();
		OUTPUT:
		RETVAL


static vtkMCubesReader*
vtkMCubesReader::New()
		CODE:
		RETVAL = vtkMCubesReader::New();
		OUTPUT:
		RETVAL


void
vtkMCubesReader::NormalsOff()
		CODE:
		THIS->NormalsOff();
		XSRETURN_EMPTY;


void
vtkMCubesReader::NormalsOn()
		CODE:
		THIS->NormalsOn();
		XSRETURN_EMPTY;


void
vtkMCubesReader::SetFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetFileName(arg1);
		XSRETURN_EMPTY;


void
vtkMCubesReader::SetFlipNormals(arg1)
		int 	arg1
		CODE:
		THIS->SetFlipNormals(arg1);
		XSRETURN_EMPTY;


void
vtkMCubesReader::SetLimitsFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetLimitsFileName(arg1);
		XSRETURN_EMPTY;


void
vtkMCubesReader::SetLocator(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::PointLocator")
		vtkPointLocator *	arg1
		CODE:
		THIS->SetLocator(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::PointLocator")
		vtkPointLocator *	arg1
		CODE:
		THIS->SetLocator(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkMCubesReader::SetLocator\n");



void
vtkMCubesReader::SetNormals(arg1)
		int 	arg1
		CODE:
		THIS->SetNormals(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::MCubesWriter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkMCubesWriter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


char *
vtkMCubesWriter::GetLimitsFileName()
		CODE:
		RETVAL = THIS->GetLimitsFileName();
		OUTPUT:
		RETVAL


static vtkMCubesWriter*
vtkMCubesWriter::New()
		CODE:
		RETVAL = vtkMCubesWriter::New();
		OUTPUT:
		RETVAL


void
vtkMCubesWriter::SetLimitsFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetLimitsFileName(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::MapperCollection PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkMapperCollection::AddItem(arg1 = 0)
	CASE: items == 2
		vtkMapper *	arg1
		CODE:
		THIS->AddItem(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkMapperCollection::AddItem\n");



const char *
vtkMapperCollection::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkMapper *
vtkMapperCollection::GetLastItem()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkMapper";
		CODE:
		RETVAL = THIS->GetLastItem();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkMapper *
vtkMapperCollection::GetNextItem()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkMapper";
		CODE:
		RETVAL = THIS->GetNextItem();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkMapperCollection*
vtkMapperCollection::New()
		CODE:
		RETVAL = vtkMapperCollection::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::MaskPoints PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkMaskPoints::GenerateVerticesOff()
		CODE:
		THIS->GenerateVerticesOff();
		XSRETURN_EMPTY;


void
vtkMaskPoints::GenerateVerticesOn()
		CODE:
		THIS->GenerateVerticesOn();
		XSRETURN_EMPTY;


const char *
vtkMaskPoints::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkMaskPoints::GetGenerateVertices()
		CODE:
		RETVAL = THIS->GetGenerateVertices();
		OUTPUT:
		RETVAL


int
vtkMaskPoints::GetMaximumNumberOfPoints()
		CODE:
		RETVAL = THIS->GetMaximumNumberOfPoints();
		OUTPUT:
		RETVAL


int
vtkMaskPoints::GetOffset()
		CODE:
		RETVAL = THIS->GetOffset();
		OUTPUT:
		RETVAL


int
vtkMaskPoints::GetOnRatio()
		CODE:
		RETVAL = THIS->GetOnRatio();
		OUTPUT:
		RETVAL


int
vtkMaskPoints::GetRandomMode()
		CODE:
		RETVAL = THIS->GetRandomMode();
		OUTPUT:
		RETVAL


static vtkMaskPoints*
vtkMaskPoints::New()
		CODE:
		RETVAL = vtkMaskPoints::New();
		OUTPUT:
		RETVAL


void
vtkMaskPoints::RandomModeOff()
		CODE:
		THIS->RandomModeOff();
		XSRETURN_EMPTY;


void
vtkMaskPoints::RandomModeOn()
		CODE:
		THIS->RandomModeOn();
		XSRETURN_EMPTY;


void
vtkMaskPoints::SetGenerateVertices(arg1)
		int 	arg1
		CODE:
		THIS->SetGenerateVertices(arg1);
		XSRETURN_EMPTY;


void
vtkMaskPoints::SetMaximumNumberOfPoints(arg1)
		int 	arg1
		CODE:
		THIS->SetMaximumNumberOfPoints(arg1);
		XSRETURN_EMPTY;


void
vtkMaskPoints::SetOffset(arg1)
		int 	arg1
		CODE:
		THIS->SetOffset(arg1);
		XSRETURN_EMPTY;


void
vtkMaskPoints::SetOnRatio(arg1)
		int 	arg1
		CODE:
		THIS->SetOnRatio(arg1);
		XSRETURN_EMPTY;


void
vtkMaskPoints::SetRandomMode(arg1)
		int 	arg1
		CODE:
		THIS->SetRandomMode(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::MaskPolyData PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkMaskPolyData::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkMaskPolyData::GetOffset()
		CODE:
		RETVAL = THIS->GetOffset();
		OUTPUT:
		RETVAL


int
vtkMaskPolyData::GetOnRatio()
		CODE:
		RETVAL = THIS->GetOnRatio();
		OUTPUT:
		RETVAL


static vtkMaskPolyData*
vtkMaskPolyData::New()
		CODE:
		RETVAL = vtkMaskPolyData::New();
		OUTPUT:
		RETVAL


void
vtkMaskPolyData::SetOffset(arg1)
		int 	arg1
		CODE:
		THIS->SetOffset(arg1);
		XSRETURN_EMPTY;


void
vtkMaskPolyData::SetOnRatio(arg1)
		int 	arg1
		CODE:
		THIS->SetOnRatio(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::MergeFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkMergeFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkMergeFilter::GetFieldData()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetFieldData();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkDataSet *
vtkMergeFilter::GetGeometry()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetGeometry();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkDataSet *
vtkMergeFilter::GetNormals()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetNormals();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkDataSet *
vtkMergeFilter::GetScalars()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetScalars();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkDataSet *
vtkMergeFilter::GetTCoords()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetTCoords();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkDataSet *
vtkMergeFilter::GetTensors()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetTensors();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkDataSet *
vtkMergeFilter::GetVectors()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetVectors();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkMergeFilter*
vtkMergeFilter::New()
		CODE:
		RETVAL = vtkMergeFilter::New();
		OUTPUT:
		RETVAL


void
vtkMergeFilter::SetFieldData(arg1)
		vtkDataSet *	arg1
		CODE:
		THIS->SetFieldData(arg1);
		XSRETURN_EMPTY;


void
vtkMergeFilter::SetGeometry(input)
		vtkDataSet *	input
		CODE:
		THIS->SetGeometry(input);
		XSRETURN_EMPTY;


void
vtkMergeFilter::SetNormals(arg1)
		vtkDataSet *	arg1
		CODE:
		THIS->SetNormals(arg1);
		XSRETURN_EMPTY;


void
vtkMergeFilter::SetScalars(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::ImageData")
		vtkImageData *	arg1
		CODE:
		THIS->SetScalars(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataSet")
		vtkDataSet *	arg1
		CODE:
		THIS->SetScalars(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkMergeFilter::SetScalars\n");



void
vtkMergeFilter::SetTCoords(arg1)
		vtkDataSet *	arg1
		CODE:
		THIS->SetTCoords(arg1);
		XSRETURN_EMPTY;


void
vtkMergeFilter::SetTensors(arg1)
		vtkDataSet *	arg1
		CODE:
		THIS->SetTensors(arg1);
		XSRETURN_EMPTY;


void
vtkMergeFilter::SetVectors(arg1)
		vtkDataSet *	arg1
		CODE:
		THIS->SetVectors(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::MergeDataObjectFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkMergeDataObjectFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataObject *
vtkMergeDataObjectFilter::GetDataObject()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataObject";
		CODE:
		RETVAL = THIS->GetDataObject();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkMergeDataObjectFilter::GetOutputField()
		CODE:
		RETVAL = THIS->GetOutputField();
		OUTPUT:
		RETVAL


static vtkMergeDataObjectFilter*
vtkMergeDataObjectFilter::New()
		CODE:
		RETVAL = vtkMergeDataObjectFilter::New();
		OUTPUT:
		RETVAL


void
vtkMergeDataObjectFilter::SetDataObject(object)
		vtkDataObject *	object
		CODE:
		THIS->SetDataObject(object);
		XSRETURN_EMPTY;


void
vtkMergeDataObjectFilter::SetOutputField(arg1)
		int 	arg1
		CODE:
		THIS->SetOutputField(arg1);
		XSRETURN_EMPTY;


void
vtkMergeDataObjectFilter::SetOutputFieldToCellDataField()
		CODE:
		THIS->SetOutputFieldToCellDataField();
		XSRETURN_EMPTY;


void
vtkMergeDataObjectFilter::SetOutputFieldToDataObjectField()
		CODE:
		THIS->SetOutputFieldToDataObjectField();
		XSRETURN_EMPTY;


void
vtkMergeDataObjectFilter::SetOutputFieldToPointDataField()
		CODE:
		THIS->SetOutputFieldToPointDataField();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::MergePoints PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkMergePoints::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkMergePoints::IsInsertedPoint(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		RETVAL = THIS->IsInsertedPoint(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkMergePoints::IsInsertedPoint\n");



static vtkMergePoints*
vtkMergePoints::New()
		CODE:
		RETVAL = vtkMergePoints::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::OBBDicer PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkOBBDicer::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkOBBDicer*
vtkOBBDicer::New()
		CODE:
		RETVAL = vtkOBBDicer::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::OBBTree PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkOBBTree::BuildLocator()
		CODE:
		THIS->BuildLocator();
		XSRETURN_EMPTY;


void
vtkOBBTree::FreeSearchStructure()
		CODE:
		THIS->FreeSearchStructure();
		XSRETURN_EMPTY;


void
vtkOBBTree::GenerateRepresentation(level, pd)
		int 	level
		vtkPolyData *	pd
		CODE:
		THIS->GenerateRepresentation(level, pd);
		XSRETURN_EMPTY;


const char *
vtkOBBTree::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkOBBTree*
vtkOBBTree::New()
		CODE:
		RETVAL = vtkOBBTree::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::OBJExporter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkOBJExporter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


char *
vtkOBJExporter::GetFilePrefix()
		CODE:
		RETVAL = THIS->GetFilePrefix();
		OUTPUT:
		RETVAL


static vtkOBJExporter*
vtkOBJExporter::New()
		CODE:
		RETVAL = vtkOBJExporter::New();
		OUTPUT:
		RETVAL


void
vtkOBJExporter::SetFilePrefix(arg1)
		char *	arg1
		CODE:
		THIS->SetFilePrefix(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::OutlineFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkOutlineFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkOutlineFilter*
vtkOutlineFilter::New()
		CODE:
		RETVAL = vtkOutlineFilter::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::OutlineSource PREFIX = vtk

PROTOTYPES: DISABLE



float  *
vtkOutlineSource::GetBounds()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetBounds();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


const char *
vtkOutlineSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkOutlineSource*
vtkOutlineSource::New()
		CODE:
		RETVAL = vtkOutlineSource::New();
		OUTPUT:
		RETVAL


void
vtkOutlineSource::SetBounds(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkOutlineSource::SetBounds\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::PLOT3DReader PREFIX = vtk

PROTOTYPES: DISABLE



float
vtkPLOT3DReader::GetAlpha()
		CODE:
		RETVAL = THIS->GetAlpha();
		OUTPUT:
		RETVAL


const char *
vtkPLOT3DReader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkPLOT3DReader::GetFileFormat()
		CODE:
		RETVAL = THIS->GetFileFormat();
		OUTPUT:
		RETVAL


float
vtkPLOT3DReader::GetFsmach()
		CODE:
		RETVAL = THIS->GetFsmach();
		OUTPUT:
		RETVAL


char *
vtkPLOT3DReader::GetFunctionFileName()
		CODE:
		RETVAL = THIS->GetFunctionFileName();
		OUTPUT:
		RETVAL


float
vtkPLOT3DReader::GetGamma()
		CODE:
		RETVAL = THIS->GetGamma();
		OUTPUT:
		RETVAL


int
vtkPLOT3DReader::GetGridNumber()
		CODE:
		RETVAL = THIS->GetGridNumber();
		OUTPUT:
		RETVAL


int
vtkPLOT3DReader::GetNumberOfGrids()
		CODE:
		RETVAL = THIS->GetNumberOfGrids();
		OUTPUT:
		RETVAL


char *
vtkPLOT3DReader::GetQFileName()
		CODE:
		RETVAL = THIS->GetQFileName();
		OUTPUT:
		RETVAL


float
vtkPLOT3DReader::GetR()
		CODE:
		RETVAL = THIS->GetR();
		OUTPUT:
		RETVAL


float
vtkPLOT3DReader::GetRe()
		CODE:
		RETVAL = THIS->GetRe();
		OUTPUT:
		RETVAL


int
vtkPLOT3DReader::GetScalarFunctionNumber()
		CODE:
		RETVAL = THIS->GetScalarFunctionNumber();
		OUTPUT:
		RETVAL


float
vtkPLOT3DReader::GetTime()
		CODE:
		RETVAL = THIS->GetTime();
		OUTPUT:
		RETVAL


float
vtkPLOT3DReader::GetUvinf()
		CODE:
		RETVAL = THIS->GetUvinf();
		OUTPUT:
		RETVAL


char *
vtkPLOT3DReader::GetVectorFunctionFileName()
		CODE:
		RETVAL = THIS->GetVectorFunctionFileName();
		OUTPUT:
		RETVAL


int
vtkPLOT3DReader::GetVectorFunctionNumber()
		CODE:
		RETVAL = THIS->GetVectorFunctionNumber();
		OUTPUT:
		RETVAL


float
vtkPLOT3DReader::GetVvinf()
		CODE:
		RETVAL = THIS->GetVvinf();
		OUTPUT:
		RETVAL


float
vtkPLOT3DReader::GetWvinf()
		CODE:
		RETVAL = THIS->GetWvinf();
		OUTPUT:
		RETVAL


char *
vtkPLOT3DReader::GetXYZFileName()
		CODE:
		RETVAL = THIS->GetXYZFileName();
		OUTPUT:
		RETVAL


static vtkPLOT3DReader*
vtkPLOT3DReader::New()
		CODE:
		RETVAL = vtkPLOT3DReader::New();
		OUTPUT:
		RETVAL


void
vtkPLOT3DReader::SetFileFormat(arg1)
		int 	arg1
		CODE:
		THIS->SetFileFormat(arg1);
		XSRETURN_EMPTY;


void
vtkPLOT3DReader::SetFunctionFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetFunctionFileName(arg1);
		XSRETURN_EMPTY;


void
vtkPLOT3DReader::SetGamma(arg1)
		float 	arg1
		CODE:
		THIS->SetGamma(arg1);
		XSRETURN_EMPTY;


void
vtkPLOT3DReader::SetGridNumber(arg1)
		int 	arg1
		CODE:
		THIS->SetGridNumber(arg1);
		XSRETURN_EMPTY;


void
vtkPLOT3DReader::SetQFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetQFileName(arg1);
		XSRETURN_EMPTY;


void
vtkPLOT3DReader::SetR(arg1)
		float 	arg1
		CODE:
		THIS->SetR(arg1);
		XSRETURN_EMPTY;


void
vtkPLOT3DReader::SetScalarFunctionNumber(arg1)
		int 	arg1
		CODE:
		THIS->SetScalarFunctionNumber(arg1);
		XSRETURN_EMPTY;


void
vtkPLOT3DReader::SetUvinf(arg1)
		float 	arg1
		CODE:
		THIS->SetUvinf(arg1);
		XSRETURN_EMPTY;


void
vtkPLOT3DReader::SetVectorFunctionFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetVectorFunctionFileName(arg1);
		XSRETURN_EMPTY;


void
vtkPLOT3DReader::SetVectorFunctionNumber(arg1)
		int 	arg1
		CODE:
		THIS->SetVectorFunctionNumber(arg1);
		XSRETURN_EMPTY;


void
vtkPLOT3DReader::SetVvinf(arg1)
		float 	arg1
		CODE:
		THIS->SetVvinf(arg1);
		XSRETURN_EMPTY;


void
vtkPLOT3DReader::SetWvinf(arg1)
		float 	arg1
		CODE:
		THIS->SetWvinf(arg1);
		XSRETURN_EMPTY;


void
vtkPLOT3DReader::SetXYZFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetXYZFileName(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Picker PREFIX = vtk

PROTOTYPES: DISABLE



vtkActorCollection *
vtkPicker::GetActors()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkActorCollection";
		CODE:
		RETVAL = THIS->GetActors();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


const char *
vtkPicker::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkPicker::GetDataSet()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetDataSet();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkAbstractMapper3D *
vtkPicker::GetMapper()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkAbstractMapper3D";
		CODE:
		RETVAL = THIS->GetMapper();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float  *
vtkPicker::GetMapperPosition()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetMapperPosition();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


vtkPoints *
vtkPicker::GetPickedPositions()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPoints";
		CODE:
		RETVAL = THIS->GetPickedPositions();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkProp3DCollection *
vtkPicker::GetProp3Ds()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkProp3DCollection";
		CODE:
		RETVAL = THIS->GetProp3Ds();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float
vtkPicker::GetTolerance()
		CODE:
		RETVAL = THIS->GetTolerance();
		OUTPUT:
		RETVAL


static vtkPicker*
vtkPicker::New()
		CODE:
		RETVAL = vtkPicker::New();
		OUTPUT:
		RETVAL


int
vtkPicker::Pick(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		float 	arg1
		float 	arg2
		float 	arg3
		vtkRenderer *	arg4
		CODE:
		RETVAL = THIS->Pick(arg1, arg2, arg3, arg4);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPicker::Pick\n");



void
vtkPicker::SetTolerance(arg1)
		float 	arg1
		CODE:
		THIS->SetTolerance(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::PiecewiseFunction PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkPiecewiseFunction::AddPoint(x, val)
		float 	x
		float 	val
		CODE:
		THIS->AddPoint(x, val);
		XSRETURN_EMPTY;


void
vtkPiecewiseFunction::AddSegment(x1, val1, x2, val2)
		float 	x1
		float 	val1
		float 	x2
		float 	val2
		CODE:
		THIS->AddSegment(x1, val1, x2, val2);
		XSRETURN_EMPTY;


void
vtkPiecewiseFunction::ClampingOff()
		CODE:
		THIS->ClampingOff();
		XSRETURN_EMPTY;


void
vtkPiecewiseFunction::ClampingOn()
		CODE:
		THIS->ClampingOn();
		XSRETURN_EMPTY;


void
vtkPiecewiseFunction::DeepCopy(f)
		vtkDataObject *	f
		CODE:
		THIS->DeepCopy(f);
		XSRETURN_EMPTY;


int
vtkPiecewiseFunction::GetClamping()
		CODE:
		RETVAL = THIS->GetClamping();
		OUTPUT:
		RETVAL


const char *
vtkPiecewiseFunction::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkPiecewiseFunction::GetDataObjectType()
		CODE:
		RETVAL = THIS->GetDataObjectType();
		OUTPUT:
		RETVAL


float
vtkPiecewiseFunction::GetFirstNonZeroValue()
		CODE:
		RETVAL = THIS->GetFirstNonZeroValue();
		OUTPUT:
		RETVAL


unsigned long
vtkPiecewiseFunction::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


int
vtkPiecewiseFunction::GetSize()
		CODE:
		RETVAL = THIS->GetSize();
		OUTPUT:
		RETVAL


const char *
vtkPiecewiseFunction::GetType()
		CODE:
		RETVAL = THIS->GetType();
		OUTPUT:
		RETVAL


float
vtkPiecewiseFunction::GetValue(x)
		float 	x
		CODE:
		RETVAL = THIS->GetValue(x);
		OUTPUT:
		RETVAL


void
vtkPiecewiseFunction::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


static vtkPiecewiseFunction*
vtkPiecewiseFunction::New()
		CODE:
		RETVAL = vtkPiecewiseFunction::New();
		OUTPUT:
		RETVAL


void
vtkPiecewiseFunction::RemoveAllPoints()
		CODE:
		THIS->RemoveAllPoints();
		XSRETURN_EMPTY;


void
vtkPiecewiseFunction::RemovePoint(x)
		float 	x
		CODE:
		THIS->RemovePoint(x);
		XSRETURN_EMPTY;


void
vtkPiecewiseFunction::SetClamping(arg1)
		int 	arg1
		CODE:
		THIS->SetClamping(arg1);
		XSRETURN_EMPTY;


void
vtkPiecewiseFunction::ShallowCopy(f)
		vtkDataObject *	f
		CODE:
		THIS->ShallowCopy(f);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::PlaneSource PREFIX = vtk

PROTOTYPES: DISABLE



float  *
vtkPlaneSource::GetCenter()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetCenter();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


const char *
vtkPlaneSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkPlaneSource::GetNormal()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetNormal();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkPlaneSource::GetOrigin()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetOrigin();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkPlaneSource::GetPoint1()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetPoint1();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkPlaneSource::GetPoint2()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetPoint2();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


void
vtkPlaneSource::GetResolution(xR, yR)
		int 	xR
		int 	yR
		CODE:
		THIS->GetResolution(xR, yR);
		XSRETURN_EMPTY;
		OUTPUT:
		xR
		yR


int
vtkPlaneSource::GetXResolution()
		CODE:
		RETVAL = THIS->GetXResolution();
		OUTPUT:
		RETVAL


int
vtkPlaneSource::GetYResolution()
		CODE:
		RETVAL = THIS->GetYResolution();
		OUTPUT:
		RETVAL


static vtkPlaneSource*
vtkPlaneSource::New()
		CODE:
		RETVAL = vtkPlaneSource::New();
		OUTPUT:
		RETVAL


void
vtkPlaneSource::Push(distance)
		float 	distance
		CODE:
		THIS->Push(distance);
		XSRETURN_EMPTY;


void
vtkPlaneSource::SetCenter(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetCenter(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPlaneSource::SetCenter\n");



void
vtkPlaneSource::SetNormal(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetNormal(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPlaneSource::SetNormal\n");



void
vtkPlaneSource::SetOrigin(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetOrigin(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPlaneSource::SetOrigin\n");



void
vtkPlaneSource::SetPoint1(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetPoint1(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPlaneSource::SetPoint1\n");



void
vtkPlaneSource::SetPoint2(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetPoint2(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPlaneSource::SetPoint2\n");



void
vtkPlaneSource::SetResolution(xR, yR)
		int 	xR
		int 	yR
		CODE:
		THIS->SetResolution(xR, yR);
		XSRETURN_EMPTY;


void
vtkPlaneSource::SetXResolution(arg1)
		int 	arg1
		CODE:
		THIS->SetXResolution(arg1);
		XSRETURN_EMPTY;


void
vtkPlaneSource::SetYResolution(arg1)
		int 	arg1
		CODE:
		THIS->SetYResolution(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Planes PREFIX = vtk

PROTOTYPES: DISABLE



float
vtkPlanes::EvaluateFunction(arg1 = 0, arg2 = 0, arg3 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkPlanes::EvaluateFunction\n");



const char *
vtkPlanes::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkNormals *
vtkPlanes::GetNormals()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkNormals";
		CODE:
		RETVAL = THIS->GetNormals();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkPlanes::GetNumberOfPlanes()
		CODE:
		RETVAL = THIS->GetNumberOfPlanes();
		OUTPUT:
		RETVAL


vtkPlane *
vtkPlanes::GetPlane(i)
		int 	i
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPlane";
		CODE:
		RETVAL = THIS->GetPlane(i);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkPoints *
vtkPlanes::GetPoints()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPoints";
		CODE:
		RETVAL = THIS->GetPoints();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkPlanes*
vtkPlanes::New()
		CODE:
		RETVAL = vtkPlanes::New();
		OUTPUT:
		RETVAL


void
vtkPlanes::SetFrustumPlanes(aspect, camera)
		float 	aspect
		vtkCamera *	camera
		CODE:
		THIS->SetFrustumPlanes(aspect, camera);
		XSRETURN_EMPTY;


void
vtkPlanes::SetNormals(arg1)
		vtkNormals *	arg1
		CODE:
		THIS->SetNormals(arg1);
		XSRETURN_EMPTY;


void
vtkPlanes::SetPoints(arg1)
		vtkPoints *	arg1
		CODE:
		THIS->SetPoints(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::PointDataToCellData PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkPointDataToCellData::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkPointDataToCellData::GetPassPointData()
		CODE:
		RETVAL = THIS->GetPassPointData();
		OUTPUT:
		RETVAL


static vtkPointDataToCellData*
vtkPointDataToCellData::New()
		CODE:
		RETVAL = vtkPointDataToCellData::New();
		OUTPUT:
		RETVAL


void
vtkPointDataToCellData::PassPointDataOff()
		CODE:
		THIS->PassPointDataOff();
		XSRETURN_EMPTY;


void
vtkPointDataToCellData::PassPointDataOn()
		CODE:
		THIS->PassPointDataOn();
		XSRETURN_EMPTY;


void
vtkPointDataToCellData::SetPassPointData(arg1)
		int 	arg1
		CODE:
		THIS->SetPassPointData(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::PointLoad PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkPointLoad::ComputeEffectiveStressOff()
		CODE:
		THIS->ComputeEffectiveStressOff();
		XSRETURN_EMPTY;


void
vtkPointLoad::ComputeEffectiveStressOn()
		CODE:
		THIS->ComputeEffectiveStressOn();
		XSRETURN_EMPTY;


const char *
vtkPointLoad::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkPointLoad::GetComputeEffectiveStress()
		CODE:
		RETVAL = THIS->GetComputeEffectiveStress();
		OUTPUT:
		RETVAL


float
vtkPointLoad::GetLoadValue()
		CODE:
		RETVAL = THIS->GetLoadValue();
		OUTPUT:
		RETVAL


float  *
vtkPointLoad::GetModelBounds()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetModelBounds();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


float
vtkPointLoad::GetPoissonsRatio()
		CODE:
		RETVAL = THIS->GetPoissonsRatio();
		OUTPUT:
		RETVAL


int  *
vtkPointLoad::GetSampleDimensions()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetSampleDimensions();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


static vtkPointLoad*
vtkPointLoad::New()
		CODE:
		RETVAL = vtkPointLoad::New();
		OUTPUT:
		RETVAL


void
vtkPointLoad::SetComputeEffectiveStress(arg1)
		int 	arg1
		CODE:
		THIS->SetComputeEffectiveStress(arg1);
		XSRETURN_EMPTY;


void
vtkPointLoad::SetLoadValue(arg1)
		float 	arg1
		CODE:
		THIS->SetLoadValue(arg1);
		XSRETURN_EMPTY;


void
vtkPointLoad::SetModelBounds(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		float  	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		float 	arg6
		CODE:
		THIS->SetModelBounds(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPointLoad::SetModelBounds\n");



void
vtkPointLoad::SetPoissonsRatio(arg1)
		float 	arg1
		CODE:
		THIS->SetPoissonsRatio(arg1);
		XSRETURN_EMPTY;


void
vtkPointLoad::SetSampleDimensions(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetSampleDimensions(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPointLoad::SetSampleDimensions\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::PointPicker PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkPointPicker::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkPointPicker::GetPointId()
		CODE:
		RETVAL = THIS->GetPointId();
		OUTPUT:
		RETVAL


static vtkPointPicker*
vtkPointPicker::New()
		CODE:
		RETVAL = vtkPointPicker::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::PointSetSource PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkPointSetSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkPointSet *
vtkPointSetSource::GetOutput(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPointSet";
		CODE:
		RETVAL = THIS->GetOutput(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE: items == 1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPointSet";
		CODE:
		RETVAL = THIS->GetOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPointSetSource::GetOutput\n");



static vtkPointSetSource*
vtkPointSetSource::New()
		CODE:
		RETVAL = vtkPointSetSource::New();
		OUTPUT:
		RETVAL


void
vtkPointSetSource::SetOutput(output)
		vtkPointSet *	output
		CODE:
		THIS->SetOutput(output);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::PointSource PREFIX = vtk

PROTOTYPES: DISABLE



float  *
vtkPointSource::GetCenter()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetCenter();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


const char *
vtkPointSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkPointSource::GetDistribution()
		CODE:
		RETVAL = THIS->GetDistribution();
		OUTPUT:
		RETVAL


int
vtkPointSource::GetNumberOfPoints()
		CODE:
		RETVAL = THIS->GetNumberOfPoints();
		OUTPUT:
		RETVAL


float
vtkPointSource::GetRadius()
		CODE:
		RETVAL = THIS->GetRadius();
		OUTPUT:
		RETVAL


static vtkPointSource*
vtkPointSource::New()
		CODE:
		RETVAL = vtkPointSource::New();
		OUTPUT:
		RETVAL


void
vtkPointSource::SetCenter(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetCenter(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPointSource::SetCenter\n");



void
vtkPointSource::SetDistribution(arg1)
		int 	arg1
		CODE:
		THIS->SetDistribution(arg1);
		XSRETURN_EMPTY;


void
vtkPointSource::SetDistributionToShell()
		CODE:
		THIS->SetDistributionToShell();
		XSRETURN_EMPTY;


void
vtkPointSource::SetDistributionToUniform()
		CODE:
		THIS->SetDistributionToUniform();
		XSRETURN_EMPTY;


void
vtkPointSource::SetNumberOfPoints(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfPoints(arg1);
		XSRETURN_EMPTY;


void
vtkPointSource::SetRadius(arg1)
		float 	arg1
		CODE:
		THIS->SetRadius(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::PolyDataCollection PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkPolyDataCollection::AddItem(arg1 = 0)
	CASE: items == 2
		vtkPolyData *	arg1
		CODE:
		THIS->AddItem(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPolyDataCollection::AddItem\n");



const char *
vtkPolyDataCollection::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkPolyData *
vtkPolyDataCollection::GetNextItem()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPolyData";
		CODE:
		RETVAL = THIS->GetNextItem();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkPolyDataCollection*
vtkPolyDataCollection::New()
		CODE:
		RETVAL = vtkPolyDataCollection::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::PolyDataConnectivityFilter PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkPolyDataConnectivityFilter::AddSeed(id)
		int 	id
		CODE:
		THIS->AddSeed(id);
		XSRETURN_EMPTY;


void
vtkPolyDataConnectivityFilter::AddSpecifiedRegion(id)
		int 	id
		CODE:
		THIS->AddSpecifiedRegion(id);
		XSRETURN_EMPTY;


void
vtkPolyDataConnectivityFilter::ColorRegionsOff()
		CODE:
		THIS->ColorRegionsOff();
		XSRETURN_EMPTY;


void
vtkPolyDataConnectivityFilter::ColorRegionsOn()
		CODE:
		THIS->ColorRegionsOn();
		XSRETURN_EMPTY;


void
vtkPolyDataConnectivityFilter::DeleteSeed(id)
		int 	id
		CODE:
		THIS->DeleteSeed(id);
		XSRETURN_EMPTY;


void
vtkPolyDataConnectivityFilter::DeleteSpecifiedRegion(id)
		int 	id
		CODE:
		THIS->DeleteSpecifiedRegion(id);
		XSRETURN_EMPTY;


const char *
vtkPolyDataConnectivityFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkPolyDataConnectivityFilter::GetClosestPoint()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetClosestPoint();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkPolyDataConnectivityFilter::GetColorRegions()
		CODE:
		RETVAL = THIS->GetColorRegions();
		OUTPUT:
		RETVAL


int
vtkPolyDataConnectivityFilter::GetExtractionMode()
		CODE:
		RETVAL = THIS->GetExtractionMode();
		OUTPUT:
		RETVAL


const char *
vtkPolyDataConnectivityFilter::GetExtractionModeAsString()
		CODE:
		RETVAL = THIS->GetExtractionModeAsString();
		OUTPUT:
		RETVAL


int
vtkPolyDataConnectivityFilter::GetMaxRecursionDepth()
		CODE:
		RETVAL = THIS->GetMaxRecursionDepth();
		OUTPUT:
		RETVAL


int
vtkPolyDataConnectivityFilter::GetNumberOfExtractedRegions()
		CODE:
		RETVAL = THIS->GetNumberOfExtractedRegions();
		OUTPUT:
		RETVAL


int
vtkPolyDataConnectivityFilter::GetScalarConnectivity()
		CODE:
		RETVAL = THIS->GetScalarConnectivity();
		OUTPUT:
		RETVAL


float  *
vtkPolyDataConnectivityFilter::GetScalarRange()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetScalarRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


void
vtkPolyDataConnectivityFilter::InitializeSeedList()
		CODE:
		THIS->InitializeSeedList();
		XSRETURN_EMPTY;


void
vtkPolyDataConnectivityFilter::InitializeSpecifiedRegionList()
		CODE:
		THIS->InitializeSpecifiedRegionList();
		XSRETURN_EMPTY;


static vtkPolyDataConnectivityFilter*
vtkPolyDataConnectivityFilter::New()
		CODE:
		RETVAL = vtkPolyDataConnectivityFilter::New();
		OUTPUT:
		RETVAL


void
vtkPolyDataConnectivityFilter::ScalarConnectivityOff()
		CODE:
		THIS->ScalarConnectivityOff();
		XSRETURN_EMPTY;


void
vtkPolyDataConnectivityFilter::ScalarConnectivityOn()
		CODE:
		THIS->ScalarConnectivityOn();
		XSRETURN_EMPTY;


void
vtkPolyDataConnectivityFilter::SetClosestPoint(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetClosestPoint(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPolyDataConnectivityFilter::SetClosestPoint\n");



void
vtkPolyDataConnectivityFilter::SetColorRegions(arg1)
		int 	arg1
		CODE:
		THIS->SetColorRegions(arg1);
		XSRETURN_EMPTY;


void
vtkPolyDataConnectivityFilter::SetExtractionMode(arg1)
		int 	arg1
		CODE:
		THIS->SetExtractionMode(arg1);
		XSRETURN_EMPTY;


void
vtkPolyDataConnectivityFilter::SetExtractionModeToAllRegions()
		CODE:
		THIS->SetExtractionModeToAllRegions();
		XSRETURN_EMPTY;


void
vtkPolyDataConnectivityFilter::SetExtractionModeToCellSeededRegions()
		CODE:
		THIS->SetExtractionModeToCellSeededRegions();
		XSRETURN_EMPTY;


void
vtkPolyDataConnectivityFilter::SetExtractionModeToClosestPointRegion()
		CODE:
		THIS->SetExtractionModeToClosestPointRegion();
		XSRETURN_EMPTY;


void
vtkPolyDataConnectivityFilter::SetExtractionModeToLargestRegion()
		CODE:
		THIS->SetExtractionModeToLargestRegion();
		XSRETURN_EMPTY;


void
vtkPolyDataConnectivityFilter::SetExtractionModeToPointSeededRegions()
		CODE:
		THIS->SetExtractionModeToPointSeededRegions();
		XSRETURN_EMPTY;


void
vtkPolyDataConnectivityFilter::SetExtractionModeToSpecifiedRegions()
		CODE:
		THIS->SetExtractionModeToSpecifiedRegions();
		XSRETURN_EMPTY;


void
vtkPolyDataConnectivityFilter::SetScalarConnectivity(arg1)
		int 	arg1
		CODE:
		THIS->SetScalarConnectivity(arg1);
		XSRETURN_EMPTY;


void
vtkPolyDataConnectivityFilter::SetScalarRange(arg1_0, arg1_1)
		float	arg1_0
		float	arg1_1
		CODE:
		float arg1[] = { arg1_0, arg1_1};
		THIS->SetScalarRange(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::PolyDataMapper PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkPolyDataMapper::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkPolyDataMapper::GetGhostLevel()
		CODE:
		RETVAL = THIS->GetGhostLevel();
		OUTPUT:
		RETVAL


vtkPolyData *
vtkPolyDataMapper::GetInput()
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


int
vtkPolyDataMapper::GetNumberOfPieces()
		CODE:
		RETVAL = THIS->GetNumberOfPieces();
		OUTPUT:
		RETVAL


int
vtkPolyDataMapper::GetPiece()
		CODE:
		RETVAL = THIS->GetPiece();
		OUTPUT:
		RETVAL


static vtkPolyDataMapper*
vtkPolyDataMapper::New()
		CODE:
		RETVAL = vtkPolyDataMapper::New();
		OUTPUT:
		RETVAL


void
vtkPolyDataMapper::Render(arg1, arg2)
		vtkRenderer *	arg1
		vtkActor *	arg2
		CODE:
		THIS->Render(arg1, arg2);
		XSRETURN_EMPTY;


void
vtkPolyDataMapper::SetGhostLevel(arg1)
		int 	arg1
		CODE:
		THIS->SetGhostLevel(arg1);
		XSRETURN_EMPTY;


void
vtkPolyDataMapper::SetInput(in)
		vtkPolyData *	in
		CODE:
		THIS->SetInput(in);
		XSRETURN_EMPTY;


void
vtkPolyDataMapper::SetNumberOfPieces(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfPieces(arg1);
		XSRETURN_EMPTY;


void
vtkPolyDataMapper::SetPiece(arg1)
		int 	arg1
		CODE:
		THIS->SetPiece(arg1);
		XSRETURN_EMPTY;


void
vtkPolyDataMapper::Update()
		CODE:
		THIS->Update();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::PolyDataNormals PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkPolyDataNormals::ComputeCellNormalsOff()
		CODE:
		THIS->ComputeCellNormalsOff();
		XSRETURN_EMPTY;


void
vtkPolyDataNormals::ComputeCellNormalsOn()
		CODE:
		THIS->ComputeCellNormalsOn();
		XSRETURN_EMPTY;


void
vtkPolyDataNormals::ComputePointNormalsOff()
		CODE:
		THIS->ComputePointNormalsOff();
		XSRETURN_EMPTY;


void
vtkPolyDataNormals::ComputePointNormalsOn()
		CODE:
		THIS->ComputePointNormalsOn();
		XSRETURN_EMPTY;


void
vtkPolyDataNormals::ConsistencyOff()
		CODE:
		THIS->ConsistencyOff();
		XSRETURN_EMPTY;


void
vtkPolyDataNormals::ConsistencyOn()
		CODE:
		THIS->ConsistencyOn();
		XSRETURN_EMPTY;


void
vtkPolyDataNormals::FlipNormalsOff()
		CODE:
		THIS->FlipNormalsOff();
		XSRETURN_EMPTY;


void
vtkPolyDataNormals::FlipNormalsOn()
		CODE:
		THIS->FlipNormalsOn();
		XSRETURN_EMPTY;


const char *
vtkPolyDataNormals::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkPolyDataNormals::GetComputeCellNormals()
		CODE:
		RETVAL = THIS->GetComputeCellNormals();
		OUTPUT:
		RETVAL


int
vtkPolyDataNormals::GetComputePointNormals()
		CODE:
		RETVAL = THIS->GetComputePointNormals();
		OUTPUT:
		RETVAL


int
vtkPolyDataNormals::GetConsistency()
		CODE:
		RETVAL = THIS->GetConsistency();
		OUTPUT:
		RETVAL


float
vtkPolyDataNormals::GetFeatureAngle()
		CODE:
		RETVAL = THIS->GetFeatureAngle();
		OUTPUT:
		RETVAL


int
vtkPolyDataNormals::GetFlipNormals()
		CODE:
		RETVAL = THIS->GetFlipNormals();
		OUTPUT:
		RETVAL


int
vtkPolyDataNormals::GetMaxRecursionDepth()
		CODE:
		RETVAL = THIS->GetMaxRecursionDepth();
		OUTPUT:
		RETVAL


int
vtkPolyDataNormals::GetNonManifoldTraversal()
		CODE:
		RETVAL = THIS->GetNonManifoldTraversal();
		OUTPUT:
		RETVAL


int
vtkPolyDataNormals::GetSplitting()
		CODE:
		RETVAL = THIS->GetSplitting();
		OUTPUT:
		RETVAL


static vtkPolyDataNormals*
vtkPolyDataNormals::New()
		CODE:
		RETVAL = vtkPolyDataNormals::New();
		OUTPUT:
		RETVAL


void
vtkPolyDataNormals::NonManifoldTraversalOff()
		CODE:
		THIS->NonManifoldTraversalOff();
		XSRETURN_EMPTY;


void
vtkPolyDataNormals::NonManifoldTraversalOn()
		CODE:
		THIS->NonManifoldTraversalOn();
		XSRETURN_EMPTY;


void
vtkPolyDataNormals::SetComputeCellNormals(arg1)
		int 	arg1
		CODE:
		THIS->SetComputeCellNormals(arg1);
		XSRETURN_EMPTY;


void
vtkPolyDataNormals::SetComputePointNormals(arg1)
		int 	arg1
		CODE:
		THIS->SetComputePointNormals(arg1);
		XSRETURN_EMPTY;


void
vtkPolyDataNormals::SetConsistency(arg1)
		int 	arg1
		CODE:
		THIS->SetConsistency(arg1);
		XSRETURN_EMPTY;


void
vtkPolyDataNormals::SetFeatureAngle(arg1)
		float 	arg1
		CODE:
		THIS->SetFeatureAngle(arg1);
		XSRETURN_EMPTY;


void
vtkPolyDataNormals::SetFlipNormals(arg1)
		int 	arg1
		CODE:
		THIS->SetFlipNormals(arg1);
		XSRETURN_EMPTY;


void
vtkPolyDataNormals::SetMaxRecursionDepth(arg1)
		int 	arg1
		CODE:
		THIS->SetMaxRecursionDepth(arg1);
		XSRETURN_EMPTY;


void
vtkPolyDataNormals::SetNonManifoldTraversal(arg1)
		int 	arg1
		CODE:
		THIS->SetNonManifoldTraversal(arg1);
		XSRETURN_EMPTY;


void
vtkPolyDataNormals::SetSplitting(arg1)
		int 	arg1
		CODE:
		THIS->SetSplitting(arg1);
		XSRETURN_EMPTY;


void
vtkPolyDataNormals::SplittingOff()
		CODE:
		THIS->SplittingOff();
		XSRETURN_EMPTY;


void
vtkPolyDataNormals::SplittingOn()
		CODE:
		THIS->SplittingOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::PolyDataReader PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkPolyDataReader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkPolyData *
vtkPolyDataReader::GetOutput(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPolyData";
		CODE:
		RETVAL = THIS->GetOutput(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE: items == 1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPolyData";
		CODE:
		RETVAL = THIS->GetOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPolyDataReader::GetOutput\n");



static vtkPolyDataReader*
vtkPolyDataReader::New()
		CODE:
		RETVAL = vtkPolyDataReader::New();
		OUTPUT:
		RETVAL


void
vtkPolyDataReader::SetOutput(output)
		vtkPolyData *	output
		CODE:
		THIS->SetOutput(output);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::PolyDataStreamer PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkPolyDataStreamer::ColorByPieceOff()
		CODE:
		THIS->ColorByPieceOff();
		XSRETURN_EMPTY;


void
vtkPolyDataStreamer::ColorByPieceOn()
		CODE:
		THIS->ColorByPieceOn();
		XSRETURN_EMPTY;


const char *
vtkPolyDataStreamer::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkPolyDataStreamer::GetColorByPiece()
		CODE:
		RETVAL = THIS->GetColorByPiece();
		OUTPUT:
		RETVAL


int
vtkPolyDataStreamer::GetNumberOfStreamDivisions()
		CODE:
		RETVAL = THIS->GetNumberOfStreamDivisions();
		OUTPUT:
		RETVAL


static vtkPolyDataStreamer*
vtkPolyDataStreamer::New()
		CODE:
		RETVAL = vtkPolyDataStreamer::New();
		OUTPUT:
		RETVAL


void
vtkPolyDataStreamer::SetColorByPiece(arg1)
		int 	arg1
		CODE:
		THIS->SetColorByPiece(arg1);
		XSRETURN_EMPTY;


void
vtkPolyDataStreamer::SetNumberOfStreamDivisions(num)
		int 	num
		CODE:
		THIS->SetNumberOfStreamDivisions(num);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::PolyDataWriter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkPolyDataWriter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkPolyData *
vtkPolyDataWriter::GetInput()
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


static vtkPolyDataWriter*
vtkPolyDataWriter::New()
		CODE:
		RETVAL = vtkPolyDataWriter::New();
		OUTPUT:
		RETVAL


void
vtkPolyDataWriter::SetInput(input)
		vtkPolyData *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ProbeFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkProbeFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkProbeFilter::GetSource()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetSource();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkProbeFilter::GetSpatialMatch()
		CODE:
		RETVAL = THIS->GetSpatialMatch();
		OUTPUT:
		RETVAL


static vtkProbeFilter*
vtkProbeFilter::New()
		CODE:
		RETVAL = vtkProbeFilter::New();
		OUTPUT:
		RETVAL


void
vtkProbeFilter::SetSource(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::StructuredPoints")
		vtkStructuredPoints *	arg1
		CODE:
		THIS->SetSource(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::ImageData")
		vtkImageData *	arg1
		CODE:
		THIS->SetSource(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataSet")
		vtkDataSet *	arg1
		CODE:
		THIS->SetSource(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProbeFilter::SetSource\n");



void
vtkProbeFilter::SetSpatialMatch(arg1)
		int 	arg1
		CODE:
		THIS->SetSpatialMatch(arg1);
		XSRETURN_EMPTY;


void
vtkProbeFilter::SpatialMatchOff()
		CODE:
		THIS->SpatialMatchOff();
		XSRETURN_EMPTY;


void
vtkProbeFilter::SpatialMatchOn()
		CODE:
		THIS->SpatialMatchOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ProgrammableAttributeDataFilter PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkProgrammableAttributeDataFilter::AddInput(arg1 = 0)
	CASE: items == 2
		vtkDataSet *	arg1
		CODE:
		THIS->AddInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProgrammableAttributeDataFilter::AddInput\n");



const char *
vtkProgrammableAttributeDataFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataSetCollection *
vtkProgrammableAttributeDataFilter::GetInputList()
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


static vtkProgrammableAttributeDataFilter*
vtkProgrammableAttributeDataFilter::New()
		CODE:
		RETVAL = vtkProgrammableAttributeDataFilter::New();
		OUTPUT:
		RETVAL


void
vtkProgrammableAttributeDataFilter::RemoveInput(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataSet")
		vtkDataSet *	arg1
		CODE:
		THIS->RemoveInput(* arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataSet")
		vtkDataSet *	arg1
		CODE:
		THIS->RemoveInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProgrammableAttributeDataFilter::RemoveInput\n");



void
vtkProgrammableAttributeDataFilter::SetExecuteMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetExecuteMethod",0), newRV(func), 0);
		}
		THIS->SetExecuteMethod(callperlsub, func);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ProgrammableDataObjectSource PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkProgrammableDataObjectSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataObject *
vtkProgrammableDataObjectSource::GetOutput(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataObject";
		CODE:
		RETVAL = THIS->GetOutput(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE: items == 1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataObject";
		CODE:
		RETVAL = THIS->GetOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProgrammableDataObjectSource::GetOutput\n");



static vtkProgrammableDataObjectSource*
vtkProgrammableDataObjectSource::New()
		CODE:
		RETVAL = vtkProgrammableDataObjectSource::New();
		OUTPUT:
		RETVAL


void
vtkProgrammableDataObjectSource::SetExecuteMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetExecuteMethod",0), newRV(func), 0);
		}
		THIS->SetExecuteMethod(callperlsub, func);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ProgrammableFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkProgrammableFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkPolyData *
vtkProgrammableFilter::GetPolyDataInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPolyData";
		CODE:
		RETVAL = THIS->GetPolyDataInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkRectilinearGrid *
vtkProgrammableFilter::GetRectilinearGridInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkRectilinearGrid";
		CODE:
		RETVAL = THIS->GetRectilinearGridInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkStructuredGrid *
vtkProgrammableFilter::GetStructuredGridInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredGrid";
		CODE:
		RETVAL = THIS->GetStructuredGridInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkStructuredPoints *
vtkProgrammableFilter::GetStructuredPointsInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredPoints";
		CODE:
		RETVAL = THIS->GetStructuredPointsInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkUnstructuredGrid *
vtkProgrammableFilter::GetUnstructuredGridInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkUnstructuredGrid";
		CODE:
		RETVAL = THIS->GetUnstructuredGridInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkProgrammableFilter*
vtkProgrammableFilter::New()
		CODE:
		RETVAL = vtkProgrammableFilter::New();
		OUTPUT:
		RETVAL


void
vtkProgrammableFilter::SetExecuteMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetExecuteMethod",0), newRV(func), 0);
		}
		THIS->SetExecuteMethod(callperlsub, func);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ProgrammableGlyphFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkProgrammableGlyphFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkProgrammableGlyphFilter::GetColorMode()
		CODE:
		RETVAL = THIS->GetColorMode();
		OUTPUT:
		RETVAL


const char *
vtkProgrammableGlyphFilter::GetColorModeAsString()
		CODE:
		RETVAL = THIS->GetColorModeAsString();
		OUTPUT:
		RETVAL


float  *
vtkProgrammableGlyphFilter::GetPoint()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetPoint();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


vtkPointData *
vtkProgrammableGlyphFilter::GetPointData()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPointData";
		CODE:
		RETVAL = THIS->GetPointData();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkProgrammableGlyphFilter::GetPointId()
		CODE:
		RETVAL = THIS->GetPointId();
		OUTPUT:
		RETVAL


vtkPolyData *
vtkProgrammableGlyphFilter::GetSource()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPolyData";
		CODE:
		RETVAL = THIS->GetSource();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkProgrammableGlyphFilter*
vtkProgrammableGlyphFilter::New()
		CODE:
		RETVAL = vtkProgrammableGlyphFilter::New();
		OUTPUT:
		RETVAL


void
vtkProgrammableGlyphFilter::SetColorMode(arg1)
		int 	arg1
		CODE:
		THIS->SetColorMode(arg1);
		XSRETURN_EMPTY;


void
vtkProgrammableGlyphFilter::SetColorModeToColorByInput()
		CODE:
		THIS->SetColorModeToColorByInput();
		XSRETURN_EMPTY;


void
vtkProgrammableGlyphFilter::SetColorModeToColorBySource()
		CODE:
		THIS->SetColorModeToColorBySource();
		XSRETURN_EMPTY;


void
vtkProgrammableGlyphFilter::SetGlyphMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetGlyphMethod",0), newRV(func), 0);
		}
		THIS->SetGlyphMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkProgrammableGlyphFilter::SetSource(source)
		vtkPolyData *	source
		CODE:
		THIS->SetSource(source);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ProgrammableSource PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkProgrammableSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkPolyData *
vtkProgrammableSource::GetPolyDataOutput()
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
vtkProgrammableSource::GetRectilinearGridOutput()
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


vtkStructuredGrid *
vtkProgrammableSource::GetStructuredGridOutput()
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
vtkProgrammableSource::GetStructuredPointsOutput()
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


vtkUnstructuredGrid *
vtkProgrammableSource::GetUnstructuredGridOutput()
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


static vtkProgrammableSource*
vtkProgrammableSource::New()
		CODE:
		RETVAL = vtkProgrammableSource::New();
		OUTPUT:
		RETVAL


void
vtkProgrammableSource::SetExecuteMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetExecuteMethod",0), newRV(func), 0);
		}
		THIS->SetExecuteMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkProgrammableSource::UpdateData(output)
		vtkDataObject *	output
		CODE:
		THIS->UpdateData(output);
		XSRETURN_EMPTY;


void
vtkProgrammableSource::UpdateInformation()
		CODE:
		THIS->UpdateInformation();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ProjectedPolyDataRayBounder PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkProjectedPolyDataRayBounder::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


unsigned long
vtkProjectedPolyDataRayBounder::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


vtkPolyData *
vtkProjectedPolyDataRayBounder::GetPolyData()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPolyData";
		CODE:
		RETVAL = THIS->GetPolyData();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkProjectedPolyDataRayBounder*
vtkProjectedPolyDataRayBounder::New()
		CODE:
		RETVAL = vtkProjectedPolyDataRayBounder::New();
		OUTPUT:
		RETVAL


void
vtkProjectedPolyDataRayBounder::SetMatrixSource(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::Volume")
		vtkVolume *	arg1
		CODE:
		THIS->SetMatrixSource(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::Actor")
		vtkActor *	arg1
		CODE:
		THIS->SetMatrixSource(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProjectedPolyDataRayBounder::SetMatrixSource\n");



void
vtkProjectedPolyDataRayBounder::SetPolyData(arg1)
		vtkPolyData *	arg1
		CODE:
		THIS->SetPolyData(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Property PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkProperty::BackfaceCullingOff()
		CODE:
		THIS->BackfaceCullingOff();
		XSRETURN_EMPTY;


void
vtkProperty::BackfaceCullingOn()
		CODE:
		THIS->BackfaceCullingOn();
		XSRETURN_EMPTY;


void
vtkProperty::BackfaceRender(arg1, arg2)
		vtkActor *	arg1
		vtkRenderer *	arg2
		CODE:
		THIS->BackfaceRender(arg1, arg2);
		XSRETURN_EMPTY;


void
vtkProperty::DeepCopy(p)
		vtkProperty *	p
		CODE:
		THIS->DeepCopy(p);
		XSRETURN_EMPTY;


void
vtkProperty::EdgeVisibilityOff()
		CODE:
		THIS->EdgeVisibilityOff();
		XSRETURN_EMPTY;


void
vtkProperty::EdgeVisibilityOn()
		CODE:
		THIS->EdgeVisibilityOn();
		XSRETURN_EMPTY;


void
vtkProperty::FrontfaceCullingOff()
		CODE:
		THIS->FrontfaceCullingOff();
		XSRETURN_EMPTY;


void
vtkProperty::FrontfaceCullingOn()
		CODE:
		THIS->FrontfaceCullingOn();
		XSRETURN_EMPTY;


float
vtkProperty::GetAmbient()
		CODE:
		RETVAL = THIS->GetAmbient();
		OUTPUT:
		RETVAL


float  *
vtkProperty::GetAmbientColor()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetAmbientColor();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkProperty::GetBackfaceCulling()
		CODE:
		RETVAL = THIS->GetBackfaceCulling();
		OUTPUT:
		RETVAL


const char *
vtkProperty::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float *
vtkProperty::GetColor()
	CASE: items == 1
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetColor();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float
vtkProperty::GetDiffuse()
		CODE:
		RETVAL = THIS->GetDiffuse();
		OUTPUT:
		RETVAL


float  *
vtkProperty::GetDiffuseColor()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetDiffuseColor();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkProperty::GetEdgeColor()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetEdgeColor();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkProperty::GetEdgeVisibility()
		CODE:
		RETVAL = THIS->GetEdgeVisibility();
		OUTPUT:
		RETVAL


int
vtkProperty::GetFrontfaceCulling()
		CODE:
		RETVAL = THIS->GetFrontfaceCulling();
		OUTPUT:
		RETVAL


int
vtkProperty::GetInterpolation()
		CODE:
		RETVAL = THIS->GetInterpolation();
		OUTPUT:
		RETVAL


char *
vtkProperty::GetInterpolationAsString()
		CODE:
		RETVAL = THIS->GetInterpolationAsString();
		OUTPUT:
		RETVAL


float
vtkProperty::GetLineWidth()
		CODE:
		RETVAL = THIS->GetLineWidth();
		OUTPUT:
		RETVAL


float
vtkProperty::GetOpacity()
		CODE:
		RETVAL = THIS->GetOpacity();
		OUTPUT:
		RETVAL


float
vtkProperty::GetPointSize()
		CODE:
		RETVAL = THIS->GetPointSize();
		OUTPUT:
		RETVAL


int
vtkProperty::GetRepresentation()
		CODE:
		RETVAL = THIS->GetRepresentation();
		OUTPUT:
		RETVAL


char *
vtkProperty::GetRepresentationAsString()
		CODE:
		RETVAL = THIS->GetRepresentationAsString();
		OUTPUT:
		RETVAL


float
vtkProperty::GetSpecular()
		CODE:
		RETVAL = THIS->GetSpecular();
		OUTPUT:
		RETVAL


float  *
vtkProperty::GetSpecularColor()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetSpecularColor();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float
vtkProperty::GetSpecularPower()
		CODE:
		RETVAL = THIS->GetSpecularPower();
		OUTPUT:
		RETVAL


static vtkProperty*
vtkProperty::New()
		CODE:
		RETVAL = vtkProperty::New();
		OUTPUT:
		RETVAL


void
vtkProperty::Render(arg1, arg2)
		vtkActor *	arg1
		vtkRenderer *	arg2
		CODE:
		THIS->Render(arg1, arg2);
		XSRETURN_EMPTY;


void
vtkProperty::SetAmbient(arg1)
		float 	arg1
		CODE:
		THIS->SetAmbient(arg1);
		XSRETURN_EMPTY;


void
vtkProperty::SetAmbientColor(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetAmbientColor(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProperty::SetAmbientColor\n");



void
vtkProperty::SetBackfaceCulling(arg1)
		int 	arg1
		CODE:
		THIS->SetBackfaceCulling(arg1);
		XSRETURN_EMPTY;


void
vtkProperty::SetColor(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetColor(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProperty::SetColor\n");



void
vtkProperty::SetDiffuse(arg1)
		float 	arg1
		CODE:
		THIS->SetDiffuse(arg1);
		XSRETURN_EMPTY;


void
vtkProperty::SetDiffuseColor(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetDiffuseColor(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProperty::SetDiffuseColor\n");



void
vtkProperty::SetEdgeColor(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetEdgeColor(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProperty::SetEdgeColor\n");



void
vtkProperty::SetEdgeVisibility(arg1)
		int 	arg1
		CODE:
		THIS->SetEdgeVisibility(arg1);
		XSRETURN_EMPTY;


void
vtkProperty::SetFrontfaceCulling(arg1)
		int 	arg1
		CODE:
		THIS->SetFrontfaceCulling(arg1);
		XSRETURN_EMPTY;


void
vtkProperty::SetInterpolation(arg1)
		int 	arg1
		CODE:
		THIS->SetInterpolation(arg1);
		XSRETURN_EMPTY;


void
vtkProperty::SetInterpolationToFlat()
		CODE:
		THIS->SetInterpolationToFlat();
		XSRETURN_EMPTY;


void
vtkProperty::SetInterpolationToGouraud()
		CODE:
		THIS->SetInterpolationToGouraud();
		XSRETURN_EMPTY;


void
vtkProperty::SetInterpolationToPhong()
		CODE:
		THIS->SetInterpolationToPhong();
		XSRETURN_EMPTY;


void
vtkProperty::SetLineWidth(arg1)
		float 	arg1
		CODE:
		THIS->SetLineWidth(arg1);
		XSRETURN_EMPTY;


void
vtkProperty::SetOpacity(arg1)
		float 	arg1
		CODE:
		THIS->SetOpacity(arg1);
		XSRETURN_EMPTY;


void
vtkProperty::SetPointSize(arg1)
		float 	arg1
		CODE:
		THIS->SetPointSize(arg1);
		XSRETURN_EMPTY;


void
vtkProperty::SetRepresentation(arg1)
		int 	arg1
		CODE:
		THIS->SetRepresentation(arg1);
		XSRETURN_EMPTY;


void
vtkProperty::SetRepresentationToPoints()
		CODE:
		THIS->SetRepresentationToPoints();
		XSRETURN_EMPTY;


void
vtkProperty::SetRepresentationToSurface()
		CODE:
		THIS->SetRepresentationToSurface();
		XSRETURN_EMPTY;


void
vtkProperty::SetRepresentationToWireframe()
		CODE:
		THIS->SetRepresentationToWireframe();
		XSRETURN_EMPTY;


void
vtkProperty::SetSpecular(arg1)
		float 	arg1
		CODE:
		THIS->SetSpecular(arg1);
		XSRETURN_EMPTY;


void
vtkProperty::SetSpecularColor(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetSpecularColor(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProperty::SetSpecularColor\n");



void
vtkProperty::SetSpecularPower(arg1)
		float 	arg1
		CODE:
		THIS->SetSpecularPower(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::PropPicker PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkPropPicker::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkPropPicker*
vtkPropPicker::New()
		CODE:
		RETVAL = vtkPropPicker::New();
		OUTPUT:
		RETVAL


int
vtkPropPicker::Pick(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		float 	arg1
		float 	arg2
		float 	arg3
		vtkRenderer *	arg4
		CODE:
		RETVAL = THIS->Pick(arg1, arg2, arg3, arg4);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPropPicker::Pick\n");



int
vtkPropPicker::PickProp(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		float 	arg1
		float 	arg2
		vtkRenderer *	arg3
		vtkPropCollection *	arg4
		CODE:
		RETVAL = THIS->PickProp(arg1, arg2, arg3, arg4);
		OUTPUT:
		RETVAL
	CASE: items == 4
		float 	arg1
		float 	arg2
		vtkRenderer *	arg3
		CODE:
		RETVAL = THIS->PickProp(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPropPicker::PickProp\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Prop3DCollection PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkProp3DCollection::AddItem(arg1 = 0)
	CASE: items == 2
		vtkProp3D *	arg1
		CODE:
		THIS->AddItem(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProp3DCollection::AddItem\n");



const char *
vtkProp3DCollection::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkProp3D *
vtkProp3DCollection::GetLastProp3D()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkProp3D";
		CODE:
		RETVAL = THIS->GetLastProp3D();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkProp3D *
vtkProp3DCollection::GetNextProp3D()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkProp3D";
		CODE:
		RETVAL = THIS->GetNextProp3D();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkProp3DCollection*
vtkProp3DCollection::New()
		CODE:
		RETVAL = vtkProp3DCollection::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::QuadricClustering PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkQuadricClustering::Append(piece)
		vtkPolyData *	piece
		CODE:
		THIS->Append(piece);
		XSRETURN_EMPTY;


void
vtkQuadricClustering::EndAppend()
		CODE:
		THIS->EndAppend();
		XSRETURN_EMPTY;


const char *
vtkQuadricClustering::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkQuadricClustering::GetDivisionOrigin()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetDivisionOrigin();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkQuadricClustering::GetDivisionSpacing()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetDivisionSpacing();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


vtkFeatureEdges *
vtkQuadricClustering::GetFeatureEdges()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkFeatureEdges";
		CODE:
		RETVAL = THIS->GetFeatureEdges();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkQuadricClustering::GetNumberOfXDivisions()
		CODE:
		RETVAL = THIS->GetNumberOfXDivisions();
		OUTPUT:
		RETVAL


int
vtkQuadricClustering::GetNumberOfYDivisions()
		CODE:
		RETVAL = THIS->GetNumberOfYDivisions();
		OUTPUT:
		RETVAL


int
vtkQuadricClustering::GetNumberOfZDivisions()
		CODE:
		RETVAL = THIS->GetNumberOfZDivisions();
		OUTPUT:
		RETVAL


int
vtkQuadricClustering::GetUseFeatureEdges()
		CODE:
		RETVAL = THIS->GetUseFeatureEdges();
		OUTPUT:
		RETVAL


int
vtkQuadricClustering::GetUseInputPoints()
		CODE:
		RETVAL = THIS->GetUseInputPoints();
		OUTPUT:
		RETVAL


static vtkQuadricClustering*
vtkQuadricClustering::New()
		CODE:
		RETVAL = vtkQuadricClustering::New();
		OUTPUT:
		RETVAL


void
vtkQuadricClustering::SetDivisionOrigin(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetDivisionOrigin(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkQuadricClustering::SetDivisionOrigin\n");



void
vtkQuadricClustering::SetDivisionSpacing(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetDivisionSpacing(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkQuadricClustering::SetDivisionSpacing\n");



void
vtkQuadricClustering::SetNumberOfXDivisions(num)
		int 	num
		CODE:
		THIS->SetNumberOfXDivisions(num);
		XSRETURN_EMPTY;


void
vtkQuadricClustering::SetNumberOfYDivisions(num)
		int 	num
		CODE:
		THIS->SetNumberOfYDivisions(num);
		XSRETURN_EMPTY;


void
vtkQuadricClustering::SetNumberOfZDivisions(num)
		int 	num
		CODE:
		THIS->SetNumberOfZDivisions(num);
		XSRETURN_EMPTY;


void
vtkQuadricClustering::SetUseFeatureEdges(arg1)
		int 	arg1
		CODE:
		THIS->SetUseFeatureEdges(arg1);
		XSRETURN_EMPTY;


void
vtkQuadricClustering::SetUseInputPoints(arg1)
		int 	arg1
		CODE:
		THIS->SetUseInputPoints(arg1);
		XSRETURN_EMPTY;


void
vtkQuadricClustering::StartAppend(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		float 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		float 	arg6
		CODE:
		THIS->StartAppend(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkQuadricClustering::StartAppend\n");



void
vtkQuadricClustering::UseFeatureEdgesOff()
		CODE:
		THIS->UseFeatureEdgesOff();
		XSRETURN_EMPTY;


void
vtkQuadricClustering::UseFeatureEdgesOn()
		CODE:
		THIS->UseFeatureEdgesOn();
		XSRETURN_EMPTY;


void
vtkQuadricClustering::UseInputPointsOff()
		CODE:
		THIS->UseInputPointsOff();
		XSRETURN_EMPTY;


void
vtkQuadricClustering::UseInputPointsOn()
		CODE:
		THIS->UseInputPointsOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::QuadricDecimation PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkQuadricDecimation::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkQuadricDecimation::GetMaximumCollapsedEdges()
		CODE:
		RETVAL = THIS->GetMaximumCollapsedEdges();
		OUTPUT:
		RETVAL


float
vtkQuadricDecimation::GetMaximumCost()
		CODE:
		RETVAL = THIS->GetMaximumCost();
		OUTPUT:
		RETVAL


vtkPolyData *
vtkQuadricDecimation::GetTestOutput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPolyData";
		CODE:
		RETVAL = THIS->GetTestOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkQuadricDecimation*
vtkQuadricDecimation::New()
		CODE:
		RETVAL = vtkQuadricDecimation::New();
		OUTPUT:
		RETVAL


void
vtkQuadricDecimation::SetMaximumCollapsedEdges(arg1)
		int 	arg1
		CODE:
		THIS->SetMaximumCollapsedEdges(arg1);
		XSRETURN_EMPTY;


void
vtkQuadricDecimation::SetMaximumCost(arg1)
		float 	arg1
		CODE:
		THIS->SetMaximumCost(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::QuantizePolyDataPoints PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkQuantizePolyDataPoints::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkQuantizePolyDataPoints::GetQFactor()
		CODE:
		RETVAL = THIS->GetQFactor();
		OUTPUT:
		RETVAL


static vtkQuantizePolyDataPoints*
vtkQuantizePolyDataPoints::New()
		CODE:
		RETVAL = vtkQuantizePolyDataPoints::New();
		OUTPUT:
		RETVAL


void
vtkQuantizePolyDataPoints::SetQFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetQFactor(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::RayCaster PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkRayCaster::AutomaticScaleAdjustmentOff()
		CODE:
		THIS->AutomaticScaleAdjustmentOff();
		XSRETURN_EMPTY;


void
vtkRayCaster::AutomaticScaleAdjustmentOn()
		CODE:
		THIS->AutomaticScaleAdjustmentOn();
		XSRETURN_EMPTY;


void
vtkRayCaster::BilinearImageZoomOff()
		CODE:
		THIS->BilinearImageZoomOff();
		XSRETURN_EMPTY;


void
vtkRayCaster::BilinearImageZoomOn()
		CODE:
		THIS->BilinearImageZoomOn();
		XSRETURN_EMPTY;


int
vtkRayCaster::GetAutomaticScaleAdjustment()
		CODE:
		RETVAL = THIS->GetAutomaticScaleAdjustment();
		OUTPUT:
		RETVAL


float
vtkRayCaster::GetAutomaticScaleLowerLimit()
		CODE:
		RETVAL = THIS->GetAutomaticScaleLowerLimit();
		OUTPUT:
		RETVAL


int
vtkRayCaster::GetBilinearImageZoom()
		CODE:
		RETVAL = THIS->GetBilinearImageZoom();
		OUTPUT:
		RETVAL


const char *
vtkRayCaster::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkRayCaster::GetImageScale(level)
		int 	level
		CODE:
		RETVAL = THIS->GetImageScale(level);
		OUTPUT:
		RETVAL


int
vtkRayCaster::GetImageScaleCount()
		CODE:
		RETVAL = THIS->GetImageScaleCount();
		OUTPUT:
		RETVAL


int
vtkRayCaster::GetNumberOfSamplesTaken()
		CODE:
		RETVAL = THIS->GetNumberOfSamplesTaken();
		OUTPUT:
		RETVAL


int
vtkRayCaster::GetNumberOfThreads()
		CODE:
		RETVAL = THIS->GetNumberOfThreads();
		OUTPUT:
		RETVAL


int
vtkRayCaster::GetSelectedImageScaleIndex()
		CODE:
		RETVAL = THIS->GetSelectedImageScaleIndex();
		OUTPUT:
		RETVAL


float
vtkRayCaster::GetTotalRenderTime()
		CODE:
		RETVAL = THIS->GetTotalRenderTime();
		OUTPUT:
		RETVAL


float
vtkRayCaster::GetViewRaysStepSize(level)
		int 	level
		CODE:
		RETVAL = THIS->GetViewRaysStepSize(level);
		OUTPUT:
		RETVAL


static vtkRayCaster*
vtkRayCaster::New()
		CODE:
		RETVAL = vtkRayCaster::New();
		OUTPUT:
		RETVAL


void
vtkRayCaster::SetAutomaticScaleLowerLimit(arg1)
		float 	arg1
		CODE:
		THIS->SetAutomaticScaleLowerLimit(arg1);
		XSRETURN_EMPTY;


void
vtkRayCaster::SetBilinearImageZoom(arg1)
		int 	arg1
		CODE:
		THIS->SetBilinearImageZoom(arg1);
		XSRETURN_EMPTY;


void
vtkRayCaster::SetImageScale(level, scale)
		int 	level
		float 	scale
		CODE:
		THIS->SetImageScale(level, scale);
		XSRETURN_EMPTY;


void
vtkRayCaster::SetNumberOfThreads(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfThreads(arg1);
		XSRETURN_EMPTY;


void
vtkRayCaster::SetSelectedImageScaleIndex(arg1)
		int 	arg1
		CODE:
		THIS->SetSelectedImageScaleIndex(arg1);
		XSRETURN_EMPTY;


void
vtkRayCaster::SetViewRaysStepSize(level, scale)
		int 	level
		float 	scale
		CODE:
		THIS->SetViewRaysStepSize(level, scale);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::RectilinearGridGeometryFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkRectilinearGridGeometryFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int  *
vtkRectilinearGridGeometryFilter::GetExtent()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetExtent();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


static vtkRectilinearGridGeometryFilter*
vtkRectilinearGridGeometryFilter::New()
		CODE:
		RETVAL = vtkRectilinearGridGeometryFilter::New();
		OUTPUT:
		RETVAL


void
vtkRectilinearGridGeometryFilter::SetExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int 	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetExtent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkRectilinearGridGeometryFilter::SetExtent\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::RectilinearGridReader PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkRectilinearGridReader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkRectilinearGrid *
vtkRectilinearGridReader::GetOutput(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkRectilinearGrid";
		CODE:
		RETVAL = THIS->GetOutput(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE: items == 1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkRectilinearGrid";
		CODE:
		RETVAL = THIS->GetOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkRectilinearGridReader::GetOutput\n");



static vtkRectilinearGridReader*
vtkRectilinearGridReader::New()
		CODE:
		RETVAL = vtkRectilinearGridReader::New();
		OUTPUT:
		RETVAL


void
vtkRectilinearGridReader::SetOutput(output)
		vtkRectilinearGrid *	output
		CODE:
		THIS->SetOutput(output);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::RectilinearGridSource PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkRectilinearGridSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkRectilinearGrid *
vtkRectilinearGridSource::GetOutput(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkRectilinearGrid";
		CODE:
		RETVAL = THIS->GetOutput(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE: items == 1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkRectilinearGrid";
		CODE:
		RETVAL = THIS->GetOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkRectilinearGridSource::GetOutput\n");



static vtkRectilinearGridSource*
vtkRectilinearGridSource::New()
		CODE:
		RETVAL = vtkRectilinearGridSource::New();
		OUTPUT:
		RETVAL


void
vtkRectilinearGridSource::SetOutput(output)
		vtkRectilinearGrid *	output
		CODE:
		THIS->SetOutput(output);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::RectilinearGridWriter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkRectilinearGridWriter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkRectilinearGrid *
vtkRectilinearGridWriter::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkRectilinearGrid";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkRectilinearGridWriter*
vtkRectilinearGridWriter::New()
		CODE:
		RETVAL = vtkRectilinearGridWriter::New();
		OUTPUT:
		RETVAL


void
vtkRectilinearGridWriter::SetInput(input)
		vtkRectilinearGrid *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::RecursiveDividingCubes PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkRecursiveDividingCubes::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkRecursiveDividingCubes::GetDistance()
		CODE:
		RETVAL = THIS->GetDistance();
		OUTPUT:
		RETVAL


int
vtkRecursiveDividingCubes::GetIncrement()
		CODE:
		RETVAL = THIS->GetIncrement();
		OUTPUT:
		RETVAL


float
vtkRecursiveDividingCubes::GetValue()
		CODE:
		RETVAL = THIS->GetValue();
		OUTPUT:
		RETVAL


static vtkRecursiveDividingCubes*
vtkRecursiveDividingCubes::New()
		CODE:
		RETVAL = vtkRecursiveDividingCubes::New();
		OUTPUT:
		RETVAL


void
vtkRecursiveDividingCubes::SetDistance(arg1)
		float 	arg1
		CODE:
		THIS->SetDistance(arg1);
		XSRETURN_EMPTY;


void
vtkRecursiveDividingCubes::SetIncrement(arg1)
		int 	arg1
		CODE:
		THIS->SetIncrement(arg1);
		XSRETURN_EMPTY;


void
vtkRecursiveDividingCubes::SetValue(arg1)
		float 	arg1
		CODE:
		THIS->SetValue(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::RecursiveSphereDirectionEncoder PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkRecursiveSphereDirectionEncoder::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkRecursiveSphereDirectionEncoder::GetNumberOfEncodedDirections()
		CODE:
		RETVAL = THIS->GetNumberOfEncodedDirections();
		OUTPUT:
		RETVAL


int
vtkRecursiveSphereDirectionEncoder::GetRecursionDepth()
		CODE:
		RETVAL = THIS->GetRecursionDepth();
		OUTPUT:
		RETVAL


static vtkRecursiveSphereDirectionEncoder*
vtkRecursiveSphereDirectionEncoder::New()
		CODE:
		RETVAL = vtkRecursiveSphereDirectionEncoder::New();
		OUTPUT:
		RETVAL


void
vtkRecursiveSphereDirectionEncoder::SetRecursionDepth(arg1)
		int 	arg1
		CODE:
		THIS->SetRecursionDepth(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::RemoveGhostCells PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkRemoveGhostCells::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkRemoveGhostCells::GetGhostLevel()
		CODE:
		RETVAL = THIS->GetGhostLevel();
		OUTPUT:
		RETVAL


static vtkRemoveGhostCells*
vtkRemoveGhostCells::New()
		CODE:
		RETVAL = vtkRemoveGhostCells::New();
		OUTPUT:
		RETVAL


void
vtkRemoveGhostCells::SetGhostLevel(arg1)
		int 	arg1
		CODE:
		THIS->SetGhostLevel(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::RenderWindow PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkRenderWindow::AddRenderer(arg1)
		vtkRenderer *	arg1
		CODE:
		THIS->AddRenderer(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindow::BordersOff()
		CODE:
		THIS->BordersOff();
		XSRETURN_EMPTY;


void
vtkRenderWindow::BordersOn()
		CODE:
		THIS->BordersOn();
		XSRETURN_EMPTY;


int
vtkRenderWindow::CheckAbortStatus()
		CODE:
		RETVAL = THIS->CheckAbortStatus();
		OUTPUT:
		RETVAL


void
vtkRenderWindow::ClosePPMImageFile()
		CODE:
		THIS->ClosePPMImageFile();
		XSRETURN_EMPTY;


void
vtkRenderWindow::CopyResultFrame()
		CODE:
		THIS->CopyResultFrame();
		XSRETURN_EMPTY;


void
vtkRenderWindow::Frame()
		CODE:
		THIS->Frame();
		XSRETURN_EMPTY;


void
vtkRenderWindow::FullScreenOff()
		CODE:
		THIS->FullScreenOff();
		XSRETURN_EMPTY;


void
vtkRenderWindow::FullScreenOn()
		CODE:
		THIS->FullScreenOn();
		XSRETURN_EMPTY;


int
vtkRenderWindow::GetAAFrames()
		CODE:
		RETVAL = THIS->GetAAFrames();
		OUTPUT:
		RETVAL


int
vtkRenderWindow::GetAbortRender()
		CODE:
		RETVAL = THIS->GetAbortRender();
		OUTPUT:
		RETVAL


int
vtkRenderWindow::GetBorders()
		CODE:
		RETVAL = THIS->GetBorders();
		OUTPUT:
		RETVAL


const char *
vtkRenderWindow::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkRenderWindow::GetDepthBufferSize()
		CODE:
		RETVAL = THIS->GetDepthBufferSize();
		OUTPUT:
		RETVAL


float
vtkRenderWindow::GetDesiredUpdateRate()
		CODE:
		RETVAL = THIS->GetDesiredUpdateRate();
		OUTPUT:
		RETVAL


int
vtkRenderWindow::GetEventPending()
		CODE:
		RETVAL = THIS->GetEventPending();
		OUTPUT:
		RETVAL


int
vtkRenderWindow::GetFDFrames()
		CODE:
		RETVAL = THIS->GetFDFrames();
		OUTPUT:
		RETVAL


char *
vtkRenderWindow::GetFileName()
		CODE:
		RETVAL = THIS->GetFileName();
		OUTPUT:
		RETVAL


int
vtkRenderWindow::GetFullScreen()
		CODE:
		RETVAL = THIS->GetFullScreen();
		OUTPUT:
		RETVAL


void *
vtkRenderWindow::GetGenericContext()
		CODE:
		RETVAL = THIS->GetGenericContext();
		OUTPUT:
		RETVAL


void *
vtkRenderWindow::GetGenericDisplayId()
		CODE:
		RETVAL = THIS->GetGenericDisplayId();
		OUTPUT:
		RETVAL


void *
vtkRenderWindow::GetGenericDrawable()
		CODE:
		RETVAL = THIS->GetGenericDrawable();
		OUTPUT:
		RETVAL


void *
vtkRenderWindow::GetGenericParentId()
		CODE:
		RETVAL = THIS->GetGenericParentId();
		OUTPUT:
		RETVAL


void *
vtkRenderWindow::GetGenericWindowId()
		CODE:
		RETVAL = THIS->GetGenericWindowId();
		OUTPUT:
		RETVAL


int
vtkRenderWindow::GetInAbortCheck()
		CODE:
		RETVAL = THIS->GetInAbortCheck();
		OUTPUT:
		RETVAL


vtkRenderWindowInteractor *
vtkRenderWindow::GetInteractor()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkRenderWindowInteractor";
		CODE:
		RETVAL = THIS->GetInteractor();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkRenderWindow::GetLineSmoothing()
		CODE:
		RETVAL = THIS->GetLineSmoothing();
		OUTPUT:
		RETVAL


int
vtkRenderWindow::GetNeverRendered()
		CODE:
		RETVAL = THIS->GetNeverRendered();
		OUTPUT:
		RETVAL


int
vtkRenderWindow::GetNumLayers()
		CODE:
		RETVAL = THIS->GetNumLayers();
		OUTPUT:
		RETVAL


int
vtkRenderWindow::GetPointSmoothing()
		CODE:
		RETVAL = THIS->GetPointSmoothing();
		OUTPUT:
		RETVAL


int
vtkRenderWindow::GetPolygonSmoothing()
		CODE:
		RETVAL = THIS->GetPolygonSmoothing();
		OUTPUT:
		RETVAL


const char *
vtkRenderWindow::GetRenderLibrary()
		CODE:
		RETVAL = THIS->GetRenderLibrary();
		OUTPUT:
		RETVAL


vtkRendererCollection *
vtkRenderWindow::GetRenderers()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkRendererCollection";
		CODE:
		RETVAL = THIS->GetRenderers();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkRenderWindow::GetStereoCapableWindow()
		CODE:
		RETVAL = THIS->GetStereoCapableWindow();
		OUTPUT:
		RETVAL


int
vtkRenderWindow::GetStereoRender()
		CODE:
		RETVAL = THIS->GetStereoRender();
		OUTPUT:
		RETVAL


int
vtkRenderWindow::GetStereoType()
		CODE:
		RETVAL = THIS->GetStereoType();
		OUTPUT:
		RETVAL


char *
vtkRenderWindow::GetStereoTypeAsString()
		CODE:
		RETVAL = THIS->GetStereoTypeAsString();
		OUTPUT:
		RETVAL


int
vtkRenderWindow::GetSubFrames()
		CODE:
		RETVAL = THIS->GetSubFrames();
		OUTPUT:
		RETVAL


int
vtkRenderWindow::GetSwapBuffers()
		CODE:
		RETVAL = THIS->GetSwapBuffers();
		OUTPUT:
		RETVAL


void
vtkRenderWindow::HideCursor()
		CODE:
		THIS->HideCursor();
		XSRETURN_EMPTY;


void
vtkRenderWindow::LineSmoothingOff()
		CODE:
		THIS->LineSmoothingOff();
		XSRETURN_EMPTY;


void
vtkRenderWindow::LineSmoothingOn()
		CODE:
		THIS->LineSmoothingOn();
		XSRETURN_EMPTY;


void
vtkRenderWindow::MakeCurrent()
		CODE:
		THIS->MakeCurrent();
		XSRETURN_EMPTY;


vtkRenderWindowInteractor *
vtkRenderWindow::MakeRenderWindowInteractor()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkRenderWindowInteractor";
		CODE:
		RETVAL = THIS->MakeRenderWindowInteractor();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkRenderWindow*
vtkRenderWindow::New()
		CODE:
		RETVAL = vtkRenderWindow::New();
		OUTPUT:
		RETVAL


int
vtkRenderWindow::OpenPPMImageFile()
		CODE:
		RETVAL = THIS->OpenPPMImageFile();
		OUTPUT:
		RETVAL


void
vtkRenderWindow::PointSmoothingOff()
		CODE:
		THIS->PointSmoothingOff();
		XSRETURN_EMPTY;


void
vtkRenderWindow::PointSmoothingOn()
		CODE:
		THIS->PointSmoothingOn();
		XSRETURN_EMPTY;


void
vtkRenderWindow::PolygonSmoothingOff()
		CODE:
		THIS->PolygonSmoothingOff();
		XSRETURN_EMPTY;


void
vtkRenderWindow::PolygonSmoothingOn()
		CODE:
		THIS->PolygonSmoothingOn();
		XSRETURN_EMPTY;


void
vtkRenderWindow::RemoveRenderer(arg1)
		vtkRenderer *	arg1
		CODE:
		THIS->RemoveRenderer(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindow::Render()
		CODE:
		THIS->Render();
		XSRETURN_EMPTY;


void
vtkRenderWindow::SaveImageAsPPM()
		CODE:
		THIS->SaveImageAsPPM();
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetAAFrames(arg1)
		int 	arg1
		CODE:
		THIS->SetAAFrames(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetAbortCheckMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetAbortCheckMethod",0), newRV(func), 0);
		}
		THIS->SetAbortCheckMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetAbortRender(arg1)
		int 	arg1
		CODE:
		THIS->SetAbortRender(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetBorders(arg1)
		int 	arg1
		CODE:
		THIS->SetBorders(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetDesiredUpdateRate(arg1)
		float 	arg1
		CODE:
		THIS->SetDesiredUpdateRate(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetFDFrames(arg1)
		int 	arg1
		CODE:
		THIS->SetFDFrames(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetFileName(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetFullScreen(arg1)
		int 	arg1
		CODE:
		THIS->SetFullScreen(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetInAbortCheck(arg1)
		int 	arg1
		CODE:
		THIS->SetInAbortCheck(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetInteractor(arg1)
		vtkRenderWindowInteractor *	arg1
		CODE:
		THIS->SetInteractor(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetLineSmoothing(arg1)
		int 	arg1
		CODE:
		THIS->SetLineSmoothing(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetNumLayers(arg1)
		int 	arg1
		CODE:
		THIS->SetNumLayers(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetPointSmoothing(arg1)
		int 	arg1
		CODE:
		THIS->SetPointSmoothing(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetPolygonSmoothing(arg1)
		int 	arg1
		CODE:
		THIS->SetPolygonSmoothing(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetStereoCapableWindow(capable)
		int 	capable
		CODE:
		THIS->SetStereoCapableWindow(capable);
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetStereoRender(stereo)
		int 	stereo
		CODE:
		THIS->SetStereoRender(stereo);
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetStereoType(arg1)
		int 	arg1
		CODE:
		THIS->SetStereoType(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetStereoTypeToCrystalEyes()
		CODE:
		THIS->SetStereoTypeToCrystalEyes();
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetStereoTypeToDresden()
		CODE:
		THIS->SetStereoTypeToDresden();
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetStereoTypeToInterlaced()
		CODE:
		THIS->SetStereoTypeToInterlaced();
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetStereoTypeToLeft()
		CODE:
		THIS->SetStereoTypeToLeft();
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetStereoTypeToRedBlue()
		CODE:
		THIS->SetStereoTypeToRedBlue();
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetStereoTypeToRight()
		CODE:
		THIS->SetStereoTypeToRight();
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetSubFrames(arg1)
		int 	arg1
		CODE:
		THIS->SetSubFrames(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetSwapBuffers(arg1)
		int 	arg1
		CODE:
		THIS->SetSwapBuffers(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindow::SetWindowInfo(arg1)
		char *	arg1
		CODE:
		THIS->SetWindowInfo(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindow::ShowCursor()
		CODE:
		THIS->ShowCursor();
		XSRETURN_EMPTY;


void
vtkRenderWindow::Start()
		CODE:
		THIS->Start();
		XSRETURN_EMPTY;


void
vtkRenderWindow::StereoCapableWindowOff()
		CODE:
		THIS->StereoCapableWindowOff();
		XSRETURN_EMPTY;


void
vtkRenderWindow::StereoCapableWindowOn()
		CODE:
		THIS->StereoCapableWindowOn();
		XSRETURN_EMPTY;


void
vtkRenderWindow::StereoMidpoint()
		CODE:
		THIS->StereoMidpoint();
		XSRETURN_EMPTY;


void
vtkRenderWindow::StereoRenderComplete()
		CODE:
		THIS->StereoRenderComplete();
		XSRETURN_EMPTY;


void
vtkRenderWindow::StereoRenderOff()
		CODE:
		THIS->StereoRenderOff();
		XSRETURN_EMPTY;


void
vtkRenderWindow::StereoRenderOn()
		CODE:
		THIS->StereoRenderOn();
		XSRETURN_EMPTY;


void
vtkRenderWindow::StereoUpdate()
		CODE:
		THIS->StereoUpdate();
		XSRETURN_EMPTY;


void
vtkRenderWindow::SwapBuffersOff()
		CODE:
		THIS->SwapBuffersOff();
		XSRETURN_EMPTY;


void
vtkRenderWindow::SwapBuffersOn()
		CODE:
		THIS->SwapBuffersOn();
		XSRETURN_EMPTY;


void
vtkRenderWindow::UnRegister(o)
		vtkObject *	o
		CODE:
		THIS->UnRegister(o);
		XSRETURN_EMPTY;


void
vtkRenderWindow::WindowRemap()
		CODE:
		THIS->WindowRemap();
		XSRETURN_EMPTY;


void
vtkRenderWindow::WritePPMImageFile()
		CODE:
		THIS->WritePPMImageFile();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::RenderWindowCollection PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkRenderWindowCollection::AddItem(arg1 = 0)
	CASE: items == 2
		vtkRenderWindow *	arg1
		CODE:
		THIS->AddItem(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkRenderWindowCollection::AddItem\n");



const char *
vtkRenderWindowCollection::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkRenderWindow *
vtkRenderWindowCollection::GetNextItem()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkRenderWindow";
		CODE:
		RETVAL = THIS->GetNextItem();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkRenderWindowCollection*
vtkRenderWindowCollection::New()
		CODE:
		RETVAL = vtkRenderWindowCollection::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::RenderWindowInteractor PREFIX = vtk

PROTOTYPES: DISABLE



vtkAbstractPropPicker *
vtkRenderWindowInteractor::CreateDefaultPicker()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkAbstractPropPicker";
		CODE:
		RETVAL = THIS->CreateDefaultPicker();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkRenderWindowInteractor::CreateTimer(arg1)
		int 	arg1
		CODE:
		RETVAL = THIS->CreateTimer(arg1);
		OUTPUT:
		RETVAL


int
vtkRenderWindowInteractor::DestroyTimer()
		CODE:
		RETVAL = THIS->DestroyTimer();
		OUTPUT:
		RETVAL


void
vtkRenderWindowInteractor::Disable()
		CODE:
		THIS->Disable();
		XSRETURN_EMPTY;


void
vtkRenderWindowInteractor::Enable()
		CODE:
		THIS->Enable();
		XSRETURN_EMPTY;


void
vtkRenderWindowInteractor::EndPickCallback()
		CODE:
		THIS->EndPickCallback();
		XSRETURN_EMPTY;


void
vtkRenderWindowInteractor::ExitCallback()
		CODE:
		THIS->ExitCallback();
		XSRETURN_EMPTY;


const char *
vtkRenderWindowInteractor::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkRenderWindowInteractor::GetDesiredUpdateRate()
		CODE:
		RETVAL = THIS->GetDesiredUpdateRate();
		OUTPUT:
		RETVAL


int
vtkRenderWindowInteractor::GetEnabled()
		CODE:
		RETVAL = THIS->GetEnabled();
		OUTPUT:
		RETVAL


int  *
vtkRenderWindowInteractor::GetEventPosition()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetEventPosition();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


int
vtkRenderWindowInteractor::GetInitialized()
		CODE:
		RETVAL = THIS->GetInitialized();
		OUTPUT:
		RETVAL


vtkInteractorStyle *
vtkRenderWindowInteractor::GetInteractorStyle()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkInteractorStyle";
		CODE:
		RETVAL = THIS->GetInteractorStyle();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkRenderWindowInteractor::GetLightFollowCamera()
		CODE:
		RETVAL = THIS->GetLightFollowCamera();
		OUTPUT:
		RETVAL


vtkAbstractPicker *
vtkRenderWindowInteractor::GetPicker()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkAbstractPicker";
		CODE:
		RETVAL = THIS->GetPicker();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkRenderWindow *
vtkRenderWindowInteractor::GetRenderWindow()
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


int  *
vtkRenderWindowInteractor::GetSize()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetSize();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


float
vtkRenderWindowInteractor::GetStillUpdateRate()
		CODE:
		RETVAL = THIS->GetStillUpdateRate();
		OUTPUT:
		RETVAL


void
vtkRenderWindowInteractor::HideCursor()
		CODE:
		THIS->HideCursor();
		XSRETURN_EMPTY;


void
vtkRenderWindowInteractor::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


void
vtkRenderWindowInteractor::LightFollowCameraOff()
		CODE:
		THIS->LightFollowCameraOff();
		XSRETURN_EMPTY;


void
vtkRenderWindowInteractor::LightFollowCameraOn()
		CODE:
		THIS->LightFollowCameraOn();
		XSRETURN_EMPTY;


static vtkRenderWindowInteractor*
vtkRenderWindowInteractor::New()
		CODE:
		RETVAL = vtkRenderWindowInteractor::New();
		OUTPUT:
		RETVAL


void
vtkRenderWindowInteractor::Render()
		CODE:
		THIS->Render();
		XSRETURN_EMPTY;


void
vtkRenderWindowInteractor::SetDesiredUpdateRate(arg1)
		float 	arg1
		CODE:
		THIS->SetDesiredUpdateRate(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindowInteractor::SetEndPickMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetEndPickMethod",0), newRV(func), 0);
		}
		THIS->SetEndPickMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkRenderWindowInteractor::SetEventPosition(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int  	arg1
		int 	arg2
		CODE:
		THIS->SetEventPosition(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkRenderWindowInteractor::SetEventPosition\n");



void
vtkRenderWindowInteractor::SetExitMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetExitMethod",0), newRV(func), 0);
		}
		THIS->SetExitMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkRenderWindowInteractor::SetInteractorStyle(arg1)
		vtkInteractorStyle *	arg1
		CODE:
		THIS->SetInteractorStyle(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindowInteractor::SetLightFollowCamera(arg1)
		int 	arg1
		CODE:
		THIS->SetLightFollowCamera(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindowInteractor::SetPicker(arg1)
		vtkAbstractPicker *	arg1
		CODE:
		THIS->SetPicker(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindowInteractor::SetRenderWindow(aren)
		vtkRenderWindow *	aren
		CODE:
		THIS->SetRenderWindow(aren);
		XSRETURN_EMPTY;


void
vtkRenderWindowInteractor::SetSize(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int  	arg1
		int 	arg2
		CODE:
		THIS->SetSize(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkRenderWindowInteractor::SetSize\n");



void
vtkRenderWindowInteractor::SetStartPickMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetStartPickMethod",0), newRV(func), 0);
		}
		THIS->SetStartPickMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkRenderWindowInteractor::SetStillUpdateRate(arg1)
		float 	arg1
		CODE:
		THIS->SetStillUpdateRate(arg1);
		XSRETURN_EMPTY;


void
vtkRenderWindowInteractor::SetUserMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetUserMethod",0), newRV(func), 0);
		}
		THIS->SetUserMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkRenderWindowInteractor::ShowCursor()
		CODE:
		THIS->ShowCursor();
		XSRETURN_EMPTY;


void
vtkRenderWindowInteractor::Start()
		CODE:
		THIS->Start();
		XSRETURN_EMPTY;


void
vtkRenderWindowInteractor::StartPickCallback()
		CODE:
		THIS->StartPickCallback();
		XSRETURN_EMPTY;


void
vtkRenderWindowInteractor::TerminateApp()
		CODE:
		THIS->TerminateApp();
		XSRETURN_EMPTY;


void
vtkRenderWindowInteractor::UnRegister(o)
		vtkObject *	o
		CODE:
		THIS->UnRegister(o);
		XSRETURN_EMPTY;


void
vtkRenderWindowInteractor::UpdateSize(x, y)
		int 	x
		int 	y
		CODE:
		THIS->UpdateSize(x, y);
		XSRETURN_EMPTY;


void
vtkRenderWindowInteractor::UserCallback()
		CODE:
		THIS->UserCallback();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Renderer PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkRenderer::AddActor(p)
		vtkProp *	p
		CODE:
		THIS->AddActor(p);
		XSRETURN_EMPTY;


void
vtkRenderer::AddCuller(arg1)
		vtkCuller *	arg1
		CODE:
		THIS->AddCuller(arg1);
		XSRETURN_EMPTY;


void
vtkRenderer::AddLight(arg1)
		vtkLight *	arg1
		CODE:
		THIS->AddLight(arg1);
		XSRETURN_EMPTY;


void
vtkRenderer::AddVolume(p)
		vtkProp *	p
		CODE:
		THIS->AddVolume(p);
		XSRETURN_EMPTY;


void
vtkRenderer::BackingStoreOff()
		CODE:
		THIS->BackingStoreOff();
		XSRETURN_EMPTY;


void
vtkRenderer::BackingStoreOn()
		CODE:
		THIS->BackingStoreOn();
		XSRETURN_EMPTY;


void
vtkRenderer::Clear()
		CODE:
		THIS->Clear();
		XSRETURN_EMPTY;


void
vtkRenderer::CreateLight()
		CODE:
		THIS->CreateLight();
		XSRETURN_EMPTY;


void
vtkRenderer::DeviceRender()
		CODE:
		THIS->DeviceRender();
		XSRETURN_EMPTY;


vtkCamera *
vtkRenderer::GetActiveCamera()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCamera";
		CODE:
		RETVAL = THIS->GetActiveCamera();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkActorCollection *
vtkRenderer::GetActors()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkActorCollection";
		CODE:
		RETVAL = THIS->GetActors();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float
vtkRenderer::GetAllocatedRenderTime()
		CODE:
		RETVAL = THIS->GetAllocatedRenderTime();
		OUTPUT:
		RETVAL


float  *
vtkRenderer::GetAmbient()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetAmbient();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkRenderer::GetBackingStore()
		CODE:
		RETVAL = THIS->GetBackingStore();
		OUTPUT:
		RETVAL


const char *
vtkRenderer::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkCullerCollection *
vtkRenderer::GetCullers()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCullerCollection";
		CODE:
		RETVAL = THIS->GetCullers();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkRenderer::GetInteractive()
		CODE:
		RETVAL = THIS->GetInteractive();
		OUTPUT:
		RETVAL


float
vtkRenderer::GetLastRenderTimeInSeconds()
		CODE:
		RETVAL = THIS->GetLastRenderTimeInSeconds();
		OUTPUT:
		RETVAL


int
vtkRenderer::GetLayer()
		CODE:
		RETVAL = THIS->GetLayer();
		OUTPUT:
		RETVAL


int
vtkRenderer::GetLightFollowCamera()
		CODE:
		RETVAL = THIS->GetLightFollowCamera();
		OUTPUT:
		RETVAL


vtkLightCollection *
vtkRenderer::GetLights()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkLightCollection";
		CODE:
		RETVAL = THIS->GetLights();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkRenderer::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


int
vtkRenderer::GetNumberOfPropsRenderedAsGeometry()
		CODE:
		RETVAL = THIS->GetNumberOfPropsRenderedAsGeometry();
		OUTPUT:
		RETVAL


vtkRayCaster *
vtkRenderer::GetRayCaster()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkRayCaster";
		CODE:
		RETVAL = THIS->GetRayCaster();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkRenderWindow *
vtkRenderer::GetRenderWindow()
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


float
vtkRenderer::GetTimeFactor()
		CODE:
		RETVAL = THIS->GetTimeFactor();
		OUTPUT:
		RETVAL


int
vtkRenderer::GetTwoSidedLighting()
		CODE:
		RETVAL = THIS->GetTwoSidedLighting();
		OUTPUT:
		RETVAL


vtkWindow *
vtkRenderer::GetVTKWindow()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkWindow";
		CODE:
		RETVAL = THIS->GetVTKWindow();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkVolumeCollection *
vtkRenderer::GetVolumes()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkVolumeCollection";
		CODE:
		RETVAL = THIS->GetVolumes();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float
vtkRenderer::GetZ(x, y)
		int 	x
		int 	y
		CODE:
		RETVAL = THIS->GetZ(x, y);
		OUTPUT:
		RETVAL


void
vtkRenderer::InteractiveOff()
		CODE:
		THIS->InteractiveOff();
		XSRETURN_EMPTY;


void
vtkRenderer::InteractiveOn()
		CODE:
		THIS->InteractiveOn();
		XSRETURN_EMPTY;


void
vtkRenderer::LightFollowCameraOff()
		CODE:
		THIS->LightFollowCameraOff();
		XSRETURN_EMPTY;


void
vtkRenderer::LightFollowCameraOn()
		CODE:
		THIS->LightFollowCameraOn();
		XSRETURN_EMPTY;


static vtkRenderer*
vtkRenderer::New()
		CODE:
		RETVAL = vtkRenderer::New();
		OUTPUT:
		RETVAL


vtkAssemblyPath *
vtkRenderer::PickProp(selectionX, selectionY)
		float 	selectionX
		float 	selectionY
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkAssemblyPath";
		CODE:
		RETVAL = THIS->PickProp(selectionX, selectionY);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkRenderer::RemoveActor(p)
		vtkProp *	p
		CODE:
		THIS->RemoveActor(p);
		XSRETURN_EMPTY;


void
vtkRenderer::RemoveCuller(arg1)
		vtkCuller *	arg1
		CODE:
		THIS->RemoveCuller(arg1);
		XSRETURN_EMPTY;


void
vtkRenderer::RemoveLight(arg1)
		vtkLight *	arg1
		CODE:
		THIS->RemoveLight(arg1);
		XSRETURN_EMPTY;


void
vtkRenderer::RemoveVolume(p)
		vtkProp *	p
		CODE:
		THIS->RemoveVolume(p);
		XSRETURN_EMPTY;


void
vtkRenderer::Render()
		CODE:
		THIS->Render();
		XSRETURN_EMPTY;


void
vtkRenderer::RenderOverlay()
		CODE:
		THIS->RenderOverlay();
		XSRETURN_EMPTY;


void
vtkRenderer::ResetCamera(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		float 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		float 	arg6
		CODE:
		THIS->ResetCamera(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE: items == 1
		CODE:
		THIS->ResetCamera();
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkRenderer::ResetCamera\n");



void
vtkRenderer::ResetCameraClippingRange(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		float 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		float 	arg6
		CODE:
		THIS->ResetCameraClippingRange(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE: items == 1
		CODE:
		THIS->ResetCameraClippingRange();
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkRenderer::ResetCameraClippingRange\n");



void
vtkRenderer::SetActiveCamera(arg1)
		vtkCamera *	arg1
		CODE:
		THIS->SetActiveCamera(arg1);
		XSRETURN_EMPTY;


void
vtkRenderer::SetAllocatedRenderTime(arg1)
		float 	arg1
		CODE:
		THIS->SetAllocatedRenderTime(arg1);
		XSRETURN_EMPTY;


void
vtkRenderer::SetAmbient(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetAmbient(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkRenderer::SetAmbient\n");



void
vtkRenderer::SetBackingStore(arg1)
		int 	arg1
		CODE:
		THIS->SetBackingStore(arg1);
		XSRETURN_EMPTY;


void
vtkRenderer::SetInteractive(arg1)
		int 	arg1
		CODE:
		THIS->SetInteractive(arg1);
		XSRETURN_EMPTY;


void
vtkRenderer::SetLayer(arg1)
		int 	arg1
		CODE:
		THIS->SetLayer(arg1);
		XSRETURN_EMPTY;


void
vtkRenderer::SetLightFollowCamera(arg1)
		int 	arg1
		CODE:
		THIS->SetLightFollowCamera(arg1);
		XSRETURN_EMPTY;


void
vtkRenderer::SetRenderWindow(arg1)
		vtkRenderWindow *	arg1
		CODE:
		THIS->SetRenderWindow(arg1);
		XSRETURN_EMPTY;


void
vtkRenderer::SetTwoSidedLighting(arg1)
		int 	arg1
		CODE:
		THIS->SetTwoSidedLighting(arg1);
		XSRETURN_EMPTY;


int
vtkRenderer::Transparent()
		CODE:
		RETVAL = THIS->Transparent();
		OUTPUT:
		RETVAL


void
vtkRenderer::TwoSidedLightingOff()
		CODE:
		THIS->TwoSidedLightingOff();
		XSRETURN_EMPTY;


void
vtkRenderer::TwoSidedLightingOn()
		CODE:
		THIS->TwoSidedLightingOn();
		XSRETURN_EMPTY;


void
vtkRenderer::UnRegister(o)
		vtkObject *	o
		CODE:
		THIS->UnRegister(o);
		XSRETURN_EMPTY;


void
vtkRenderer::ViewToWorld(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->ViewToWorld(arg1, arg2, arg3);
		XSRETURN_EMPTY;
		OUTPUT:
		arg1
		arg2
		arg3
	CASE: items == 1
		CODE:
		THIS->ViewToWorld();
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkRenderer::ViewToWorld\n");



int
vtkRenderer::VisibleActorCount()
		CODE:
		RETVAL = THIS->VisibleActorCount();
		OUTPUT:
		RETVAL


int
vtkRenderer::VisibleVolumeCount()
		CODE:
		RETVAL = THIS->VisibleVolumeCount();
		OUTPUT:
		RETVAL


void
vtkRenderer::WorldToView(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->WorldToView(arg1, arg2, arg3);
		XSRETURN_EMPTY;
		OUTPUT:
		arg1
		arg2
		arg3
	CASE: items == 1
		CODE:
		THIS->WorldToView();
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkRenderer::WorldToView\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::RendererCollection PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkRendererCollection::AddItem(arg1 = 0)
	CASE: items == 2
		vtkRenderer *	arg1
		CODE:
		THIS->AddItem(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkRendererCollection::AddItem\n");



const char *
vtkRendererCollection::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkRenderer *
vtkRendererCollection::GetNextItem()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkRenderer";
		CODE:
		RETVAL = THIS->GetNextItem();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkRendererCollection*
vtkRendererCollection::New()
		CODE:
		RETVAL = vtkRendererCollection::New();
		OUTPUT:
		RETVAL


void
vtkRendererCollection::Render()
		CODE:
		THIS->Render();
		XSRETURN_EMPTY;


void
vtkRendererCollection::RenderOverlay()
		CODE:
		THIS->RenderOverlay();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::RendererSource PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkRendererSource::DepthValuesOff()
		CODE:
		THIS->DepthValuesOff();
		XSRETURN_EMPTY;


void
vtkRendererSource::DepthValuesOn()
		CODE:
		THIS->DepthValuesOn();
		XSRETURN_EMPTY;


const char *
vtkRendererSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkRendererSource::GetDepthValues()
		CODE:
		RETVAL = THIS->GetDepthValues();
		OUTPUT:
		RETVAL


vtkRenderer *
vtkRendererSource::GetInput()
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


unsigned long
vtkRendererSource::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


int
vtkRendererSource::GetRenderFlag()
		CODE:
		RETVAL = THIS->GetRenderFlag();
		OUTPUT:
		RETVAL


int
vtkRendererSource::GetWholeWindow()
		CODE:
		RETVAL = THIS->GetWholeWindow();
		OUTPUT:
		RETVAL


static vtkRendererSource*
vtkRendererSource::New()
		CODE:
		RETVAL = vtkRendererSource::New();
		OUTPUT:
		RETVAL


void
vtkRendererSource::RenderFlagOff()
		CODE:
		THIS->RenderFlagOff();
		XSRETURN_EMPTY;


void
vtkRendererSource::RenderFlagOn()
		CODE:
		THIS->RenderFlagOn();
		XSRETURN_EMPTY;


void
vtkRendererSource::SetDepthValues(arg1)
		int 	arg1
		CODE:
		THIS->SetDepthValues(arg1);
		XSRETURN_EMPTY;


void
vtkRendererSource::SetInput(arg1)
		vtkRenderer *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;


void
vtkRendererSource::SetRenderFlag(arg1)
		int 	arg1
		CODE:
		THIS->SetRenderFlag(arg1);
		XSRETURN_EMPTY;


void
vtkRendererSource::SetWholeWindow(arg1)
		int 	arg1
		CODE:
		THIS->SetWholeWindow(arg1);
		XSRETURN_EMPTY;


void
vtkRendererSource::WholeWindowOff()
		CODE:
		THIS->WholeWindowOff();
		XSRETURN_EMPTY;


void
vtkRendererSource::WholeWindowOn()
		CODE:
		THIS->WholeWindowOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ReverseSense PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkReverseSense::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkReverseSense::GetReverseCells()
		CODE:
		RETVAL = THIS->GetReverseCells();
		OUTPUT:
		RETVAL


int
vtkReverseSense::GetReverseNormals()
		CODE:
		RETVAL = THIS->GetReverseNormals();
		OUTPUT:
		RETVAL


static vtkReverseSense*
vtkReverseSense::New()
		CODE:
		RETVAL = vtkReverseSense::New();
		OUTPUT:
		RETVAL


void
vtkReverseSense::ReverseCellsOff()
		CODE:
		THIS->ReverseCellsOff();
		XSRETURN_EMPTY;


void
vtkReverseSense::ReverseCellsOn()
		CODE:
		THIS->ReverseCellsOn();
		XSRETURN_EMPTY;


void
vtkReverseSense::ReverseNormalsOff()
		CODE:
		THIS->ReverseNormalsOff();
		XSRETURN_EMPTY;


void
vtkReverseSense::ReverseNormalsOn()
		CODE:
		THIS->ReverseNormalsOn();
		XSRETURN_EMPTY;


void
vtkReverseSense::SetReverseCells(arg1)
		int 	arg1
		CODE:
		THIS->SetReverseCells(arg1);
		XSRETURN_EMPTY;


void
vtkReverseSense::SetReverseNormals(arg1)
		int 	arg1
		CODE:
		THIS->SetReverseNormals(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::RibbonFilter PREFIX = vtk

PROTOTYPES: DISABLE



float
vtkRibbonFilter::GetAngle()
		CODE:
		RETVAL = THIS->GetAngle();
		OUTPUT:
		RETVAL


const char *
vtkRibbonFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkRibbonFilter::GetDefaultNormal()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetDefaultNormal();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkRibbonFilter::GetUseDefaultNormal()
		CODE:
		RETVAL = THIS->GetUseDefaultNormal();
		OUTPUT:
		RETVAL


int
vtkRibbonFilter::GetVaryWidth()
		CODE:
		RETVAL = THIS->GetVaryWidth();
		OUTPUT:
		RETVAL


float
vtkRibbonFilter::GetWidth()
		CODE:
		RETVAL = THIS->GetWidth();
		OUTPUT:
		RETVAL


float
vtkRibbonFilter::GetWidthFactor()
		CODE:
		RETVAL = THIS->GetWidthFactor();
		OUTPUT:
		RETVAL


static vtkRibbonFilter*
vtkRibbonFilter::New()
		CODE:
		RETVAL = vtkRibbonFilter::New();
		OUTPUT:
		RETVAL


void
vtkRibbonFilter::SetAngle(arg1)
		float 	arg1
		CODE:
		THIS->SetAngle(arg1);
		XSRETURN_EMPTY;


void
vtkRibbonFilter::SetDefaultNormal(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetDefaultNormal(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkRibbonFilter::SetDefaultNormal\n");



void
vtkRibbonFilter::SetUseDefaultNormal(arg1)
		int 	arg1
		CODE:
		THIS->SetUseDefaultNormal(arg1);
		XSRETURN_EMPTY;


void
vtkRibbonFilter::SetVaryWidth(arg1)
		int 	arg1
		CODE:
		THIS->SetVaryWidth(arg1);
		XSRETURN_EMPTY;


void
vtkRibbonFilter::SetWidth(arg1)
		float 	arg1
		CODE:
		THIS->SetWidth(arg1);
		XSRETURN_EMPTY;


void
vtkRibbonFilter::SetWidthFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetWidthFactor(arg1);
		XSRETURN_EMPTY;


void
vtkRibbonFilter::UseDefaultNormalOff()
		CODE:
		THIS->UseDefaultNormalOff();
		XSRETURN_EMPTY;


void
vtkRibbonFilter::UseDefaultNormalOn()
		CODE:
		THIS->UseDefaultNormalOn();
		XSRETURN_EMPTY;


void
vtkRibbonFilter::VaryWidthOff()
		CODE:
		THIS->VaryWidthOff();
		XSRETURN_EMPTY;


void
vtkRibbonFilter::VaryWidthOn()
		CODE:
		THIS->VaryWidthOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::RotationalExtrusionFilter PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkRotationalExtrusionFilter::CappingOff()
		CODE:
		THIS->CappingOff();
		XSRETURN_EMPTY;


void
vtkRotationalExtrusionFilter::CappingOn()
		CODE:
		THIS->CappingOn();
		XSRETURN_EMPTY;


float
vtkRotationalExtrusionFilter::GetAngle()
		CODE:
		RETVAL = THIS->GetAngle();
		OUTPUT:
		RETVAL


int
vtkRotationalExtrusionFilter::GetCapping()
		CODE:
		RETVAL = THIS->GetCapping();
		OUTPUT:
		RETVAL


const char *
vtkRotationalExtrusionFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkRotationalExtrusionFilter::GetDeltaRadius()
		CODE:
		RETVAL = THIS->GetDeltaRadius();
		OUTPUT:
		RETVAL


int
vtkRotationalExtrusionFilter::GetResolution()
		CODE:
		RETVAL = THIS->GetResolution();
		OUTPUT:
		RETVAL


float
vtkRotationalExtrusionFilter::GetTranslation()
		CODE:
		RETVAL = THIS->GetTranslation();
		OUTPUT:
		RETVAL


static vtkRotationalExtrusionFilter*
vtkRotationalExtrusionFilter::New()
		CODE:
		RETVAL = vtkRotationalExtrusionFilter::New();
		OUTPUT:
		RETVAL


void
vtkRotationalExtrusionFilter::SetAngle(arg1)
		float 	arg1
		CODE:
		THIS->SetAngle(arg1);
		XSRETURN_EMPTY;


void
vtkRotationalExtrusionFilter::SetCapping(arg1)
		int 	arg1
		CODE:
		THIS->SetCapping(arg1);
		XSRETURN_EMPTY;


void
vtkRotationalExtrusionFilter::SetDeltaRadius(arg1)
		float 	arg1
		CODE:
		THIS->SetDeltaRadius(arg1);
		XSRETURN_EMPTY;


void
vtkRotationalExtrusionFilter::SetResolution(arg1)
		int 	arg1
		CODE:
		THIS->SetResolution(arg1);
		XSRETURN_EMPTY;


void
vtkRotationalExtrusionFilter::SetTranslation(arg1)
		float 	arg1
		CODE:
		THIS->SetTranslation(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::RuledSurfaceFilter PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkRuledSurfaceFilter::CloseSurfaceOff()
		CODE:
		THIS->CloseSurfaceOff();
		XSRETURN_EMPTY;


void
vtkRuledSurfaceFilter::CloseSurfaceOn()
		CODE:
		THIS->CloseSurfaceOn();
		XSRETURN_EMPTY;


const char *
vtkRuledSurfaceFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkRuledSurfaceFilter::GetCloseSurface()
		CODE:
		RETVAL = THIS->GetCloseSurface();
		OUTPUT:
		RETVAL


float
vtkRuledSurfaceFilter::GetDistanceFactor()
		CODE:
		RETVAL = THIS->GetDistanceFactor();
		OUTPUT:
		RETVAL


int
vtkRuledSurfaceFilter::GetOffset()
		CODE:
		RETVAL = THIS->GetOffset();
		OUTPUT:
		RETVAL


int
vtkRuledSurfaceFilter::GetOnRatio()
		CODE:
		RETVAL = THIS->GetOnRatio();
		OUTPUT:
		RETVAL


int
vtkRuledSurfaceFilter::GetPassLines()
		CODE:
		RETVAL = THIS->GetPassLines();
		OUTPUT:
		RETVAL


int  *
vtkRuledSurfaceFilter::GetResolution()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetResolution();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


int
vtkRuledSurfaceFilter::GetRuledMode()
		CODE:
		RETVAL = THIS->GetRuledMode();
		OUTPUT:
		RETVAL


const char *
vtkRuledSurfaceFilter::GetRuledModeAsString()
		CODE:
		RETVAL = THIS->GetRuledModeAsString();
		OUTPUT:
		RETVAL


static vtkRuledSurfaceFilter*
vtkRuledSurfaceFilter::New()
		CODE:
		RETVAL = vtkRuledSurfaceFilter::New();
		OUTPUT:
		RETVAL


void
vtkRuledSurfaceFilter::PassLinesOff()
		CODE:
		THIS->PassLinesOff();
		XSRETURN_EMPTY;


void
vtkRuledSurfaceFilter::PassLinesOn()
		CODE:
		THIS->PassLinesOn();
		XSRETURN_EMPTY;


void
vtkRuledSurfaceFilter::SetCloseSurface(arg1)
		int 	arg1
		CODE:
		THIS->SetCloseSurface(arg1);
		XSRETURN_EMPTY;


void
vtkRuledSurfaceFilter::SetDistanceFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetDistanceFactor(arg1);
		XSRETURN_EMPTY;


void
vtkRuledSurfaceFilter::SetOffset(arg1)
		int 	arg1
		CODE:
		THIS->SetOffset(arg1);
		XSRETURN_EMPTY;


void
vtkRuledSurfaceFilter::SetOnRatio(arg1)
		int 	arg1
		CODE:
		THIS->SetOnRatio(arg1);
		XSRETURN_EMPTY;


void
vtkRuledSurfaceFilter::SetPassLines(arg1)
		int 	arg1
		CODE:
		THIS->SetPassLines(arg1);
		XSRETURN_EMPTY;


void
vtkRuledSurfaceFilter::SetResolution(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int  	arg1
		int 	arg2
		CODE:
		THIS->SetResolution(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkRuledSurfaceFilter::SetResolution\n");



void
vtkRuledSurfaceFilter::SetRuledMode(arg1)
		int 	arg1
		CODE:
		THIS->SetRuledMode(arg1);
		XSRETURN_EMPTY;


void
vtkRuledSurfaceFilter::SetRuledModeToPointWalk()
		CODE:
		THIS->SetRuledModeToPointWalk();
		XSRETURN_EMPTY;


void
vtkRuledSurfaceFilter::SetRuledModeToResample()
		CODE:
		THIS->SetRuledModeToResample();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::SLCReader PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkSLCReader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkSLCReader::GetError()
		CODE:
		RETVAL = THIS->GetError();
		OUTPUT:
		RETVAL


char *
vtkSLCReader::GetFileName()
		CODE:
		RETVAL = THIS->GetFileName();
		OUTPUT:
		RETVAL


static vtkSLCReader*
vtkSLCReader::New()
		CODE:
		RETVAL = vtkSLCReader::New();
		OUTPUT:
		RETVAL


void
vtkSLCReader::SetFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetFileName(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::STLReader PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkSTLReader::CreateDefaultLocator()
		CODE:
		THIS->CreateDefaultLocator();
		XSRETURN_EMPTY;


const char *
vtkSTLReader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


char *
vtkSTLReader::GetFileName()
		CODE:
		RETVAL = THIS->GetFileName();
		OUTPUT:
		RETVAL


vtkPointLocator *
vtkSTLReader::GetLocator()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPointLocator";
		CODE:
		RETVAL = THIS->GetLocator();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkSTLReader::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


int
vtkSTLReader::GetMerging()
		CODE:
		RETVAL = THIS->GetMerging();
		OUTPUT:
		RETVAL


void
vtkSTLReader::MergingOff()
		CODE:
		THIS->MergingOff();
		XSRETURN_EMPTY;


void
vtkSTLReader::MergingOn()
		CODE:
		THIS->MergingOn();
		XSRETURN_EMPTY;


static vtkSTLReader*
vtkSTLReader::New()
		CODE:
		RETVAL = vtkSTLReader::New();
		OUTPUT:
		RETVAL


void
vtkSTLReader::SetFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetFileName(arg1);
		XSRETURN_EMPTY;


void
vtkSTLReader::SetLocator(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::PointLocator")
		vtkPointLocator *	arg1
		CODE:
		THIS->SetLocator(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::PointLocator")
		vtkPointLocator *	arg1
		CODE:
		THIS->SetLocator(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkSTLReader::SetLocator\n");



void
vtkSTLReader::SetMerging(arg1)
		int 	arg1
		CODE:
		THIS->SetMerging(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::STLWriter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkSTLWriter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkSTLWriter*
vtkSTLWriter::New()
		CODE:
		RETVAL = vtkSTLWriter::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::SampleFunction PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkSampleFunction::CappingOff()
		CODE:
		THIS->CappingOff();
		XSRETURN_EMPTY;


void
vtkSampleFunction::CappingOn()
		CODE:
		THIS->CappingOn();
		XSRETURN_EMPTY;


void
vtkSampleFunction::ComputeNormalsOff()
		CODE:
		THIS->ComputeNormalsOff();
		XSRETURN_EMPTY;


void
vtkSampleFunction::ComputeNormalsOn()
		CODE:
		THIS->ComputeNormalsOn();
		XSRETURN_EMPTY;


float
vtkSampleFunction::GetCapValue()
		CODE:
		RETVAL = THIS->GetCapValue();
		OUTPUT:
		RETVAL


int
vtkSampleFunction::GetCapping()
		CODE:
		RETVAL = THIS->GetCapping();
		OUTPUT:
		RETVAL


const char *
vtkSampleFunction::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkSampleFunction::GetComputeNormals()
		CODE:
		RETVAL = THIS->GetComputeNormals();
		OUTPUT:
		RETVAL


vtkImplicitFunction *
vtkSampleFunction::GetImplicitFunction()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImplicitFunction";
		CODE:
		RETVAL = THIS->GetImplicitFunction();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkSampleFunction::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


float  *
vtkSampleFunction::GetModelBounds()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetModelBounds();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


int  *
vtkSampleFunction::GetSampleDimensions()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetSampleDimensions();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


static vtkSampleFunction*
vtkSampleFunction::New()
		CODE:
		RETVAL = vtkSampleFunction::New();
		OUTPUT:
		RETVAL


void
vtkSampleFunction::SetCapValue(arg1)
		float 	arg1
		CODE:
		THIS->SetCapValue(arg1);
		XSRETURN_EMPTY;


void
vtkSampleFunction::SetCapping(arg1)
		int 	arg1
		CODE:
		THIS->SetCapping(arg1);
		XSRETURN_EMPTY;


void
vtkSampleFunction::SetComputeNormals(arg1)
		int 	arg1
		CODE:
		THIS->SetComputeNormals(arg1);
		XSRETURN_EMPTY;


void
vtkSampleFunction::SetImplicitFunction(arg1)
		vtkImplicitFunction *	arg1
		CODE:
		THIS->SetImplicitFunction(arg1);
		XSRETURN_EMPTY;


void
vtkSampleFunction::SetModelBounds(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		float  	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		float 	arg6
		CODE:
		THIS->SetModelBounds(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkSampleFunction::SetModelBounds\n");



void
vtkSampleFunction::SetSampleDimensions(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetSampleDimensions(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkSampleFunction::SetSampleDimensions\n");



void
vtkSampleFunction::SetScalars(arg1)
		vtkScalars *	arg1
		CODE:
		THIS->SetScalars(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ScalarTree PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkScalarTree::BuildTree()
		CODE:
		THIS->BuildTree();
		XSRETURN_EMPTY;


int
vtkScalarTree::GetBranchingFactor()
		CODE:
		RETVAL = THIS->GetBranchingFactor();
		OUTPUT:
		RETVAL


const char *
vtkScalarTree::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkScalarTree::GetDataSet()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetDataSet();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkScalarTree::GetLevel()
		CODE:
		RETVAL = THIS->GetLevel();
		OUTPUT:
		RETVAL


int
vtkScalarTree::GetMaxLevel()
		CODE:
		RETVAL = THIS->GetMaxLevel();
		OUTPUT:
		RETVAL


void
vtkScalarTree::InitTraversal(scalarValue)
		float 	scalarValue
		CODE:
		THIS->InitTraversal(scalarValue);
		XSRETURN_EMPTY;


void
vtkScalarTree::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


static vtkScalarTree*
vtkScalarTree::New()
		CODE:
		RETVAL = vtkScalarTree::New();
		OUTPUT:
		RETVAL


void
vtkScalarTree::SetBranchingFactor(arg1)
		int 	arg1
		CODE:
		THIS->SetBranchingFactor(arg1);
		XSRETURN_EMPTY;


void
vtkScalarTree::SetDataSet(arg1)
		vtkDataSet *	arg1
		CODE:
		THIS->SetDataSet(arg1);
		XSRETURN_EMPTY;


void
vtkScalarTree::SetMaxLevel(arg1)
		int 	arg1
		CODE:
		THIS->SetMaxLevel(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::SelectPolyData PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkSelectPolyData::GenerateSelectionScalarsOff()
		CODE:
		THIS->GenerateSelectionScalarsOff();
		XSRETURN_EMPTY;


void
vtkSelectPolyData::GenerateSelectionScalarsOn()
		CODE:
		THIS->GenerateSelectionScalarsOn();
		XSRETURN_EMPTY;


void
vtkSelectPolyData::GenerateUnselectedOutputOff()
		CODE:
		THIS->GenerateUnselectedOutputOff();
		XSRETURN_EMPTY;


void
vtkSelectPolyData::GenerateUnselectedOutputOn()
		CODE:
		THIS->GenerateUnselectedOutputOn();
		XSRETURN_EMPTY;


const char *
vtkSelectPolyData::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkSelectPolyData::GetGenerateSelectionScalars()
		CODE:
		RETVAL = THIS->GetGenerateSelectionScalars();
		OUTPUT:
		RETVAL


int
vtkSelectPolyData::GetGenerateUnselectedOutput()
		CODE:
		RETVAL = THIS->GetGenerateUnselectedOutput();
		OUTPUT:
		RETVAL


int
vtkSelectPolyData::GetInsideOut()
		CODE:
		RETVAL = THIS->GetInsideOut();
		OUTPUT:
		RETVAL


vtkPoints *
vtkSelectPolyData::GetLoop()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPoints";
		CODE:
		RETVAL = THIS->GetLoop();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkSelectPolyData::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


vtkPolyData *
vtkSelectPolyData::GetSelectionEdges()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPolyData";
		CODE:
		RETVAL = THIS->GetSelectionEdges();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkSelectPolyData::GetSelectionMode()
		CODE:
		RETVAL = THIS->GetSelectionMode();
		OUTPUT:
		RETVAL


const char *
vtkSelectPolyData::GetSelectionModeAsString()
		CODE:
		RETVAL = THIS->GetSelectionModeAsString();
		OUTPUT:
		RETVAL


vtkPolyData *
vtkSelectPolyData::GetUnselectedOutput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPolyData";
		CODE:
		RETVAL = THIS->GetUnselectedOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkSelectPolyData::InRegisterLoop(arg1)
		vtkObject *	arg1
		CODE:
		RETVAL = THIS->InRegisterLoop(arg1);
		OUTPUT:
		RETVAL


void
vtkSelectPolyData::InsideOutOff()
		CODE:
		THIS->InsideOutOff();
		XSRETURN_EMPTY;


void
vtkSelectPolyData::InsideOutOn()
		CODE:
		THIS->InsideOutOn();
		XSRETURN_EMPTY;


static vtkSelectPolyData*
vtkSelectPolyData::New()
		CODE:
		RETVAL = vtkSelectPolyData::New();
		OUTPUT:
		RETVAL


void
vtkSelectPolyData::SetGenerateSelectionScalars(arg1)
		int 	arg1
		CODE:
		THIS->SetGenerateSelectionScalars(arg1);
		XSRETURN_EMPTY;


void
vtkSelectPolyData::SetGenerateUnselectedOutput(arg1)
		int 	arg1
		CODE:
		THIS->SetGenerateUnselectedOutput(arg1);
		XSRETURN_EMPTY;


void
vtkSelectPolyData::SetInsideOut(arg1)
		int 	arg1
		CODE:
		THIS->SetInsideOut(arg1);
		XSRETURN_EMPTY;


void
vtkSelectPolyData::SetLoop(arg1)
		vtkPoints *	arg1
		CODE:
		THIS->SetLoop(arg1);
		XSRETURN_EMPTY;


void
vtkSelectPolyData::SetSelectionMode(arg1)
		int 	arg1
		CODE:
		THIS->SetSelectionMode(arg1);
		XSRETURN_EMPTY;


void
vtkSelectPolyData::SetSelectionModeToClosestPointRegion()
		CODE:
		THIS->SetSelectionModeToClosestPointRegion();
		XSRETURN_EMPTY;


void
vtkSelectPolyData::SetSelectionModeToLargestRegion()
		CODE:
		THIS->SetSelectionModeToLargestRegion();
		XSRETURN_EMPTY;


void
vtkSelectPolyData::SetSelectionModeToSmallestRegion()
		CODE:
		THIS->SetSelectionModeToSmallestRegion();
		XSRETURN_EMPTY;


void
vtkSelectPolyData::UnRegister(o)
		vtkObject *	o
		CODE:
		THIS->UnRegister(o);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::SelectVisiblePoints PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkSelectVisiblePoints::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


unsigned long
vtkSelectVisiblePoints::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


vtkRenderer *
vtkSelectVisiblePoints::GetRenderer()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkRenderer";
		CODE:
		RETVAL = THIS->GetRenderer();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkSelectVisiblePoints::GetSelectInvisible()
		CODE:
		RETVAL = THIS->GetSelectInvisible();
		OUTPUT:
		RETVAL


int  *
vtkSelectVisiblePoints::GetSelection()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetSelection();
		EXTEND(SP, 4);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));


int
vtkSelectVisiblePoints::GetSelectionWindow()
		CODE:
		RETVAL = THIS->GetSelectionWindow();
		OUTPUT:
		RETVAL


float
vtkSelectVisiblePoints::GetTolerance()
		CODE:
		RETVAL = THIS->GetTolerance();
		OUTPUT:
		RETVAL


static vtkSelectVisiblePoints*
vtkSelectVisiblePoints::New()
		CODE:
		RETVAL = vtkSelectVisiblePoints::New();
		OUTPUT:
		RETVAL


void
vtkSelectVisiblePoints::SelectInvisibleOff()
		CODE:
		THIS->SelectInvisibleOff();
		XSRETURN_EMPTY;


void
vtkSelectVisiblePoints::SelectInvisibleOn()
		CODE:
		THIS->SelectInvisibleOn();
		XSRETURN_EMPTY;


void
vtkSelectVisiblePoints::SelectionWindowOff()
		CODE:
		THIS->SelectionWindowOff();
		XSRETURN_EMPTY;


void
vtkSelectVisiblePoints::SelectionWindowOn()
		CODE:
		THIS->SelectionWindowOn();
		XSRETURN_EMPTY;


void
vtkSelectVisiblePoints::SetRenderer(ren)
		vtkRenderer *	ren
		CODE:
		THIS->SetRenderer(ren);
		XSRETURN_EMPTY;


void
vtkSelectVisiblePoints::SetSelectInvisible(arg1)
		int 	arg1
		CODE:
		THIS->SetSelectInvisible(arg1);
		XSRETURN_EMPTY;


void
vtkSelectVisiblePoints::SetSelection(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		int  	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		CODE:
		THIS->SetSelection(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkSelectVisiblePoints::SetSelection\n");



void
vtkSelectVisiblePoints::SetSelectionWindow(arg1)
		int 	arg1
		CODE:
		THIS->SetSelectionWindow(arg1);
		XSRETURN_EMPTY;


void
vtkSelectVisiblePoints::SetTolerance(arg1)
		float 	arg1
		CODE:
		THIS->SetTolerance(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ShepardMethod PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkShepardMethod::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkShepardMethod::GetMaximumDistance()
		CODE:
		RETVAL = THIS->GetMaximumDistance();
		OUTPUT:
		RETVAL


float  *
vtkShepardMethod::GetModelBounds()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetModelBounds();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


float
vtkShepardMethod::GetNullValue()
		CODE:
		RETVAL = THIS->GetNullValue();
		OUTPUT:
		RETVAL


int  *
vtkShepardMethod::GetSampleDimensions()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetSampleDimensions();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


static vtkShepardMethod*
vtkShepardMethod::New()
		CODE:
		RETVAL = vtkShepardMethod::New();
		OUTPUT:
		RETVAL


void
vtkShepardMethod::SetMaximumDistance(arg1)
		float 	arg1
		CODE:
		THIS->SetMaximumDistance(arg1);
		XSRETURN_EMPTY;


void
vtkShepardMethod::SetModelBounds(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		float  	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		float 	arg6
		CODE:
		THIS->SetModelBounds(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkShepardMethod::SetModelBounds\n");



void
vtkShepardMethod::SetNullValue(arg1)
		float 	arg1
		CODE:
		THIS->SetNullValue(arg1);
		XSRETURN_EMPTY;


void
vtkShepardMethod::SetSampleDimensions(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetSampleDimensions(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkShepardMethod::SetSampleDimensions\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ShrinkFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkShrinkFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkShrinkFilter::GetShrinkFactor()
		CODE:
		RETVAL = THIS->GetShrinkFactor();
		OUTPUT:
		RETVAL


static vtkShrinkFilter*
vtkShrinkFilter::New()
		CODE:
		RETVAL = vtkShrinkFilter::New();
		OUTPUT:
		RETVAL


void
vtkShrinkFilter::SetShrinkFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetShrinkFactor(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ShrinkPolyData PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkShrinkPolyData::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkShrinkPolyData::GetShrinkFactor()
		CODE:
		RETVAL = THIS->GetShrinkFactor();
		OUTPUT:
		RETVAL


static vtkShrinkPolyData*
vtkShrinkPolyData::New()
		CODE:
		RETVAL = vtkShrinkPolyData::New();
		OUTPUT:
		RETVAL


void
vtkShrinkPolyData::SetShrinkFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetShrinkFactor(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::SimpleElevationFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkSimpleElevationFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkSimpleElevationFilter::GetVector()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetVector();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


static vtkSimpleElevationFilter*
vtkSimpleElevationFilter::New()
		CODE:
		RETVAL = vtkSimpleElevationFilter::New();
		OUTPUT:
		RETVAL


void
vtkSimpleElevationFilter::SetVector(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetVector(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkSimpleElevationFilter::SetVector\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::SmoothPolyDataFilter PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkSmoothPolyDataFilter::BoundarySmoothingOff()
		CODE:
		THIS->BoundarySmoothingOff();
		XSRETURN_EMPTY;


void
vtkSmoothPolyDataFilter::BoundarySmoothingOn()
		CODE:
		THIS->BoundarySmoothingOn();
		XSRETURN_EMPTY;


void
vtkSmoothPolyDataFilter::FeatureEdgeSmoothingOff()
		CODE:
		THIS->FeatureEdgeSmoothingOff();
		XSRETURN_EMPTY;


void
vtkSmoothPolyDataFilter::FeatureEdgeSmoothingOn()
		CODE:
		THIS->FeatureEdgeSmoothingOn();
		XSRETURN_EMPTY;


void
vtkSmoothPolyDataFilter::GenerateErrorScalarsOff()
		CODE:
		THIS->GenerateErrorScalarsOff();
		XSRETURN_EMPTY;


void
vtkSmoothPolyDataFilter::GenerateErrorScalarsOn()
		CODE:
		THIS->GenerateErrorScalarsOn();
		XSRETURN_EMPTY;


void
vtkSmoothPolyDataFilter::GenerateErrorVectorsOff()
		CODE:
		THIS->GenerateErrorVectorsOff();
		XSRETURN_EMPTY;


void
vtkSmoothPolyDataFilter::GenerateErrorVectorsOn()
		CODE:
		THIS->GenerateErrorVectorsOn();
		XSRETURN_EMPTY;


int
vtkSmoothPolyDataFilter::GetBoundarySmoothing()
		CODE:
		RETVAL = THIS->GetBoundarySmoothing();
		OUTPUT:
		RETVAL


const char *
vtkSmoothPolyDataFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkSmoothPolyDataFilter::GetConvergence()
		CODE:
		RETVAL = THIS->GetConvergence();
		OUTPUT:
		RETVAL


float
vtkSmoothPolyDataFilter::GetEdgeAngle()
		CODE:
		RETVAL = THIS->GetEdgeAngle();
		OUTPUT:
		RETVAL


float
vtkSmoothPolyDataFilter::GetFeatureAngle()
		CODE:
		RETVAL = THIS->GetFeatureAngle();
		OUTPUT:
		RETVAL


int
vtkSmoothPolyDataFilter::GetFeatureEdgeSmoothing()
		CODE:
		RETVAL = THIS->GetFeatureEdgeSmoothing();
		OUTPUT:
		RETVAL


int
vtkSmoothPolyDataFilter::GetGenerateErrorScalars()
		CODE:
		RETVAL = THIS->GetGenerateErrorScalars();
		OUTPUT:
		RETVAL


int
vtkSmoothPolyDataFilter::GetGenerateErrorVectors()
		CODE:
		RETVAL = THIS->GetGenerateErrorVectors();
		OUTPUT:
		RETVAL


int
vtkSmoothPolyDataFilter::GetNumberOfIterations()
		CODE:
		RETVAL = THIS->GetNumberOfIterations();
		OUTPUT:
		RETVAL


float
vtkSmoothPolyDataFilter::GetRelaxationFactor()
		CODE:
		RETVAL = THIS->GetRelaxationFactor();
		OUTPUT:
		RETVAL


vtkPolyData *
vtkSmoothPolyDataFilter::GetSource()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPolyData";
		CODE:
		RETVAL = THIS->GetSource();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkSmoothPolyDataFilter*
vtkSmoothPolyDataFilter::New()
		CODE:
		RETVAL = vtkSmoothPolyDataFilter::New();
		OUTPUT:
		RETVAL


void
vtkSmoothPolyDataFilter::SetBoundarySmoothing(arg1)
		int 	arg1
		CODE:
		THIS->SetBoundarySmoothing(arg1);
		XSRETURN_EMPTY;


void
vtkSmoothPolyDataFilter::SetConvergence(arg1)
		float 	arg1
		CODE:
		THIS->SetConvergence(arg1);
		XSRETURN_EMPTY;


void
vtkSmoothPolyDataFilter::SetEdgeAngle(arg1)
		float 	arg1
		CODE:
		THIS->SetEdgeAngle(arg1);
		XSRETURN_EMPTY;


void
vtkSmoothPolyDataFilter::SetFeatureAngle(arg1)
		float 	arg1
		CODE:
		THIS->SetFeatureAngle(arg1);
		XSRETURN_EMPTY;


void
vtkSmoothPolyDataFilter::SetFeatureEdgeSmoothing(arg1)
		int 	arg1
		CODE:
		THIS->SetFeatureEdgeSmoothing(arg1);
		XSRETURN_EMPTY;


void
vtkSmoothPolyDataFilter::SetGenerateErrorScalars(arg1)
		int 	arg1
		CODE:
		THIS->SetGenerateErrorScalars(arg1);
		XSRETURN_EMPTY;


void
vtkSmoothPolyDataFilter::SetGenerateErrorVectors(arg1)
		int 	arg1
		CODE:
		THIS->SetGenerateErrorVectors(arg1);
		XSRETURN_EMPTY;


void
vtkSmoothPolyDataFilter::SetNumberOfIterations(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfIterations(arg1);
		XSRETURN_EMPTY;


void
vtkSmoothPolyDataFilter::SetRelaxationFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetRelaxationFactor(arg1);
		XSRETURN_EMPTY;


void
vtkSmoothPolyDataFilter::SetSource(source)
		vtkPolyData *	source
		CODE:
		THIS->SetSource(source);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::SpatialRepresentationFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkSpatialRepresentationFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkSpatialRepresentationFilter::GetInput()
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
vtkSpatialRepresentationFilter::GetLevel()
		CODE:
		RETVAL = THIS->GetLevel();
		OUTPUT:
		RETVAL


vtkPolyData *
vtkSpatialRepresentationFilter::GetOutput(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPolyData";
		CODE:
		RETVAL = THIS->GetOutput(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE: items == 1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPolyData";
		CODE:
		RETVAL = THIS->GetOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkSpatialRepresentationFilter::GetOutput\n");



vtkLocator *
vtkSpatialRepresentationFilter::GetSpatialRepresentation()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkLocator";
		CODE:
		RETVAL = THIS->GetSpatialRepresentation();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkSpatialRepresentationFilter*
vtkSpatialRepresentationFilter::New()
		CODE:
		RETVAL = vtkSpatialRepresentationFilter::New();
		OUTPUT:
		RETVAL


void
vtkSpatialRepresentationFilter::ResetOutput()
		CODE:
		THIS->ResetOutput();
		XSRETURN_EMPTY;


void
vtkSpatialRepresentationFilter::SetInput(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::ImageData")
		vtkImageData *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataSet")
		vtkDataSet *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkSpatialRepresentationFilter::SetInput\n");



void
vtkSpatialRepresentationFilter::SetSpatialRepresentation(arg1)
		vtkLocator *	arg1
		CODE:
		THIS->SetSpatialRepresentation(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Sphere PREFIX = vtk

PROTOTYPES: DISABLE



float
vtkSphere::EvaluateFunction(arg1 = 0, arg2 = 0, arg3 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkSphere::EvaluateFunction\n");



float  *
vtkSphere::GetCenter()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetCenter();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


const char *
vtkSphere::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkSphere::GetRadius()
		CODE:
		RETVAL = THIS->GetRadius();
		OUTPUT:
		RETVAL


static vtkSphere*
vtkSphere::New()
		CODE:
		RETVAL = vtkSphere::New();
		OUTPUT:
		RETVAL


void
vtkSphere::SetCenter(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetCenter(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkSphere::SetCenter\n");



void
vtkSphere::SetRadius(arg1)
		float 	arg1
		CODE:
		THIS->SetRadius(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::SphereSource PREFIX = vtk

PROTOTYPES: DISABLE



float  *
vtkSphereSource::GetCenter()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetCenter();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


const char *
vtkSphereSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkSphereSource::GetEndPhi()
		CODE:
		RETVAL = THIS->GetEndPhi();
		OUTPUT:
		RETVAL


float
vtkSphereSource::GetEndTheta()
		CODE:
		RETVAL = THIS->GetEndTheta();
		OUTPUT:
		RETVAL


int
vtkSphereSource::GetPhiResolution()
		CODE:
		RETVAL = THIS->GetPhiResolution();
		OUTPUT:
		RETVAL


float
vtkSphereSource::GetRadius()
		CODE:
		RETVAL = THIS->GetRadius();
		OUTPUT:
		RETVAL


float
vtkSphereSource::GetStartPhi()
		CODE:
		RETVAL = THIS->GetStartPhi();
		OUTPUT:
		RETVAL


float
vtkSphereSource::GetStartTheta()
		CODE:
		RETVAL = THIS->GetStartTheta();
		OUTPUT:
		RETVAL


int
vtkSphereSource::GetThetaResolution()
		CODE:
		RETVAL = THIS->GetThetaResolution();
		OUTPUT:
		RETVAL


static vtkSphereSource*
vtkSphereSource::New()
		CODE:
		RETVAL = vtkSphereSource::New();
		OUTPUT:
		RETVAL


void
vtkSphereSource::SetCenter(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetCenter(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkSphereSource::SetCenter\n");



void
vtkSphereSource::SetEndPhi(arg1)
		float 	arg1
		CODE:
		THIS->SetEndPhi(arg1);
		XSRETURN_EMPTY;


void
vtkSphereSource::SetEndTheta(arg1)
		float 	arg1
		CODE:
		THIS->SetEndTheta(arg1);
		XSRETURN_EMPTY;


void
vtkSphereSource::SetPhiResolution(arg1)
		int 	arg1
		CODE:
		THIS->SetPhiResolution(arg1);
		XSRETURN_EMPTY;


void
vtkSphereSource::SetRadius(arg1)
		float 	arg1
		CODE:
		THIS->SetRadius(arg1);
		XSRETURN_EMPTY;


void
vtkSphereSource::SetStartPhi(arg1)
		float 	arg1
		CODE:
		THIS->SetStartPhi(arg1);
		XSRETURN_EMPTY;


void
vtkSphereSource::SetStartTheta(arg1)
		float 	arg1
		CODE:
		THIS->SetStartTheta(arg1);
		XSRETURN_EMPTY;


void
vtkSphereSource::SetThetaResolution(arg1)
		int 	arg1
		CODE:
		THIS->SetThetaResolution(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::StreamLine PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkStreamLine::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkStreamLine::GetStepLength()
		CODE:
		RETVAL = THIS->GetStepLength();
		OUTPUT:
		RETVAL


static vtkStreamLine*
vtkStreamLine::New()
		CODE:
		RETVAL = vtkStreamLine::New();
		OUTPUT:
		RETVAL


void
vtkStreamLine::SetStepLength(arg1)
		float 	arg1
		CODE:
		THIS->SetStepLength(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::StreamPoints PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkStreamPoints::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkStreamPoints::GetTimeIncrement()
		CODE:
		RETVAL = THIS->GetTimeIncrement();
		OUTPUT:
		RETVAL


static vtkStreamPoints*
vtkStreamPoints::New()
		CODE:
		RETVAL = vtkStreamPoints::New();
		OUTPUT:
		RETVAL


void
vtkStreamPoints::SetTimeIncrement(arg1)
		float 	arg1
		CODE:
		THIS->SetTimeIncrement(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Streamer PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkStreamer::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkStreamer::GetIntegrationDirection()
		CODE:
		RETVAL = THIS->GetIntegrationDirection();
		OUTPUT:
		RETVAL


const char *
vtkStreamer::GetIntegrationDirectionAsString()
		CODE:
		RETVAL = THIS->GetIntegrationDirectionAsString();
		OUTPUT:
		RETVAL


float
vtkStreamer::GetIntegrationStepLength()
		CODE:
		RETVAL = THIS->GetIntegrationStepLength();
		OUTPUT:
		RETVAL


vtkInitialValueProblemSolver *
vtkStreamer::GetIntegrator()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkInitialValueProblemSolver";
		CODE:
		RETVAL = THIS->GetIntegrator();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float
vtkStreamer::GetMaximumPropagationTime()
		CODE:
		RETVAL = THIS->GetMaximumPropagationTime();
		OUTPUT:
		RETVAL


int
vtkStreamer::GetNumberOfThreads()
		CODE:
		RETVAL = THIS->GetNumberOfThreads();
		OUTPUT:
		RETVAL


float
vtkStreamer::GetSavePointInterval()
		CODE:
		RETVAL = THIS->GetSavePointInterval();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkStreamer::GetSource()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetSource();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkStreamer::GetSpeedScalars()
		CODE:
		RETVAL = THIS->GetSpeedScalars();
		OUTPUT:
		RETVAL


float *
vtkStreamer::GetStartPosition()
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetStartPosition();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float
vtkStreamer::GetTerminalSpeed()
		CODE:
		RETVAL = THIS->GetTerminalSpeed();
		OUTPUT:
		RETVAL


int
vtkStreamer::GetVorticity()
		CODE:
		RETVAL = THIS->GetVorticity();
		OUTPUT:
		RETVAL


static vtkStreamer*
vtkStreamer::New()
		CODE:
		RETVAL = vtkStreamer::New();
		OUTPUT:
		RETVAL


void
vtkStreamer::SetIntegrationDirection(arg1)
		int 	arg1
		CODE:
		THIS->SetIntegrationDirection(arg1);
		XSRETURN_EMPTY;


void
vtkStreamer::SetIntegrationDirectionToBackward()
		CODE:
		THIS->SetIntegrationDirectionToBackward();
		XSRETURN_EMPTY;


void
vtkStreamer::SetIntegrationDirectionToForward()
		CODE:
		THIS->SetIntegrationDirectionToForward();
		XSRETURN_EMPTY;


void
vtkStreamer::SetIntegrationDirectionToIntegrateBothDirections()
		CODE:
		THIS->SetIntegrationDirectionToIntegrateBothDirections();
		XSRETURN_EMPTY;


void
vtkStreamer::SetIntegrationStepLength(arg1)
		float 	arg1
		CODE:
		THIS->SetIntegrationStepLength(arg1);
		XSRETURN_EMPTY;


void
vtkStreamer::SetIntegrator(arg1)
		vtkInitialValueProblemSolver *	arg1
		CODE:
		THIS->SetIntegrator(arg1);
		XSRETURN_EMPTY;


void
vtkStreamer::SetMaximumPropagationTime(arg1)
		float 	arg1
		CODE:
		THIS->SetMaximumPropagationTime(arg1);
		XSRETURN_EMPTY;


void
vtkStreamer::SetNumberOfThreads(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfThreads(arg1);
		XSRETURN_EMPTY;


void
vtkStreamer::SetSavePointInterval(arg1)
		float 	arg1
		CODE:
		THIS->SetSavePointInterval(arg1);
		XSRETURN_EMPTY;


void
vtkStreamer::SetSource(source)
		vtkDataSet *	source
		CODE:
		THIS->SetSource(source);
		XSRETURN_EMPTY;


void
vtkStreamer::SetSpeedScalars(arg1)
		int 	arg1
		CODE:
		THIS->SetSpeedScalars(arg1);
		XSRETURN_EMPTY;


void
vtkStreamer::SetStartLocation(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0)
	CASE: items == 6
		int 	arg1
		int 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		CODE:
		THIS->SetStartLocation(arg1, arg2, arg3, arg4, arg5);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkStreamer::SetStartLocation\n");



void
vtkStreamer::SetStartPosition(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetStartPosition(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkStreamer::SetStartPosition\n");



void
vtkStreamer::SetTerminalSpeed(arg1)
		float 	arg1
		CODE:
		THIS->SetTerminalSpeed(arg1);
		XSRETURN_EMPTY;


void
vtkStreamer::SetVorticity(arg1)
		int 	arg1
		CODE:
		THIS->SetVorticity(arg1);
		XSRETURN_EMPTY;


void
vtkStreamer::SpeedScalarsOff()
		CODE:
		THIS->SpeedScalarsOff();
		XSRETURN_EMPTY;


void
vtkStreamer::SpeedScalarsOn()
		CODE:
		THIS->SpeedScalarsOn();
		XSRETURN_EMPTY;


void
vtkStreamer::VorticityOff()
		CODE:
		THIS->VorticityOff();
		XSRETURN_EMPTY;


void
vtkStreamer::VorticityOn()
		CODE:
		THIS->VorticityOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Stripper PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkStripper::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkStripper::GetMaximumLength()
		CODE:
		RETVAL = THIS->GetMaximumLength();
		OUTPUT:
		RETVAL


static vtkStripper*
vtkStripper::New()
		CODE:
		RETVAL = vtkStripper::New();
		OUTPUT:
		RETVAL


void
vtkStripper::SetMaximumLength(arg1)
		int 	arg1
		CODE:
		THIS->SetMaximumLength(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::StructuredGridGeometryFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkStructuredGridGeometryFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int  *
vtkStructuredGridGeometryFilter::GetExtent()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetExtent();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


static vtkStructuredGridGeometryFilter*
vtkStructuredGridGeometryFilter::New()
		CODE:
		RETVAL = vtkStructuredGridGeometryFilter::New();
		OUTPUT:
		RETVAL


void
vtkStructuredGridGeometryFilter::SetExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int 	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetExtent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkStructuredGridGeometryFilter::SetExtent\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::StructuredGridOutlineFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkStructuredGridOutlineFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkStructuredGridOutlineFilter*
vtkStructuredGridOutlineFilter::New()
		CODE:
		RETVAL = vtkStructuredGridOutlineFilter::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::StructuredGridReader PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkStructuredGridReader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkStructuredGrid *
vtkStructuredGridReader::GetOutput(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredGrid";
		CODE:
		RETVAL = THIS->GetOutput(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE: items == 1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredGrid";
		CODE:
		RETVAL = THIS->GetOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkStructuredGridReader::GetOutput\n");



static vtkStructuredGridReader*
vtkStructuredGridReader::New()
		CODE:
		RETVAL = vtkStructuredGridReader::New();
		OUTPUT:
		RETVAL


void
vtkStructuredGridReader::SetOutput(output)
		vtkStructuredGrid *	output
		CODE:
		THIS->SetOutput(output);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::StructuredGridSource PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkStructuredGridSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkStructuredGrid *
vtkStructuredGridSource::GetOutput(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredGrid";
		CODE:
		RETVAL = THIS->GetOutput(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE: items == 1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredGrid";
		CODE:
		RETVAL = THIS->GetOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkStructuredGridSource::GetOutput\n");



static vtkStructuredGridSource*
vtkStructuredGridSource::New()
		CODE:
		RETVAL = vtkStructuredGridSource::New();
		OUTPUT:
		RETVAL


void
vtkStructuredGridSource::SetOutput(output)
		vtkStructuredGrid *	output
		CODE:
		THIS->SetOutput(output);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::StructuredGridWriter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkStructuredGridWriter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkStructuredGrid *
vtkStructuredGridWriter::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredGrid";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkStructuredGridWriter*
vtkStructuredGridWriter::New()
		CODE:
		RETVAL = vtkStructuredGridWriter::New();
		OUTPUT:
		RETVAL


void
vtkStructuredGridWriter::SetInput(input)
		vtkStructuredGrid *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::StructuredPointsGeometryFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkStructuredPointsGeometryFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkStructuredPointsGeometryFilter*
vtkStructuredPointsGeometryFilter::New()
		CODE:
		RETVAL = vtkStructuredPointsGeometryFilter::New();
		OUTPUT:
		RETVAL


void
vtkStructuredPointsGeometryFilter::SetExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int 	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetExtent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkStructuredPointsGeometryFilter::SetExtent\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::StructuredPointsCollection PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkStructuredPointsCollection::AddItem(arg1 = 0)
	CASE: items == 2
		vtkStructuredPoints *	arg1
		CODE:
		THIS->AddItem(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkStructuredPointsCollection::AddItem\n");



const char *
vtkStructuredPointsCollection::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkStructuredPoints *
vtkStructuredPointsCollection::GetNextItem()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredPoints";
		CODE:
		RETVAL = THIS->GetNextItem();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkStructuredPointsCollection*
vtkStructuredPointsCollection::New()
		CODE:
		RETVAL = vtkStructuredPointsCollection::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::StructuredPointsReader PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkStructuredPointsReader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkStructuredPoints *
vtkStructuredPointsReader::GetOutput(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredPoints";
		CODE:
		RETVAL = THIS->GetOutput(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE: items == 1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredPoints";
		CODE:
		RETVAL = THIS->GetOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkStructuredPointsReader::GetOutput\n");



static vtkStructuredPointsReader*
vtkStructuredPointsReader::New()
		CODE:
		RETVAL = vtkStructuredPointsReader::New();
		OUTPUT:
		RETVAL


void
vtkStructuredPointsReader::SetOutput(output)
		vtkStructuredPoints *	output
		CODE:
		THIS->SetOutput(output);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::StructuredPointsSource PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkStructuredPointsSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkStructuredPoints *
vtkStructuredPointsSource::GetOutput(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredPoints";
		CODE:
		RETVAL = THIS->GetOutput(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE: items == 1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredPoints";
		CODE:
		RETVAL = THIS->GetOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkStructuredPointsSource::GetOutput\n");



static vtkStructuredPointsSource*
vtkStructuredPointsSource::New()
		CODE:
		RETVAL = vtkStructuredPointsSource::New();
		OUTPUT:
		RETVAL


void
vtkStructuredPointsSource::SetOutput(output)
		vtkStructuredPoints *	output
		CODE:
		THIS->SetOutput(output);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::StructuredPointsWriter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkStructuredPointsWriter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkStructuredPoints *
vtkStructuredPointsWriter::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredPoints";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkStructuredPointsWriter*
vtkStructuredPointsWriter::New()
		CODE:
		RETVAL = vtkStructuredPointsWriter::New();
		OUTPUT:
		RETVAL


void
vtkStructuredPointsWriter::SetInput(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::StructuredPoints")
		vtkStructuredPoints *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::ImageData")
		vtkImageData *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkStructuredPointsWriter::SetInput\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::SubPixelPositionEdgels PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkSubPixelPositionEdgels::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkStructuredPoints *
vtkSubPixelPositionEdgels::GetGradMaps()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredPoints";
		CODE:
		RETVAL = THIS->GetGradMaps();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkSubPixelPositionEdgels::GetTargetFlag()
		CODE:
		RETVAL = THIS->GetTargetFlag();
		OUTPUT:
		RETVAL


float
vtkSubPixelPositionEdgels::GetTargetValue()
		CODE:
		RETVAL = THIS->GetTargetValue();
		OUTPUT:
		RETVAL


static vtkSubPixelPositionEdgels*
vtkSubPixelPositionEdgels::New()
		CODE:
		RETVAL = vtkSubPixelPositionEdgels::New();
		OUTPUT:
		RETVAL


void
vtkSubPixelPositionEdgels::SetGradMaps(gm)
		vtkStructuredPoints *	gm
		CODE:
		THIS->SetGradMaps(gm);
		XSRETURN_EMPTY;


void
vtkSubPixelPositionEdgels::SetTargetFlag(arg1)
		int 	arg1
		CODE:
		THIS->SetTargetFlag(arg1);
		XSRETURN_EMPTY;


void
vtkSubPixelPositionEdgels::SetTargetValue(arg1)
		float 	arg1
		CODE:
		THIS->SetTargetValue(arg1);
		XSRETURN_EMPTY;


void
vtkSubPixelPositionEdgels::TargetFlagOff()
		CODE:
		THIS->TargetFlagOff();
		XSRETURN_EMPTY;


void
vtkSubPixelPositionEdgels::TargetFlagOn()
		CODE:
		THIS->TargetFlagOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::TensorGlyph PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkTensorGlyph::ClampScalingOff()
		CODE:
		THIS->ClampScalingOff();
		XSRETURN_EMPTY;


void
vtkTensorGlyph::ClampScalingOn()
		CODE:
		THIS->ClampScalingOn();
		XSRETURN_EMPTY;


void
vtkTensorGlyph::ColorGlyphsOff()
		CODE:
		THIS->ColorGlyphsOff();
		XSRETURN_EMPTY;


void
vtkTensorGlyph::ColorGlyphsOn()
		CODE:
		THIS->ColorGlyphsOn();
		XSRETURN_EMPTY;


void
vtkTensorGlyph::ExtractEigenvaluesOff()
		CODE:
		THIS->ExtractEigenvaluesOff();
		XSRETURN_EMPTY;


void
vtkTensorGlyph::ExtractEigenvaluesOn()
		CODE:
		THIS->ExtractEigenvaluesOn();
		XSRETURN_EMPTY;


int
vtkTensorGlyph::GetClampScaling()
		CODE:
		RETVAL = THIS->GetClampScaling();
		OUTPUT:
		RETVAL


const char *
vtkTensorGlyph::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkTensorGlyph::GetColorGlyphs()
		CODE:
		RETVAL = THIS->GetColorGlyphs();
		OUTPUT:
		RETVAL


int
vtkTensorGlyph::GetExtractEigenvalues()
		CODE:
		RETVAL = THIS->GetExtractEigenvalues();
		OUTPUT:
		RETVAL


float
vtkTensorGlyph::GetMaxScaleFactor()
		CODE:
		RETVAL = THIS->GetMaxScaleFactor();
		OUTPUT:
		RETVAL


float
vtkTensorGlyph::GetScaleFactor()
		CODE:
		RETVAL = THIS->GetScaleFactor();
		OUTPUT:
		RETVAL


int
vtkTensorGlyph::GetScaling()
		CODE:
		RETVAL = THIS->GetScaling();
		OUTPUT:
		RETVAL


vtkPolyData *
vtkTensorGlyph::GetSource()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPolyData";
		CODE:
		RETVAL = THIS->GetSource();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkTensorGlyph*
vtkTensorGlyph::New()
		CODE:
		RETVAL = vtkTensorGlyph::New();
		OUTPUT:
		RETVAL


void
vtkTensorGlyph::ScalingOff()
		CODE:
		THIS->ScalingOff();
		XSRETURN_EMPTY;


void
vtkTensorGlyph::ScalingOn()
		CODE:
		THIS->ScalingOn();
		XSRETURN_EMPTY;


void
vtkTensorGlyph::SetClampScaling(arg1)
		int 	arg1
		CODE:
		THIS->SetClampScaling(arg1);
		XSRETURN_EMPTY;


void
vtkTensorGlyph::SetColorGlyphs(arg1)
		int 	arg1
		CODE:
		THIS->SetColorGlyphs(arg1);
		XSRETURN_EMPTY;


void
vtkTensorGlyph::SetExtractEigenvalues(arg1)
		int 	arg1
		CODE:
		THIS->SetExtractEigenvalues(arg1);
		XSRETURN_EMPTY;


void
vtkTensorGlyph::SetMaxScaleFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetMaxScaleFactor(arg1);
		XSRETURN_EMPTY;


void
vtkTensorGlyph::SetScaleFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetScaleFactor(arg1);
		XSRETURN_EMPTY;


void
vtkTensorGlyph::SetScaling(arg1)
		int 	arg1
		CODE:
		THIS->SetScaling(arg1);
		XSRETURN_EMPTY;


void
vtkTensorGlyph::SetSource(source)
		vtkPolyData *	source
		CODE:
		THIS->SetSource(source);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::TextSource PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkTextSource::BackingOff()
		CODE:
		THIS->BackingOff();
		XSRETURN_EMPTY;


void
vtkTextSource::BackingOn()
		CODE:
		THIS->BackingOn();
		XSRETURN_EMPTY;


float  *
vtkTextSource::GetBackgroundColor()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetBackgroundColor();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkTextSource::GetBacking()
		CODE:
		RETVAL = THIS->GetBacking();
		OUTPUT:
		RETVAL


const char *
vtkTextSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkTextSource::GetForegroundColor()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetForegroundColor();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


char *
vtkTextSource::GetText()
		CODE:
		RETVAL = THIS->GetText();
		OUTPUT:
		RETVAL


static vtkTextSource*
vtkTextSource::New()
		CODE:
		RETVAL = vtkTextSource::New();
		OUTPUT:
		RETVAL


void
vtkTextSource::SetBackgroundColor(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetBackgroundColor(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTextSource::SetBackgroundColor\n");



void
vtkTextSource::SetBacking(arg1)
		int 	arg1
		CODE:
		THIS->SetBacking(arg1);
		XSRETURN_EMPTY;


void
vtkTextSource::SetForegroundColor(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetForegroundColor(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTextSource::SetForegroundColor\n");



void
vtkTextSource::SetText(arg1)
		char *	arg1
		CODE:
		THIS->SetText(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Texture PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkTexture::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkStructuredPoints *
vtkTexture::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredPoints";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkTexture::GetInterpolate()
		CODE:
		RETVAL = THIS->GetInterpolate();
		OUTPUT:
		RETVAL


vtkLookupTable *
vtkTexture::GetLookupTable()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkLookupTable";
		CODE:
		RETVAL = THIS->GetLookupTable();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkTexture::GetMapColorScalarsThroughLookupTable()
		CODE:
		RETVAL = THIS->GetMapColorScalarsThroughLookupTable();
		OUTPUT:
		RETVAL


vtkScalars *
vtkTexture::GetMappedScalars()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkScalars";
		CODE:
		RETVAL = THIS->GetMappedScalars();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkTexture::GetQuality()
		CODE:
		RETVAL = THIS->GetQuality();
		OUTPUT:
		RETVAL


int
vtkTexture::GetRepeat()
		CODE:
		RETVAL = THIS->GetRepeat();
		OUTPUT:
		RETVAL


void
vtkTexture::InterpolateOff()
		CODE:
		THIS->InterpolateOff();
		XSRETURN_EMPTY;


void
vtkTexture::InterpolateOn()
		CODE:
		THIS->InterpolateOn();
		XSRETURN_EMPTY;


void
vtkTexture::Load(arg1)
		vtkRenderer *	arg1
		CODE:
		THIS->Load(arg1);
		XSRETURN_EMPTY;


void
vtkTexture::MapColorScalarsThroughLookupTableOff()
		CODE:
		THIS->MapColorScalarsThroughLookupTableOff();
		XSRETURN_EMPTY;


void
vtkTexture::MapColorScalarsThroughLookupTableOn()
		CODE:
		THIS->MapColorScalarsThroughLookupTableOn();
		XSRETURN_EMPTY;


static vtkTexture*
vtkTexture::New()
		CODE:
		RETVAL = vtkTexture::New();
		OUTPUT:
		RETVAL


void
vtkTexture::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;


void
vtkTexture::Render(ren)
		vtkRenderer *	ren
		CODE:
		THIS->Render(ren);
		XSRETURN_EMPTY;


void
vtkTexture::RepeatOff()
		CODE:
		THIS->RepeatOff();
		XSRETURN_EMPTY;


void
vtkTexture::RepeatOn()
		CODE:
		THIS->RepeatOn();
		XSRETURN_EMPTY;


void
vtkTexture::SetInput(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::StructuredPoints")
		vtkStructuredPoints *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::ImageData")
		vtkImageData *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTexture::SetInput\n");



void
vtkTexture::SetInterpolate(arg1)
		int 	arg1
		CODE:
		THIS->SetInterpolate(arg1);
		XSRETURN_EMPTY;


void
vtkTexture::SetLookupTable(arg1)
		vtkLookupTable *	arg1
		CODE:
		THIS->SetLookupTable(arg1);
		XSRETURN_EMPTY;


void
vtkTexture::SetMapColorScalarsThroughLookupTable(arg1)
		int 	arg1
		CODE:
		THIS->SetMapColorScalarsThroughLookupTable(arg1);
		XSRETURN_EMPTY;


void
vtkTexture::SetQuality(arg1)
		int 	arg1
		CODE:
		THIS->SetQuality(arg1);
		XSRETURN_EMPTY;


void
vtkTexture::SetQualityTo16Bit()
		CODE:
		THIS->SetQualityTo16Bit();
		XSRETURN_EMPTY;


void
vtkTexture::SetQualityTo32Bit()
		CODE:
		THIS->SetQualityTo32Bit();
		XSRETURN_EMPTY;


void
vtkTexture::SetQualityToDefault()
		CODE:
		THIS->SetQualityToDefault();
		XSRETURN_EMPTY;


void
vtkTexture::SetRepeat(arg1)
		int 	arg1
		CODE:
		THIS->SetRepeat(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::TextureMapToCylinder PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkTextureMapToCylinder::AutomaticCylinderGenerationOff()
		CODE:
		THIS->AutomaticCylinderGenerationOff();
		XSRETURN_EMPTY;


void
vtkTextureMapToCylinder::AutomaticCylinderGenerationOn()
		CODE:
		THIS->AutomaticCylinderGenerationOn();
		XSRETURN_EMPTY;


int
vtkTextureMapToCylinder::GetAutomaticCylinderGeneration()
		CODE:
		RETVAL = THIS->GetAutomaticCylinderGeneration();
		OUTPUT:
		RETVAL


const char *
vtkTextureMapToCylinder::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkTextureMapToCylinder::GetPoint1()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetPoint1();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkTextureMapToCylinder::GetPoint2()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetPoint2();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkTextureMapToCylinder::GetPreventSeam()
		CODE:
		RETVAL = THIS->GetPreventSeam();
		OUTPUT:
		RETVAL


static vtkTextureMapToCylinder*
vtkTextureMapToCylinder::New()
		CODE:
		RETVAL = vtkTextureMapToCylinder::New();
		OUTPUT:
		RETVAL


void
vtkTextureMapToCylinder::PreventSeamOff()
		CODE:
		THIS->PreventSeamOff();
		XSRETURN_EMPTY;


void
vtkTextureMapToCylinder::PreventSeamOn()
		CODE:
		THIS->PreventSeamOn();
		XSRETURN_EMPTY;


void
vtkTextureMapToCylinder::SetAutomaticCylinderGeneration(arg1)
		int 	arg1
		CODE:
		THIS->SetAutomaticCylinderGeneration(arg1);
		XSRETURN_EMPTY;


void
vtkTextureMapToCylinder::SetPoint1(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetPoint1(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTextureMapToCylinder::SetPoint1\n");



void
vtkTextureMapToCylinder::SetPoint2(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetPoint2(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTextureMapToCylinder::SetPoint2\n");



void
vtkTextureMapToCylinder::SetPreventSeam(arg1)
		int 	arg1
		CODE:
		THIS->SetPreventSeam(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::TextureMapToPlane PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkTextureMapToPlane::AutomaticPlaneGenerationOff()
		CODE:
		THIS->AutomaticPlaneGenerationOff();
		XSRETURN_EMPTY;


void
vtkTextureMapToPlane::AutomaticPlaneGenerationOn()
		CODE:
		THIS->AutomaticPlaneGenerationOn();
		XSRETURN_EMPTY;


int
vtkTextureMapToPlane::GetAutomaticPlaneGeneration()
		CODE:
		RETVAL = THIS->GetAutomaticPlaneGeneration();
		OUTPUT:
		RETVAL


const char *
vtkTextureMapToPlane::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkTextureMapToPlane::GetNormal()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetNormal();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkTextureMapToPlane::GetOrigin()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetOrigin();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkTextureMapToPlane::GetPoint1()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetPoint1();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkTextureMapToPlane::GetPoint2()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetPoint2();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkTextureMapToPlane::GetSRange()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetSRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


float  *
vtkTextureMapToPlane::GetTRange()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetTRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


static vtkTextureMapToPlane*
vtkTextureMapToPlane::New()
		CODE:
		RETVAL = vtkTextureMapToPlane::New();
		OUTPUT:
		RETVAL


void
vtkTextureMapToPlane::SetAutomaticPlaneGeneration(arg1)
		int 	arg1
		CODE:
		THIS->SetAutomaticPlaneGeneration(arg1);
		XSRETURN_EMPTY;


void
vtkTextureMapToPlane::SetNormal(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetNormal(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTextureMapToPlane::SetNormal\n");



void
vtkTextureMapToPlane::SetOrigin(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetOrigin(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTextureMapToPlane::SetOrigin\n");



void
vtkTextureMapToPlane::SetPoint1(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetPoint1(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTextureMapToPlane::SetPoint1\n");



void
vtkTextureMapToPlane::SetPoint2(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetPoint2(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTextureMapToPlane::SetPoint2\n");



void
vtkTextureMapToPlane::SetSRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetSRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTextureMapToPlane::SetSRange\n");



void
vtkTextureMapToPlane::SetTRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetTRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTextureMapToPlane::SetTRange\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::TextureMapToSphere PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkTextureMapToSphere::AutomaticSphereGenerationOff()
		CODE:
		THIS->AutomaticSphereGenerationOff();
		XSRETURN_EMPTY;


void
vtkTextureMapToSphere::AutomaticSphereGenerationOn()
		CODE:
		THIS->AutomaticSphereGenerationOn();
		XSRETURN_EMPTY;


int
vtkTextureMapToSphere::GetAutomaticSphereGeneration()
		CODE:
		RETVAL = THIS->GetAutomaticSphereGeneration();
		OUTPUT:
		RETVAL


float  *
vtkTextureMapToSphere::GetCenter()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetCenter();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


const char *
vtkTextureMapToSphere::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkTextureMapToSphere::GetPreventSeam()
		CODE:
		RETVAL = THIS->GetPreventSeam();
		OUTPUT:
		RETVAL


static vtkTextureMapToSphere*
vtkTextureMapToSphere::New()
		CODE:
		RETVAL = vtkTextureMapToSphere::New();
		OUTPUT:
		RETVAL


void
vtkTextureMapToSphere::PreventSeamOff()
		CODE:
		THIS->PreventSeamOff();
		XSRETURN_EMPTY;


void
vtkTextureMapToSphere::PreventSeamOn()
		CODE:
		THIS->PreventSeamOn();
		XSRETURN_EMPTY;


void
vtkTextureMapToSphere::SetAutomaticSphereGeneration(arg1)
		int 	arg1
		CODE:
		THIS->SetAutomaticSphereGeneration(arg1);
		XSRETURN_EMPTY;


void
vtkTextureMapToSphere::SetCenter(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetCenter(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTextureMapToSphere::SetCenter\n");



void
vtkTextureMapToSphere::SetPreventSeam(arg1)
		int 	arg1
		CODE:
		THIS->SetPreventSeam(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::TexturedSphereSource PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkTexturedSphereSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkTexturedSphereSource::GetPhi()
		CODE:
		RETVAL = THIS->GetPhi();
		OUTPUT:
		RETVAL


int
vtkTexturedSphereSource::GetPhiResolution()
		CODE:
		RETVAL = THIS->GetPhiResolution();
		OUTPUT:
		RETVAL


float
vtkTexturedSphereSource::GetRadius()
		CODE:
		RETVAL = THIS->GetRadius();
		OUTPUT:
		RETVAL


float
vtkTexturedSphereSource::GetTheta()
		CODE:
		RETVAL = THIS->GetTheta();
		OUTPUT:
		RETVAL


int
vtkTexturedSphereSource::GetThetaResolution()
		CODE:
		RETVAL = THIS->GetThetaResolution();
		OUTPUT:
		RETVAL


static vtkTexturedSphereSource*
vtkTexturedSphereSource::New()
		CODE:
		RETVAL = vtkTexturedSphereSource::New();
		OUTPUT:
		RETVAL


void
vtkTexturedSphereSource::SetPhi(arg1)
		float 	arg1
		CODE:
		THIS->SetPhi(arg1);
		XSRETURN_EMPTY;


void
vtkTexturedSphereSource::SetPhiResolution(arg1)
		int 	arg1
		CODE:
		THIS->SetPhiResolution(arg1);
		XSRETURN_EMPTY;


void
vtkTexturedSphereSource::SetRadius(arg1)
		float 	arg1
		CODE:
		THIS->SetRadius(arg1);
		XSRETURN_EMPTY;


void
vtkTexturedSphereSource::SetTheta(arg1)
		float 	arg1
		CODE:
		THIS->SetTheta(arg1);
		XSRETURN_EMPTY;


void
vtkTexturedSphereSource::SetThetaResolution(arg1)
		int 	arg1
		CODE:
		THIS->SetThetaResolution(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Threshold PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkThreshold::AllScalarsOff()
		CODE:
		THIS->AllScalarsOff();
		XSRETURN_EMPTY;


void
vtkThreshold::AllScalarsOn()
		CODE:
		THIS->AllScalarsOn();
		XSRETURN_EMPTY;


int
vtkThreshold::GetAllScalars()
		CODE:
		RETVAL = THIS->GetAllScalars();
		OUTPUT:
		RETVAL


int
vtkThreshold::GetAttributeMode()
		CODE:
		RETVAL = THIS->GetAttributeMode();
		OUTPUT:
		RETVAL


const char *
vtkThreshold::GetAttributeModeAsString()
		CODE:
		RETVAL = THIS->GetAttributeModeAsString();
		OUTPUT:
		RETVAL


const char *
vtkThreshold::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkThreshold::GetLowerThreshold()
		CODE:
		RETVAL = THIS->GetLowerThreshold();
		OUTPUT:
		RETVAL


float
vtkThreshold::GetUpperThreshold()
		CODE:
		RETVAL = THIS->GetUpperThreshold();
		OUTPUT:
		RETVAL


static vtkThreshold*
vtkThreshold::New()
		CODE:
		RETVAL = vtkThreshold::New();
		OUTPUT:
		RETVAL


void
vtkThreshold::SetAllScalars(arg1)
		int 	arg1
		CODE:
		THIS->SetAllScalars(arg1);
		XSRETURN_EMPTY;


void
vtkThreshold::SetAttributeMode(arg1)
		int 	arg1
		CODE:
		THIS->SetAttributeMode(arg1);
		XSRETURN_EMPTY;


void
vtkThreshold::SetAttributeModeToDefault()
		CODE:
		THIS->SetAttributeModeToDefault();
		XSRETURN_EMPTY;


void
vtkThreshold::SetAttributeModeToUseCellData()
		CODE:
		THIS->SetAttributeModeToUseCellData();
		XSRETURN_EMPTY;


void
vtkThreshold::SetAttributeModeToUsePointData()
		CODE:
		THIS->SetAttributeModeToUsePointData();
		XSRETURN_EMPTY;


void
vtkThreshold::ThresholdBetween(lower, upper)
		float 	lower
		float 	upper
		CODE:
		THIS->ThresholdBetween(lower, upper);
		XSRETURN_EMPTY;


void
vtkThreshold::ThresholdByLower(lower)
		float 	lower
		CODE:
		THIS->ThresholdByLower(lower);
		XSRETURN_EMPTY;


void
vtkThreshold::ThresholdByUpper(upper)
		float 	upper
		CODE:
		THIS->ThresholdByUpper(upper);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ThresholdPoints PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkThresholdPoints::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkThresholdPoints::GetLowerThreshold()
		CODE:
		RETVAL = THIS->GetLowerThreshold();
		OUTPUT:
		RETVAL


float
vtkThresholdPoints::GetUpperThreshold()
		CODE:
		RETVAL = THIS->GetUpperThreshold();
		OUTPUT:
		RETVAL


static vtkThresholdPoints*
vtkThresholdPoints::New()
		CODE:
		RETVAL = vtkThresholdPoints::New();
		OUTPUT:
		RETVAL


void
vtkThresholdPoints::ThresholdBetween(lower, upper)
		float 	lower
		float 	upper
		CODE:
		THIS->ThresholdBetween(lower, upper);
		XSRETURN_EMPTY;


void
vtkThresholdPoints::ThresholdByLower(lower)
		float 	lower
		CODE:
		THIS->ThresholdByLower(lower);
		XSRETURN_EMPTY;


void
vtkThresholdPoints::ThresholdByUpper(upper)
		float 	upper
		CODE:
		THIS->ThresholdByUpper(upper);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ThresholdTextureCoords PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkThresholdTextureCoords::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkThresholdTextureCoords::GetInTextureCoord()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetInTextureCoord();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float
vtkThresholdTextureCoords::GetLowerThreshold()
		CODE:
		RETVAL = THIS->GetLowerThreshold();
		OUTPUT:
		RETVAL


float  *
vtkThresholdTextureCoords::GetOutTextureCoord()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetOutTextureCoord();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkThresholdTextureCoords::GetTextureDimension()
		CODE:
		RETVAL = THIS->GetTextureDimension();
		OUTPUT:
		RETVAL


float
vtkThresholdTextureCoords::GetUpperThreshold()
		CODE:
		RETVAL = THIS->GetUpperThreshold();
		OUTPUT:
		RETVAL


static vtkThresholdTextureCoords*
vtkThresholdTextureCoords::New()
		CODE:
		RETVAL = vtkThresholdTextureCoords::New();
		OUTPUT:
		RETVAL


void
vtkThresholdTextureCoords::SetInTextureCoord(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetInTextureCoord(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkThresholdTextureCoords::SetInTextureCoord\n");



void
vtkThresholdTextureCoords::SetOutTextureCoord(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetOutTextureCoord(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkThresholdTextureCoords::SetOutTextureCoord\n");



void
vtkThresholdTextureCoords::SetTextureDimension(arg1)
		int 	arg1
		CODE:
		THIS->SetTextureDimension(arg1);
		XSRETURN_EMPTY;


void
vtkThresholdTextureCoords::ThresholdBetween(lower, upper)
		float 	lower
		float 	upper
		CODE:
		THIS->ThresholdBetween(lower, upper);
		XSRETURN_EMPTY;


void
vtkThresholdTextureCoords::ThresholdByLower(lower)
		float 	lower
		CODE:
		THIS->ThresholdByLower(lower);
		XSRETURN_EMPTY;


void
vtkThresholdTextureCoords::ThresholdByUpper(upper)
		float 	upper
		CODE:
		THIS->ThresholdByUpper(upper);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::TransformFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkTransformFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


unsigned long
vtkTransformFilter::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


vtkAbstractTransform *
vtkTransformFilter::GetTransform()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkAbstractTransform";
		CODE:
		RETVAL = THIS->GetTransform();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkTransformFilter*
vtkTransformFilter::New()
		CODE:
		RETVAL = vtkTransformFilter::New();
		OUTPUT:
		RETVAL


void
vtkTransformFilter::SetTransform(arg1)
		vtkAbstractTransform *	arg1
		CODE:
		THIS->SetTransform(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::TransformPolyDataFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkTransformPolyDataFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


unsigned long
vtkTransformPolyDataFilter::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


vtkAbstractTransform *
vtkTransformPolyDataFilter::GetTransform()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkAbstractTransform";
		CODE:
		RETVAL = THIS->GetTransform();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkTransformPolyDataFilter*
vtkTransformPolyDataFilter::New()
		CODE:
		RETVAL = vtkTransformPolyDataFilter::New();
		OUTPUT:
		RETVAL


void
vtkTransformPolyDataFilter::SetTransform(arg1)
		vtkAbstractTransform *	arg1
		CODE:
		THIS->SetTransform(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::TransformTextureCoords PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkTransformTextureCoords::AddPosition(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->AddPosition(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTransformTextureCoords::AddPosition\n");



void
vtkTransformTextureCoords::FlipROff()
		CODE:
		THIS->FlipROff();
		XSRETURN_EMPTY;


void
vtkTransformTextureCoords::FlipROn()
		CODE:
		THIS->FlipROn();
		XSRETURN_EMPTY;


void
vtkTransformTextureCoords::FlipSOff()
		CODE:
		THIS->FlipSOff();
		XSRETURN_EMPTY;


void
vtkTransformTextureCoords::FlipSOn()
		CODE:
		THIS->FlipSOn();
		XSRETURN_EMPTY;


void
vtkTransformTextureCoords::FlipTOff()
		CODE:
		THIS->FlipTOff();
		XSRETURN_EMPTY;


void
vtkTransformTextureCoords::FlipTOn()
		CODE:
		THIS->FlipTOn();
		XSRETURN_EMPTY;


const char *
vtkTransformTextureCoords::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkTransformTextureCoords::GetFlipR()
		CODE:
		RETVAL = THIS->GetFlipR();
		OUTPUT:
		RETVAL


int
vtkTransformTextureCoords::GetFlipS()
		CODE:
		RETVAL = THIS->GetFlipS();
		OUTPUT:
		RETVAL


int
vtkTransformTextureCoords::GetFlipT()
		CODE:
		RETVAL = THIS->GetFlipT();
		OUTPUT:
		RETVAL


float  *
vtkTransformTextureCoords::GetOrigin()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetOrigin();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkTransformTextureCoords::GetPosition()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetPosition();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkTransformTextureCoords::GetScale()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetScale();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


static vtkTransformTextureCoords*
vtkTransformTextureCoords::New()
		CODE:
		RETVAL = vtkTransformTextureCoords::New();
		OUTPUT:
		RETVAL


void
vtkTransformTextureCoords::SetFlipR(arg1)
		int 	arg1
		CODE:
		THIS->SetFlipR(arg1);
		XSRETURN_EMPTY;


void
vtkTransformTextureCoords::SetFlipS(arg1)
		int 	arg1
		CODE:
		THIS->SetFlipS(arg1);
		XSRETURN_EMPTY;


void
vtkTransformTextureCoords::SetFlipT(arg1)
		int 	arg1
		CODE:
		THIS->SetFlipT(arg1);
		XSRETURN_EMPTY;


void
vtkTransformTextureCoords::SetOrigin(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetOrigin(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTransformTextureCoords::SetOrigin\n");



void
vtkTransformTextureCoords::SetPosition(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetPosition(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTransformTextureCoords::SetPosition\n");



void
vtkTransformTextureCoords::SetScale(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetScale(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTransformTextureCoords::SetScale\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::TriangleFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkTriangleFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkTriangleFilter::GetPassLines()
		CODE:
		RETVAL = THIS->GetPassLines();
		OUTPUT:
		RETVAL


int
vtkTriangleFilter::GetPassVerts()
		CODE:
		RETVAL = THIS->GetPassVerts();
		OUTPUT:
		RETVAL


static vtkTriangleFilter*
vtkTriangleFilter::New()
		CODE:
		RETVAL = vtkTriangleFilter::New();
		OUTPUT:
		RETVAL


void
vtkTriangleFilter::PassLinesOff()
		CODE:
		THIS->PassLinesOff();
		XSRETURN_EMPTY;


void
vtkTriangleFilter::PassLinesOn()
		CODE:
		THIS->PassLinesOn();
		XSRETURN_EMPTY;


void
vtkTriangleFilter::PassVertsOff()
		CODE:
		THIS->PassVertsOff();
		XSRETURN_EMPTY;


void
vtkTriangleFilter::PassVertsOn()
		CODE:
		THIS->PassVertsOn();
		XSRETURN_EMPTY;


void
vtkTriangleFilter::SetPassLines(arg1)
		int 	arg1
		CODE:
		THIS->SetPassLines(arg1);
		XSRETURN_EMPTY;


void
vtkTriangleFilter::SetPassVerts(arg1)
		int 	arg1
		CODE:
		THIS->SetPassVerts(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::TriangularTexture PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkTriangularTexture::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkTriangularTexture::GetScaleFactor()
		CODE:
		RETVAL = THIS->GetScaleFactor();
		OUTPUT:
		RETVAL


int
vtkTriangularTexture::GetTexturePattern()
		CODE:
		RETVAL = THIS->GetTexturePattern();
		OUTPUT:
		RETVAL


int
vtkTriangularTexture::GetXSize()
		CODE:
		RETVAL = THIS->GetXSize();
		OUTPUT:
		RETVAL


int
vtkTriangularTexture::GetYSize()
		CODE:
		RETVAL = THIS->GetYSize();
		OUTPUT:
		RETVAL


static vtkTriangularTexture*
vtkTriangularTexture::New()
		CODE:
		RETVAL = vtkTriangularTexture::New();
		OUTPUT:
		RETVAL


void
vtkTriangularTexture::SetScaleFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetScaleFactor(arg1);
		XSRETURN_EMPTY;


void
vtkTriangularTexture::SetTexturePattern(arg1)
		int 	arg1
		CODE:
		THIS->SetTexturePattern(arg1);
		XSRETURN_EMPTY;


void
vtkTriangularTexture::SetXSize(arg1)
		int 	arg1
		CODE:
		THIS->SetXSize(arg1);
		XSRETURN_EMPTY;


void
vtkTriangularTexture::SetYSize(arg1)
		int 	arg1
		CODE:
		THIS->SetYSize(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::TriangularTCoords PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkTriangularTCoords::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkTriangularTCoords*
vtkTriangularTCoords::New()
		CODE:
		RETVAL = vtkTriangularTCoords::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::TubeFilter PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkTubeFilter::CappingOff()
		CODE:
		THIS->CappingOff();
		XSRETURN_EMPTY;


void
vtkTubeFilter::CappingOn()
		CODE:
		THIS->CappingOn();
		XSRETURN_EMPTY;


int
vtkTubeFilter::GetCapping()
		CODE:
		RETVAL = THIS->GetCapping();
		OUTPUT:
		RETVAL


const char *
vtkTubeFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkTubeFilter::GetDefaultNormal()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetDefaultNormal();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkTubeFilter::GetNumberOfSides()
		CODE:
		RETVAL = THIS->GetNumberOfSides();
		OUTPUT:
		RETVAL


int
vtkTubeFilter::GetOffset()
		CODE:
		RETVAL = THIS->GetOffset();
		OUTPUT:
		RETVAL


int
vtkTubeFilter::GetOnRatio()
		CODE:
		RETVAL = THIS->GetOnRatio();
		OUTPUT:
		RETVAL


float
vtkTubeFilter::GetRadius()
		CODE:
		RETVAL = THIS->GetRadius();
		OUTPUT:
		RETVAL


float
vtkTubeFilter::GetRadiusFactor()
		CODE:
		RETVAL = THIS->GetRadiusFactor();
		OUTPUT:
		RETVAL


int
vtkTubeFilter::GetUseDefaultNormal()
		CODE:
		RETVAL = THIS->GetUseDefaultNormal();
		OUTPUT:
		RETVAL


int
vtkTubeFilter::GetVaryRadius()
		CODE:
		RETVAL = THIS->GetVaryRadius();
		OUTPUT:
		RETVAL


const char *
vtkTubeFilter::GetVaryRadiusAsString()
		CODE:
		RETVAL = THIS->GetVaryRadiusAsString();
		OUTPUT:
		RETVAL


static vtkTubeFilter*
vtkTubeFilter::New()
		CODE:
		RETVAL = vtkTubeFilter::New();
		OUTPUT:
		RETVAL


void
vtkTubeFilter::SetCapping(arg1)
		int 	arg1
		CODE:
		THIS->SetCapping(arg1);
		XSRETURN_EMPTY;


void
vtkTubeFilter::SetDefaultNormal(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetDefaultNormal(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTubeFilter::SetDefaultNormal\n");



void
vtkTubeFilter::SetNumberOfSides(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfSides(arg1);
		XSRETURN_EMPTY;


void
vtkTubeFilter::SetOffset(arg1)
		int 	arg1
		CODE:
		THIS->SetOffset(arg1);
		XSRETURN_EMPTY;


void
vtkTubeFilter::SetOnRatio(arg1)
		int 	arg1
		CODE:
		THIS->SetOnRatio(arg1);
		XSRETURN_EMPTY;


void
vtkTubeFilter::SetRadius(arg1)
		float 	arg1
		CODE:
		THIS->SetRadius(arg1);
		XSRETURN_EMPTY;


void
vtkTubeFilter::SetRadiusFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetRadiusFactor(arg1);
		XSRETURN_EMPTY;


void
vtkTubeFilter::SetUseDefaultNormal(arg1)
		int 	arg1
		CODE:
		THIS->SetUseDefaultNormal(arg1);
		XSRETURN_EMPTY;


void
vtkTubeFilter::SetVaryRadius(arg1)
		int 	arg1
		CODE:
		THIS->SetVaryRadius(arg1);
		XSRETURN_EMPTY;


void
vtkTubeFilter::SetVaryRadiusToVaryRadiusByScalar()
		CODE:
		THIS->SetVaryRadiusToVaryRadiusByScalar();
		XSRETURN_EMPTY;


void
vtkTubeFilter::SetVaryRadiusToVaryRadiusByVector()
		CODE:
		THIS->SetVaryRadiusToVaryRadiusByVector();
		XSRETURN_EMPTY;


void
vtkTubeFilter::SetVaryRadiusToVaryRadiusOff()
		CODE:
		THIS->SetVaryRadiusToVaryRadiusOff();
		XSRETURN_EMPTY;


void
vtkTubeFilter::UseDefaultNormalOff()
		CODE:
		THIS->UseDefaultNormalOff();
		XSRETURN_EMPTY;


void
vtkTubeFilter::UseDefaultNormalOn()
		CODE:
		THIS->UseDefaultNormalOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::UGFacetReader PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkUGFacetReader::CreateDefaultLocator()
		CODE:
		THIS->CreateDefaultLocator();
		XSRETURN_EMPTY;


const char *
vtkUGFacetReader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


char *
vtkUGFacetReader::GetFileName()
		CODE:
		RETVAL = THIS->GetFileName();
		OUTPUT:
		RETVAL


vtkPointLocator *
vtkUGFacetReader::GetLocator()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPointLocator";
		CODE:
		RETVAL = THIS->GetLocator();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkUGFacetReader::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


int
vtkUGFacetReader::GetMerging()
		CODE:
		RETVAL = THIS->GetMerging();
		OUTPUT:
		RETVAL


int
vtkUGFacetReader::GetNumberOfParts()
		CODE:
		RETVAL = THIS->GetNumberOfParts();
		OUTPUT:
		RETVAL


short
vtkUGFacetReader::GetPartColorIndex(partId)
		int 	partId
		CODE:
		RETVAL = THIS->GetPartColorIndex(partId);
		OUTPUT:
		RETVAL


int
vtkUGFacetReader::GetPartNumber()
		CODE:
		RETVAL = THIS->GetPartNumber();
		OUTPUT:
		RETVAL


void
vtkUGFacetReader::MergingOff()
		CODE:
		THIS->MergingOff();
		XSRETURN_EMPTY;


void
vtkUGFacetReader::MergingOn()
		CODE:
		THIS->MergingOn();
		XSRETURN_EMPTY;


static vtkUGFacetReader*
vtkUGFacetReader::New()
		CODE:
		RETVAL = vtkUGFacetReader::New();
		OUTPUT:
		RETVAL


void
vtkUGFacetReader::SetFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetFileName(arg1);
		XSRETURN_EMPTY;


void
vtkUGFacetReader::SetLocator(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::PointLocator")
		vtkPointLocator *	arg1
		CODE:
		THIS->SetLocator(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::PointLocator")
		vtkPointLocator *	arg1
		CODE:
		THIS->SetLocator(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkUGFacetReader::SetLocator\n");



void
vtkUGFacetReader::SetMerging(arg1)
		int 	arg1
		CODE:
		THIS->SetMerging(arg1);
		XSRETURN_EMPTY;


void
vtkUGFacetReader::SetPartNumber(arg1)
		int 	arg1
		CODE:
		THIS->SetPartNumber(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::UnstructuredGridReader PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkUnstructuredGridReader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkUnstructuredGrid *
vtkUnstructuredGridReader::GetOutput(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkUnstructuredGrid";
		CODE:
		RETVAL = THIS->GetOutput(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE: items == 1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkUnstructuredGrid";
		CODE:
		RETVAL = THIS->GetOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkUnstructuredGridReader::GetOutput\n");



static vtkUnstructuredGridReader*
vtkUnstructuredGridReader::New()
		CODE:
		RETVAL = vtkUnstructuredGridReader::New();
		OUTPUT:
		RETVAL


void
vtkUnstructuredGridReader::SetOutput(output)
		vtkUnstructuredGrid *	output
		CODE:
		THIS->SetOutput(output);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::UnstructuredGridSource PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkUnstructuredGridSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkUnstructuredGrid *
vtkUnstructuredGridSource::GetOutput(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkUnstructuredGrid";
		CODE:
		RETVAL = THIS->GetOutput(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE: items == 1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkUnstructuredGrid";
		CODE:
		RETVAL = THIS->GetOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkUnstructuredGridSource::GetOutput\n");



static vtkUnstructuredGridSource*
vtkUnstructuredGridSource::New()
		CODE:
		RETVAL = vtkUnstructuredGridSource::New();
		OUTPUT:
		RETVAL


void
vtkUnstructuredGridSource::SetOutput(output)
		vtkUnstructuredGrid *	output
		CODE:
		THIS->SetOutput(output);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::UnstructuredGridWriter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkUnstructuredGridWriter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkUnstructuredGrid *
vtkUnstructuredGridWriter::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkUnstructuredGrid";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkUnstructuredGridWriter*
vtkUnstructuredGridWriter::New()
		CODE:
		RETVAL = vtkUnstructuredGridWriter::New();
		OUTPUT:
		RETVAL


void
vtkUnstructuredGridWriter::SetInput(input)
		vtkUnstructuredGrid *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::VRMLExporter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkVRMLExporter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


char *
vtkVRMLExporter::GetFileName()
		CODE:
		RETVAL = THIS->GetFileName();
		OUTPUT:
		RETVAL


float
vtkVRMLExporter::GetSpeed()
		CODE:
		RETVAL = THIS->GetSpeed();
		OUTPUT:
		RETVAL


static vtkVRMLExporter*
vtkVRMLExporter::New()
		CODE:
		RETVAL = vtkVRMLExporter::New();
		OUTPUT:
		RETVAL


void
vtkVRMLExporter::SetFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetFileName(arg1);
		XSRETURN_EMPTY;


void
vtkVRMLExporter::SetSpeed(arg1)
		float 	arg1
		CODE:
		THIS->SetSpeed(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::VectorDot PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkVectorDot::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkVectorDot::GetScalarRange()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetScalarRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


static vtkVectorDot*
vtkVectorDot::New()
		CODE:
		RETVAL = vtkVectorDot::New();
		OUTPUT:
		RETVAL


void
vtkVectorDot::SetScalarRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetScalarRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVectorDot::SetScalarRange\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::VectorNorm PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkVectorNorm::GetAttributeMode()
		CODE:
		RETVAL = THIS->GetAttributeMode();
		OUTPUT:
		RETVAL


const char *
vtkVectorNorm::GetAttributeModeAsString()
		CODE:
		RETVAL = THIS->GetAttributeModeAsString();
		OUTPUT:
		RETVAL


const char *
vtkVectorNorm::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkVectorNorm::GetNormalize()
		CODE:
		RETVAL = THIS->GetNormalize();
		OUTPUT:
		RETVAL


static vtkVectorNorm*
vtkVectorNorm::New()
		CODE:
		RETVAL = vtkVectorNorm::New();
		OUTPUT:
		RETVAL


void
vtkVectorNorm::NormalizeOff()
		CODE:
		THIS->NormalizeOff();
		XSRETURN_EMPTY;


void
vtkVectorNorm::NormalizeOn()
		CODE:
		THIS->NormalizeOn();
		XSRETURN_EMPTY;


void
vtkVectorNorm::SetAttributeMode(arg1)
		int 	arg1
		CODE:
		THIS->SetAttributeMode(arg1);
		XSRETURN_EMPTY;


void
vtkVectorNorm::SetAttributeModeToDefault()
		CODE:
		THIS->SetAttributeModeToDefault();
		XSRETURN_EMPTY;


void
vtkVectorNorm::SetAttributeModeToUseCellData()
		CODE:
		THIS->SetAttributeModeToUseCellData();
		XSRETURN_EMPTY;


void
vtkVectorNorm::SetAttributeModeToUsePointData()
		CODE:
		THIS->SetAttributeModeToUsePointData();
		XSRETURN_EMPTY;


void
vtkVectorNorm::SetNormalize(arg1)
		int 	arg1
		CODE:
		THIS->SetNormalize(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::VectorText PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkVectorText::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


char *
vtkVectorText::GetText()
		CODE:
		RETVAL = THIS->GetText();
		OUTPUT:
		RETVAL


static vtkVectorText*
vtkVectorText::New()
		CODE:
		RETVAL = vtkVectorText::New();
		OUTPUT:
		RETVAL


void
vtkVectorText::SetText(arg1)
		char *	arg1
		CODE:
		THIS->SetText(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::ViewRays PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkViewRays::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkRenderer *
vtkViewRays::GetRenderer()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkRenderer";
		CODE:
		RETVAL = THIS->GetRenderer();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int  *
vtkViewRays::GetSize()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetSize();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


static vtkViewRays*
vtkViewRays::New()
		CODE:
		RETVAL = vtkViewRays::New();
		OUTPUT:
		RETVAL


void
vtkViewRays::SetRenderer(ren)
		vtkRenderer *	ren
		CODE:
		THIS->SetRenderer(ren);
		XSRETURN_EMPTY;


void
vtkViewRays::SetSize(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int  	arg1
		int 	arg2
		CODE:
		THIS->SetSize(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkViewRays::SetSize\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Volume PREFIX = vtk

PROTOTYPES: DISABLE



float *
vtkVolume::GetBounds()
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


const char *
vtkVolume::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


unsigned long
vtkVolume::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


vtkVolumeMapper *
vtkVolume::GetMapper()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkVolumeMapper";
		CODE:
		RETVAL = THIS->GetMapper();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float
vtkVolume::GetMaxXBound()
		CODE:
		RETVAL = THIS->GetMaxXBound();
		OUTPUT:
		RETVAL


float
vtkVolume::GetMaxYBound()
		CODE:
		RETVAL = THIS->GetMaxYBound();
		OUTPUT:
		RETVAL


float
vtkVolume::GetMaxZBound()
		CODE:
		RETVAL = THIS->GetMaxZBound();
		OUTPUT:
		RETVAL


float
vtkVolume::GetMinXBound()
		CODE:
		RETVAL = THIS->GetMinXBound();
		OUTPUT:
		RETVAL


float
vtkVolume::GetMinYBound()
		CODE:
		RETVAL = THIS->GetMinYBound();
		OUTPUT:
		RETVAL


float
vtkVolume::GetMinZBound()
		CODE:
		RETVAL = THIS->GetMinZBound();
		OUTPUT:
		RETVAL


vtkVolumeProperty *
vtkVolume::GetProperty()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkVolumeProperty";
		CODE:
		RETVAL = THIS->GetProperty();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkVolume::GetRedrawMTime()
		CODE:
		RETVAL = THIS->GetRedrawMTime();
		OUTPUT:
		RETVAL


void
vtkVolume::GetVolumes(vc)
		vtkPropCollection *	vc
		CODE:
		THIS->GetVolumes(vc);
		XSRETURN_EMPTY;


static vtkVolume*
vtkVolume::New()
		CODE:
		RETVAL = vtkVolume::New();
		OUTPUT:
		RETVAL


void
vtkVolume::SetMapper(mapper)
		vtkVolumeMapper *	mapper
		CODE:
		THIS->SetMapper(mapper);
		XSRETURN_EMPTY;


void
vtkVolume::SetProperty(property)
		vtkVolumeProperty *	property
		CODE:
		THIS->SetProperty(property);
		XSRETURN_EMPTY;


void
vtkVolume::ShallowCopy(prop)
		vtkProp *	prop
		CODE:
		THIS->ShallowCopy(prop);
		XSRETURN_EMPTY;


void
vtkVolume::Update()
		CODE:
		THIS->Update();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::VolumeCollection PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkVolumeCollection::AddItem(arg1 = 0)
	CASE: items == 2
		vtkVolume *	arg1
		CODE:
		THIS->AddItem(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVolumeCollection::AddItem\n");



const char *
vtkVolumeCollection::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkVolume *
vtkVolumeCollection::GetNextItem()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkVolume";
		CODE:
		RETVAL = THIS->GetNextItem();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkVolume *
vtkVolumeCollection::GetNextVolume()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkVolume";
		CODE:
		RETVAL = THIS->GetNextVolume();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkVolumeCollection*
vtkVolumeCollection::New()
		CODE:
		RETVAL = vtkVolumeCollection::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::VolumeProperty PREFIX = vtk

PROTOTYPES: DISABLE



float
vtkVolumeProperty::GetAmbient()
		CODE:
		RETVAL = THIS->GetAmbient();
		OUTPUT:
		RETVAL


const char *
vtkVolumeProperty::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkVolumeProperty::GetColorChannels()
		CODE:
		RETVAL = THIS->GetColorChannels();
		OUTPUT:
		RETVAL


float
vtkVolumeProperty::GetDiffuse()
		CODE:
		RETVAL = THIS->GetDiffuse();
		OUTPUT:
		RETVAL


vtkPiecewiseFunction *
vtkVolumeProperty::GetGradientOpacity()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPiecewiseFunction";
		CODE:
		RETVAL = THIS->GetGradientOpacity();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkPiecewiseFunction *
vtkVolumeProperty::GetGrayTransferFunction()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPiecewiseFunction";
		CODE:
		RETVAL = THIS->GetGrayTransferFunction();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkVolumeProperty::GetInterpolationType()
		CODE:
		RETVAL = THIS->GetInterpolationType();
		OUTPUT:
		RETVAL


const char *
vtkVolumeProperty::GetInterpolationTypeAsString()
		CODE:
		RETVAL = THIS->GetInterpolationTypeAsString();
		OUTPUT:
		RETVAL


unsigned long
vtkVolumeProperty::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


float
vtkVolumeProperty::GetRGBTextureCoefficient()
		CODE:
		RETVAL = THIS->GetRGBTextureCoefficient();
		OUTPUT:
		RETVAL


vtkColorTransferFunction *
vtkVolumeProperty::GetRGBTransferFunction()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkColorTransferFunction";
		CODE:
		RETVAL = THIS->GetRGBTransferFunction();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkPiecewiseFunction *
vtkVolumeProperty::GetScalarOpacity()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPiecewiseFunction";
		CODE:
		RETVAL = THIS->GetScalarOpacity();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkVolumeProperty::GetShade()
		CODE:
		RETVAL = THIS->GetShade();
		OUTPUT:
		RETVAL


float
vtkVolumeProperty::GetSpecular()
		CODE:
		RETVAL = THIS->GetSpecular();
		OUTPUT:
		RETVAL


float
vtkVolumeProperty::GetSpecularPower()
		CODE:
		RETVAL = THIS->GetSpecularPower();
		OUTPUT:
		RETVAL


static vtkVolumeProperty*
vtkVolumeProperty::New()
		CODE:
		RETVAL = vtkVolumeProperty::New();
		OUTPUT:
		RETVAL


void
vtkVolumeProperty::SetAmbient(arg1)
		float 	arg1
		CODE:
		THIS->SetAmbient(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeProperty::SetColor(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::PiecewiseFunction")
		vtkPiecewiseFunction *	arg1
		CODE:
		THIS->SetColor(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::ColorTransferFunction")
		vtkColorTransferFunction *	arg1
		CODE:
		THIS->SetColor(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVolumeProperty::SetColor\n");



void
vtkVolumeProperty::SetDiffuse(arg1)
		float 	arg1
		CODE:
		THIS->SetDiffuse(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeProperty::SetGradientOpacity(function)
		vtkPiecewiseFunction *	function
		CODE:
		THIS->SetGradientOpacity(function);
		XSRETURN_EMPTY;


void
vtkVolumeProperty::SetInterpolationType(arg1)
		int 	arg1
		CODE:
		THIS->SetInterpolationType(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeProperty::SetInterpolationTypeToLinear()
		CODE:
		THIS->SetInterpolationTypeToLinear();
		XSRETURN_EMPTY;


void
vtkVolumeProperty::SetInterpolationTypeToNearest()
		CODE:
		THIS->SetInterpolationTypeToNearest();
		XSRETURN_EMPTY;


void
vtkVolumeProperty::SetRGBTextureCoefficient(arg1)
		float 	arg1
		CODE:
		THIS->SetRGBTextureCoefficient(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeProperty::SetScalarOpacity(function)
		vtkPiecewiseFunction *	function
		CODE:
		THIS->SetScalarOpacity(function);
		XSRETURN_EMPTY;


void
vtkVolumeProperty::SetShade(arg1)
		int 	arg1
		CODE:
		THIS->SetShade(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeProperty::SetSpecular(arg1)
		float 	arg1
		CODE:
		THIS->SetSpecular(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeProperty::SetSpecularPower(arg1)
		float 	arg1
		CODE:
		THIS->SetSpecularPower(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeProperty::ShadeOff()
		CODE:
		THIS->ShadeOff();
		XSRETURN_EMPTY;


void
vtkVolumeProperty::ShadeOn()
		CODE:
		THIS->ShadeOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::VolumeRayCastCompositeFunction PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkVolumeRayCastCompositeFunction::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkVolumeRayCastCompositeFunction::GetCompositeMethod()
		CODE:
		RETVAL = THIS->GetCompositeMethod();
		OUTPUT:
		RETVAL


const char *
vtkVolumeRayCastCompositeFunction::GetCompositeMethodAsString()
		CODE:
		RETVAL = THIS->GetCompositeMethodAsString();
		OUTPUT:
		RETVAL


static vtkVolumeRayCastCompositeFunction*
vtkVolumeRayCastCompositeFunction::New()
		CODE:
		RETVAL = vtkVolumeRayCastCompositeFunction::New();
		OUTPUT:
		RETVAL


void
vtkVolumeRayCastCompositeFunction::SetCompositeMethod(arg1)
		int 	arg1
		CODE:
		THIS->SetCompositeMethod(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeRayCastCompositeFunction::SetCompositeMethodToClassifyFirst()
		CODE:
		THIS->SetCompositeMethodToClassifyFirst();
		XSRETURN_EMPTY;


void
vtkVolumeRayCastCompositeFunction::SetCompositeMethodToInterpolateFirst()
		CODE:
		THIS->SetCompositeMethodToInterpolateFirst();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::VolumeRayCastIsosurfaceFunction PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkVolumeRayCastIsosurfaceFunction::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkVolumeRayCastIsosurfaceFunction::GetIsoValue()
		CODE:
		RETVAL = THIS->GetIsoValue();
		OUTPUT:
		RETVAL


float
vtkVolumeRayCastIsosurfaceFunction::GetZeroOpacityThreshold(vol)
		vtkVolume *	vol
		CODE:
		RETVAL = THIS->GetZeroOpacityThreshold(vol);
		OUTPUT:
		RETVAL


static vtkVolumeRayCastIsosurfaceFunction*
vtkVolumeRayCastIsosurfaceFunction::New()
		CODE:
		RETVAL = vtkVolumeRayCastIsosurfaceFunction::New();
		OUTPUT:
		RETVAL


void
vtkVolumeRayCastIsosurfaceFunction::SetIsoValue(arg1)
		float 	arg1
		CODE:
		THIS->SetIsoValue(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::VolumeRayCastMapper PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkVolumeRayCastMapper::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkEncodedGradientEstimator *
vtkVolumeRayCastMapper::GetGradientEstimator()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkEncodedGradientEstimator";
		CODE:
		RETVAL = THIS->GetGradientEstimator();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkEncodedGradientShader *
vtkVolumeRayCastMapper::GetGradientShader()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkEncodedGradientShader";
		CODE:
		RETVAL = THIS->GetGradientShader();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkRayBounder *
vtkVolumeRayCastMapper::GetRayBounder()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkRayBounder";
		CODE:
		RETVAL = THIS->GetRayBounder();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float
vtkVolumeRayCastMapper::GetSampleDistance()
		CODE:
		RETVAL = THIS->GetSampleDistance();
		OUTPUT:
		RETVAL


vtkVolumeRayCastFunction *
vtkVolumeRayCastMapper::GetVolumeRayCastFunction()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkVolumeRayCastFunction";
		CODE:
		RETVAL = THIS->GetVolumeRayCastFunction();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkVolumeRayCastMapper*
vtkVolumeRayCastMapper::New()
		CODE:
		RETVAL = vtkVolumeRayCastMapper::New();
		OUTPUT:
		RETVAL


void
vtkVolumeRayCastMapper::SetGradientEstimator(gradest)
		vtkEncodedGradientEstimator *	gradest
		CODE:
		THIS->SetGradientEstimator(gradest);
		XSRETURN_EMPTY;


void
vtkVolumeRayCastMapper::SetRayBounder(arg1)
		vtkRayBounder *	arg1
		CODE:
		THIS->SetRayBounder(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeRayCastMapper::SetSampleDistance(arg1)
		float 	arg1
		CODE:
		THIS->SetSampleDistance(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeRayCastMapper::SetVolumeRayCastFunction(arg1)
		vtkVolumeRayCastFunction *	arg1
		CODE:
		THIS->SetVolumeRayCastFunction(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::VolumeRayCastMIPFunction PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkVolumeRayCastMIPFunction::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkVolumeRayCastMIPFunction::GetMaximizeMethod()
		CODE:
		RETVAL = THIS->GetMaximizeMethod();
		OUTPUT:
		RETVAL


const char *
vtkVolumeRayCastMIPFunction::GetMaximizeMethodAsString()
		CODE:
		RETVAL = THIS->GetMaximizeMethodAsString();
		OUTPUT:
		RETVAL


float
vtkVolumeRayCastMIPFunction::GetZeroOpacityThreshold(vol)
		vtkVolume *	vol
		CODE:
		RETVAL = THIS->GetZeroOpacityThreshold(vol);
		OUTPUT:
		RETVAL


static vtkVolumeRayCastMIPFunction*
vtkVolumeRayCastMIPFunction::New()
		CODE:
		RETVAL = vtkVolumeRayCastMIPFunction::New();
		OUTPUT:
		RETVAL


void
vtkVolumeRayCastMIPFunction::SetMaximizeMethod(arg1)
		int 	arg1
		CODE:
		THIS->SetMaximizeMethod(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeRayCastMIPFunction::SetMaximizeMethodToOpacity()
		CODE:
		THIS->SetMaximizeMethodToOpacity();
		XSRETURN_EMPTY;


void
vtkVolumeRayCastMIPFunction::SetMaximizeMethodToScalarValue()
		CODE:
		THIS->SetMaximizeMethodToScalarValue();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::VolumeTextureMapper2D PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkVolumeTextureMapper2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkVolumeTextureMapper2D::GetMaximumNumberOfPlanes()
		CODE:
		RETVAL = THIS->GetMaximumNumberOfPlanes();
		OUTPUT:
		RETVAL


int  *
vtkVolumeTextureMapper2D::GetTargetTextureSize()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetTargetTextureSize();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


static vtkVolumeTextureMapper2D*
vtkVolumeTextureMapper2D::New()
		CODE:
		RETVAL = vtkVolumeTextureMapper2D::New();
		OUTPUT:
		RETVAL


void
vtkVolumeTextureMapper2D::SetMaximumNumberOfPlanes(arg1)
		int 	arg1
		CODE:
		THIS->SetMaximumNumberOfPlanes(arg1);
		XSRETURN_EMPTY;


void
vtkVolumeTextureMapper2D::SetTargetTextureSize(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int  	arg1
		int 	arg2
		CODE:
		THIS->SetTargetTextureSize(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVolumeTextureMapper2D::SetTargetTextureSize\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Volume16Reader PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkVolume16Reader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkVolume16Reader::GetDataByteOrder()
		CODE:
		RETVAL = THIS->GetDataByteOrder();
		OUTPUT:
		RETVAL


const char *
vtkVolume16Reader::GetDataByteOrderAsString()
		CODE:
		RETVAL = THIS->GetDataByteOrderAsString();
		OUTPUT:
		RETVAL


int  *
vtkVolume16Reader::GetDataDimensions()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetDataDimensions();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


unsigned short
vtkVolume16Reader::GetDataMask()
		CODE:
		RETVAL = THIS->GetDataMask();
		OUTPUT:
		RETVAL


int
vtkVolume16Reader::GetHeaderSize()
		CODE:
		RETVAL = THIS->GetHeaderSize();
		OUTPUT:
		RETVAL


vtkStructuredPoints *
vtkVolume16Reader::GetImage(ImageNumber)
		int 	ImageNumber
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkStructuredPoints";
		CODE:
		RETVAL = THIS->GetImage(ImageNumber);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkVolume16Reader::GetSwapBytes()
		CODE:
		RETVAL = THIS->GetSwapBytes();
		OUTPUT:
		RETVAL


vtkTransform *
vtkVolume16Reader::GetTransform()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkTransform";
		CODE:
		RETVAL = THIS->GetTransform();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkVolume16Reader*
vtkVolume16Reader::New()
		CODE:
		RETVAL = vtkVolume16Reader::New();
		OUTPUT:
		RETVAL


void
vtkVolume16Reader::SetDataByteOrder(arg1)
		int 	arg1
		CODE:
		THIS->SetDataByteOrder(arg1);
		XSRETURN_EMPTY;


void
vtkVolume16Reader::SetDataByteOrderToBigEndian()
		CODE:
		THIS->SetDataByteOrderToBigEndian();
		XSRETURN_EMPTY;


void
vtkVolume16Reader::SetDataByteOrderToLittleEndian()
		CODE:
		THIS->SetDataByteOrderToLittleEndian();
		XSRETURN_EMPTY;


void
vtkVolume16Reader::SetDataDimensions(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int  	arg1
		int 	arg2
		CODE:
		THIS->SetDataDimensions(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVolume16Reader::SetDataDimensions\n");



void
vtkVolume16Reader::SetDataMask(arg1)
		unsigned short 	arg1
		CODE:
		THIS->SetDataMask(arg1);
		XSRETURN_EMPTY;


void
vtkVolume16Reader::SetHeaderSize(arg1)
		int 	arg1
		CODE:
		THIS->SetHeaderSize(arg1);
		XSRETURN_EMPTY;


void
vtkVolume16Reader::SetSwapBytes(arg1)
		int 	arg1
		CODE:
		THIS->SetSwapBytes(arg1);
		XSRETURN_EMPTY;


void
vtkVolume16Reader::SetTransform(arg1)
		vtkTransform *	arg1
		CODE:
		THIS->SetTransform(arg1);
		XSRETURN_EMPTY;


void
vtkVolume16Reader::SwapBytesOff()
		CODE:
		THIS->SwapBytesOff();
		XSRETURN_EMPTY;


void
vtkVolume16Reader::SwapBytesOn()
		CODE:
		THIS->SwapBytesOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::VoxelContoursToSurfaceFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkVoxelContoursToSurfaceFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkVoxelContoursToSurfaceFilter::GetMemoryLimitInBytes()
		CODE:
		RETVAL = THIS->GetMemoryLimitInBytes();
		OUTPUT:
		RETVAL


float  *
vtkVoxelContoursToSurfaceFilter::GetSpacing()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetSpacing();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


static vtkVoxelContoursToSurfaceFilter*
vtkVoxelContoursToSurfaceFilter::New()
		CODE:
		RETVAL = vtkVoxelContoursToSurfaceFilter::New();
		OUTPUT:
		RETVAL


void
vtkVoxelContoursToSurfaceFilter::SetMemoryLimitInBytes(arg1)
		int 	arg1
		CODE:
		THIS->SetMemoryLimitInBytes(arg1);
		XSRETURN_EMPTY;


void
vtkVoxelContoursToSurfaceFilter::SetSpacing(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetSpacing(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVoxelContoursToSurfaceFilter::SetSpacing\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::VoxelModeller PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkVoxelModeller::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkVoxelModeller::GetMaximumDistance()
		CODE:
		RETVAL = THIS->GetMaximumDistance();
		OUTPUT:
		RETVAL


float  *
vtkVoxelModeller::GetModelBounds()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetModelBounds();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


int  *
vtkVoxelModeller::GetSampleDimensions()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetSampleDimensions();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


static vtkVoxelModeller*
vtkVoxelModeller::New()
		CODE:
		RETVAL = vtkVoxelModeller::New();
		OUTPUT:
		RETVAL


void
vtkVoxelModeller::SetMaximumDistance(arg1)
		float 	arg1
		CODE:
		THIS->SetMaximumDistance(arg1);
		XSRETURN_EMPTY;


void
vtkVoxelModeller::SetModelBounds(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		float 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		float 	arg6
		CODE:
		THIS->SetModelBounds(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVoxelModeller::SetModelBounds\n");



void
vtkVoxelModeller::SetSampleDimensions(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetSampleDimensions(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVoxelModeller::SetSampleDimensions\n");



void
vtkVoxelModeller::Write(arg1)
		char *	arg1
		CODE:
		THIS->Write(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::WarpLens PREFIX = vtk

PROTOTYPES: DISABLE



float  *
vtkWarpLens::GetCenter()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetCenter();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


const char *
vtkWarpLens::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkWarpLens::GetKappa()
		CODE:
		RETVAL = THIS->GetKappa();
		OUTPUT:
		RETVAL


static vtkWarpLens*
vtkWarpLens::New()
		CODE:
		RETVAL = vtkWarpLens::New();
		OUTPUT:
		RETVAL


void
vtkWarpLens::SetCenter(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetCenter(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkWarpLens::SetCenter\n");



void
vtkWarpLens::SetKappa(arg1)
		float 	arg1
		CODE:
		THIS->SetKappa(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::WarpScalar PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkWarpScalar::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkWarpScalar::GetNormal()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetNormal();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float
vtkWarpScalar::GetScaleFactor()
		CODE:
		RETVAL = THIS->GetScaleFactor();
		OUTPUT:
		RETVAL


int
vtkWarpScalar::GetUseNormal()
		CODE:
		RETVAL = THIS->GetUseNormal();
		OUTPUT:
		RETVAL


int
vtkWarpScalar::GetXYPlane()
		CODE:
		RETVAL = THIS->GetXYPlane();
		OUTPUT:
		RETVAL


static vtkWarpScalar*
vtkWarpScalar::New()
		CODE:
		RETVAL = vtkWarpScalar::New();
		OUTPUT:
		RETVAL


void
vtkWarpScalar::SetNormal(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetNormal(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkWarpScalar::SetNormal\n");



void
vtkWarpScalar::SetScaleFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetScaleFactor(arg1);
		XSRETURN_EMPTY;


void
vtkWarpScalar::SetUseNormal(arg1)
		int 	arg1
		CODE:
		THIS->SetUseNormal(arg1);
		XSRETURN_EMPTY;


void
vtkWarpScalar::SetXYPlane(arg1)
		int 	arg1
		CODE:
		THIS->SetXYPlane(arg1);
		XSRETURN_EMPTY;


void
vtkWarpScalar::UseNormalOff()
		CODE:
		THIS->UseNormalOff();
		XSRETURN_EMPTY;


void
vtkWarpScalar::UseNormalOn()
		CODE:
		THIS->UseNormalOn();
		XSRETURN_EMPTY;


void
vtkWarpScalar::XYPlaneOff()
		CODE:
		THIS->XYPlaneOff();
		XSRETURN_EMPTY;


void
vtkWarpScalar::XYPlaneOn()
		CODE:
		THIS->XYPlaneOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::WarpTo PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkWarpTo::AbsoluteOff()
		CODE:
		THIS->AbsoluteOff();
		XSRETURN_EMPTY;


void
vtkWarpTo::AbsoluteOn()
		CODE:
		THIS->AbsoluteOn();
		XSRETURN_EMPTY;


int
vtkWarpTo::GetAbsolute()
		CODE:
		RETVAL = THIS->GetAbsolute();
		OUTPUT:
		RETVAL


const char *
vtkWarpTo::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkWarpTo::GetPosition()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetPosition();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float
vtkWarpTo::GetScaleFactor()
		CODE:
		RETVAL = THIS->GetScaleFactor();
		OUTPUT:
		RETVAL


static vtkWarpTo*
vtkWarpTo::New()
		CODE:
		RETVAL = vtkWarpTo::New();
		OUTPUT:
		RETVAL


void
vtkWarpTo::SetAbsolute(arg1)
		int 	arg1
		CODE:
		THIS->SetAbsolute(arg1);
		XSRETURN_EMPTY;


void
vtkWarpTo::SetPosition(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetPosition(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkWarpTo::SetPosition\n");



void
vtkWarpTo::SetScaleFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetScaleFactor(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::WindowedSincPolyDataFilter PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkWindowedSincPolyDataFilter::BoundarySmoothingOff()
		CODE:
		THIS->BoundarySmoothingOff();
		XSRETURN_EMPTY;


void
vtkWindowedSincPolyDataFilter::BoundarySmoothingOn()
		CODE:
		THIS->BoundarySmoothingOn();
		XSRETURN_EMPTY;


void
vtkWindowedSincPolyDataFilter::FeatureEdgeSmoothingOff()
		CODE:
		THIS->FeatureEdgeSmoothingOff();
		XSRETURN_EMPTY;


void
vtkWindowedSincPolyDataFilter::FeatureEdgeSmoothingOn()
		CODE:
		THIS->FeatureEdgeSmoothingOn();
		XSRETURN_EMPTY;


void
vtkWindowedSincPolyDataFilter::GenerateErrorScalarsOff()
		CODE:
		THIS->GenerateErrorScalarsOff();
		XSRETURN_EMPTY;


void
vtkWindowedSincPolyDataFilter::GenerateErrorScalarsOn()
		CODE:
		THIS->GenerateErrorScalarsOn();
		XSRETURN_EMPTY;


void
vtkWindowedSincPolyDataFilter::GenerateErrorVectorsOff()
		CODE:
		THIS->GenerateErrorVectorsOff();
		XSRETURN_EMPTY;


void
vtkWindowedSincPolyDataFilter::GenerateErrorVectorsOn()
		CODE:
		THIS->GenerateErrorVectorsOn();
		XSRETURN_EMPTY;


int
vtkWindowedSincPolyDataFilter::GetBoundarySmoothing()
		CODE:
		RETVAL = THIS->GetBoundarySmoothing();
		OUTPUT:
		RETVAL


const char *
vtkWindowedSincPolyDataFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkWindowedSincPolyDataFilter::GetEdgeAngle()
		CODE:
		RETVAL = THIS->GetEdgeAngle();
		OUTPUT:
		RETVAL


float
vtkWindowedSincPolyDataFilter::GetFeatureAngle()
		CODE:
		RETVAL = THIS->GetFeatureAngle();
		OUTPUT:
		RETVAL


int
vtkWindowedSincPolyDataFilter::GetFeatureEdgeSmoothing()
		CODE:
		RETVAL = THIS->GetFeatureEdgeSmoothing();
		OUTPUT:
		RETVAL


int
vtkWindowedSincPolyDataFilter::GetGenerateErrorScalars()
		CODE:
		RETVAL = THIS->GetGenerateErrorScalars();
		OUTPUT:
		RETVAL


int
vtkWindowedSincPolyDataFilter::GetGenerateErrorVectors()
		CODE:
		RETVAL = THIS->GetGenerateErrorVectors();
		OUTPUT:
		RETVAL


int
vtkWindowedSincPolyDataFilter::GetNumberOfIterations()
		CODE:
		RETVAL = THIS->GetNumberOfIterations();
		OUTPUT:
		RETVAL


float
vtkWindowedSincPolyDataFilter::GetPassBand()
		CODE:
		RETVAL = THIS->GetPassBand();
		OUTPUT:
		RETVAL


static vtkWindowedSincPolyDataFilter*
vtkWindowedSincPolyDataFilter::New()
		CODE:
		RETVAL = vtkWindowedSincPolyDataFilter::New();
		OUTPUT:
		RETVAL


void
vtkWindowedSincPolyDataFilter::SetBoundarySmoothing(arg1)
		int 	arg1
		CODE:
		THIS->SetBoundarySmoothing(arg1);
		XSRETURN_EMPTY;


void
vtkWindowedSincPolyDataFilter::SetEdgeAngle(arg1)
		float 	arg1
		CODE:
		THIS->SetEdgeAngle(arg1);
		XSRETURN_EMPTY;


void
vtkWindowedSincPolyDataFilter::SetFeatureAngle(arg1)
		float 	arg1
		CODE:
		THIS->SetFeatureAngle(arg1);
		XSRETURN_EMPTY;


void
vtkWindowedSincPolyDataFilter::SetFeatureEdgeSmoothing(arg1)
		int 	arg1
		CODE:
		THIS->SetFeatureEdgeSmoothing(arg1);
		XSRETURN_EMPTY;


void
vtkWindowedSincPolyDataFilter::SetGenerateErrorScalars(arg1)
		int 	arg1
		CODE:
		THIS->SetGenerateErrorScalars(arg1);
		XSRETURN_EMPTY;


void
vtkWindowedSincPolyDataFilter::SetGenerateErrorVectors(arg1)
		int 	arg1
		CODE:
		THIS->SetGenerateErrorVectors(arg1);
		XSRETURN_EMPTY;


void
vtkWindowedSincPolyDataFilter::SetNumberOfIterations(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfIterations(arg1);
		XSRETURN_EMPTY;


void
vtkWindowedSincPolyDataFilter::SetPassBand(arg1)
		float 	arg1
		CODE:
		THIS->SetPassBand(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::WorldPointPicker PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkWorldPointPicker::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkWorldPointPicker*
vtkWorldPointPicker::New()
		CODE:
		RETVAL = vtkWorldPointPicker::New();
		OUTPUT:
		RETVAL


int
vtkWorldPointPicker::Pick(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		float 	arg1
		float 	arg2
		float 	arg3
		vtkRenderer *	arg4
		CODE:
		RETVAL = THIS->Pick(arg1, arg2, arg3, arg4);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkWorldPointPicker::Pick\n");


MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::WarpVector PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkWarpVector::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkWarpVector::GetScaleFactor()
		CODE:
		RETVAL = THIS->GetScaleFactor();
		OUTPUT:
		RETVAL


static vtkWarpVector*
vtkWarpVector::New()
		CODE:
		RETVAL = vtkWarpVector::New();
		OUTPUT:
		RETVAL


void
vtkWarpVector::SetScaleFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetScaleFactor(arg1);
		XSRETURN_EMPTY;

#ifdef USE_MESA

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::MesaActor PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkMesaActor::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkMesaActor*
vtkMesaActor::New()
		CODE:
		RETVAL = vtkMesaActor::New();
		OUTPUT:
		RETVAL


void
vtkMesaActor::Render(ren, mapper)
		vtkRenderer *	ren
		vtkMapper *	mapper
		CODE:
		THIS->Render(ren, mapper);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::MesaCamera PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkMesaCamera::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkMesaCamera*
vtkMesaCamera::New()
		CODE:
		RETVAL = vtkMesaCamera::New();
		OUTPUT:
		RETVAL


void
vtkMesaCamera::Render(ren)
		vtkRenderer *	ren
		CODE:
		THIS->Render(ren);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::MesaImageActor PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkMesaImageActor::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


void
vtkMesaImageActor::Load(ren)
		vtkRenderer *	ren
		CODE:
		THIS->Load(ren);
		XSRETURN_EMPTY;


static vtkMesaImageActor*
vtkMesaImageActor::New()
		CODE:
		RETVAL = vtkMesaImageActor::New();
		OUTPUT:
		RETVAL


void
vtkMesaImageActor::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::MesaLight PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkMesaLight::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkMesaLight*
vtkMesaLight::New()
		CODE:
		RETVAL = vtkMesaLight::New();
		OUTPUT:
		RETVAL


void
vtkMesaLight::Render(ren, light_index)
		vtkRenderer *	ren
		int 	light_index
		CODE:
		THIS->Render(ren, light_index);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::MesaPolyDataMapper PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkMesaPolyDataMapper::Draw(ren, a)
		vtkRenderer *	ren
		vtkActor *	a
		CODE:
		THIS->Draw(ren, a);
		XSRETURN_EMPTY;


const char *
vtkMesaPolyDataMapper::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkMesaPolyDataMapper*
vtkMesaPolyDataMapper::New()
		CODE:
		RETVAL = vtkMesaPolyDataMapper::New();
		OUTPUT:
		RETVAL


void
vtkMesaPolyDataMapper::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;


void
vtkMesaPolyDataMapper::Render(ren, a)
		vtkRenderer *	ren
		vtkActor *	a
		CODE:
		THIS->Render(ren, a);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::MesaProperty PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkMesaProperty::BackfaceRender(a, ren)
		vtkActor *	a
		vtkRenderer *	ren
		CODE:
		THIS->BackfaceRender(a, ren);
		XSRETURN_EMPTY;


const char *
vtkMesaProperty::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkMesaProperty*
vtkMesaProperty::New()
		CODE:
		RETVAL = vtkMesaProperty::New();
		OUTPUT:
		RETVAL


void
vtkMesaProperty::Render(a, ren)
		vtkActor *	a
		vtkRenderer *	ren
		CODE:
		THIS->Render(a, ren);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::MesaProjectedPolyDataRayBounder PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkMesaProjectedPolyDataRayBounder::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkMesaProjectedPolyDataRayBounder*
vtkMesaProjectedPolyDataRayBounder::New()
		CODE:
		RETVAL = vtkMesaProjectedPolyDataRayBounder::New();
		OUTPUT:
		RETVAL


void
vtkMesaProjectedPolyDataRayBounder::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::MesaRenderWindow PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkMesaRenderWindow::Frame()
		CODE:
		THIS->Frame();
		XSRETURN_EMPTY;


const char *
vtkMesaRenderWindow::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkMesaRenderWindow::GetDepthBufferSize()
		CODE:
		RETVAL = THIS->GetDepthBufferSize();
		OUTPUT:
		RETVAL


int
vtkMesaRenderWindow::GetDesiredDepth()
		CODE:
		RETVAL = THIS->GetDesiredDepth();
		OUTPUT:
		RETVAL


void *
vtkMesaRenderWindow::GetGenericContext()
		CODE:
		RETVAL = THIS->GetGenericContext();
		OUTPUT:
		RETVAL


void *
vtkMesaRenderWindow::GetGenericWindowId()
		CODE:
		RETVAL = THIS->GetGenericWindowId();
		OUTPUT:
		RETVAL


void
vtkMesaRenderWindow::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


void
vtkMesaRenderWindow::MakeCurrent()
		CODE:
		THIS->MakeCurrent();
		XSRETURN_EMPTY;


static vtkMesaRenderWindow*
vtkMesaRenderWindow::New()
		CODE:
		RETVAL = vtkMesaRenderWindow::New();
		OUTPUT:
		RETVAL


void
vtkMesaRenderWindow::PrefFullScreen()
		CODE:
		THIS->PrefFullScreen();
		XSRETURN_EMPTY;


void
vtkMesaRenderWindow::RegisterTextureResource(id)
		GLuint 	id
		CODE:
		THIS->RegisterTextureResource(id);
		XSRETURN_EMPTY;


void
vtkMesaRenderWindow::SetFullScreen(arg1)
		int 	arg1
		CODE:
		THIS->SetFullScreen(arg1);
		XSRETURN_EMPTY;


void
vtkMesaRenderWindow::SetOffScreenRendering(i)
		int 	i
		CODE:
		THIS->SetOffScreenRendering(i);
		XSRETURN_EMPTY;


void
vtkMesaRenderWindow::SetSize(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetSize(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkMesaRenderWindow::SetSize\n");



void
vtkMesaRenderWindow::SetStereoCapableWindow(capable)
		int 	capable
		CODE:
		THIS->SetStereoCapableWindow(capable);
		XSRETURN_EMPTY;


void
vtkMesaRenderWindow::Start()
		CODE:
		THIS->Start();
		XSRETURN_EMPTY;


void
vtkMesaRenderWindow::StereoUpdate()
		CODE:
		THIS->StereoUpdate();
		XSRETURN_EMPTY;


void
vtkMesaRenderWindow::WindowConfigure()
		CODE:
		THIS->WindowConfigure();
		XSRETURN_EMPTY;


void
vtkMesaRenderWindow::WindowInitialize()
		CODE:
		THIS->WindowInitialize();
		XSRETURN_EMPTY;


void
vtkMesaRenderWindow::WindowRemap()
		CODE:
		THIS->WindowRemap();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::MesaRenderer PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkMesaRenderer::Clear()
		CODE:
		THIS->Clear();
		XSRETURN_EMPTY;


void
vtkMesaRenderer::ClearLights()
		CODE:
		THIS->ClearLights();
		XSRETURN_EMPTY;


void
vtkMesaRenderer::DeviceRender()
		CODE:
		THIS->DeviceRender();
		XSRETURN_EMPTY;


const char *
vtkMesaRenderer::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkMesaRenderer*
vtkMesaRenderer::New()
		CODE:
		RETVAL = vtkMesaRenderer::New();
		OUTPUT:
		RETVAL


int
vtkMesaRenderer::UpdateLights()
		CODE:
		RETVAL = THIS->UpdateLights();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::MesaTexture PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkMesaTexture::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


void
vtkMesaTexture::Load(ren)
		vtkRenderer *	ren
		CODE:
		THIS->Load(ren);
		XSRETURN_EMPTY;


static vtkMesaTexture*
vtkMesaTexture::New()
		CODE:
		RETVAL = vtkMesaTexture::New();
		OUTPUT:
		RETVAL


void
vtkMesaTexture::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::MesaVolumeTextureMapper2D PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkMesaVolumeTextureMapper2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkMesaVolumeTextureMapper2D*
vtkMesaVolumeTextureMapper2D::New()
		CODE:
		RETVAL = vtkMesaVolumeTextureMapper2D::New();
		OUTPUT:
		RETVAL

#endif

#ifndef USE_MESA

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::OpenGLActor PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkOpenGLActor::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkOpenGLActor*
vtkOpenGLActor::New()
		CODE:
		RETVAL = vtkOpenGLActor::New();
		OUTPUT:
		RETVAL


void
vtkOpenGLActor::Render(ren, mapper)
		vtkRenderer *	ren
		vtkMapper *	mapper
		CODE:
		THIS->Render(ren, mapper);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::OpenGLCamera PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkOpenGLCamera::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkOpenGLCamera*
vtkOpenGLCamera::New()
		CODE:
		RETVAL = vtkOpenGLCamera::New();
		OUTPUT:
		RETVAL


void
vtkOpenGLCamera::Render(ren)
		vtkRenderer *	ren
		CODE:
		THIS->Render(ren);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::OpenGLImageActor PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkOpenGLImageActor::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


void
vtkOpenGLImageActor::Load(ren)
		vtkRenderer *	ren
		CODE:
		THIS->Load(ren);
		XSRETURN_EMPTY;


static vtkOpenGLImageActor*
vtkOpenGLImageActor::New()
		CODE:
		RETVAL = vtkOpenGLImageActor::New();
		OUTPUT:
		RETVAL


void
vtkOpenGLImageActor::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::OpenGLLight PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkOpenGLLight::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkOpenGLLight*
vtkOpenGLLight::New()
		CODE:
		RETVAL = vtkOpenGLLight::New();
		OUTPUT:
		RETVAL


void
vtkOpenGLLight::Render(ren, light_index)
		vtkRenderer *	ren
		int 	light_index
		CODE:
		THIS->Render(ren, light_index);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::OpenGLPolyDataMapper PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkOpenGLPolyDataMapper::Draw(ren, a)
		vtkRenderer *	ren
		vtkActor *	a
		CODE:
		THIS->Draw(ren, a);
		XSRETURN_EMPTY;


const char *
vtkOpenGLPolyDataMapper::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkOpenGLPolyDataMapper*
vtkOpenGLPolyDataMapper::New()
		CODE:
		RETVAL = vtkOpenGLPolyDataMapper::New();
		OUTPUT:
		RETVAL


void
vtkOpenGLPolyDataMapper::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;


void
vtkOpenGLPolyDataMapper::Render(ren, a)
		vtkRenderer *	ren
		vtkActor *	a
		CODE:
		THIS->Render(ren, a);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::OpenGLProjectedPolyDataRayBounder PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkOpenGLProjectedPolyDataRayBounder::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkOpenGLProjectedPolyDataRayBounder*
vtkOpenGLProjectedPolyDataRayBounder::New()
		CODE:
		RETVAL = vtkOpenGLProjectedPolyDataRayBounder::New();
		OUTPUT:
		RETVAL


void
vtkOpenGLProjectedPolyDataRayBounder::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::OpenGLProperty PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkOpenGLProperty::BackfaceRender(a, ren)
		vtkActor *	a
		vtkRenderer *	ren
		CODE:
		THIS->BackfaceRender(a, ren);
		XSRETURN_EMPTY;


const char *
vtkOpenGLProperty::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkOpenGLProperty*
vtkOpenGLProperty::New()
		CODE:
		RETVAL = vtkOpenGLProperty::New();
		OUTPUT:
		RETVAL


void
vtkOpenGLProperty::Render(a, ren)
		vtkActor *	a
		vtkRenderer *	ren
		CODE:
		THIS->Render(a, ren);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::OpenGLRenderer PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkOpenGLRenderer::Clear()
		CODE:
		THIS->Clear();
		XSRETURN_EMPTY;


void
vtkOpenGLRenderer::ClearLights()
		CODE:
		THIS->ClearLights();
		XSRETURN_EMPTY;


void
vtkOpenGLRenderer::DeviceRender()
		CODE:
		THIS->DeviceRender();
		XSRETURN_EMPTY;


const char *
vtkOpenGLRenderer::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkOpenGLRenderer*
vtkOpenGLRenderer::New()
		CODE:
		RETVAL = vtkOpenGLRenderer::New();
		OUTPUT:
		RETVAL


int
vtkOpenGLRenderer::UpdateLights()
		CODE:
		RETVAL = THIS->UpdateLights();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::OpenGLTexture PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkOpenGLTexture::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


void
vtkOpenGLTexture::Load(ren)
		vtkRenderer *	ren
		CODE:
		THIS->Load(ren);
		XSRETURN_EMPTY;


static vtkOpenGLTexture*
vtkOpenGLTexture::New()
		CODE:
		RETVAL = vtkOpenGLTexture::New();
		OUTPUT:
		RETVAL


void
vtkOpenGLTexture::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::OpenGLVolumeTextureMapper2D PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkOpenGLVolumeTextureMapper2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkOpenGLVolumeTextureMapper2D*
vtkOpenGLVolumeTextureMapper2D::New()
		CODE:
		RETVAL = vtkOpenGLVolumeTextureMapper2D::New();
		OUTPUT:
		RETVAL

#endif

#ifndef WIN32

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::XRenderWindowInteractor PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkXRenderWindowInteractor::BreakLoopFlagOff()
		CODE:
		THIS->BreakLoopFlagOff();
		XSRETURN_EMPTY;


void
vtkXRenderWindowInteractor::BreakLoopFlagOn()
		CODE:
		THIS->BreakLoopFlagOn();
		XSRETURN_EMPTY;


int
vtkXRenderWindowInteractor::CreateTimer(timertype)
		int 	timertype
		CODE:
		RETVAL = THIS->CreateTimer(timertype);
		OUTPUT:
		RETVAL


int
vtkXRenderWindowInteractor::DestroyTimer()
		CODE:
		RETVAL = THIS->DestroyTimer();
		OUTPUT:
		RETVAL


void
vtkXRenderWindowInteractor::Disable()
		CODE:
		THIS->Disable();
		XSRETURN_EMPTY;


void
vtkXRenderWindowInteractor::Enable()
		CODE:
		THIS->Enable();
		XSRETURN_EMPTY;


int
vtkXRenderWindowInteractor::GetBreakLoopFlag()
		CODE:
		RETVAL = THIS->GetBreakLoopFlag();
		OUTPUT:
		RETVAL


const char *
vtkXRenderWindowInteractor::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


void
vtkXRenderWindowInteractor::Initialize()
	CASE: items == 1
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkXRenderWindowInteractor::Initialize\n");



static vtkXRenderWindowInteractor*
vtkXRenderWindowInteractor::New()
		CODE:
		RETVAL = vtkXRenderWindowInteractor::New();
		OUTPUT:
		RETVAL


void
vtkXRenderWindowInteractor::SetBreakLoopFlag(arg1)
		int 	arg1
		CODE:
		THIS->SetBreakLoopFlag(arg1);
		XSRETURN_EMPTY;


void
vtkXRenderWindowInteractor::Start()
		CODE:
		THIS->Start();
		XSRETURN_EMPTY;


void
vtkXRenderWindowInteractor::TerminateApp()
		CODE:
		THIS->TerminateApp();
		XSRETURN_EMPTY;

#endif

#ifdef WIN32

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Win32OpenGLRenderWindow PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkWin32OpenGLRenderWindow::Clean()
		CODE:
		THIS->Clean();
		XSRETURN_EMPTY;


void
vtkWin32OpenGLRenderWindow::Frame()
		CODE:
		THIS->Frame();
		XSRETURN_EMPTY;


const char *
vtkWin32OpenGLRenderWindow::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkWin32OpenGLRenderWindow::GetDepthBufferSize()
		CODE:
		RETVAL = THIS->GetDepthBufferSize();
		OUTPUT:
		RETVAL


int
vtkWin32OpenGLRenderWindow::GetEventPending()
		CODE:
		RETVAL = THIS->GetEventPending();
		OUTPUT:
		RETVAL


int
vtkWin32OpenGLRenderWindow::GetMultiSamples()
		CODE:
		RETVAL = THIS->GetMultiSamples();
		OUTPUT:
		RETVAL


void
vtkWin32OpenGLRenderWindow::HideCursor()
		CODE:
		THIS->HideCursor();
		XSRETURN_EMPTY;


void
vtkWin32OpenGLRenderWindow::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


void
vtkWin32OpenGLRenderWindow::MakeCurrent()
		CODE:
		THIS->MakeCurrent();
		XSRETURN_EMPTY;


static vtkWin32OpenGLRenderWindow*
vtkWin32OpenGLRenderWindow::New()
		CODE:
		RETVAL = vtkWin32OpenGLRenderWindow::New();
		OUTPUT:
		RETVAL


void
vtkWin32OpenGLRenderWindow::OpenGLInit()
		CODE:
		THIS->OpenGLInit();
		XSRETURN_EMPTY;


void
vtkWin32OpenGLRenderWindow::PrefFullScreen()
		CODE:
		THIS->PrefFullScreen();
		XSRETURN_EMPTY;


void
vtkWin32OpenGLRenderWindow::RegisterTextureResource(id)
		GLuint 	id
		CODE:
		THIS->RegisterTextureResource(id);
		XSRETURN_EMPTY;


void
vtkWin32OpenGLRenderWindow::ResumeScreenRendering()
		CODE:
		THIS->ResumeScreenRendering();
		XSRETURN_EMPTY;


void
vtkWin32OpenGLRenderWindow::SetFullScreen(arg1)
		int 	arg1
		CODE:
		THIS->SetFullScreen(arg1);
		XSRETURN_EMPTY;


void
vtkWin32OpenGLRenderWindow::SetMultiSamples(arg1)
		int 	arg1
		CODE:
		THIS->SetMultiSamples(arg1);
		XSRETURN_EMPTY;


void
vtkWin32OpenGLRenderWindow::SetPosition(arg1, arg2)
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetPosition(arg1, arg2);
		XSRETURN_EMPTY;


void
vtkWin32OpenGLRenderWindow::SetSize(arg1, arg2)
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetSize(arg1, arg2);
		XSRETURN_EMPTY;


void
vtkWin32OpenGLRenderWindow::SetStereoCapableWindow(capable)
		int 	capable
		CODE:
		THIS->SetStereoCapableWindow(capable);
		XSRETURN_EMPTY;


void
vtkWin32OpenGLRenderWindow::SetWindowInfo(arg1)
		char *	arg1
		CODE:
		THIS->SetWindowInfo(arg1);
		XSRETURN_EMPTY;


void
vtkWin32OpenGLRenderWindow::SetWindowName(arg1)
		char *	arg1
		CODE:
		THIS->SetWindowName(arg1);
		XSRETURN_EMPTY;


void
vtkWin32OpenGLRenderWindow::SetupMemoryRendering(x, y, prn)
		int 	x
		int 	y
		HDC 	prn
		CODE:
		THIS->SetupMemoryRendering(x, y, prn);
		XSRETURN_EMPTY;


void
vtkWin32OpenGLRenderWindow::SetupPalette(hDC)
		HDC 	hDC
		CODE:
		THIS->SetupPalette(hDC);
		XSRETURN_EMPTY;


void
vtkWin32OpenGLRenderWindow::SetupPixelFormat(hDC, dwFlags, debug, bpp, zbpp)
		HDC 	hDC
		DWORD 	dwFlags
		int 	debug
		int 	bpp
		int 	zbpp
		CODE:
		THIS->SetupPixelFormat(hDC, dwFlags, debug, bpp, zbpp);
		XSRETURN_EMPTY;


void
vtkWin32OpenGLRenderWindow::ShowCursor()
		CODE:
		THIS->ShowCursor();
		XSRETURN_EMPTY;


void
vtkWin32OpenGLRenderWindow::Start()
		CODE:
		THIS->Start();
		XSRETURN_EMPTY;


void
vtkWin32OpenGLRenderWindow::StereoUpdate()
		CODE:
		THIS->StereoUpdate();
		XSRETURN_EMPTY;


void
vtkWin32OpenGLRenderWindow::WindowConfigure()
		CODE:
		THIS->WindowConfigure();
		XSRETURN_EMPTY;


void
vtkWin32OpenGLRenderWindow::WindowInitialize()
		CODE:
		THIS->WindowInitialize();
		XSRETURN_EMPTY;


void
vtkWin32OpenGLRenderWindow::WindowRemap()
		CODE:
		THIS->WindowRemap();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Graphics	PACKAGE = Graphics::VTK::Win32RenderWindowInteractor PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkWin32RenderWindowInteractor::CreateTimer(timertype)
		int 	timertype
		CODE:
		RETVAL = THIS->CreateTimer(timertype);
		OUTPUT:
		RETVAL


int
vtkWin32RenderWindowInteractor::DestroyTimer()
		CODE:
		RETVAL = THIS->DestroyTimer();
		OUTPUT:
		RETVAL


void
vtkWin32RenderWindowInteractor::Disable()
		CODE:
		THIS->Disable();
		XSRETURN_EMPTY;


void
vtkWin32RenderWindowInteractor::Enable()
		CODE:
		THIS->Enable();
		XSRETURN_EMPTY;


void
vtkWin32RenderWindowInteractor::ExitCallback()
		CODE:
		THIS->ExitCallback();
		XSRETURN_EMPTY;


const char *
vtkWin32RenderWindowInteractor::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkWin32RenderWindowInteractor::GetInstallMessageProc()
		CODE:
		RETVAL = THIS->GetInstallMessageProc();
		OUTPUT:
		RETVAL


void
vtkWin32RenderWindowInteractor::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


void
vtkWin32RenderWindowInteractor::InstallMessageProcOff()
		CODE:
		THIS->InstallMessageProcOff();
		XSRETURN_EMPTY;


void
vtkWin32RenderWindowInteractor::InstallMessageProcOn()
		CODE:
		THIS->InstallMessageProcOn();
		XSRETURN_EMPTY;


static vtkWin32RenderWindowInteractor*
vtkWin32RenderWindowInteractor::New()
		CODE:
		RETVAL = vtkWin32RenderWindowInteractor::New();
		OUTPUT:
		RETVAL


void
vtkWin32RenderWindowInteractor::SetClassExitMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetClassExitMethod",0), newRV(func), 0);
		}
		THIS->SetClassExitMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkWin32RenderWindowInteractor::SetInstallMessageProc(arg1)
		int 	arg1
		CODE:
		THIS->SetInstallMessageProc(arg1);
		XSRETURN_EMPTY;


void
vtkWin32RenderWindowInteractor::Start()
		CODE:
		THIS->Start();
		XSRETURN_EMPTY;


void
vtkWin32RenderWindowInteractor::TerminateApp()
		CODE:
		THIS->TerminateApp();
		XSRETURN_EMPTY;

#endif


