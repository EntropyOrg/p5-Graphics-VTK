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
#include "vtkCommon.h"
#include "vtkAbstractMapper.h"
#include "vtkAbstractTransform.h"
#include "vtkAttributeData.h"
#include "vtkCell.h"
#include "vtkCommand.h"
#include "vtkDataArray.h"
#include "vtkDataSet.h"
#include "vtkHomogeneousTransform.h"
#include "vtkLinearTransform.h"
#include "vtkImplicitFunction.h"
#include "vtkLocator.h"
#include "vtkObjectFactory.h"
#include "vtkPointSet.h"
#include "vtkScalarsToColors.h"
#include "vtkViewport.h"
#include "vtkWarpTransform.h"
#include "vtkWindow.h"
#include "vtkFunctionSet.h"
#include "vtkInitialValueProblemSolver.h"
#include "vtkObjectFactoryCollection.h"
#include "vtkActor2D.h"
#include "vtkActor2DCollection.h"
#include "vtkAssemblyNode.h"
#include "vtkAssemblyPath.h"
#include "vtkAssemblyPaths.h"
#include "vtkBitArray.h"
#include "vtkByteSwap.h"
#include "vtkCellArray.h"
#include "vtkCellData.h"
#include "vtkCellLinks.h"
#include "vtkCellTypes.h"
#include "vtkCharArray.h"
#include "vtkCollection.h"
#include "vtkContourValues.h"
#include "vtkCoordinate.h"
#include "vtkCriticalSection.h"
#include "vtkDataObject.h"
#include "vtkDataObjectCollection.h"
#include "vtkDataSetAttributes.h"
#include "vtkDataSetCollection.h"
#include "vtkDebugLeaks.h"
#include "vtkDirectory.h"
#include "vtkDynamicLoader.h"
#include "vtkDoubleArray.h"
#include "vtkEdgeTable.h"
#include "vtkEmptyCell.h"
#include "vtkExtentTranslator.h"
#include "vtkFieldData.h"
#include "vtkFileOutputWindow.h"
#include "vtkFloatArray.h"
#include "vtkFloatNormals.h"
#include "vtkFloatPoints.h"
#include "vtkFloatScalars.h"
#include "vtkFloatTCoords.h"
#include "vtkFloatTensors.h"
#include "vtkFloatVectors.h"
#include "vtkGeneralTransform.h"
#include "vtkGenericCell.h"
#include "vtkGhostLevels.h"
#include "vtkHexahedron.h"
#include "vtkIdentityTransform.h"
#include "vtkIdList.h"
#include "vtkImageData.h"
#include "vtkImageSource.h"
#include "vtkImageToStructuredPoints.h"
#include "vtkImplicitFunctionCollection.h"
#include "vtkIndent.h"
#include "vtkIntArray.h"
#include "vtkLine.h"
#include "vtkLogLookupTable.h"
#include "vtkLongArray.h"
#include "vtkLookupTable.h"
#include "vtkMapper2D.h"
#include "vtkMath.h"
#include "vtkMatrix4x4.h"
#include "vtkMatrixToHomogeneousTransform.h"
#include "vtkMatrixToLinearTransform.h"
#include "vtkMergePoints2D.h"
#include "vtkMultiThreader.h"
#include "vtkMutexLock.h"
#include "vtkNormals.h"
#include "vtkObject.h"
#include "vtkOutputWindow.h"
#include "vtkPerspectiveTransform.h"
#include "vtkPixel.h"
#include "vtkPlane.h"
#include "vtkPlaneCollection.h"
#include "vtkPointData.h"
#include "vtkPointLocator.h"
#include "vtkPointLocator2D.h"
#include "vtkPoints.h"
#include "vtkPolyData.h"
#include "vtkPolyDataSource.h"
#include "vtkPolyLine.h"
#include "vtkPolyVertex.h"
#include "vtkPolygon.h"
#include "vtkPriorityQueue.h"
#include "vtkProcessObject.h"
#include "vtkProp.h"
#include "vtkPropAssembly.h"
#include "vtkPropCollection.h"
#include "vtkProperty2D.h"
#include "vtkPyramid.h"
#include "vtkQuad.h"
#include "vtkQuadric.h"
#include "vtkRectilinearGrid.h"
#include "vtkReferenceCount.h"
#include "vtkScalars.h"
#include "vtkShortArray.h"
#include "vtkSource.h"
#include "vtkStack.h"
#include "vtkStructuredData.h"
#include "vtkStructuredGrid.h"
#include "vtkStructuredPoints.h"
#include "vtkTCoords.h"
#include "vtkTensor.h"
#include "vtkTensors.h"
#include "vtkTetra.h"
#include "vtkTimeStamp.h"
#include "vtkTimerLog.h"
#include "vtkTransform.h"
#include "vtkTransformCollection.h"
#include "vtkTriangle.h"
#include "vtkTriangleStrip.h"
#include "vtkUnsignedCharArray.h"
#include "vtkUnsignedIntArray.h"
#include "vtkUnsignedLongArray.h"
#include "vtkUnsignedShortArray.h"
#include "vtkUnstructuredGrid.h"
#include "vtkVectors.h"
#include "vtkVersion.h"
#include "vtkVertex.h"
#include "vtkVoidArray.h"
#include "vtkVoxel.h"
#include "vtkWedge.h"
#include "vtkWindowLevelLookupTable.h"
#include "vtkWindowToImageFilter.h"
#include "vtkInterpolatedVelocityField.h"
#include "vtkRungeKutta2.h"
#include "vtkRungeKutta4.h"
#ifdef WIN32
#include "vtkWin32OutputWindow.h"
#endif
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

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::AbstractMapper PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkAbstractMapper::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkAbstractMapper::GetTimeToDraw()
		CODE:
		RETVAL = THIS->GetTimeToDraw();
		OUTPUT:
		RETVAL


void
vtkAbstractMapper::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::AbstractTransform PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkAbstractTransform::CircuitCheck(transform)
		vtkAbstractTransform *	transform
		CODE:
		RETVAL = THIS->CircuitCheck(transform);
		OUTPUT:
		RETVAL


void
vtkAbstractTransform::DeepCopy(arg1)
		vtkAbstractTransform *	arg1
		CODE:
		THIS->DeepCopy(arg1);
		XSRETURN_EMPTY;


const char *
vtkAbstractTransform::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkAbstractTransform *
vtkAbstractTransform::GetInverse()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkAbstractTransform";
		CODE:
		RETVAL = THIS->GetInverse();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkAbstractTransform::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


void
vtkAbstractTransform::Identity()
		CODE:
		THIS->Identity();
		XSRETURN_EMPTY;


void
vtkAbstractTransform::Inverse()
		CODE:
		THIS->Inverse();
		XSRETURN_EMPTY;


vtkAbstractTransform *
vtkAbstractTransform::MakeTransform()
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


void
vtkAbstractTransform::SetInverse(transform)
		vtkAbstractTransform *	transform
		CODE:
		THIS->SetInverse(transform);
		XSRETURN_EMPTY;


double *
vtkAbstractTransform::TransformDoublePoint(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double 	arg1
		double 	arg2
		double 	arg3
		PREINIT:
		double * retval;
		PPCODE:
		retval = THIS->TransformDoublePoint(arg1, arg2, arg3);
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float *
vtkAbstractTransform::TransformFloatPoint(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->TransformFloatPoint(arg1, arg2, arg3);
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


double *
vtkAbstractTransform::TransformPoint(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double 	arg1
		double 	arg2
		double 	arg3
		PREINIT:
		double * retval;
		PPCODE:
		retval = THIS->TransformPoint(arg1, arg2, arg3);
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


void
vtkAbstractTransform::TransformPoints(inPts, outPts)
		vtkPoints *	inPts
		vtkPoints *	outPts
		CODE:
		THIS->TransformPoints(inPts, outPts);
		XSRETURN_EMPTY;


void
vtkAbstractTransform::TransformPointsNormalsVectors(inPts, outPts, inNms, outNms, inVrs, outVrs)
		vtkPoints *	inPts
		vtkPoints *	outPts
		vtkNormals *	inNms
		vtkNormals *	outNms
		vtkVectors *	inVrs
		vtkVectors *	outVrs
		CODE:
		THIS->TransformPointsNormalsVectors(inPts, outPts, inNms, outNms, inVrs, outVrs);
		XSRETURN_EMPTY;


void
vtkAbstractTransform::UnRegister(O)
		vtkObject *	O
		CODE:
		THIS->UnRegister(O);
		XSRETURN_EMPTY;


void
vtkAbstractTransform::Update()
		CODE:
		THIS->Update();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::AttributeData PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkAttributeData::Allocate(sz, ext)
		int 	sz
		int 	ext
		CODE:
		RETVAL = THIS->Allocate(sz, ext);
		OUTPUT:
		RETVAL


void
vtkAttributeData::DeepCopy(arg1 = 0)
	CASE: items == 2
		vtkAttributeData *	arg1
		CODE:
		THIS->DeepCopy(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkAttributeData::DeepCopy\n");



unsigned long
vtkAttributeData::GetActualMemorySize()
		CODE:
		RETVAL = THIS->GetActualMemorySize();
		OUTPUT:
		RETVAL


const char *
vtkAttributeData::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataArray *
vtkAttributeData::GetData()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataArray";
		CODE:
		RETVAL = THIS->GetData();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkAttributeData::GetDataType()
		CODE:
		RETVAL = THIS->GetDataType();
		OUTPUT:
		RETVAL


void *
vtkAttributeData::GetVoidPointer(id)
		int 	id
		CODE:
		RETVAL = THIS->GetVoidPointer(id);
		OUTPUT:
		RETVAL


void
vtkAttributeData::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


void
vtkAttributeData::Reset()
		CODE:
		THIS->Reset();
		XSRETURN_EMPTY;


void
vtkAttributeData::SetData(arg1)
		vtkDataArray *	arg1
		CODE:
		THIS->SetData(arg1);
		XSRETURN_EMPTY;


void
vtkAttributeData::SetDataType(dataType)
		int 	dataType
		CODE:
		THIS->SetDataType(dataType);
		XSRETURN_EMPTY;


void
vtkAttributeData::SetDataTypeToBit()
		CODE:
		THIS->SetDataTypeToBit();
		XSRETURN_EMPTY;


void
vtkAttributeData::SetDataTypeToChar()
		CODE:
		THIS->SetDataTypeToChar();
		XSRETURN_EMPTY;


void
vtkAttributeData::SetDataTypeToDouble()
		CODE:
		THIS->SetDataTypeToDouble();
		XSRETURN_EMPTY;


void
vtkAttributeData::SetDataTypeToFloat()
		CODE:
		THIS->SetDataTypeToFloat();
		XSRETURN_EMPTY;


void
vtkAttributeData::SetDataTypeToInt()
		CODE:
		THIS->SetDataTypeToInt();
		XSRETURN_EMPTY;


void
vtkAttributeData::SetDataTypeToLong()
		CODE:
		THIS->SetDataTypeToLong();
		XSRETURN_EMPTY;


void
vtkAttributeData::SetDataTypeToShort()
		CODE:
		THIS->SetDataTypeToShort();
		XSRETURN_EMPTY;


void
vtkAttributeData::SetDataTypeToUnsignedChar()
		CODE:
		THIS->SetDataTypeToUnsignedChar();
		XSRETURN_EMPTY;


void
vtkAttributeData::SetDataTypeToUnsignedInt()
		CODE:
		THIS->SetDataTypeToUnsignedInt();
		XSRETURN_EMPTY;


void
vtkAttributeData::SetDataTypeToUnsignedLong()
		CODE:
		THIS->SetDataTypeToUnsignedLong();
		XSRETURN_EMPTY;


void
vtkAttributeData::SetDataTypeToUnsignedShort()
		CODE:
		THIS->SetDataTypeToUnsignedShort();
		XSRETURN_EMPTY;


void
vtkAttributeData::ShallowCopy(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::AttributeData")
		vtkAttributeData *	arg1
		CODE:
		THIS->ShallowCopy(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::AttributeData")
		vtkAttributeData *	arg1
		CODE:
		THIS->ShallowCopy(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkAttributeData::ShallowCopy\n");



void
vtkAttributeData::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Cell PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkCell::Clip(value, cellScalars, locator, connectivity, inPd, outPd, inCd, cellId, outCd, insideOut)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	connectivity
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		int 	insideOut
		CODE:
		THIS->Clip(value, cellScalars, locator, connectivity, inPd, outPd, inCd, cellId, outCd, insideOut);
		XSRETURN_EMPTY;


void
vtkCell::Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	verts
		vtkCellArray *	lines
		vtkCellArray *	polys
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		CODE:
		THIS->Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd);
		XSRETURN_EMPTY;


void
vtkCell::DeepCopy(arg1 = 0)
	CASE: items == 2
		vtkCell *	arg1
		CODE:
		THIS->DeepCopy(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkCell::DeepCopy\n");



float *
vtkCell::GetBounds()
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


int
vtkCell::GetCellDimension()
		CODE:
		RETVAL = THIS->GetCellDimension();
		OUTPUT:
		RETVAL


int
vtkCell::GetCellType()
		CODE:
		RETVAL = THIS->GetCellType();
		OUTPUT:
		RETVAL


const char *
vtkCell::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkCell *
vtkCell::GetEdge(edgeId)
		int 	edgeId
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetEdge(edgeId);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkCell *
vtkCell::GetFace(faceId)
		int 	faceId
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetFace(faceId);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkCell::GetInterpolationOrder()
		CODE:
		RETVAL = THIS->GetInterpolationOrder();
		OUTPUT:
		RETVAL


float
vtkCell::GetLength2()
		CODE:
		RETVAL = THIS->GetLength2();
		OUTPUT:
		RETVAL


int
vtkCell::GetNumberOfEdges()
		CODE:
		RETVAL = THIS->GetNumberOfEdges();
		OUTPUT:
		RETVAL


int
vtkCell::GetNumberOfFaces()
		CODE:
		RETVAL = THIS->GetNumberOfFaces();
		OUTPUT:
		RETVAL


int
vtkCell::GetNumberOfPoints()
		CODE:
		RETVAL = THIS->GetNumberOfPoints();
		OUTPUT:
		RETVAL


int
vtkCell::GetPointId(ptId)
		int 	ptId
		CODE:
		RETVAL = THIS->GetPointId(ptId);
		OUTPUT:
		RETVAL


vtkIdList *
vtkCell::GetPointIds()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkIdList";
		CODE:
		RETVAL = THIS->GetPointIds();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkPoints *
vtkCell::GetPoints()
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


void
vtkCell::ShallowCopy(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::Cell")
		vtkCell *	arg1
		CODE:
		THIS->ShallowCopy(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::Cell")
		vtkCell *	arg1
		CODE:
		THIS->ShallowCopy(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkCell::ShallowCopy\n");



int
vtkCell::Triangulate(index, ptIds, pts)
		int 	index
		vtkIdList *	ptIds
		vtkPoints *	pts
		CODE:
		RETVAL = THIS->Triangulate(index, ptIds, pts);
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Command PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkCommand::Delete()
		CODE:
		THIS->Delete();
		XSRETURN_EMPTY;


unsigned long
vtkCommand::GetEventIdFromString(event)
		char *	event
		CODE:
		RETVAL = THIS->GetEventIdFromString(event);
		OUTPUT:
		RETVAL


const char *
vtkCommand::GetStringFromEventId(event)
		unsigned long 	event
		CODE:
		RETVAL = THIS->GetStringFromEventId(event);
		OUTPUT:
		RETVAL


static vtkCommand*
vtkCommand::New()
		CODE:
		RETVAL = vtkCommand::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::DataArray PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkDataArray::Allocate(sz, ext)
		int 	sz
		int 	ext
		CODE:
		RETVAL = THIS->Allocate(sz, ext);
		OUTPUT:
		RETVAL


void
vtkDataArray::DeepCopy(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataArray::DeepCopy\n");



unsigned long
vtkDataArray::GetActualMemorySize()
		CODE:
		RETVAL = THIS->GetActualMemorySize();
		OUTPUT:
		RETVAL


const char *
vtkDataArray::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkDataArray::GetComponent(i, j)
		int 	i
		int 	j
		CODE:
		RETVAL = THIS->GetComponent(i, j);
		OUTPUT:
		RETVAL


void
vtkDataArray::GetData(tupleMin, tupleMax, compMin, compMax, data)
		int 	tupleMin
		int 	tupleMax
		int 	compMin
		int 	compMax
		vtkFloatArray *	data
		CODE:
		THIS->GetData(tupleMin, tupleMax, compMin, compMax, *data);
		XSRETURN_EMPTY;


int
vtkDataArray::GetDataType()
		CODE:
		RETVAL = THIS->GetDataType();
		OUTPUT:
		RETVAL


int
vtkDataArray::GetExtend()
		CODE:
		RETVAL = THIS->GetExtend();
		OUTPUT:
		RETVAL


int
vtkDataArray::GetMaxId()
		CODE:
		RETVAL = THIS->GetMaxId();
		OUTPUT:
		RETVAL


int
vtkDataArray::GetNumberOfComponents()
		CODE:
		RETVAL = THIS->GetNumberOfComponents();
		OUTPUT:
		RETVAL


int
vtkDataArray::GetNumberOfTuples()
		CODE:
		RETVAL = THIS->GetNumberOfTuples();
		OUTPUT:
		RETVAL


int
vtkDataArray::GetSize()
		CODE:
		RETVAL = THIS->GetSize();
		OUTPUT:
		RETVAL


void *
vtkDataArray::GetVoidPointer(id)
		int 	id
		CODE:
		RETVAL = THIS->GetVoidPointer(id);
		OUTPUT:
		RETVAL


void
vtkDataArray::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


void
vtkDataArray::InsertComponent(i, j, c)
		int 	i
		int 	j
		float 	c
		CODE:
		THIS->InsertComponent(i, j, c);
		XSRETURN_EMPTY;


void
vtkDataArray::Reset()
		CODE:
		THIS->Reset();
		XSRETURN_EMPTY;


void
vtkDataArray::SetComponent(i, j, c)
		int 	i
		int 	j
		float 	c
		CODE:
		THIS->SetComponent(i, j, c);
		XSRETURN_EMPTY;


void
vtkDataArray::SetNumberOfComponents(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfComponents(arg1);
		XSRETURN_EMPTY;


void
vtkDataArray::SetNumberOfTuples(number)
		int 	number
		CODE:
		THIS->SetNumberOfTuples(number);
		XSRETURN_EMPTY;


void
vtkDataArray::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::DataSet PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkDataSet::ComputeBounds()
		CODE:
		THIS->ComputeBounds();
		XSRETURN_EMPTY;


void
vtkDataSet::CopyStructure(ds)
		vtkDataSet *	ds
		CODE:
		THIS->CopyStructure(ds);
		XSRETURN_EMPTY;


void
vtkDataSet::DeepCopy(src)
		vtkDataObject *	src
		CODE:
		THIS->DeepCopy(src);
		XSRETURN_EMPTY;


int
vtkDataSet::FindPoint(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		RETVAL = THIS->FindPoint(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataSet::FindPoint\n");



unsigned long
vtkDataSet::GetActualMemorySize()
		CODE:
		RETVAL = THIS->GetActualMemorySize();
		OUTPUT:
		RETVAL


float *
vtkDataSet::GetBounds()
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


vtkCell *
vtkDataSet::GetCell(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		vtkGenericCell *	arg2
		CODE:
		THIS->GetCell(arg1, arg2);
		XSRETURN_EMPTY;
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetCell(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataSet::GetCell\n");



vtkCellData *
vtkDataSet::GetCellData()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCellData";
		CODE:
		RETVAL = THIS->GetCellData();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkDataSet::GetCellNeighbors(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		vtkIdList *	arg2
		vtkIdList *	arg3
		CODE:
		THIS->GetCellNeighbors(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataSet::GetCellNeighbors\n");



void
vtkDataSet::GetCellPoints(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		vtkIdList *	arg2
		CODE:
		THIS->GetCellPoints(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataSet::GetCellPoints\n");



int
vtkDataSet::GetCellType(cellId)
		int 	cellId
		CODE:
		RETVAL = THIS->GetCellType(cellId);
		OUTPUT:
		RETVAL


void
vtkDataSet::GetCellTypes(types)
		vtkCellTypes *	types
		CODE:
		THIS->GetCellTypes(types);
		XSRETURN_EMPTY;


float *
vtkDataSet::GetCenter()
	CASE: items == 1
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetCenter();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


const char *
vtkDataSet::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkDataSet::GetDataObjectType()
		CODE:
		RETVAL = THIS->GetDataObjectType();
		OUTPUT:
		RETVAL


int
vtkDataSet::GetDataSetType()
		CODE:
		RETVAL = THIS->GetDataSetType();
		OUTPUT:
		RETVAL


float
vtkDataSet::GetLength()
		CODE:
		RETVAL = THIS->GetLength();
		OUTPUT:
		RETVAL


unsigned long
vtkDataSet::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


int
vtkDataSet::GetMaxCellSize()
		CODE:
		RETVAL = THIS->GetMaxCellSize();
		OUTPUT:
		RETVAL


int
vtkDataSet::GetNumberOfCells()
		CODE:
		RETVAL = THIS->GetNumberOfCells();
		OUTPUT:
		RETVAL


int
vtkDataSet::GetNumberOfPoints()
		CODE:
		RETVAL = THIS->GetNumberOfPoints();
		OUTPUT:
		RETVAL


float *
vtkDataSet::GetPoint(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetPoint(arg1);
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


void
vtkDataSet::GetPointCells(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		vtkIdList *	arg2
		CODE:
		THIS->GetPointCells(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataSet::GetPointCells\n");



vtkPointData *
vtkDataSet::GetPointData()
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


float *
vtkDataSet::GetScalarRange()
	CASE: items == 1
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetScalarRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


void
vtkDataSet::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


void
vtkDataSet::ShallowCopy(src)
		vtkDataObject *	src
		CODE:
		THIS->ShallowCopy(src);
		XSRETURN_EMPTY;


void
vtkDataSet::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::HomogeneousTransform PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkHomogeneousTransform::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkHomogeneousTransform *
vtkHomogeneousTransform::GetHomogeneousInverse()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkHomogeneousTransform";
		CODE:
		RETVAL = THIS->GetHomogeneousInverse();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkMatrix4x4 *
vtkHomogeneousTransform::GetMatrix(arg1 = 0)
	CASE: items == 2
		vtkMatrix4x4 *	arg1
		CODE:
		THIS->GetMatrix(arg1);
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
		croak("Unsupported number of args and/or types supplied to vtkHomogeneousTransform::GetMatrix\n");



vtkMatrix4x4 *
vtkHomogeneousTransform::GetMatrixPointer()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkMatrix4x4";
		CODE:
		RETVAL = THIS->GetMatrixPointer();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkHomogeneousTransform::TransformPoints(inPts, outPts)
		vtkPoints *	inPts
		vtkPoints *	outPts
		CODE:
		THIS->TransformPoints(inPts, outPts);
		XSRETURN_EMPTY;


void
vtkHomogeneousTransform::TransformPointsNormalsVectors(inPts, outPts, inNms, outNms, inVrs, outVrs)
		vtkPoints *	inPts
		vtkPoints *	outPts
		vtkNormals *	inNms
		vtkNormals *	outNms
		vtkVectors *	inVrs
		vtkVectors *	outVrs
		CODE:
		THIS->TransformPointsNormalsVectors(inPts, outPts, inNms, outNms, inVrs, outVrs);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::LinearTransform PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkLinearTransform::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkLinearTransform *
vtkLinearTransform::GetLinearInverse()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkLinearTransform";
		CODE:
		RETVAL = THIS->GetLinearInverse();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


double *
vtkLinearTransform::TransformDoubleNormal(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double 	arg1
		double 	arg2
		double 	arg3
		PREINIT:
		double * retval;
		PPCODE:
		retval = THIS->TransformDoubleNormal(arg1, arg2, arg3);
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


double *
vtkLinearTransform::TransformDoubleVector(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double 	arg1
		double 	arg2
		double 	arg3
		PREINIT:
		double * retval;
		PPCODE:
		retval = THIS->TransformDoubleVector(arg1, arg2, arg3);
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float *
vtkLinearTransform::TransformFloatNormal(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->TransformFloatNormal(arg1, arg2, arg3);
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float *
vtkLinearTransform::TransformFloatVector(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->TransformFloatVector(arg1, arg2, arg3);
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


double *
vtkLinearTransform::TransformNormal(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double 	arg1
		double 	arg2
		double 	arg3
		PREINIT:
		double * retval;
		PPCODE:
		retval = THIS->TransformNormal(arg1, arg2, arg3);
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


void
vtkLinearTransform::TransformNormals(inNms, outNms)
		vtkNormals *	inNms
		vtkNormals *	outNms
		CODE:
		THIS->TransformNormals(inNms, outNms);
		XSRETURN_EMPTY;


void
vtkLinearTransform::TransformPoints(inPts, outPts)
		vtkPoints *	inPts
		vtkPoints *	outPts
		CODE:
		THIS->TransformPoints(inPts, outPts);
		XSRETURN_EMPTY;


void
vtkLinearTransform::TransformPointsNormalsVectors(inPts, outPts, inNms, outNms, inVrs, outVrs)
		vtkPoints *	inPts
		vtkPoints *	outPts
		vtkNormals *	inNms
		vtkNormals *	outNms
		vtkVectors *	inVrs
		vtkVectors *	outVrs
		CODE:
		THIS->TransformPointsNormalsVectors(inPts, outPts, inNms, outNms, inVrs, outVrs);
		XSRETURN_EMPTY;


double *
vtkLinearTransform::TransformVector(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double 	arg1
		double 	arg2
		double 	arg3
		PREINIT:
		double * retval;
		PPCODE:
		retval = THIS->TransformVector(arg1, arg2, arg3);
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


void
vtkLinearTransform::TransformVectors(inVrs, outVrs)
		vtkVectors *	inVrs
		vtkVectors *	outVrs
		CODE:
		THIS->TransformVectors(inVrs, outVrs);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::ImplicitFunction PREFIX = vtk

PROTOTYPES: DISABLE



float
vtkImplicitFunction::EvaluateFunction(arg1 = 0, arg2 = 0, arg3 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkImplicitFunction::EvaluateFunction\n");



float *
vtkImplicitFunction::FunctionGradient(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->FunctionGradient(arg1, arg2, arg3);
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float
vtkImplicitFunction::FunctionValue(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		RETVAL = THIS->FunctionValue(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImplicitFunction::FunctionValue\n");



const char *
vtkImplicitFunction::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


unsigned long
vtkImplicitFunction::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


vtkAbstractTransform *
vtkImplicitFunction::GetTransform()
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


void
vtkImplicitFunction::SetTransform(arg1)
		vtkAbstractTransform *	arg1
		CODE:
		THIS->SetTransform(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Locator PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkLocator::AutomaticOff()
		CODE:
		THIS->AutomaticOff();
		XSRETURN_EMPTY;


void
vtkLocator::AutomaticOn()
		CODE:
		THIS->AutomaticOn();
		XSRETURN_EMPTY;


void
vtkLocator::BuildLocator()
		CODE:
		THIS->BuildLocator();
		XSRETURN_EMPTY;


void
vtkLocator::FreeSearchStructure()
		CODE:
		THIS->FreeSearchStructure();
		XSRETURN_EMPTY;


void
vtkLocator::GenerateRepresentation(level, pd)
		int 	level
		vtkPolyData *	pd
		CODE:
		THIS->GenerateRepresentation(level, pd);
		XSRETURN_EMPTY;


int
vtkLocator::GetAutomatic()
		CODE:
		RETVAL = THIS->GetAutomatic();
		OUTPUT:
		RETVAL


unsigned long
vtkLocator::GetBuildTime()
		CODE:
		RETVAL = THIS->GetBuildTime();
		OUTPUT:
		RETVAL


const char *
vtkLocator::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkLocator::GetDataSet()
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
vtkLocator::GetLevel()
		CODE:
		RETVAL = THIS->GetLevel();
		OUTPUT:
		RETVAL


int
vtkLocator::GetMaxLevel()
		CODE:
		RETVAL = THIS->GetMaxLevel();
		OUTPUT:
		RETVAL


int
vtkLocator::GetRetainCellLists()
		CODE:
		RETVAL = THIS->GetRetainCellLists();
		OUTPUT:
		RETVAL


float
vtkLocator::GetTolerance()
		CODE:
		RETVAL = THIS->GetTolerance();
		OUTPUT:
		RETVAL


void
vtkLocator::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


void
vtkLocator::RetainCellListsOff()
		CODE:
		THIS->RetainCellListsOff();
		XSRETURN_EMPTY;


void
vtkLocator::RetainCellListsOn()
		CODE:
		THIS->RetainCellListsOn();
		XSRETURN_EMPTY;


void
vtkLocator::SetAutomatic(arg1)
		int 	arg1
		CODE:
		THIS->SetAutomatic(arg1);
		XSRETURN_EMPTY;


void
vtkLocator::SetDataSet(arg1)
		vtkDataSet *	arg1
		CODE:
		THIS->SetDataSet(arg1);
		XSRETURN_EMPTY;


void
vtkLocator::SetMaxLevel(arg1)
		int 	arg1
		CODE:
		THIS->SetMaxLevel(arg1);
		XSRETURN_EMPTY;


void
vtkLocator::SetRetainCellLists(arg1)
		int 	arg1
		CODE:
		THIS->SetRetainCellLists(arg1);
		XSRETURN_EMPTY;


void
vtkLocator::SetTolerance(arg1)
		float 	arg1
		CODE:
		THIS->SetTolerance(arg1);
		XSRETURN_EMPTY;


void
vtkLocator::Update()
		CODE:
		THIS->Update();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::ObjectFactory PREFIX = vtk

PROTOTYPES: DISABLE



vtkObject *
vtkObjectFactory::CreateInstance(vtkclassname)
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


void
vtkObjectFactory::Disable(className)
		char *	className
		CODE:
		THIS->Disable(className);
		XSRETURN_EMPTY;


const char *
vtkObjectFactory::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


const char *
vtkObjectFactory::GetClassOverrideName(index)
		int 	index
		CODE:
		RETVAL = THIS->GetClassOverrideName(index);
		OUTPUT:
		RETVAL


const char *
vtkObjectFactory::GetClassOverrideWithName(index)
		int 	index
		CODE:
		RETVAL = THIS->GetClassOverrideWithName(index);
		OUTPUT:
		RETVAL


const char *
vtkObjectFactory::GetDescription(arg1 = 0)
	CASE: items == 2
		int 	arg1
		CODE:
		RETVAL = THIS->GetDescription(arg1);
		OUTPUT:
		RETVAL
	CASE: items == 1
		CODE:
		RETVAL = THIS->GetDescription();
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkObjectFactory::GetDescription\n");



int
vtkObjectFactory::GetEnableFlag(arg1 = 0, arg2 = 0)
	CASE: items == 3
		char *	arg1
		char *	arg2
		CODE:
		RETVAL = THIS->GetEnableFlag(arg1, arg2);
		OUTPUT:
		RETVAL
	CASE: items == 2
		int 	arg1
		CODE:
		RETVAL = THIS->GetEnableFlag(arg1);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkObjectFactory::GetEnableFlag\n");



char *
vtkObjectFactory::GetLibraryPath()
		CODE:
		RETVAL = THIS->GetLibraryPath();
		OUTPUT:
		RETVAL


int
vtkObjectFactory::GetNumberOfOverrides()
		CODE:
		RETVAL = THIS->GetNumberOfOverrides();
		OUTPUT:
		RETVAL


vtkObjectFactoryCollection *
vtkObjectFactory::GetRegisteredFactories()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkObjectFactoryCollection";
		CODE:
		RETVAL = THIS->GetRegisteredFactories();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


const char *
vtkObjectFactory::GetVTKSourceVersion()
		CODE:
		RETVAL = THIS->GetVTKSourceVersion();
		OUTPUT:
		RETVAL


void
vtkObjectFactory::ReHash()
		CODE:
		THIS->ReHash();
		XSRETURN_EMPTY;


void
vtkObjectFactory::RegisterFactory(arg1)
		vtkObjectFactory *	arg1
		CODE:
		THIS->RegisterFactory(arg1);
		XSRETURN_EMPTY;


void
vtkObjectFactory::SetEnableFlag(flag, className, subclassName)
		int 	flag
		char *	className
		char *	subclassName
		CODE:
		THIS->SetEnableFlag(flag, className, subclassName);
		XSRETURN_EMPTY;


void
vtkObjectFactory::UnRegisterAllFactories()
		CODE:
		THIS->UnRegisterAllFactories();
		XSRETURN_EMPTY;


void
vtkObjectFactory::UnRegisterFactory(arg1)
		vtkObjectFactory *	arg1
		CODE:
		THIS->UnRegisterFactory(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::PointSet PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkPointSet::ComputeBounds()
		CODE:
		THIS->ComputeBounds();
		XSRETURN_EMPTY;


void
vtkPointSet::CopyStructure(pd)
		vtkDataSet *	pd
		CODE:
		THIS->CopyStructure(pd);
		XSRETURN_EMPTY;


void
vtkPointSet::DeepCopy(src)
		vtkDataObject *	src
		CODE:
		THIS->DeepCopy(src);
		XSRETURN_EMPTY;


int
vtkPointSet::FindPoint(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		RETVAL = THIS->FindPoint(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPointSet::FindPoint\n");



unsigned long
vtkPointSet::GetActualMemorySize()
		CODE:
		RETVAL = THIS->GetActualMemorySize();
		OUTPUT:
		RETVAL


const char *
vtkPointSet::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


unsigned long
vtkPointSet::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


int
vtkPointSet::GetNetReferenceCount()
		CODE:
		RETVAL = THIS->GetNetReferenceCount();
		OUTPUT:
		RETVAL


int
vtkPointSet::GetNumberOfPoints()
		CODE:
		RETVAL = THIS->GetNumberOfPoints();
		OUTPUT:
		RETVAL


float *
vtkPointSet::GetPoint(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetPoint(arg1);
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


vtkPoints *
vtkPointSet::GetPoints()
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


void
vtkPointSet::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


void
vtkPointSet::SetPoints(arg1)
		vtkPoints *	arg1
		CODE:
		THIS->SetPoints(arg1);
		XSRETURN_EMPTY;


void
vtkPointSet::ShallowCopy(src)
		vtkDataObject *	src
		CODE:
		THIS->ShallowCopy(src);
		XSRETURN_EMPTY;


void
vtkPointSet::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;


void
vtkPointSet::UnRegister(o)
		vtkObject *	o
		CODE:
		THIS->UnRegister(o);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::ScalarsToColors PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkScalarsToColors::Build()
		CODE:
		THIS->Build();
		XSRETURN_EMPTY;


const char *
vtkScalarsToColors::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float *
vtkScalarsToColors::GetColor(arg1 = 0)
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


float
vtkScalarsToColors::GetLuminance(x)
		float 	x
		CODE:
		RETVAL = THIS->GetLuminance(x);
		OUTPUT:
		RETVAL


float
vtkScalarsToColors::GetOpacity(arg1)
		float 	arg1
		CODE:
		RETVAL = THIS->GetOpacity(arg1);
		OUTPUT:
		RETVAL


void
vtkScalarsToColors::SetRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float 	arg1
		float 	arg2
		CODE:
		THIS->SetRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkScalarsToColors::SetRange\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Viewport PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkViewport::AddActor2D(p)
		vtkProp *	p
		CODE:
		THIS->AddActor2D(p);
		XSRETURN_EMPTY;


void
vtkViewport::AddProp(arg1)
		vtkProp *	arg1
		CODE:
		THIS->AddProp(arg1);
		XSRETURN_EMPTY;


void
vtkViewport::ComputeAspect()
		CODE:
		THIS->ComputeAspect();
		XSRETURN_EMPTY;


void
vtkViewport::DisplayToLocalDisplay(x, y)
		float 	x
		float 	y
		CODE:
		THIS->DisplayToLocalDisplay(x, y);
		XSRETURN_EMPTY;
		OUTPUT:
		x
		y


void
vtkViewport::DisplayToNormalizedDisplay(u, v)
		float 	u
		float 	v
		CODE:
		THIS->DisplayToNormalizedDisplay(u, v);
		XSRETURN_EMPTY;
		OUTPUT:
		u
		v


void
vtkViewport::DisplayToView()
		CODE:
		THIS->DisplayToView();
		XSRETURN_EMPTY;


void
vtkViewport::DisplayToWorld()
		CODE:
		THIS->DisplayToWorld();
		XSRETURN_EMPTY;


vtkActor2DCollection *
vtkViewport::GetActors2D()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkActor2DCollection";
		CODE:
		RETVAL = THIS->GetActors2D();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float  *
vtkViewport::GetAspect()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetAspect();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


float  *
vtkViewport::GetBackground()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetBackground();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float *
vtkViewport::GetCenter()
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetCenter();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


const char *
vtkViewport::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkViewport::GetDisplayPoint()
	CASE: items == 1
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetDisplayPoint();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkViewport::GetIsPicking()
		CODE:
		RETVAL = THIS->GetIsPicking();
		OUTPUT:
		RETVAL


int *
vtkViewport::GetOrigin()
		PREINIT:
		int * retval;
		PPCODE:
		retval = THIS->GetOrigin();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


float
vtkViewport::GetPickX()
		CODE:
		RETVAL = THIS->GetPickX();
		OUTPUT:
		RETVAL


float
vtkViewport::GetPickY()
		CODE:
		RETVAL = THIS->GetPickY();
		OUTPUT:
		RETVAL


float
vtkViewport::GetPickedZ()
		CODE:
		RETVAL = THIS->GetPickedZ();
		OUTPUT:
		RETVAL


vtkPropCollection *
vtkViewport::GetProps()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPropCollection";
		CODE:
		RETVAL = THIS->GetProps();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int *
vtkViewport::GetSize()
		PREINIT:
		int * retval;
		PPCODE:
		retval = THIS->GetSize();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


vtkWindow *
vtkViewport::GetVTKWindow()
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


float  *
vtkViewport::GetViewPoint()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetViewPoint();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkViewport::GetViewport()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetViewport();
		EXTEND(SP, 4);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));


float  *
vtkViewport::GetWorldPoint()
	CASE: items == 1
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetWorldPoint();
		EXTEND(SP, 4);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));


int
vtkViewport::IsInViewport(x, y)
		int 	x
		int 	y
		CODE:
		RETVAL = THIS->IsInViewport(x, y);
		OUTPUT:
		RETVAL


void
vtkViewport::LocalDisplayToDisplay(x, y)
		float 	x
		float 	y
		CODE:
		THIS->LocalDisplayToDisplay(x, y);
		XSRETURN_EMPTY;
		OUTPUT:
		x
		y


void
vtkViewport::NormalizedDisplayToDisplay(u, v)
		float 	u
		float 	v
		CODE:
		THIS->NormalizedDisplayToDisplay(u, v);
		XSRETURN_EMPTY;
		OUTPUT:
		u
		v


void
vtkViewport::NormalizedDisplayToViewport(x, y)
		float 	x
		float 	y
		CODE:
		THIS->NormalizedDisplayToViewport(x, y);
		XSRETURN_EMPTY;
		OUTPUT:
		x
		y


void
vtkViewport::NormalizedViewportToView(x, y, z)
		float 	x
		float 	y
		float 	z
		CODE:
		THIS->NormalizedViewportToView(x, y, z);
		XSRETURN_EMPTY;
		OUTPUT:
		x
		y
		z


void
vtkViewport::NormalizedViewportToViewport(u, v)
		float 	u
		float 	v
		CODE:
		THIS->NormalizedViewportToViewport(u, v);
		XSRETURN_EMPTY;
		OUTPUT:
		u
		v


vtkAssemblyPath *
vtkViewport::PickProp(selectionX, selectionY)
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


vtkAssemblyPath *
vtkViewport::PickPropFrom(selectionX, selectionY, arg3)
		float 	selectionX
		float 	selectionY
		vtkPropCollection *	arg3
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkAssemblyPath";
		CODE:
		RETVAL = THIS->PickPropFrom(selectionX, selectionY, arg3);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkViewport::RemoveActor2D(p)
		vtkProp *	p
		CODE:
		THIS->RemoveActor2D(p);
		XSRETURN_EMPTY;


void
vtkViewport::RemoveProp(arg1)
		vtkProp *	arg1
		CODE:
		THIS->RemoveProp(arg1);
		XSRETURN_EMPTY;


void
vtkViewport::SetAspect(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetAspect(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkViewport::SetAspect\n");



void
vtkViewport::SetBackground(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetBackground(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkViewport::SetBackground\n");



void
vtkViewport::SetDisplayPoint(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetDisplayPoint(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkViewport::SetDisplayPoint\n");



void
vtkViewport::SetEndRenderMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetEndRenderMethod",0), newRV(func), 0);
		}
		THIS->SetEndRenderMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkViewport::SetStartRenderMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetStartRenderMethod",0), newRV(func), 0);
		}
		THIS->SetStartRenderMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkViewport::SetViewPoint(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetViewPoint(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkViewport::SetViewPoint\n");



void
vtkViewport::SetViewport(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		float  	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		CODE:
		THIS->SetViewport(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkViewport::SetViewport\n");



void
vtkViewport::SetWorldPoint(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		float  	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		CODE:
		THIS->SetWorldPoint(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkViewport::SetWorldPoint\n");



void
vtkViewport::ViewToDisplay()
		CODE:
		THIS->ViewToDisplay();
		XSRETURN_EMPTY;


void
vtkViewport::ViewToNormalizedViewport(x, y, z)
		float 	x
		float 	y
		float 	z
		CODE:
		THIS->ViewToNormalizedViewport(x, y, z);
		XSRETURN_EMPTY;
		OUTPUT:
		x
		y
		z


void
vtkViewport::ViewToWorld(arg1 = 0, arg2 = 0, arg3 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkViewport::ViewToWorld\n");



void
vtkViewport::ViewportToNormalizedDisplay(x, y)
		float 	x
		float 	y
		CODE:
		THIS->ViewportToNormalizedDisplay(x, y);
		XSRETURN_EMPTY;
		OUTPUT:
		x
		y


void
vtkViewport::ViewportToNormalizedViewport(u, v)
		float 	u
		float 	v
		CODE:
		THIS->ViewportToNormalizedViewport(u, v);
		XSRETURN_EMPTY;
		OUTPUT:
		u
		v


void
vtkViewport::WorldToDisplay()
		CODE:
		THIS->WorldToDisplay();
		XSRETURN_EMPTY;


void
vtkViewport::WorldToView(arg1 = 0, arg2 = 0, arg3 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkViewport::WorldToView\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::WarpTransform PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkWarpTransform::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkWarpTransform::GetInverseIterations()
		CODE:
		RETVAL = THIS->GetInverseIterations();
		OUTPUT:
		RETVAL


double
vtkWarpTransform::GetInverseTolerance()
		CODE:
		RETVAL = THIS->GetInverseTolerance();
		OUTPUT:
		RETVAL


void
vtkWarpTransform::Inverse()
		CODE:
		THIS->Inverse();
		XSRETURN_EMPTY;


void
vtkWarpTransform::SetInverseIterations(arg1)
		int 	arg1
		CODE:
		THIS->SetInverseIterations(arg1);
		XSRETURN_EMPTY;


void
vtkWarpTransform::SetInverseTolerance(arg1)
		double 	arg1
		CODE:
		THIS->SetInverseTolerance(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Window PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkWindow::DoubleBufferOff()
		CODE:
		THIS->DoubleBufferOff();
		XSRETURN_EMPTY;


void
vtkWindow::DoubleBufferOn()
		CODE:
		THIS->DoubleBufferOn();
		XSRETURN_EMPTY;


void
vtkWindow::EraseOff()
		CODE:
		THIS->EraseOff();
		XSRETURN_EMPTY;


void
vtkWindow::EraseOn()
		CODE:
		THIS->EraseOn();
		XSRETURN_EMPTY;


const char *
vtkWindow::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkWindow::GetDPI()
		CODE:
		RETVAL = THIS->GetDPI();
		OUTPUT:
		RETVAL


int
vtkWindow::GetDoubleBuffer()
		CODE:
		RETVAL = THIS->GetDoubleBuffer();
		OUTPUT:
		RETVAL


int
vtkWindow::GetErase()
		CODE:
		RETVAL = THIS->GetErase();
		OUTPUT:
		RETVAL


void *
vtkWindow::GetGenericContext()
		CODE:
		RETVAL = THIS->GetGenericContext();
		OUTPUT:
		RETVAL


void *
vtkWindow::GetGenericDisplayId()
		CODE:
		RETVAL = THIS->GetGenericDisplayId();
		OUTPUT:
		RETVAL


void *
vtkWindow::GetGenericDrawable()
		CODE:
		RETVAL = THIS->GetGenericDrawable();
		OUTPUT:
		RETVAL


void *
vtkWindow::GetGenericParentId()
		CODE:
		RETVAL = THIS->GetGenericParentId();
		OUTPUT:
		RETVAL


void *
vtkWindow::GetGenericWindowId()
		CODE:
		RETVAL = THIS->GetGenericWindowId();
		OUTPUT:
		RETVAL


int
vtkWindow::GetMapped()
		CODE:
		RETVAL = THIS->GetMapped();
		OUTPUT:
		RETVAL


int
vtkWindow::GetOffScreenRendering()
		CODE:
		RETVAL = THIS->GetOffScreenRendering();
		OUTPUT:
		RETVAL


int *
vtkWindow::GetPosition()
		PREINIT:
		int * retval;
		PPCODE:
		retval = THIS->GetPosition();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


int *
vtkWindow::GetSize()
		PREINIT:
		int * retval;
		PPCODE:
		retval = THIS->GetSize();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


char *
vtkWindow::GetWindowName()
		CODE:
		RETVAL = THIS->GetWindowName();
		OUTPUT:
		RETVAL


void
vtkWindow::MakeCurrent()
		CODE:
		THIS->MakeCurrent();
		XSRETURN_EMPTY;


void
vtkWindow::MappedOff()
		CODE:
		THIS->MappedOff();
		XSRETURN_EMPTY;


void
vtkWindow::MappedOn()
		CODE:
		THIS->MappedOn();
		XSRETURN_EMPTY;


void
vtkWindow::OffScreenRenderingOff()
		CODE:
		THIS->OffScreenRenderingOff();
		XSRETURN_EMPTY;


void
vtkWindow::OffScreenRenderingOn()
		CODE:
		THIS->OffScreenRenderingOn();
		XSRETURN_EMPTY;


void
vtkWindow::Render()
		CODE:
		THIS->Render();
		XSRETURN_EMPTY;


void
vtkWindow::SetDPI(arg1)
		int 	arg1
		CODE:
		THIS->SetDPI(arg1);
		XSRETURN_EMPTY;


void
vtkWindow::SetDoubleBuffer(arg1)
		int 	arg1
		CODE:
		THIS->SetDoubleBuffer(arg1);
		XSRETURN_EMPTY;


void
vtkWindow::SetErase(arg1)
		int 	arg1
		CODE:
		THIS->SetErase(arg1);
		XSRETURN_EMPTY;


void
vtkWindow::SetMapped(arg1)
		int 	arg1
		CODE:
		THIS->SetMapped(arg1);
		XSRETURN_EMPTY;


void
vtkWindow::SetOffScreenRendering(arg1)
		int 	arg1
		CODE:
		THIS->SetOffScreenRendering(arg1);
		XSRETURN_EMPTY;


void
vtkWindow::SetPosition(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetPosition(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkWindow::SetPosition\n");



void
vtkWindow::SetSize(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetSize(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkWindow::SetSize\n");



void
vtkWindow::SetWindowInfo(arg1)
		char *	arg1
		CODE:
		THIS->SetWindowInfo(arg1);
		XSRETURN_EMPTY;


void
vtkWindow::SetWindowName(arg1)
		char *	arg1
		CODE:
		THIS->SetWindowName(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::FunctionSet PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkFunctionSet::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkFunctionSet::GetNumberOfFunctions()
		CODE:
		RETVAL = THIS->GetNumberOfFunctions();
		OUTPUT:
		RETVAL


int
vtkFunctionSet::GetNumberOfIndependentVariables()
		CODE:
		RETVAL = THIS->GetNumberOfIndependentVariables();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::InitialValueProblemSolver PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkInitialValueProblemSolver::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkFunctionSet *
vtkInitialValueProblemSolver::GetFunctionSet()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkFunctionSet";
		CODE:
		RETVAL = THIS->GetFunctionSet();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkInitialValueProblemSolver::SetFunctionSet(functionset)
		vtkFunctionSet *	functionset
		CODE:
		THIS->SetFunctionSet(functionset);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::ObjectFactoryCollection PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkObjectFactoryCollection::AddItem(arg1 = 0)
	CASE: items == 2
		vtkObjectFactory *	arg1
		CODE:
		THIS->AddItem(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkObjectFactoryCollection::AddItem\n");



const char *
vtkObjectFactoryCollection::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkObjectFactory *
vtkObjectFactoryCollection::GetNextItem()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkObjectFactory";
		CODE:
		RETVAL = THIS->GetNextItem();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkObjectFactoryCollection*
vtkObjectFactoryCollection::New()
		CODE:
		RETVAL = vtkObjectFactoryCollection::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Actor2D PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkActor2D::GetActors2D(pc)
		vtkPropCollection *	pc
		CODE:
		THIS->GetActors2D(pc);
		XSRETURN_EMPTY;


const char *
vtkActor2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkActor2D::GetHeight()
		CODE:
		RETVAL = THIS->GetHeight();
		OUTPUT:
		RETVAL


int
vtkActor2D::GetLayerNumber()
		CODE:
		RETVAL = THIS->GetLayerNumber();
		OUTPUT:
		RETVAL


unsigned long
vtkActor2D::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


vtkMapper2D *
vtkActor2D::GetMapper()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkMapper2D";
		CODE:
		RETVAL = THIS->GetMapper();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float *
vtkActor2D::GetPosition()
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetPosition();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


float *
vtkActor2D::GetPosition2()
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetPosition2();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


vtkCoordinate *
vtkActor2D::GetPosition2Coordinate()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCoordinate";
		CODE:
		RETVAL = THIS->GetPosition2Coordinate();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkCoordinate *
vtkActor2D::GetPositionCoordinate()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCoordinate";
		CODE:
		RETVAL = THIS->GetPositionCoordinate();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkProperty2D *
vtkActor2D::GetProperty()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkProperty2D";
		CODE:
		RETVAL = THIS->GetProperty();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float
vtkActor2D::GetWidth()
		CODE:
		RETVAL = THIS->GetWidth();
		OUTPUT:
		RETVAL


static vtkActor2D*
vtkActor2D::New()
		CODE:
		RETVAL = vtkActor2D::New();
		OUTPUT:
		RETVAL


void
vtkActor2D::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;


int
vtkActor2D::RenderOpaqueGeometry(viewport)
		vtkViewport *	viewport
		CODE:
		RETVAL = THIS->RenderOpaqueGeometry(viewport);
		OUTPUT:
		RETVAL


int
vtkActor2D::RenderOverlay(viewport)
		vtkViewport *	viewport
		CODE:
		RETVAL = THIS->RenderOverlay(viewport);
		OUTPUT:
		RETVAL


int
vtkActor2D::RenderTranslucentGeometry(viewport)
		vtkViewport *	viewport
		CODE:
		RETVAL = THIS->RenderTranslucentGeometry(viewport);
		OUTPUT:
		RETVAL


void
vtkActor2D::SetDisplayPosition(arg1, arg2)
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetDisplayPosition(arg1, arg2);
		XSRETURN_EMPTY;


void
vtkActor2D::SetHeight(h)
		float 	h
		CODE:
		THIS->SetHeight(h);
		XSRETURN_EMPTY;


void
vtkActor2D::SetLayerNumber(arg1)
		int 	arg1
		CODE:
		THIS->SetLayerNumber(arg1);
		XSRETURN_EMPTY;


void
vtkActor2D::SetMapper(mapper)
		vtkMapper2D *	mapper
		CODE:
		THIS->SetMapper(mapper);
		XSRETURN_EMPTY;


void
vtkActor2D::SetPosition(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float 	arg1
		float	arg2
		CODE:
		THIS->SetPosition(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkActor2D::SetPosition\n");



void
vtkActor2D::SetPosition2(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float 	arg1
		float	arg2
		CODE:
		THIS->SetPosition2(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkActor2D::SetPosition2\n");



void
vtkActor2D::SetProperty(arg1)
		vtkProperty2D *	arg1
		CODE:
		THIS->SetProperty(arg1);
		XSRETURN_EMPTY;


void
vtkActor2D::SetWidth(w)
		float 	w
		CODE:
		THIS->SetWidth(w);
		XSRETURN_EMPTY;


void
vtkActor2D::ShallowCopy(prop)
		vtkProp *	prop
		CODE:
		THIS->ShallowCopy(prop);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Actor2DCollection PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkActor2DCollection::AddItem(arg1 = 0)
	CASE: items == 2
		vtkActor2D *	arg1
		CODE:
		THIS->AddItem(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkActor2DCollection::AddItem\n");



const char *
vtkActor2DCollection::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkActor2D *
vtkActor2DCollection::GetLastActor2D()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkActor2D";
		CODE:
		RETVAL = THIS->GetLastActor2D();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkActor2D *
vtkActor2DCollection::GetLastItem()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkActor2D";
		CODE:
		RETVAL = THIS->GetLastItem();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkActor2D *
vtkActor2DCollection::GetNextActor2D()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkActor2D";
		CODE:
		RETVAL = THIS->GetNextActor2D();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkActor2D *
vtkActor2DCollection::GetNextItem()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkActor2D";
		CODE:
		RETVAL = THIS->GetNextItem();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkActor2DCollection::IsItemPresent(arg1 = 0)
	CASE: items == 2
		vtkActor2D *	arg1
		CODE:
		RETVAL = THIS->IsItemPresent(arg1);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkActor2DCollection::IsItemPresent\n");



static vtkActor2DCollection*
vtkActor2DCollection::New()
		CODE:
		RETVAL = vtkActor2DCollection::New();
		OUTPUT:
		RETVAL


void
vtkActor2DCollection::RenderOverlay(viewport)
		vtkViewport *	viewport
		CODE:
		THIS->RenderOverlay(viewport);
		XSRETURN_EMPTY;


void
vtkActor2DCollection::Sort()
		CODE:
		THIS->Sort();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::AssemblyNode PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkAssemblyNode::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


unsigned long
vtkAssemblyNode::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


vtkMatrix4x4 *
vtkAssemblyNode::GetMatrix()
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


vtkProp *
vtkAssemblyNode::GetProp()
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


static vtkAssemblyNode*
vtkAssemblyNode::New()
		CODE:
		RETVAL = vtkAssemblyNode::New();
		OUTPUT:
		RETVAL


void
vtkAssemblyNode::SetMatrix(matrix)
		vtkMatrix4x4 *	matrix
		CODE:
		THIS->SetMatrix(matrix);
		XSRETURN_EMPTY;


void
vtkAssemblyNode::SetProp(prop)
		vtkProp *	prop
		CODE:
		THIS->SetProp(prop);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::AssemblyPath PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkAssemblyPath::AddNode(arg1 = 0, arg2 = 0)
	CASE: items == 3
		vtkProp *	arg1
		vtkMatrix4x4 *	arg2
		CODE:
		THIS->AddNode(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkAssemblyPath::AddNode\n");



void
vtkAssemblyPath::DeleteLastNode()
		CODE:
		THIS->DeleteLastNode();
		XSRETURN_EMPTY;


const char *
vtkAssemblyPath::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkAssemblyNode *
vtkAssemblyPath::GetFirstNode()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkAssemblyNode";
		CODE:
		RETVAL = THIS->GetFirstNode();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkAssemblyNode *
vtkAssemblyPath::GetLastNode()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkAssemblyNode";
		CODE:
		RETVAL = THIS->GetLastNode();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkAssemblyPath::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


vtkAssemblyNode *
vtkAssemblyPath::GetNextNode()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkAssemblyNode";
		CODE:
		RETVAL = THIS->GetNextNode();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkAssemblyPath*
vtkAssemblyPath::New()
		CODE:
		RETVAL = vtkAssemblyPath::New();
		OUTPUT:
		RETVAL


void
vtkAssemblyPath::ShallowCopy(path)
		vtkAssemblyPath *	path
		CODE:
		THIS->ShallowCopy(path);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::AssemblyPaths PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkAssemblyPaths::AddItem(arg1 = 0)
	CASE: items == 2
		vtkAssemblyPath *	arg1
		CODE:
		THIS->AddItem(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkAssemblyPaths::AddItem\n");



const char *
vtkAssemblyPaths::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


unsigned long
vtkAssemblyPaths::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


vtkAssemblyPath *
vtkAssemblyPaths::GetNextItem()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkAssemblyPath";
		CODE:
		RETVAL = THIS->GetNextItem();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkAssemblyPaths::IsItemPresent(arg1 = 0)
	CASE: items == 2
		vtkAssemblyPath *	arg1
		CODE:
		RETVAL = THIS->IsItemPresent(arg1);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkAssemblyPaths::IsItemPresent\n");



static vtkAssemblyPaths*
vtkAssemblyPaths::New()
		CODE:
		RETVAL = vtkAssemblyPaths::New();
		OUTPUT:
		RETVAL


void
vtkAssemblyPaths::RemoveItem(arg1 = 0)
	CASE: items == 2
		vtkAssemblyPath *	arg1
		CODE:
		THIS->RemoveItem(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkAssemblyPaths::RemoveItem\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::BitArray PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkBitArray::Allocate(sz, ext)
		int 	sz
		int 	ext
		CODE:
		RETVAL = THIS->Allocate(sz, ext);
		OUTPUT:
		RETVAL


void
vtkBitArray::DeepCopy(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::BitArray")
		vtkBitArray *	arg1
		CODE:
		THIS->DeepCopy(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkBitArray::DeepCopy\n");



const char *
vtkBitArray::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkBitArray::GetDataType()
		CODE:
		RETVAL = THIS->GetDataType();
		OUTPUT:
		RETVAL


int
vtkBitArray::GetValue(id)
		int 	id
		CODE:
		RETVAL = THIS->GetValue(id);
		OUTPUT:
		RETVAL


void *
vtkBitArray::GetVoidPointer(id)
		int 	id
		CODE:
		RETVAL = THIS->GetVoidPointer(id);
		OUTPUT:
		RETVAL


void
vtkBitArray::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


int
vtkBitArray::InsertNextValue(i)
		int 	i
		CODE:
		RETVAL = THIS->InsertNextValue(i);
		OUTPUT:
		RETVAL


void
vtkBitArray::InsertValue(id, i)
		int 	id
		int 	i
		CODE:
		THIS->InsertValue(id, i);
		XSRETURN_EMPTY;


static vtkBitArray*
vtkBitArray::New()
		CODE:
		RETVAL = vtkBitArray::New();
		OUTPUT:
		RETVAL


void
vtkBitArray::SetNumberOfTuples(number)
		int 	number
		CODE:
		THIS->SetNumberOfTuples(number);
		XSRETURN_EMPTY;


void
vtkBitArray::SetNumberOfValues(number)
		int 	number
		CODE:
		THIS->SetNumberOfValues(number);
		XSRETURN_EMPTY;


void
vtkBitArray::SetValue(id, value)
		int 	id
		int 	value
		CODE:
		THIS->SetValue(id, value);
		XSRETURN_EMPTY;


void
vtkBitArray::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::ByteSwap PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkByteSwap::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkByteSwap*
vtkByteSwap::New()
		CODE:
		RETVAL = vtkByteSwap::New();
		OUTPUT:
		RETVAL


void
vtkByteSwap::Swap2BERange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		char *	arg1
		int 	arg2
		CODE:
		THIS->Swap2BERange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkByteSwap::Swap2BERange\n");



void
vtkByteSwap::Swap2LERange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		char *	arg1
		int 	arg2
		CODE:
		THIS->Swap2LERange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkByteSwap::Swap2LERange\n");



void
vtkByteSwap::Swap4BE(arg1 = 0)
	CASE: items == 2
		char *	arg1
		CODE:
		THIS->Swap4BE(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkByteSwap::Swap4BE\n");



void
vtkByteSwap::Swap4BERange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		char *	arg1
		int 	arg2
		CODE:
		THIS->Swap4BERange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkByteSwap::Swap4BERange\n");



void
vtkByteSwap::Swap4LE(arg1 = 0)
	CASE: items == 2
		char *	arg1
		CODE:
		THIS->Swap4LE(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkByteSwap::Swap4LE\n");



void
vtkByteSwap::Swap4LERange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		char *	arg1
		int 	arg2
		CODE:
		THIS->Swap4LERange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkByteSwap::Swap4LERange\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::CellArray PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkCellArray::Allocate(sz, ext)
		int 	sz
		int 	ext
		CODE:
		RETVAL = THIS->Allocate(sz, ext);
		OUTPUT:
		RETVAL


void
vtkCellArray::DeepCopy(ca)
		vtkCellArray *	ca
		CODE:
		THIS->DeepCopy(ca);
		XSRETURN_EMPTY;


int
vtkCellArray::EstimateSize(numCells, maxPtsPerCell)
		int 	numCells
		int 	maxPtsPerCell
		CODE:
		RETVAL = THIS->EstimateSize(numCells, maxPtsPerCell);
		OUTPUT:
		RETVAL


unsigned long
vtkCellArray::GetActualMemorySize()
		CODE:
		RETVAL = THIS->GetActualMemorySize();
		OUTPUT:
		RETVAL


const char *
vtkCellArray::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataArray *
vtkCellArray::GetData()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataArray";
		CODE:
		RETVAL = THIS->GetData();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkCellArray::GetInsertLocation(npts)
		int 	npts
		CODE:
		RETVAL = THIS->GetInsertLocation(npts);
		OUTPUT:
		RETVAL


int
vtkCellArray::GetMaxCellSize()
		CODE:
		RETVAL = THIS->GetMaxCellSize();
		OUTPUT:
		RETVAL


int
vtkCellArray::GetNumberOfCells()
		CODE:
		RETVAL = THIS->GetNumberOfCells();
		OUTPUT:
		RETVAL


int
vtkCellArray::GetNumberOfConnectivityEntries()
		CODE:
		RETVAL = THIS->GetNumberOfConnectivityEntries();
		OUTPUT:
		RETVAL


int
vtkCellArray::GetSize()
		CODE:
		RETVAL = THIS->GetSize();
		OUTPUT:
		RETVAL


int
vtkCellArray::GetTraversalLocation(arg1 = 0)
	CASE: items == 2
		int 	arg1
		CODE:
		RETVAL = THIS->GetTraversalLocation(arg1);
		OUTPUT:
		RETVAL
	CASE: items == 1
		CODE:
		RETVAL = THIS->GetTraversalLocation();
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkCellArray::GetTraversalLocation\n");



void
vtkCellArray::InitTraversal()
		CODE:
		THIS->InitTraversal();
		XSRETURN_EMPTY;


void
vtkCellArray::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


void
vtkCellArray::InsertCellPoint(id)
		int 	id
		CODE:
		THIS->InsertCellPoint(id);
		XSRETURN_EMPTY;


int
vtkCellArray::InsertNextCell(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::IdList")
		vtkIdList *	arg1
		CODE:
		RETVAL = THIS->InsertNextCell(arg1);
		OUTPUT:
		RETVAL
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::Cell")
		vtkCell *	arg1
		CODE:
		RETVAL = THIS->InsertNextCell(arg1);
		OUTPUT:
		RETVAL
	CASE: items == 2 && SvIOK(ST(1))
		int 	arg1
		CODE:
		RETVAL = THIS->InsertNextCell(arg1);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkCellArray::InsertNextCell\n");



static vtkCellArray*
vtkCellArray::New()
		CODE:
		RETVAL = vtkCellArray::New();
		OUTPUT:
		RETVAL


void
vtkCellArray::Reset()
		CODE:
		THIS->Reset();
		XSRETURN_EMPTY;


void
vtkCellArray::ReverseCell(loc)
		int 	loc
		CODE:
		THIS->ReverseCell(loc);
		XSRETURN_EMPTY;


void
vtkCellArray::SetCells(ncells, cells)
		int 	ncells
		vtkIntArray *	cells
		CODE:
		THIS->SetCells(ncells, cells);
		XSRETURN_EMPTY;


void
vtkCellArray::SetTraversalLocation(loc)
		int 	loc
		CODE:
		THIS->SetTraversalLocation(loc);
		XSRETURN_EMPTY;


void
vtkCellArray::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;


void
vtkCellArray::UpdateCellCount(npts)
		int 	npts
		CODE:
		THIS->UpdateCellCount(npts);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::CellData PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkCellData::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkCellData*
vtkCellData::New()
		CODE:
		RETVAL = vtkCellData::New();
		OUTPUT:
		RETVAL


void
vtkCellData::NullCell(cellId)
		int 	cellId
		CODE:
		THIS->NullCell(cellId);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::CellLinks PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkCellLinks::AddCellReference(cellId, ptId)
		int 	cellId
		int 	ptId
		CODE:
		THIS->AddCellReference(cellId, ptId);
		XSRETURN_EMPTY;


void
vtkCellLinks::Allocate(numLinks, ext)
		int 	numLinks
		int 	ext
		CODE:
		THIS->Allocate(numLinks, ext);
		XSRETURN_EMPTY;


void
vtkCellLinks::BuildLinks(arg1 = 0, arg2 = 0)
	CASE: items == 3
		vtkDataSet *	arg1
		vtkCellArray *	arg2
		CODE:
		THIS->BuildLinks(arg1, arg2);
		XSRETURN_EMPTY;
	CASE: items == 2
		vtkDataSet *	arg1
		CODE:
		THIS->BuildLinks(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkCellLinks::BuildLinks\n");



void
vtkCellLinks::DeepCopy(src)
		vtkCellLinks *	src
		CODE:
		THIS->DeepCopy(src);
		XSRETURN_EMPTY;


void
vtkCellLinks::DeletePoint(ptId)
		int 	ptId
		CODE:
		THIS->DeletePoint(ptId);
		XSRETURN_EMPTY;


unsigned long
vtkCellLinks::GetActualMemorySize()
		CODE:
		RETVAL = THIS->GetActualMemorySize();
		OUTPUT:
		RETVAL


const char *
vtkCellLinks::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


unsigned short
vtkCellLinks::GetNcells(ptId)
		int 	ptId
		CODE:
		RETVAL = THIS->GetNcells(ptId);
		OUTPUT:
		RETVAL


void
vtkCellLinks::InsertNextCellReference(ptId, cellId)
		int 	ptId
		int 	cellId
		CODE:
		THIS->InsertNextCellReference(ptId, cellId);
		XSRETURN_EMPTY;


int
vtkCellLinks::InsertNextPoint(numLinks)
		int 	numLinks
		CODE:
		RETVAL = THIS->InsertNextPoint(numLinks);
		OUTPUT:
		RETVAL


static vtkCellLinks*
vtkCellLinks::New()
		CODE:
		RETVAL = vtkCellLinks::New();
		OUTPUT:
		RETVAL


void
vtkCellLinks::RemoveCellReference(cellId, ptId)
		int 	cellId
		int 	ptId
		CODE:
		THIS->RemoveCellReference(cellId, ptId);
		XSRETURN_EMPTY;


void
vtkCellLinks::Reset()
		CODE:
		THIS->Reset();
		XSRETURN_EMPTY;


void
vtkCellLinks::ResizeCellList(ptId, size)
		int 	ptId
		int 	size
		CODE:
		THIS->ResizeCellList(ptId, size);
		XSRETURN_EMPTY;


void
vtkCellLinks::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::CellTypes PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkCellTypes::Allocate(sz, ext)
		int 	sz
		int 	ext
		CODE:
		RETVAL = THIS->Allocate(sz, ext);
		OUTPUT:
		RETVAL


void
vtkCellTypes::DeepCopy(src)
		vtkCellTypes *	src
		CODE:
		THIS->DeepCopy(src);
		XSRETURN_EMPTY;


void
vtkCellTypes::DeleteCell(cellId)
		int 	cellId
		CODE:
		THIS->DeleteCell(cellId);
		XSRETURN_EMPTY;


unsigned long
vtkCellTypes::GetActualMemorySize()
		CODE:
		RETVAL = THIS->GetActualMemorySize();
		OUTPUT:
		RETVAL


int
vtkCellTypes::GetCellLocation(cellId)
		int 	cellId
		CODE:
		RETVAL = THIS->GetCellLocation(cellId);
		OUTPUT:
		RETVAL


unsigned char
vtkCellTypes::GetCellType(cellId)
		int 	cellId
		CODE:
		RETVAL = THIS->GetCellType(cellId);
		OUTPUT:
		RETVAL


const char *
vtkCellTypes::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkCellTypes::GetNumberOfTypes()
		CODE:
		RETVAL = THIS->GetNumberOfTypes();
		OUTPUT:
		RETVAL


void
vtkCellTypes::InsertCell(id, type, loc)
		int 	id
		unsigned char 	type
		int 	loc
		CODE:
		THIS->InsertCell(id, type, loc);
		XSRETURN_EMPTY;


int
vtkCellTypes::InsertNextCell(type, loc)
		unsigned char 	type
		int 	loc
		CODE:
		RETVAL = THIS->InsertNextCell(type, loc);
		OUTPUT:
		RETVAL


int
vtkCellTypes::InsertNextType(type)
		unsigned char 	type
		CODE:
		RETVAL = THIS->InsertNextType(type);
		OUTPUT:
		RETVAL


int
vtkCellTypes::IsType(type)
		unsigned char 	type
		CODE:
		RETVAL = THIS->IsType(type);
		OUTPUT:
		RETVAL


static vtkCellTypes*
vtkCellTypes::New()
		CODE:
		RETVAL = vtkCellTypes::New();
		OUTPUT:
		RETVAL


void
vtkCellTypes::Reset()
		CODE:
		THIS->Reset();
		XSRETURN_EMPTY;


void
vtkCellTypes::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::CharArray PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkCharArray::Allocate(sz, ext)
		int 	sz
		int 	ext
		CODE:
		RETVAL = THIS->Allocate(sz, ext);
		OUTPUT:
		RETVAL


void
vtkCharArray::DeepCopy(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkCharArray::DeepCopy\n");



const char *
vtkCharArray::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkCharArray::GetComponent(i, j)
		int 	i
		int 	j
		CODE:
		RETVAL = THIS->GetComponent(i, j);
		OUTPUT:
		RETVAL


int
vtkCharArray::GetDataType()
		CODE:
		RETVAL = THIS->GetDataType();
		OUTPUT:
		RETVAL


char *
vtkCharArray::GetPointer(id)
		int 	id
		CODE:
		RETVAL = THIS->GetPointer(id);
		OUTPUT:
		RETVAL


char
vtkCharArray::GetValue(id)
		int 	id
		CODE:
		RETVAL = THIS->GetValue(id);
		OUTPUT:
		RETVAL


void *
vtkCharArray::GetVoidPointer(id)
		int 	id
		CODE:
		RETVAL = THIS->GetVoidPointer(id);
		OUTPUT:
		RETVAL


void
vtkCharArray::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


void
vtkCharArray::InsertComponent(i, j, c)
		int 	i
		int 	j
		float 	c
		CODE:
		THIS->InsertComponent(i, j, c);
		XSRETURN_EMPTY;


int
vtkCharArray::InsertNextValue(c)
		char 	c
		CODE:
		RETVAL = THIS->InsertNextValue(c);
		OUTPUT:
		RETVAL


void
vtkCharArray::InsertValue(id, c)
		int 	id
		char 	c
		CODE:
		THIS->InsertValue(id, c);
		XSRETURN_EMPTY;


static vtkCharArray*
vtkCharArray::New()
		CODE:
		RETVAL = vtkCharArray::New();
		OUTPUT:
		RETVAL


void
vtkCharArray::SetArray(array, size, save)
		char *	array
		int 	size
		int 	save
		CODE:
		THIS->SetArray(array, size, save);
		XSRETURN_EMPTY;


void
vtkCharArray::SetComponent(i, j, c)
		int 	i
		int 	j
		float 	c
		CODE:
		THIS->SetComponent(i, j, c);
		XSRETURN_EMPTY;


void
vtkCharArray::SetNumberOfTuples(number)
		int 	number
		CODE:
		THIS->SetNumberOfTuples(number);
		XSRETURN_EMPTY;


void
vtkCharArray::SetNumberOfValues(number)
		int 	number
		CODE:
		THIS->SetNumberOfValues(number);
		XSRETURN_EMPTY;


void
vtkCharArray::SetValue(id, value)
		int 	id
		char 	value
		CODE:
		THIS->SetValue(id, value);
		XSRETURN_EMPTY;


void
vtkCharArray::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;


char *
vtkCharArray::WritePointer(id, number)
		int 	id
		int 	number
		CODE:
		RETVAL = THIS->WritePointer(id, number);
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Collection PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkCollection::AddItem(arg1)
		vtkObject *	arg1
		CODE:
		THIS->AddItem(arg1);
		XSRETURN_EMPTY;


const char *
vtkCollection::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkObject *
vtkCollection::GetItemAsObject(i)
		int 	i
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkObject";
		CODE:
		RETVAL = THIS->GetItemAsObject(i);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkObject *
vtkCollection::GetNextItemAsObject()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkObject";
		CODE:
		RETVAL = THIS->GetNextItemAsObject();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkCollection::GetNumberOfItems()
		CODE:
		RETVAL = THIS->GetNumberOfItems();
		OUTPUT:
		RETVAL


void
vtkCollection::InitTraversal()
		CODE:
		THIS->InitTraversal();
		XSRETURN_EMPTY;


int
vtkCollection::IsItemPresent(arg1)
		vtkObject *	arg1
		CODE:
		RETVAL = THIS->IsItemPresent(arg1);
		OUTPUT:
		RETVAL


static vtkCollection*
vtkCollection::New()
		CODE:
		RETVAL = vtkCollection::New();
		OUTPUT:
		RETVAL


void
vtkCollection::RemoveAllItems()
		CODE:
		THIS->RemoveAllItems();
		XSRETURN_EMPTY;


void
vtkCollection::RemoveItem(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::Object")
		vtkObject *	arg1
		CODE:
		THIS->RemoveItem(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && SvIOK(ST(1))
		int 	arg1
		CODE:
		THIS->RemoveItem(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkCollection::RemoveItem\n");



void
vtkCollection::ReplaceItem(i, arg2)
		int 	i
		vtkObject *	arg2
		CODE:
		THIS->ReplaceItem(i, arg2);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::ContourValues PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkContourValues::GenerateValues(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->GenerateValues(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkContourValues::GenerateValues\n");



const char *
vtkContourValues::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkContourValues::GetNumberOfContours()
		CODE:
		RETVAL = THIS->GetNumberOfContours();
		OUTPUT:
		RETVAL


float
vtkContourValues::GetValue(i)
		int 	i
		CODE:
		RETVAL = THIS->GetValue(i);
		OUTPUT:
		RETVAL


static vtkContourValues*
vtkContourValues::New()
		CODE:
		RETVAL = vtkContourValues::New();
		OUTPUT:
		RETVAL


void
vtkContourValues::SetNumberOfContours(number)
		int 	number
		CODE:
		THIS->SetNumberOfContours(number);
		XSRETURN_EMPTY;


void
vtkContourValues::SetValue(i, value)
		int 	i
		float 	value
		CODE:
		THIS->SetValue(i, value);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Coordinate PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkCoordinate::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int *
vtkCoordinate::GetComputedDisplayValue(arg1)
		vtkViewport *	arg1
		PREINIT:
		int * retval;
		PPCODE:
		retval = THIS->GetComputedDisplayValue(arg1);
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


int *
vtkCoordinate::GetComputedLocalDisplayValue(arg1)
		vtkViewport *	arg1
		PREINIT:
		int * retval;
		PPCODE:
		retval = THIS->GetComputedLocalDisplayValue(arg1);
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


int *
vtkCoordinate::GetComputedViewportValue(arg1)
		vtkViewport *	arg1
		PREINIT:
		int * retval;
		PPCODE:
		retval = THIS->GetComputedViewportValue(arg1);
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


float *
vtkCoordinate::GetComputedWorldValue(arg1)
		vtkViewport *	arg1
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetComputedWorldValue(arg1);
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkCoordinate::GetCoordinateSystem()
		CODE:
		RETVAL = THIS->GetCoordinateSystem();
		OUTPUT:
		RETVAL


const char *
vtkCoordinate::GetCoordinateSystemAsString()
		CODE:
		RETVAL = THIS->GetCoordinateSystemAsString();
		OUTPUT:
		RETVAL


vtkCoordinate *
vtkCoordinate::GetReferenceCoordinate()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCoordinate";
		CODE:
		RETVAL = THIS->GetReferenceCoordinate();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float  *
vtkCoordinate::GetValue()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetValue();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


vtkViewport *
vtkCoordinate::GetViewport()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkViewport";
		CODE:
		RETVAL = THIS->GetViewport();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkCoordinate*
vtkCoordinate::New()
		CODE:
		RETVAL = vtkCoordinate::New();
		OUTPUT:
		RETVAL


void
vtkCoordinate::SetCoordinateSystem(arg1)
		int 	arg1
		CODE:
		THIS->SetCoordinateSystem(arg1);
		XSRETURN_EMPTY;


void
vtkCoordinate::SetCoordinateSystemToDisplay()
		CODE:
		THIS->SetCoordinateSystemToDisplay();
		XSRETURN_EMPTY;


void
vtkCoordinate::SetCoordinateSystemToNormalizedDisplay()
		CODE:
		THIS->SetCoordinateSystemToNormalizedDisplay();
		XSRETURN_EMPTY;


void
vtkCoordinate::SetCoordinateSystemToNormalizedViewport()
		CODE:
		THIS->SetCoordinateSystemToNormalizedViewport();
		XSRETURN_EMPTY;


void
vtkCoordinate::SetCoordinateSystemToView()
		CODE:
		THIS->SetCoordinateSystemToView();
		XSRETURN_EMPTY;


void
vtkCoordinate::SetCoordinateSystemToViewport()
		CODE:
		THIS->SetCoordinateSystemToViewport();
		XSRETURN_EMPTY;


void
vtkCoordinate::SetCoordinateSystemToWorld()
		CODE:
		THIS->SetCoordinateSystemToWorld();
		XSRETURN_EMPTY;


void
vtkCoordinate::SetReferenceCoordinate(arg1)
		vtkCoordinate *	arg1
		CODE:
		THIS->SetReferenceCoordinate(arg1);
		XSRETURN_EMPTY;


void
vtkCoordinate::SetValue(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetValue(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 3
		float 	arg1
		float 	arg2
		CODE:
		THIS->SetValue(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkCoordinate::SetValue\n");



void
vtkCoordinate::SetViewport(viewport)
		vtkViewport *	viewport
		CODE:
		THIS->SetViewport(viewport);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::CriticalSection PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkCriticalSection::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


void
vtkCriticalSection::Lock()
		CODE:
		THIS->Lock();
		XSRETURN_EMPTY;


static vtkCriticalSection*
vtkCriticalSection::New()
		CODE:
		RETVAL = vtkCriticalSection::New();
		OUTPUT:
		RETVAL


void
vtkCriticalSection::Unlock()
		CODE:
		THIS->Unlock();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::DataObject PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkDataObject::CopyInformation(data)
		vtkDataObject *	data
		CODE:
		THIS->CopyInformation(data);
		XSRETURN_EMPTY;


void
vtkDataObject::CopyTypeSpecificInformation(data)
		vtkDataObject *	data
		CODE:
		THIS->CopyTypeSpecificInformation(data);
		XSRETURN_EMPTY;


void
vtkDataObject::DataHasBeenGenerated()
		CODE:
		THIS->DataHasBeenGenerated();
		XSRETURN_EMPTY;


void
vtkDataObject::DeepCopy(src)
		vtkDataObject *	src
		CODE:
		THIS->DeepCopy(src);
		XSRETURN_EMPTY;


unsigned long
vtkDataObject::GetActualMemorySize()
		CODE:
		RETVAL = THIS->GetActualMemorySize();
		OUTPUT:
		RETVAL


const char *
vtkDataObject::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkDataObject::GetDataObjectType()
		CODE:
		RETVAL = THIS->GetDataObjectType();
		OUTPUT:
		RETVAL


int
vtkDataObject::GetDataReleased()
		CODE:
		RETVAL = THIS->GetDataReleased();
		OUTPUT:
		RETVAL


unsigned long
vtkDataObject::GetEstimatedMemorySize()
		CODE:
		RETVAL = THIS->GetEstimatedMemorySize();
		OUTPUT:
		RETVAL


unsigned long
vtkDataObject::GetEstimatedPipelineMemorySize()
		CODE:
		RETVAL = THIS->GetEstimatedPipelineMemorySize();
		OUTPUT:
		RETVAL


vtkExtentTranslator *
vtkDataObject::GetExtentTranslator()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkExtentTranslator";
		CODE:
		RETVAL = THIS->GetExtentTranslator();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkFieldData *
vtkDataObject::GetFieldData()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkFieldData";
		CODE:
		RETVAL = THIS->GetFieldData();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkDataObject::GetGlobalReleaseDataFlag()
		CODE:
		RETVAL = THIS->GetGlobalReleaseDataFlag();
		OUTPUT:
		RETVAL


float
vtkDataObject::GetLocality()
		CODE:
		RETVAL = THIS->GetLocality();
		OUTPUT:
		RETVAL


unsigned long
vtkDataObject::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


int
vtkDataObject::GetNetReferenceCount()
		CODE:
		RETVAL = THIS->GetNetReferenceCount();
		OUTPUT:
		RETVAL


unsigned long
vtkDataObject::GetPipelineMTime()
		CODE:
		RETVAL = THIS->GetPipelineMTime();
		OUTPUT:
		RETVAL


int
vtkDataObject::GetReleaseDataFlag()
		CODE:
		RETVAL = THIS->GetReleaseDataFlag();
		OUTPUT:
		RETVAL


vtkSource *
vtkDataObject::GetSource()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkSource";
		CODE:
		RETVAL = THIS->GetSource();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int  *
vtkDataObject::GetUpdateExtent()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetUpdateExtent();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


int
vtkDataObject::GetUpdateGhostLevel()
		CODE:
		RETVAL = THIS->GetUpdateGhostLevel();
		OUTPUT:
		RETVAL


int
vtkDataObject::GetUpdateNumberOfPieces()
		CODE:
		RETVAL = THIS->GetUpdateNumberOfPieces();
		OUTPUT:
		RETVAL


int
vtkDataObject::GetUpdatePiece()
		CODE:
		RETVAL = THIS->GetUpdatePiece();
		OUTPUT:
		RETVAL


unsigned long
vtkDataObject::GetUpdateTime()
		CODE:
		RETVAL = THIS->GetUpdateTime();
		OUTPUT:
		RETVAL


int  *
vtkDataObject::GetWholeExtent()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetWholeExtent();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


void
vtkDataObject::GlobalReleaseDataFlagOff()
		CODE:
		THIS->GlobalReleaseDataFlagOff();
		XSRETURN_EMPTY;


void
vtkDataObject::GlobalReleaseDataFlagOn()
		CODE:
		THIS->GlobalReleaseDataFlagOn();
		XSRETURN_EMPTY;


void
vtkDataObject::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


static vtkDataObject*
vtkDataObject::New()
		CODE:
		RETVAL = vtkDataObject::New();
		OUTPUT:
		RETVAL


void
vtkDataObject::PrepareForNewData()
		CODE:
		THIS->PrepareForNewData();
		XSRETURN_EMPTY;


void
vtkDataObject::PropagateUpdateExtent()
		CODE:
		THIS->PropagateUpdateExtent();
		XSRETURN_EMPTY;


void
vtkDataObject::ReleaseData()
		CODE:
		THIS->ReleaseData();
		XSRETURN_EMPTY;


void
vtkDataObject::ReleaseDataFlagOff()
		CODE:
		THIS->ReleaseDataFlagOff();
		XSRETURN_EMPTY;


void
vtkDataObject::ReleaseDataFlagOn()
		CODE:
		THIS->ReleaseDataFlagOn();
		XSRETURN_EMPTY;


void
vtkDataObject::SetExtentTranslator(translator)
		vtkExtentTranslator *	translator
		CODE:
		THIS->SetExtentTranslator(translator);
		XSRETURN_EMPTY;


void
vtkDataObject::SetFieldData(arg1)
		vtkFieldData *	arg1
		CODE:
		THIS->SetFieldData(arg1);
		XSRETURN_EMPTY;


void
vtkDataObject::SetGlobalReleaseDataFlag(val)
		int 	val
		CODE:
		THIS->SetGlobalReleaseDataFlag(val);
		XSRETURN_EMPTY;


void
vtkDataObject::SetLocality(arg1)
		float 	arg1
		CODE:
		THIS->SetLocality(arg1);
		XSRETURN_EMPTY;


void
vtkDataObject::SetPipelineMTime(time)
		unsigned long 	time
		CODE:
		THIS->SetPipelineMTime(time);
		XSRETURN_EMPTY;


void
vtkDataObject::SetReleaseDataFlag(arg1)
		int 	arg1
		CODE:
		THIS->SetReleaseDataFlag(arg1);
		XSRETURN_EMPTY;


void
vtkDataObject::SetSource(s)
		vtkSource *	s
		CODE:
		THIS->SetSource(s);
		XSRETURN_EMPTY;


void
vtkDataObject::SetUpdateExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int 	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetUpdateExtent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetUpdateExtent(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 3
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetUpdateExtent(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataObject::SetUpdateExtent\n");



void
vtkDataObject::SetUpdateExtentToWholeExtent()
		CODE:
		THIS->SetUpdateExtentToWholeExtent();
		XSRETURN_EMPTY;


void
vtkDataObject::SetUpdateGhostLevel(level)
		int 	level
		CODE:
		THIS->SetUpdateGhostLevel(level);
		XSRETURN_EMPTY;


void
vtkDataObject::SetUpdateNumberOfPieces(num)
		int 	num
		CODE:
		THIS->SetUpdateNumberOfPieces(num);
		XSRETURN_EMPTY;


void
vtkDataObject::SetUpdatePiece(piece)
		int 	piece
		CODE:
		THIS->SetUpdatePiece(piece);
		XSRETURN_EMPTY;


void
vtkDataObject::SetWholeExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int  	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetWholeExtent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataObject::SetWholeExtent\n");



void
vtkDataObject::ShallowCopy(src)
		vtkDataObject *	src
		CODE:
		THIS->ShallowCopy(src);
		XSRETURN_EMPTY;


int
vtkDataObject::ShouldIReleaseData()
		CODE:
		RETVAL = THIS->ShouldIReleaseData();
		OUTPUT:
		RETVAL


void
vtkDataObject::TriggerAsynchronousUpdate()
		CODE:
		THIS->TriggerAsynchronousUpdate();
		XSRETURN_EMPTY;


void
vtkDataObject::UnRegister(o)
		vtkObject *	o
		CODE:
		THIS->UnRegister(o);
		XSRETURN_EMPTY;


void
vtkDataObject::Update()
		CODE:
		THIS->Update();
		XSRETURN_EMPTY;


void
vtkDataObject::UpdateData()
		CODE:
		THIS->UpdateData();
		XSRETURN_EMPTY;


void
vtkDataObject::UpdateInformation()
		CODE:
		THIS->UpdateInformation();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::DataObjectCollection PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkDataObjectCollection::AddItem(arg1 = 0)
	CASE: items == 2
		vtkDataObject *	arg1
		CODE:
		THIS->AddItem(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataObjectCollection::AddItem\n");



const char *
vtkDataObjectCollection::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataObject *
vtkDataObjectCollection::GetItem(i)
		int 	i
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataObject";
		CODE:
		RETVAL = THIS->GetItem(i);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkDataObject *
vtkDataObjectCollection::GetNextItem()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataObject";
		CODE:
		RETVAL = THIS->GetNextItem();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkDataObjectCollection*
vtkDataObjectCollection::New()
		CODE:
		RETVAL = vtkDataObjectCollection::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::DataSetAttributes PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkDataSetAttributes::CopyAllOff()
		CODE:
		THIS->CopyAllOff();
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::CopyAllOn()
		CODE:
		THIS->CopyAllOn();
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::CopyAllocate(pd, sze, ext)
		vtkDataSetAttributes *	pd
		int 	sze
		int 	ext
		CODE:
		THIS->CopyAllocate(pd, sze, ext);
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::CopyData(fromPd, fromId, toId)
		vtkDataSetAttributes *	fromPd
		int 	fromId
		int 	toId
		CODE:
		THIS->CopyData(fromPd, fromId, toId);
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::CopyFieldDataOff()
		CODE:
		THIS->CopyFieldDataOff();
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::CopyFieldDataOn()
		CODE:
		THIS->CopyFieldDataOn();
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::CopyGhostLevelsOff()
		CODE:
		THIS->CopyGhostLevelsOff();
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::CopyGhostLevelsOn()
		CODE:
		THIS->CopyGhostLevelsOn();
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::CopyNormalsOff()
		CODE:
		THIS->CopyNormalsOff();
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::CopyNormalsOn()
		CODE:
		THIS->CopyNormalsOn();
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::CopyScalarsOff()
		CODE:
		THIS->CopyScalarsOff();
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::CopyScalarsOn()
		CODE:
		THIS->CopyScalarsOn();
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::CopyTCoordsOff()
		CODE:
		THIS->CopyTCoordsOff();
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::CopyTCoordsOn()
		CODE:
		THIS->CopyTCoordsOn();
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::CopyTensorsOff()
		CODE:
		THIS->CopyTensorsOff();
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::CopyTensorsOn()
		CODE:
		THIS->CopyTensorsOn();
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::CopyTuple(fromData, toData, fromId, toId)
		vtkDataArray *	fromData
		vtkDataArray *	toData
		int 	fromId
		int 	toId
		CODE:
		THIS->CopyTuple(fromData, toData, fromId, toId);
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::CopyVectorsOff()
		CODE:
		THIS->CopyVectorsOff();
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::CopyVectorsOn()
		CODE:
		THIS->CopyVectorsOn();
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::DeepCopy(arg1 = 0)
	CASE: items == 2
		vtkDataSetAttributes *	arg1
		CODE:
		THIS->DeepCopy(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataSetAttributes::DeepCopy\n");



unsigned long
vtkDataSetAttributes::GetActualMemorySize()
		CODE:
		RETVAL = THIS->GetActualMemorySize();
		OUTPUT:
		RETVAL


int
vtkDataSetAttributes::GetAnyEnabled()
		CODE:
		RETVAL = THIS->GetAnyEnabled();
		OUTPUT:
		RETVAL


const char *
vtkDataSetAttributes::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkDataSetAttributes::GetCopyFieldData()
		CODE:
		RETVAL = THIS->GetCopyFieldData();
		OUTPUT:
		RETVAL


int
vtkDataSetAttributes::GetCopyGhostLevels()
		CODE:
		RETVAL = THIS->GetCopyGhostLevels();
		OUTPUT:
		RETVAL


int
vtkDataSetAttributes::GetCopyNormals()
		CODE:
		RETVAL = THIS->GetCopyNormals();
		OUTPUT:
		RETVAL


int
vtkDataSetAttributes::GetCopyScalars()
		CODE:
		RETVAL = THIS->GetCopyScalars();
		OUTPUT:
		RETVAL


int
vtkDataSetAttributes::GetCopyTCoords()
		CODE:
		RETVAL = THIS->GetCopyTCoords();
		OUTPUT:
		RETVAL


int
vtkDataSetAttributes::GetCopyTensors()
		CODE:
		RETVAL = THIS->GetCopyTensors();
		OUTPUT:
		RETVAL


int
vtkDataSetAttributes::GetCopyVectors()
		CODE:
		RETVAL = THIS->GetCopyVectors();
		OUTPUT:
		RETVAL


vtkFieldData *
vtkDataSetAttributes::GetFieldData()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkFieldData";
		CODE:
		RETVAL = THIS->GetFieldData();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkGhostLevels *
vtkDataSetAttributes::GetGhostLevels()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkGhostLevels";
		CODE:
		RETVAL = THIS->GetGhostLevels();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkDataSetAttributes::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


vtkNormals *
vtkDataSetAttributes::GetNormals()
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


vtkScalars *
vtkDataSetAttributes::GetScalars()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkScalars";
		CODE:
		RETVAL = THIS->GetScalars();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkTCoords *
vtkDataSetAttributes::GetTCoords()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkTCoords";
		CODE:
		RETVAL = THIS->GetTCoords();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkTensors *
vtkDataSetAttributes::GetTensors()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkTensors";
		CODE:
		RETVAL = THIS->GetTensors();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkVectors *
vtkDataSetAttributes::GetVectors()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkVectors";
		CODE:
		RETVAL = THIS->GetVectors();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkDataSetAttributes::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::InterpolateAllocate(pd, sze, ext)
		vtkDataSetAttributes *	pd
		int 	sze
		int 	ext
		CODE:
		THIS->InterpolateAllocate(pd, sze, ext);
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::InterpolateEdge(fromPd, toId, p1, p2, t)
		vtkDataSetAttributes *	fromPd
		int 	toId
		int 	p1
		int 	p2
		float 	t
		CODE:
		THIS->InterpolateEdge(fromPd, toId, p1, p2, t);
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::InterpolateTime(from1, from2, id, t)
		vtkDataSetAttributes *	from1
		vtkDataSetAttributes *	from2
		int 	id
		float 	t
		CODE:
		THIS->InterpolateTime(from1, from2, id, t);
		XSRETURN_EMPTY;


static vtkDataSetAttributes*
vtkDataSetAttributes::New()
		CODE:
		RETVAL = vtkDataSetAttributes::New();
		OUTPUT:
		RETVAL


void
vtkDataSetAttributes::PassData(pd)
		vtkDataSetAttributes *	pd
		CODE:
		THIS->PassData(pd);
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::PassNoReplaceData(pd)
		vtkDataSetAttributes *	pd
		CODE:
		THIS->PassNoReplaceData(pd);
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::SetCopyFieldData(arg1)
		int 	arg1
		CODE:
		THIS->SetCopyFieldData(arg1);
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::SetCopyGhostLevels(arg1)
		int 	arg1
		CODE:
		THIS->SetCopyGhostLevels(arg1);
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::SetCopyNormals(arg1)
		int 	arg1
		CODE:
		THIS->SetCopyNormals(arg1);
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::SetCopyScalars(arg1)
		int 	arg1
		CODE:
		THIS->SetCopyScalars(arg1);
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::SetCopyTCoords(arg1)
		int 	arg1
		CODE:
		THIS->SetCopyTCoords(arg1);
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::SetCopyTensors(arg1)
		int 	arg1
		CODE:
		THIS->SetCopyTensors(arg1);
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::SetCopyVectors(arg1)
		int 	arg1
		CODE:
		THIS->SetCopyVectors(arg1);
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::SetFieldData(arg1)
		vtkFieldData *	arg1
		CODE:
		THIS->SetFieldData(arg1);
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::SetGhostLevels(arg1)
		vtkGhostLevels *	arg1
		CODE:
		THIS->SetGhostLevels(arg1);
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::SetNormals(arg1)
		vtkNormals *	arg1
		CODE:
		THIS->SetNormals(arg1);
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::SetScalars(arg1)
		vtkScalars *	arg1
		CODE:
		THIS->SetScalars(arg1);
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::SetTCoords(arg1)
		vtkTCoords *	arg1
		CODE:
		THIS->SetTCoords(arg1);
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::SetTensors(arg1)
		vtkTensors *	arg1
		CODE:
		THIS->SetTensors(arg1);
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::SetVectors(arg1)
		vtkVectors *	arg1
		CODE:
		THIS->SetVectors(arg1);
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::ShallowCopy(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataSetAttributes")
		vtkDataSetAttributes *	arg1
		CODE:
		THIS->ShallowCopy(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataSetAttributes")
		vtkDataSetAttributes *	arg1
		CODE:
		THIS->ShallowCopy(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataSetAttributes::ShallowCopy\n");



void
vtkDataSetAttributes::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;


void
vtkDataSetAttributes::Update()
		CODE:
		THIS->Update();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::DataSetCollection PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkDataSetCollection::AddItem(arg1 = 0)
	CASE: items == 2
		vtkDataSet *	arg1
		CODE:
		THIS->AddItem(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDataSetCollection::AddItem\n");



const char *
vtkDataSetCollection::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkDataSetCollection::GetItem(i)
		int 	i
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetItem(i);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkDataSet *
vtkDataSetCollection::GetNextItem()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataSet";
		CODE:
		RETVAL = THIS->GetNextItem();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkDataSetCollection*
vtkDataSetCollection::New()
		CODE:
		RETVAL = vtkDataSetCollection::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::DebugLeaks PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkDebugLeaks::ConstructClass(classname)
		char *	classname
		CODE:
		THIS->ConstructClass(classname);
		XSRETURN_EMPTY;


void
vtkDebugLeaks::DeleteTable()
		CODE:
		THIS->DeleteTable();
		XSRETURN_EMPTY;


void
vtkDebugLeaks::DestructClass(classname)
		char *	classname
		CODE:
		THIS->DestructClass(classname);
		XSRETURN_EMPTY;


const char *
vtkDebugLeaks::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkDebugLeaks*
vtkDebugLeaks::New()
		CODE:
		RETVAL = vtkDebugLeaks::New();
		OUTPUT:
		RETVAL


void
vtkDebugLeaks::PrintCurrentLeaks()
		CODE:
		THIS->PrintCurrentLeaks();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Directory PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkDirectory::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


const char *
vtkDirectory::GetFile(index)
		int 	index
		CODE:
		RETVAL = THIS->GetFile(index);
		OUTPUT:
		RETVAL


int
vtkDirectory::GetNumberOfFiles()
		CODE:
		RETVAL = THIS->GetNumberOfFiles();
		OUTPUT:
		RETVAL


static vtkDirectory*
vtkDirectory::New()
		CODE:
		RETVAL = vtkDirectory::New();
		OUTPUT:
		RETVAL


int
vtkDirectory::Open(dir)
		char *	dir
		CODE:
		RETVAL = THIS->Open(dir);
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::DynamicLoader PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkDynamicLoader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


void *
vtkDynamicLoader::GetSymbolAddress(arg1, arg2)
		vtkLibHandle 	arg1
		char *	arg2
		CODE:
		RETVAL = THIS->GetSymbolAddress(arg1, arg2);
		OUTPUT:
		RETVAL


const char *
vtkDynamicLoader::LastError()
		CODE:
		RETVAL = THIS->LastError();
		OUTPUT:
		RETVAL


const char *
vtkDynamicLoader::LibExtension()
		CODE:
		RETVAL = THIS->LibExtension();
		OUTPUT:
		RETVAL


const char *
vtkDynamicLoader::LibPrefix()
		CODE:
		RETVAL = THIS->LibPrefix();
		OUTPUT:
		RETVAL


static vtkDynamicLoader*
vtkDynamicLoader::New()
		CODE:
		RETVAL = vtkDynamicLoader::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::DoubleArray PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkDoubleArray::Allocate(sz, ext)
		int 	sz
		int 	ext
		CODE:
		RETVAL = THIS->Allocate(sz, ext);
		OUTPUT:
		RETVAL


void
vtkDoubleArray::DeepCopy(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkDoubleArray::DeepCopy\n");



const char *
vtkDoubleArray::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkDoubleArray::GetDataType()
		CODE:
		RETVAL = THIS->GetDataType();
		OUTPUT:
		RETVAL


double
vtkDoubleArray::GetValue(id)
		int 	id
		CODE:
		RETVAL = THIS->GetValue(id);
		OUTPUT:
		RETVAL


void *
vtkDoubleArray::GetVoidPointer(id)
		int 	id
		CODE:
		RETVAL = THIS->GetVoidPointer(id);
		OUTPUT:
		RETVAL


void
vtkDoubleArray::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


int
vtkDoubleArray::InsertNextValue(f)
		double 	f
		CODE:
		RETVAL = THIS->InsertNextValue(f);
		OUTPUT:
		RETVAL


void
vtkDoubleArray::InsertValue(id, f)
		int 	id
		double 	f
		CODE:
		THIS->InsertValue(id, f);
		XSRETURN_EMPTY;


static vtkDoubleArray*
vtkDoubleArray::New()
		CODE:
		RETVAL = vtkDoubleArray::New();
		OUTPUT:
		RETVAL


void
vtkDoubleArray::SetNumberOfTuples(number)
		int 	number
		CODE:
		THIS->SetNumberOfTuples(number);
		XSRETURN_EMPTY;


void
vtkDoubleArray::SetNumberOfValues(number)
		int 	number
		CODE:
		THIS->SetNumberOfValues(number);
		XSRETURN_EMPTY;


void
vtkDoubleArray::SetValue(id, value)
		int 	id
		double 	value
		CODE:
		THIS->SetValue(id, value);
		XSRETURN_EMPTY;


void
vtkDoubleArray::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::EdgeTable PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkEdgeTable::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkEdgeTable::GetNextEdge(p1, p2)
		int 	p1
		int 	p2
		CODE:
		RETVAL = THIS->GetNextEdge(p1, p2);
		OUTPUT:
		p1
		p2
		RETVAL


int
vtkEdgeTable::GetNumberOfEdges()
		CODE:
		RETVAL = THIS->GetNumberOfEdges();
		OUTPUT:
		RETVAL


int
vtkEdgeTable::InitEdgeInsertion(numPoints, storeAttributes)
		int 	numPoints
		int 	storeAttributes
		CODE:
		RETVAL = THIS->InitEdgeInsertion(numPoints, storeAttributes);
		OUTPUT:
		RETVAL


int
vtkEdgeTable::InitPointInsertion(newPts, estSize)
		vtkPoints *	newPts
		int 	estSize
		CODE:
		RETVAL = THIS->InitPointInsertion(newPts, estSize);
		OUTPUT:
		RETVAL


void
vtkEdgeTable::InitTraversal()
		CODE:
		THIS->InitTraversal();
		XSRETURN_EMPTY;


void
vtkEdgeTable::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


int
vtkEdgeTable::InsertEdge(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->InsertEdge(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 3
		int 	arg1
		int 	arg2
		CODE:
		RETVAL = THIS->InsertEdge(arg1, arg2);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkEdgeTable::InsertEdge\n");



int
vtkEdgeTable::IsEdge(p1, p2)
		int 	p1
		int 	p2
		CODE:
		RETVAL = THIS->IsEdge(p1, p2);
		OUTPUT:
		RETVAL


static vtkEdgeTable*
vtkEdgeTable::New()
		CODE:
		RETVAL = vtkEdgeTable::New();
		OUTPUT:
		RETVAL


void
vtkEdgeTable::Reset()
		CODE:
		THIS->Reset();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::EmptyCell PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkEmptyCell::Clip(value, cellScalars, locator, pts, inPd, outPd, inCd, cellId, outCd, insideOut)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	pts
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		int 	insideOut
		CODE:
		THIS->Clip(value, cellScalars, locator, pts, inPd, outPd, inCd, cellId, outCd, insideOut);
		XSRETURN_EMPTY;


void
vtkEmptyCell::Contour(value, cellScalars, locator, verts1, lines, verts2, inPd, outPd, inCd, cellId, outCd)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	verts1
		vtkCellArray *	lines
		vtkCellArray *	verts2
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		CODE:
		THIS->Contour(value, cellScalars, locator, verts1, lines, verts2, inPd, outPd, inCd, cellId, outCd);
		XSRETURN_EMPTY;


int
vtkEmptyCell::GetCellDimension()
		CODE:
		RETVAL = THIS->GetCellDimension();
		OUTPUT:
		RETVAL


int
vtkEmptyCell::GetCellType()
		CODE:
		RETVAL = THIS->GetCellType();
		OUTPUT:
		RETVAL


const char *
vtkEmptyCell::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkCell *
vtkEmptyCell::GetEdge(arg1)
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetEdge(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkCell *
vtkEmptyCell::GetFace(arg1)
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetFace(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkEmptyCell::GetNumberOfEdges()
		CODE:
		RETVAL = THIS->GetNumberOfEdges();
		OUTPUT:
		RETVAL


int
vtkEmptyCell::GetNumberOfFaces()
		CODE:
		RETVAL = THIS->GetNumberOfFaces();
		OUTPUT:
		RETVAL


static vtkEmptyCell*
vtkEmptyCell::New()
		CODE:
		RETVAL = vtkEmptyCell::New();
		OUTPUT:
		RETVAL


int
vtkEmptyCell::Triangulate(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, * arg2, * arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkEmptyCell::Triangulate\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::ExtentTranslator PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkExtentTranslator::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int  *
vtkExtentTranslator::GetExtent()
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


int
vtkExtentTranslator::GetGhostLevel()
		CODE:
		RETVAL = THIS->GetGhostLevel();
		OUTPUT:
		RETVAL


int
vtkExtentTranslator::GetNumberOfPieces()
		CODE:
		RETVAL = THIS->GetNumberOfPieces();
		OUTPUT:
		RETVAL


int
vtkExtentTranslator::GetPiece()
		CODE:
		RETVAL = THIS->GetPiece();
		OUTPUT:
		RETVAL


int  *
vtkExtentTranslator::GetWholeExtent()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetWholeExtent();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


static vtkExtentTranslator*
vtkExtentTranslator::New()
		CODE:
		RETVAL = vtkExtentTranslator::New();
		OUTPUT:
		RETVAL


int
vtkExtentTranslator::PieceToExtent()
		CODE:
		RETVAL = THIS->PieceToExtent();
		OUTPUT:
		RETVAL


void
vtkExtentTranslator::SetExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int  	arg1
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
		croak("Unsupported number of args and/or types supplied to vtkExtentTranslator::SetExtent\n");



void
vtkExtentTranslator::SetGhostLevel(arg1)
		int 	arg1
		CODE:
		THIS->SetGhostLevel(arg1);
		XSRETURN_EMPTY;


void
vtkExtentTranslator::SetNumberOfPieces(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfPieces(arg1);
		XSRETURN_EMPTY;


void
vtkExtentTranslator::SetPiece(arg1)
		int 	arg1
		CODE:
		THIS->SetPiece(arg1);
		XSRETURN_EMPTY;


void
vtkExtentTranslator::SetWholeExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int  	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetWholeExtent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkExtentTranslator::SetWholeExtent\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::FieldData PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkFieldData::AddArray(arg1 = 0, arg2 = 0)
	CASE: items == 3
		vtkDataArray *	arg1
		char *	arg2
		CODE:
		RETVAL = THIS->AddArray(arg1, arg2);
		OUTPUT:
		RETVAL
	CASE: items == 2
		vtkDataArray *	arg1
		CODE:
		RETVAL = THIS->AddArray(arg1);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkFieldData::AddArray\n");



int
vtkFieldData::AddNoReplaceArray(array, name)
		vtkDataArray *	array
		char *	name
		CODE:
		RETVAL = THIS->AddNoReplaceArray(array, name);
		OUTPUT:
		RETVAL


int
vtkFieldData::AddReplaceArray(array, name)
		vtkDataArray *	array
		char *	name
		CODE:
		RETVAL = THIS->AddReplaceArray(array, name);
		OUTPUT:
		RETVAL


int
vtkFieldData::Allocate(sz, ext)
		int 	sz
		int 	ext
		CODE:
		RETVAL = THIS->Allocate(sz, ext);
		OUTPUT:
		RETVAL


void
vtkFieldData::DeepCopy(arg1 = 0)
	CASE: items == 2
		vtkFieldData *	arg1
		CODE:
		THIS->DeepCopy(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkFieldData::DeepCopy\n");



unsigned long
vtkFieldData::GetActualMemorySize()
		CODE:
		RETVAL = THIS->GetActualMemorySize();
		OUTPUT:
		RETVAL


vtkDataArray *
vtkFieldData::GetArray(arg1 = 0, arg2 = 0)
	CASE: items == 3
		char *	arg1
		int 	arg2
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataArray";
		CODE:
		RETVAL = THIS->GetArray(arg1, arg2);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		arg2
		RETVAL
	CASE: items == 2 && SvPOK(ST(1))
		char *	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataArray";
		CODE:
		RETVAL = THIS->GetArray(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE: items == 2 && SvIOK(ST(1))
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkDataArray";
		CODE:
		RETVAL = THIS->GetArray(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkFieldData::GetArray\n");



int
vtkFieldData::GetArrayContainingComponent(i, arrayComp)
		int 	i
		int 	arrayComp
		CODE:
		RETVAL = THIS->GetArrayContainingComponent(i, arrayComp);
		OUTPUT:
		arrayComp
		RETVAL


char *
vtkFieldData::GetArrayName(i)
		int 	i
		CODE:
		RETVAL = THIS->GetArrayName(i);
		OUTPUT:
		RETVAL


const char *
vtkFieldData::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkFieldData::GetComponent(i, j)
		int 	i
		int 	j
		CODE:
		RETVAL = THIS->GetComponent(i, j);
		OUTPUT:
		RETVAL


void
vtkFieldData::GetField(arg1 = 0, arg2 = 0)
	CASE: items == 3 && sv_isobject(ST(2)) && sv_derived_from(ST(2),"Graphics::VTK::FieldData")
		vtkIdList *	arg1
		vtkFieldData *	arg2
		CODE:
		THIS->GetField(arg1, arg2);
		XSRETURN_EMPTY;
	CASE: items == 3 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::IdList")
		vtkIdList *	arg1
		vtkFieldData *	arg2
		CODE:
		THIS->GetField(* arg1, * arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkFieldData::GetField\n");



int
vtkFieldData::GetNumberOfArrays()
		CODE:
		RETVAL = THIS->GetNumberOfArrays();
		OUTPUT:
		RETVAL


int
vtkFieldData::GetNumberOfComponents()
		CODE:
		RETVAL = THIS->GetNumberOfComponents();
		OUTPUT:
		RETVAL


int
vtkFieldData::GetNumberOfTuples()
		CODE:
		RETVAL = THIS->GetNumberOfTuples();
		OUTPUT:
		RETVAL


void
vtkFieldData::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


void
vtkFieldData::InsertComponent(i, j, c)
		int 	i
		int 	j
		float 	c
		CODE:
		THIS->InsertComponent(i, j, c);
		XSRETURN_EMPTY;


static vtkFieldData*
vtkFieldData::New()
		CODE:
		RETVAL = vtkFieldData::New();
		OUTPUT:
		RETVAL


void
vtkFieldData::Reset()
		CODE:
		THIS->Reset();
		XSRETURN_EMPTY;


void
vtkFieldData::SetArray(i, arg2)
		int 	i
		vtkDataArray *	arg2
		CODE:
		THIS->SetArray(i, arg2);
		XSRETURN_EMPTY;


void
vtkFieldData::SetArrayName(i, name)
		int 	i
		char *	name
		CODE:
		THIS->SetArrayName(i, name);
		XSRETURN_EMPTY;


void
vtkFieldData::SetComponent(i, j, c)
		int 	i
		int 	j
		float 	c
		CODE:
		THIS->SetComponent(i, j, c);
		XSRETURN_EMPTY;


void
vtkFieldData::SetNumberOfArrays(num)
		int 	num
		CODE:
		THIS->SetNumberOfArrays(num);
		XSRETURN_EMPTY;


void
vtkFieldData::SetNumberOfTuples(number)
		int 	number
		CODE:
		THIS->SetNumberOfTuples(number);
		XSRETURN_EMPTY;


void
vtkFieldData::ShallowCopy(arg1 = 0)
	CASE: items == 2
		vtkFieldData *	arg1
		CODE:
		THIS->ShallowCopy(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkFieldData::ShallowCopy\n");



void
vtkFieldData::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::FileOutputWindow PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkFileOutputWindow::AppendOff()
		CODE:
		THIS->AppendOff();
		XSRETURN_EMPTY;


void
vtkFileOutputWindow::AppendOn()
		CODE:
		THIS->AppendOn();
		XSRETURN_EMPTY;


void
vtkFileOutputWindow::DisplayText(arg1)
		char *	arg1
		CODE:
		THIS->DisplayText(arg1);
		XSRETURN_EMPTY;


void
vtkFileOutputWindow::FlushOff()
		CODE:
		THIS->FlushOff();
		XSRETURN_EMPTY;


void
vtkFileOutputWindow::FlushOn()
		CODE:
		THIS->FlushOn();
		XSRETURN_EMPTY;


int
vtkFileOutputWindow::GetAppend()
		CODE:
		RETVAL = THIS->GetAppend();
		OUTPUT:
		RETVAL


const char *
vtkFileOutputWindow::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


char *
vtkFileOutputWindow::GetFileName()
		CODE:
		RETVAL = THIS->GetFileName();
		OUTPUT:
		RETVAL


int
vtkFileOutputWindow::GetFlush()
		CODE:
		RETVAL = THIS->GetFlush();
		OUTPUT:
		RETVAL


static vtkFileOutputWindow*
vtkFileOutputWindow::New()
		CODE:
		RETVAL = vtkFileOutputWindow::New();
		OUTPUT:
		RETVAL


void
vtkFileOutputWindow::SetAppend(arg1)
		int 	arg1
		CODE:
		THIS->SetAppend(arg1);
		XSRETURN_EMPTY;


void
vtkFileOutputWindow::SetFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetFileName(arg1);
		XSRETURN_EMPTY;


void
vtkFileOutputWindow::SetFlush(arg1)
		int 	arg1
		CODE:
		THIS->SetFlush(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::FloatArray PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkFloatArray::Allocate(sz, ext)
		int 	sz
		int 	ext
		CODE:
		RETVAL = THIS->Allocate(sz, ext);
		OUTPUT:
		RETVAL


void
vtkFloatArray::DeepCopy(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkFloatArray::DeepCopy\n");



const char *
vtkFloatArray::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkFloatArray::GetComponent(i, j)
		int 	i
		int 	j
		CODE:
		RETVAL = THIS->GetComponent(i, j);
		OUTPUT:
		RETVAL


int
vtkFloatArray::GetDataType()
		CODE:
		RETVAL = THIS->GetDataType();
		OUTPUT:
		RETVAL


float
vtkFloatArray::GetValue(id)
		int 	id
		CODE:
		RETVAL = THIS->GetValue(id);
		OUTPUT:
		RETVAL


void *
vtkFloatArray::GetVoidPointer(id)
		int 	id
		CODE:
		RETVAL = THIS->GetVoidPointer(id);
		OUTPUT:
		RETVAL


void
vtkFloatArray::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


void
vtkFloatArray::InsertComponent(i, j, c)
		int 	i
		int 	j
		float 	c
		CODE:
		THIS->InsertComponent(i, j, c);
		XSRETURN_EMPTY;


int
vtkFloatArray::InsertNextValue(f)
		float 	f
		CODE:
		RETVAL = THIS->InsertNextValue(f);
		OUTPUT:
		RETVAL


void
vtkFloatArray::InsertValue(id, f)
		int 	id
		float 	f
		CODE:
		THIS->InsertValue(id, f);
		XSRETURN_EMPTY;


static vtkFloatArray*
vtkFloatArray::New()
		CODE:
		RETVAL = vtkFloatArray::New();
		OUTPUT:
		RETVAL


void
vtkFloatArray::SetComponent(i, j, c)
		int 	i
		int 	j
		float 	c
		CODE:
		THIS->SetComponent(i, j, c);
		XSRETURN_EMPTY;


void
vtkFloatArray::SetNumberOfTuples(number)
		int 	number
		CODE:
		THIS->SetNumberOfTuples(number);
		XSRETURN_EMPTY;


void
vtkFloatArray::SetNumberOfValues(number)
		int 	number
		CODE:
		THIS->SetNumberOfValues(number);
		XSRETURN_EMPTY;


void
vtkFloatArray::SetValue(id, value)
		int 	id
		float 	value
		CODE:
		THIS->SetValue(id, value);
		XSRETURN_EMPTY;


void
vtkFloatArray::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::FloatNormals PREFIX = vtk

PROTOTYPES: DISABLE



static vtkFloatNormals*
vtkFloatNormals::New()
	CASE: items == 1
		CODE:
		RETVAL = vtkFloatNormals::New();
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkFloatNormals::New\n");



void
vtkFloatNormals::SetData(arg1)
		vtkDataArray *	arg1
		CODE:
		THIS->SetData(arg1);
		XSRETURN_EMPTY;


void
vtkFloatNormals::SetDataType(dataType)
		int 	dataType
		CODE:
		THIS->SetDataType(dataType);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::FloatPoints PREFIX = vtk

PROTOTYPES: DISABLE



static vtkFloatPoints*
vtkFloatPoints::New()
	CASE: items == 1
		CODE:
		RETVAL = vtkFloatPoints::New();
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkFloatPoints::New\n");



void
vtkFloatPoints::SetData(arg1)
		vtkDataArray *	arg1
		CODE:
		THIS->SetData(arg1);
		XSRETURN_EMPTY;


void
vtkFloatPoints::SetDataType(dataType)
		int 	dataType
		CODE:
		THIS->SetDataType(dataType);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::FloatScalars PREFIX = vtk

PROTOTYPES: DISABLE



static vtkFloatScalars*
vtkFloatScalars::New()
	CASE: items == 1
		CODE:
		RETVAL = vtkFloatScalars::New();
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkFloatScalars::New\n");



void
vtkFloatScalars::SetData(arg1)
		vtkDataArray *	arg1
		CODE:
		THIS->SetData(arg1);
		XSRETURN_EMPTY;


void
vtkFloatScalars::SetDataType(dataType)
		int 	dataType
		CODE:
		THIS->SetDataType(dataType);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::FloatTCoords PREFIX = vtk

PROTOTYPES: DISABLE



static vtkFloatTCoords*
vtkFloatTCoords::New()
	CASE: items == 1
		CODE:
		RETVAL = vtkFloatTCoords::New();
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkFloatTCoords::New\n");



void
vtkFloatTCoords::SetData(arg1)
		vtkDataArray *	arg1
		CODE:
		THIS->SetData(arg1);
		XSRETURN_EMPTY;


void
vtkFloatTCoords::SetDataType(dataType)
		int 	dataType
		CODE:
		THIS->SetDataType(dataType);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::FloatTensors PREFIX = vtk

PROTOTYPES: DISABLE



static vtkFloatTensors*
vtkFloatTensors::New()
	CASE: items == 1
		CODE:
		RETVAL = vtkFloatTensors::New();
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkFloatTensors::New\n");



void
vtkFloatTensors::SetData(arg1)
		vtkDataArray *	arg1
		CODE:
		THIS->SetData(arg1);
		XSRETURN_EMPTY;


void
vtkFloatTensors::SetDataType(dataType)
		int 	dataType
		CODE:
		THIS->SetDataType(dataType);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::FloatVectors PREFIX = vtk

PROTOTYPES: DISABLE



static vtkFloatVectors*
vtkFloatVectors::New()
	CASE: items == 1
		CODE:
		RETVAL = vtkFloatVectors::New();
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkFloatVectors::New\n");



void
vtkFloatVectors::SetData(arg1)
		vtkDataArray *	arg1
		CODE:
		THIS->SetData(arg1);
		XSRETURN_EMPTY;


void
vtkFloatVectors::SetDataType(dataType)
		int 	dataType
		CODE:
		THIS->SetDataType(dataType);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::GeneralTransform PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkGeneralTransform::CircuitCheck(transform)
		vtkAbstractTransform *	transform
		CODE:
		RETVAL = THIS->CircuitCheck(transform);
		OUTPUT:
		RETVAL


void
vtkGeneralTransform::Concatenate(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::Matrix4x4")
		vtkMatrix4x4 *	arg1
		CODE:
		THIS->Concatenate(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::AbstractTransform")
		vtkAbstractTransform *	arg1
		CODE:
		THIS->Concatenate(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkGeneralTransform::Concatenate\n");



const char *
vtkGeneralTransform::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkAbstractTransform *
vtkGeneralTransform::GetInput()
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


unsigned long
vtkGeneralTransform::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


void
vtkGeneralTransform::Identity()
		CODE:
		THIS->Identity();
		XSRETURN_EMPTY;


void
vtkGeneralTransform::Inverse()
		CODE:
		THIS->Inverse();
		XSRETURN_EMPTY;


vtkAbstractTransform *
vtkGeneralTransform::MakeTransform()
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


static vtkGeneralTransform*
vtkGeneralTransform::New()
		CODE:
		RETVAL = vtkGeneralTransform::New();
		OUTPUT:
		RETVAL


void
vtkGeneralTransform::Pop()
		CODE:
		THIS->Pop();
		XSRETURN_EMPTY;


void
vtkGeneralTransform::PostMultiply()
		CODE:
		THIS->PostMultiply();
		XSRETURN_EMPTY;


void
vtkGeneralTransform::PreMultiply()
		CODE:
		THIS->PreMultiply();
		XSRETURN_EMPTY;


void
vtkGeneralTransform::Push()
		CODE:
		THIS->Push();
		XSRETURN_EMPTY;


void
vtkGeneralTransform::RotateWXYZ(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		double 	arg1
		double 	arg2
		double 	arg3
		double 	arg4
		CODE:
		THIS->RotateWXYZ(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkGeneralTransform::RotateWXYZ\n");



void
vtkGeneralTransform::RotateX(angle)
		double 	angle
		CODE:
		THIS->RotateX(angle);
		XSRETURN_EMPTY;


void
vtkGeneralTransform::RotateY(angle)
		double 	angle
		CODE:
		THIS->RotateY(angle);
		XSRETURN_EMPTY;


void
vtkGeneralTransform::RotateZ(angle)
		double 	angle
		CODE:
		THIS->RotateZ(angle);
		XSRETURN_EMPTY;


void
vtkGeneralTransform::Scale(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double 	arg1
		double 	arg2
		double 	arg3
		CODE:
		THIS->Scale(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkGeneralTransform::Scale\n");



void
vtkGeneralTransform::SetInput(input)
		vtkAbstractTransform *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;


void
vtkGeneralTransform::Translate(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double 	arg1
		double 	arg2
		double 	arg3
		CODE:
		THIS->Translate(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkGeneralTransform::Translate\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::GenericCell PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkGenericCell::Clip(value, cellScalars, locator, connectivity, inPd, outPd, inCd, cellId, outCd, insideOut)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	connectivity
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		int 	insideOut
		CODE:
		THIS->Clip(value, cellScalars, locator, connectivity, inPd, outPd, inCd, cellId, outCd, insideOut);
		XSRETURN_EMPTY;


void
vtkGenericCell::Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	verts
		vtkCellArray *	lines
		vtkCellArray *	polys
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		CODE:
		THIS->Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd);
		XSRETURN_EMPTY;


void
vtkGenericCell::DeepCopy(arg1 = 0)
	CASE: items == 2
		vtkCell *	arg1
		CODE:
		THIS->DeepCopy(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkGenericCell::DeepCopy\n");



int
vtkGenericCell::GetCellDimension()
		CODE:
		RETVAL = THIS->GetCellDimension();
		OUTPUT:
		RETVAL


int
vtkGenericCell::GetCellType()
		CODE:
		RETVAL = THIS->GetCellType();
		OUTPUT:
		RETVAL


const char *
vtkGenericCell::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkCell *
vtkGenericCell::GetEdge(edgeId)
		int 	edgeId
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetEdge(edgeId);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkCell *
vtkGenericCell::GetFace(faceId)
		int 	faceId
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetFace(faceId);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkGenericCell::GetInterpolationOrder()
		CODE:
		RETVAL = THIS->GetInterpolationOrder();
		OUTPUT:
		RETVAL


int
vtkGenericCell::GetNumberOfEdges()
		CODE:
		RETVAL = THIS->GetNumberOfEdges();
		OUTPUT:
		RETVAL


int
vtkGenericCell::GetNumberOfFaces()
		CODE:
		RETVAL = THIS->GetNumberOfFaces();
		OUTPUT:
		RETVAL


static vtkGenericCell*
vtkGenericCell::New()
		CODE:
		RETVAL = vtkGenericCell::New();
		OUTPUT:
		RETVAL


void
vtkGenericCell::SetCellType(cellType)
		int 	cellType
		CODE:
		THIS->SetCellType(cellType);
		XSRETURN_EMPTY;


void
vtkGenericCell::SetCellTypeToEmptyCell()
		CODE:
		THIS->SetCellTypeToEmptyCell();
		XSRETURN_EMPTY;


void
vtkGenericCell::SetCellTypeToHexahedron()
		CODE:
		THIS->SetCellTypeToHexahedron();
		XSRETURN_EMPTY;


void
vtkGenericCell::SetCellTypeToLine()
		CODE:
		THIS->SetCellTypeToLine();
		XSRETURN_EMPTY;


void
vtkGenericCell::SetCellTypeToPixel()
		CODE:
		THIS->SetCellTypeToPixel();
		XSRETURN_EMPTY;


void
vtkGenericCell::SetCellTypeToPolyLine()
		CODE:
		THIS->SetCellTypeToPolyLine();
		XSRETURN_EMPTY;


void
vtkGenericCell::SetCellTypeToPolyVertex()
		CODE:
		THIS->SetCellTypeToPolyVertex();
		XSRETURN_EMPTY;


void
vtkGenericCell::SetCellTypeToPolygon()
		CODE:
		THIS->SetCellTypeToPolygon();
		XSRETURN_EMPTY;


void
vtkGenericCell::SetCellTypeToQuad()
		CODE:
		THIS->SetCellTypeToQuad();
		XSRETURN_EMPTY;


void
vtkGenericCell::SetCellTypeToTetra()
		CODE:
		THIS->SetCellTypeToTetra();
		XSRETURN_EMPTY;


void
vtkGenericCell::SetCellTypeToTriangle()
		CODE:
		THIS->SetCellTypeToTriangle();
		XSRETURN_EMPTY;


void
vtkGenericCell::SetCellTypeToTriangleStrip()
		CODE:
		THIS->SetCellTypeToTriangleStrip();
		XSRETURN_EMPTY;


void
vtkGenericCell::SetCellTypeToVertex()
		CODE:
		THIS->SetCellTypeToVertex();
		XSRETURN_EMPTY;


void
vtkGenericCell::SetCellTypeToVoxel()
		CODE:
		THIS->SetCellTypeToVoxel();
		XSRETURN_EMPTY;


void
vtkGenericCell::SetCellTypeToWedge()
		CODE:
		THIS->SetCellTypeToWedge();
		XSRETURN_EMPTY;


void
vtkGenericCell::ShallowCopy(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::Cell")
		vtkCell *	arg1
		CODE:
		THIS->ShallowCopy(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::Cell")
		vtkCell *	arg1
		CODE:
		THIS->ShallowCopy(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkGenericCell::ShallowCopy\n");



int
vtkGenericCell::Triangulate(index, ptIds, pts)
		int 	index
		vtkIdList *	ptIds
		vtkPoints *	pts
		CODE:
		RETVAL = THIS->Triangulate(index, ptIds, pts);
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::GhostLevels PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkGhostLevels::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


unsigned char
vtkGhostLevels::GetGhostLevel(id)
		int 	id
		CODE:
		RETVAL = THIS->GetGhostLevel(id);
		OUTPUT:
		RETVAL


void
vtkGhostLevels::GetGhostLevels(ptId, fn)
		vtkIdList *	ptId
		vtkGhostLevels *	fn
		CODE:
		THIS->GetGhostLevels(ptId, fn);
		XSRETURN_EMPTY;


int
vtkGhostLevels::GetNumberOfGhostLevels()
		CODE:
		RETVAL = THIS->GetNumberOfGhostLevels();
		OUTPUT:
		RETVAL


void
vtkGhostLevels::InsertGhostLevel(id, lev)
		int 	id
		unsigned char 	lev
		CODE:
		THIS->InsertGhostLevel(id, lev);
		XSRETURN_EMPTY;


int
vtkGhostLevels::InsertNextGhostLevel(lev)
		unsigned char 	lev
		CODE:
		RETVAL = THIS->InsertNextGhostLevel(lev);
		OUTPUT:
		RETVAL


static vtkGhostLevels*
vtkGhostLevels::New()
		CODE:
		RETVAL = vtkGhostLevels::New();
		OUTPUT:
		RETVAL


void
vtkGhostLevels::SetGhostLevel(id, lev)
		int 	id
		unsigned char 	lev
		CODE:
		THIS->SetGhostLevel(id, lev);
		XSRETURN_EMPTY;


void
vtkGhostLevels::SetNumberOfGhostLevels(number)
		int 	number
		CODE:
		THIS->SetNumberOfGhostLevels(number);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Hexahedron PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkHexahedron::Clip(value, cellScalars, locator, tetras, inPd, outPd, inCd, cellId, outCd, insideOut)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	tetras
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		int 	insideOut
		CODE:
		THIS->Clip(value, cellScalars, locator, tetras, inPd, outPd, inCd, cellId, outCd, insideOut);
		XSRETURN_EMPTY;


void
vtkHexahedron::Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	verts
		vtkCellArray *	lines
		vtkCellArray *	polys
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		CODE:
		THIS->Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd);
		XSRETURN_EMPTY;


int
vtkHexahedron::GetCellDimension()
		CODE:
		RETVAL = THIS->GetCellDimension();
		OUTPUT:
		RETVAL


int
vtkHexahedron::GetCellType()
		CODE:
		RETVAL = THIS->GetCellType();
		OUTPUT:
		RETVAL


const char *
vtkHexahedron::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkCell *
vtkHexahedron::GetEdge(edgeId)
		int 	edgeId
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetEdge(edgeId);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkCell *
vtkHexahedron::GetFace(faceId)
		int 	faceId
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetFace(faceId);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkHexahedron::GetNumberOfEdges()
		CODE:
		RETVAL = THIS->GetNumberOfEdges();
		OUTPUT:
		RETVAL


int
vtkHexahedron::GetNumberOfFaces()
		CODE:
		RETVAL = THIS->GetNumberOfFaces();
		OUTPUT:
		RETVAL


static vtkHexahedron*
vtkHexahedron::New()
		CODE:
		RETVAL = vtkHexahedron::New();
		OUTPUT:
		RETVAL


int
vtkHexahedron::Triangulate(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, * arg2, * arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkHexahedron::Triangulate\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::IdentityTransform PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkIdentityTransform::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


void
vtkIdentityTransform::Inverse()
		CODE:
		THIS->Inverse();
		XSRETURN_EMPTY;


vtkAbstractTransform *
vtkIdentityTransform::MakeTransform()
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


static vtkIdentityTransform*
vtkIdentityTransform::New()
		CODE:
		RETVAL = vtkIdentityTransform::New();
		OUTPUT:
		RETVAL


void
vtkIdentityTransform::TransformNormals(inNms, outNms)
		vtkNormals *	inNms
		vtkNormals *	outNms
		CODE:
		THIS->TransformNormals(inNms, outNms);
		XSRETURN_EMPTY;


void
vtkIdentityTransform::TransformPoints(inPts, outPts)
		vtkPoints *	inPts
		vtkPoints *	outPts
		CODE:
		THIS->TransformPoints(inPts, outPts);
		XSRETURN_EMPTY;


void
vtkIdentityTransform::TransformPointsNormalsVectors(inPts, outPts, inNms, outNms, inVrs, outVrs)
		vtkPoints *	inPts
		vtkPoints *	outPts
		vtkNormals *	inNms
		vtkNormals *	outNms
		vtkVectors *	inVrs
		vtkVectors *	outVrs
		CODE:
		THIS->TransformPointsNormalsVectors(inPts, outPts, inNms, outNms, inVrs, outVrs);
		XSRETURN_EMPTY;


void
vtkIdentityTransform::TransformVectors(inVrs, outVrs)
		vtkVectors *	inVrs
		vtkVectors *	outVrs
		CODE:
		THIS->TransformVectors(inVrs, outVrs);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::IdList PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkIdList::Allocate(sz, strategy)
		int 	sz
		int 	strategy
		CODE:
		RETVAL = THIS->Allocate(sz, strategy);
		OUTPUT:
		RETVAL


void
vtkIdList::DeepCopy(ids)
		vtkIdList *	ids
		CODE:
		THIS->DeepCopy(ids);
		XSRETURN_EMPTY;


void
vtkIdList::DeleteId(id)
		int 	id
		CODE:
		THIS->DeleteId(id);
		XSRETURN_EMPTY;


const char *
vtkIdList::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkIdList::GetId(i)
		int 	i
		CODE:
		RETVAL = THIS->GetId(i);
		OUTPUT:
		RETVAL


int
vtkIdList::GetNumberOfIds()
		CODE:
		RETVAL = THIS->GetNumberOfIds();
		OUTPUT:
		RETVAL


void
vtkIdList::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


void
vtkIdList::InsertId(i, id)
		int 	i
		int 	id
		CODE:
		THIS->InsertId(i, id);
		XSRETURN_EMPTY;


int
vtkIdList::InsertNextId(id)
		int 	id
		CODE:
		RETVAL = THIS->InsertNextId(id);
		OUTPUT:
		RETVAL


int
vtkIdList::InsertUniqueId(id)
		int 	id
		CODE:
		RETVAL = THIS->InsertUniqueId(id);
		OUTPUT:
		RETVAL


void
vtkIdList::IntersectWith(otherIds)
		vtkIdList *	otherIds
		CODE:
		THIS->IntersectWith(*otherIds);
		XSRETURN_EMPTY;


int
vtkIdList::IsId(id)
		int 	id
		CODE:
		RETVAL = THIS->IsId(id);
		OUTPUT:
		RETVAL


static vtkIdList*
vtkIdList::New()
		CODE:
		RETVAL = vtkIdList::New();
		OUTPUT:
		RETVAL


void
vtkIdList::Reset()
		CODE:
		THIS->Reset();
		XSRETURN_EMPTY;


void
vtkIdList::SetId(i, id)
		int 	i
		int 	id
		CODE:
		THIS->SetId(i, id);
		XSRETURN_EMPTY;


void
vtkIdList::SetNumberOfIds(number)
		int 	number
		CODE:
		THIS->SetNumberOfIds(number);
		XSRETURN_EMPTY;


void
vtkIdList::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::ImageData PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImageData::AllocateScalars()
		CODE:
		THIS->AllocateScalars();
		XSRETURN_EMPTY;


void
vtkImageData::ComputeBounds()
		CODE:
		THIS->ComputeBounds();
		XSRETURN_EMPTY;


void
vtkImageData::CopyStructure(ds)
		vtkDataSet *	ds
		CODE:
		THIS->CopyStructure(ds);
		XSRETURN_EMPTY;


void
vtkImageData::CopyTypeSpecificInformation(image)
		vtkDataObject *	image
		CODE:
		THIS->CopyTypeSpecificInformation(image);
		XSRETURN_EMPTY;


void
vtkImageData::DeepCopy(src)
		vtkDataObject *	src
		CODE:
		THIS->DeepCopy(src);
		XSRETURN_EMPTY;


int
vtkImageData::FindPoint(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		RETVAL = THIS->FindPoint(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageData::FindPoint\n");



unsigned long
vtkImageData::GetActualMemorySize()
		CODE:
		RETVAL = THIS->GetActualMemorySize();
		OUTPUT:
		RETVAL


void
vtkImageData::GetAxisUpdateExtent(axis, min, max)
		int 	axis
		int 	min
		int 	max
		CODE:
		THIS->GetAxisUpdateExtent(axis, min, max);
		XSRETURN_EMPTY;
		OUTPUT:
		min
		max


vtkCell *
vtkImageData::GetCell(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		vtkGenericCell *	arg2
		CODE:
		THIS->GetCell(arg1, arg2);
		XSRETURN_EMPTY;
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetCell(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageData::GetCell\n");



void
vtkImageData::GetCellPoints(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		vtkIdList *	arg2
		CODE:
		THIS->GetCellPoints(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageData::GetCellPoints\n");



int
vtkImageData::GetCellType(cellId)
		int 	cellId
		CODE:
		RETVAL = THIS->GetCellType(cellId);
		OUTPUT:
		RETVAL


const char *
vtkImageData::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageData::GetDataDimension()
		CODE:
		RETVAL = THIS->GetDataDimension();
		OUTPUT:
		RETVAL


int
vtkImageData::GetDataObjectType()
		CODE:
		RETVAL = THIS->GetDataObjectType();
		OUTPUT:
		RETVAL


int *
vtkImageData::GetDimensions()
	CASE: items == 1
		PREINIT:
		int * retval;
		PPCODE:
		retval = THIS->GetDimensions();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


unsigned long
vtkImageData::GetEstimatedMemorySize()
		CODE:
		RETVAL = THIS->GetEstimatedMemorySize();
		OUTPUT:
		RETVAL


int  *
vtkImageData::GetExtent()
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


void
vtkImageData::GetIncrements(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->GetIncrements(arg1, arg2, arg3);
		XSRETURN_EMPTY;
		OUTPUT:
		arg1
		arg2
		arg3
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageData::GetIncrements\n");



int
vtkImageData::GetMaxCellSize()
		CODE:
		RETVAL = THIS->GetMaxCellSize();
		OUTPUT:
		RETVAL


int
vtkImageData::GetNumberOfCells()
		CODE:
		RETVAL = THIS->GetNumberOfCells();
		OUTPUT:
		RETVAL


int
vtkImageData::GetNumberOfPoints()
		CODE:
		RETVAL = THIS->GetNumberOfPoints();
		OUTPUT:
		RETVAL


int
vtkImageData::GetNumberOfScalarComponents()
		CODE:
		RETVAL = THIS->GetNumberOfScalarComponents();
		OUTPUT:
		RETVAL


float  *
vtkImageData::GetOrigin()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetOrigin();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


void
vtkImageData::GetPointCells(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		vtkIdList *	arg2
		CODE:
		THIS->GetPointCells(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageData::GetPointCells\n");



float
vtkImageData::GetScalarComponentAsFloat(x, y, z, component)
		int 	x
		int 	y
		int 	z
		int 	component
		CODE:
		RETVAL = THIS->GetScalarComponentAsFloat(x, y, z, component);
		OUTPUT:
		RETVAL


void *
vtkImageData::GetScalarPointer(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		RETVAL = THIS->GetScalarPointer(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE: items == 1
		CODE:
		RETVAL = THIS->GetScalarPointer();
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageData::GetScalarPointer\n");



int
vtkImageData::GetScalarSize()
		CODE:
		RETVAL = THIS->GetScalarSize();
		OUTPUT:
		RETVAL


int
vtkImageData::GetScalarType()
		CODE:
		RETVAL = THIS->GetScalarType();
		OUTPUT:
		RETVAL


double
vtkImageData::GetScalarTypeMax()
		CODE:
		RETVAL = THIS->GetScalarTypeMax();
		OUTPUT:
		RETVAL


double
vtkImageData::GetScalarTypeMin()
		CODE:
		RETVAL = THIS->GetScalarTypeMin();
		OUTPUT:
		RETVAL


float  *
vtkImageData::GetSpacing()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetSpacing();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


void
vtkImageData::GetVoxelGradient(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0)
	CASE: items == 6
		int 	arg1
		int 	arg2
		int 	arg3
		vtkScalars *	arg4
		vtkVectors *	arg5
		CODE:
		THIS->GetVoxelGradient(arg1, arg2, arg3, arg4, arg5);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageData::GetVoxelGradient\n");



vtkImageToStructuredPoints *
vtkImageData::MakeImageToStructuredPoints()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImageToStructuredPoints";
		CODE:
		RETVAL = THIS->MakeImageToStructuredPoints();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkImageData*
vtkImageData::New()
		CODE:
		RETVAL = vtkImageData::New();
		OUTPUT:
		RETVAL


void
vtkImageData::PrepareForNewData()
		CODE:
		THIS->PrepareForNewData();
		XSRETURN_EMPTY;


void
vtkImageData::SetAxisUpdateExtent(axis, min, max)
		int 	axis
		int 	min
		int 	max
		CODE:
		THIS->SetAxisUpdateExtent(axis, min, max);
		XSRETURN_EMPTY;


void
vtkImageData::SetDimensions(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetDimensions(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageData::SetDimensions\n");



void
vtkImageData::SetExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkImageData::SetExtent\n");



void
vtkImageData::SetNumberOfScalarComponents(n)
		int 	n
		CODE:
		THIS->SetNumberOfScalarComponents(n);
		XSRETURN_EMPTY;


void
vtkImageData::SetOrigin(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetOrigin(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageData::SetOrigin\n");



void
vtkImageData::SetScalarType(arg1)
		int 	arg1
		CODE:
		THIS->SetScalarType(arg1);
		XSRETURN_EMPTY;


void
vtkImageData::SetSpacing(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetSpacing(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageData::SetSpacing\n");



void
vtkImageData::SetUpdateExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int 	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetUpdateExtent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetUpdateExtent(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 3
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetUpdateExtent(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageData::SetUpdateExtent\n");



void
vtkImageData::ShallowCopy(src)
		vtkDataObject *	src
		CODE:
		THIS->ShallowCopy(src);
		XSRETURN_EMPTY;


vtkImageData *
vtkImageData::UpdateAndReturnData()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImageData";
		CODE:
		RETVAL = THIS->UpdateAndReturnData();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkImageData::UpdateData()
		CODE:
		THIS->UpdateData();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::ImageSource PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkImageData *
vtkImageSource::GetOutput(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImageData";
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
		char  CLASS[80] = "Graphics::VTK::vtkImageData";
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
		croak("Unsupported number of args and/or types supplied to vtkImageSource::GetOutput\n");



static vtkImageSource*
vtkImageSource::New()
		CODE:
		RETVAL = vtkImageSource::New();
		OUTPUT:
		RETVAL


void
vtkImageSource::PropagateUpdateExtent(output)
		vtkDataObject *	output
		CODE:
		THIS->PropagateUpdateExtent(output);
		XSRETURN_EMPTY;


void
vtkImageSource::SetOutput(output)
		vtkImageData *	output
		CODE:
		THIS->SetOutput(output);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::ImageToStructuredPoints PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageToStructuredPoints::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkImageData *
vtkImageToStructuredPoints::GetInput()
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


vtkStructuredPoints *
vtkImageToStructuredPoints::GetOutput(arg1 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkImageToStructuredPoints::GetOutput\n");



vtkImageData *
vtkImageToStructuredPoints::GetVectorInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImageData";
		CODE:
		RETVAL = THIS->GetVectorInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkImageToStructuredPoints*
vtkImageToStructuredPoints::New()
		CODE:
		RETVAL = vtkImageToStructuredPoints::New();
		OUTPUT:
		RETVAL


void
vtkImageToStructuredPoints::SetInput(input)
		vtkImageData *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;


void
vtkImageToStructuredPoints::SetVectorInput(input)
		vtkImageData *	input
		CODE:
		THIS->SetVectorInput(input);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::ImplicitFunctionCollection PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImplicitFunctionCollection::AddItem(arg1 = 0)
	CASE: items == 2
		vtkImplicitFunction *	arg1
		CODE:
		THIS->AddItem(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImplicitFunctionCollection::AddItem\n");



const char *
vtkImplicitFunctionCollection::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkImplicitFunction *
vtkImplicitFunctionCollection::GetNextItem()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImplicitFunction";
		CODE:
		RETVAL = THIS->GetNextItem();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkImplicitFunctionCollection*
vtkImplicitFunctionCollection::New()
		CODE:
		RETVAL = vtkImplicitFunctionCollection::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Indent PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkIndent::Delete()
		CODE:
		THIS->Delete();
		XSRETURN_EMPTY;


const char *
vtkIndent::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkIndent*
vtkIndent::New()
		CODE:
		RETVAL = vtkIndent::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::IntArray PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkIntArray::Allocate(sz, ext)
		int 	sz
		int 	ext
		CODE:
		RETVAL = THIS->Allocate(sz, ext);
		OUTPUT:
		RETVAL


void
vtkIntArray::DeepCopy(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkIntArray::DeepCopy\n");



const char *
vtkIntArray::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkIntArray::GetDataType()
		CODE:
		RETVAL = THIS->GetDataType();
		OUTPUT:
		RETVAL


int
vtkIntArray::GetValue(id)
		int 	id
		CODE:
		RETVAL = THIS->GetValue(id);
		OUTPUT:
		RETVAL


void *
vtkIntArray::GetVoidPointer(id)
		int 	id
		CODE:
		RETVAL = THIS->GetVoidPointer(id);
		OUTPUT:
		RETVAL


void
vtkIntArray::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


int
vtkIntArray::InsertNextValue(i)
		int 	i
		CODE:
		RETVAL = THIS->InsertNextValue(i);
		OUTPUT:
		RETVAL


void
vtkIntArray::InsertValue(id, i)
		int 	id
		int 	i
		CODE:
		THIS->InsertValue(id, i);
		XSRETURN_EMPTY;


static vtkIntArray*
vtkIntArray::New()
		CODE:
		RETVAL = vtkIntArray::New();
		OUTPUT:
		RETVAL


void
vtkIntArray::SetNumberOfTuples(number)
		int 	number
		CODE:
		THIS->SetNumberOfTuples(number);
		XSRETURN_EMPTY;


void
vtkIntArray::SetNumberOfValues(number)
		int 	number
		CODE:
		THIS->SetNumberOfValues(number);
		XSRETURN_EMPTY;


void
vtkIntArray::SetValue(id, value)
		int 	id
		int 	value
		CODE:
		THIS->SetValue(id, value);
		XSRETURN_EMPTY;


void
vtkIntArray::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Line PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkLine::Clip(value, cellScalars, locator, lines, inPd, outPd, inCd, cellId, outCd, insideOut)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	lines
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		int 	insideOut
		CODE:
		THIS->Clip(value, cellScalars, locator, lines, inPd, outPd, inCd, cellId, outCd, insideOut);
		XSRETURN_EMPTY;


void
vtkLine::Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	verts
		vtkCellArray *	lines
		vtkCellArray *	polys
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		CODE:
		THIS->Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd);
		XSRETURN_EMPTY;


int
vtkLine::GetCellDimension()
		CODE:
		RETVAL = THIS->GetCellDimension();
		OUTPUT:
		RETVAL


int
vtkLine::GetCellType()
		CODE:
		RETVAL = THIS->GetCellType();
		OUTPUT:
		RETVAL


const char *
vtkLine::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkCell *
vtkLine::GetEdge(arg1)
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetEdge(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkCell *
vtkLine::GetFace(arg1)
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetFace(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkLine::GetNumberOfEdges()
		CODE:
		RETVAL = THIS->GetNumberOfEdges();
		OUTPUT:
		RETVAL


int
vtkLine::GetNumberOfFaces()
		CODE:
		RETVAL = THIS->GetNumberOfFaces();
		OUTPUT:
		RETVAL


static vtkLine*
vtkLine::New()
		CODE:
		RETVAL = vtkLine::New();
		OUTPUT:
		RETVAL


int
vtkLine::Triangulate(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, * arg2, * arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLine::Triangulate\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::LogLookupTable PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkLogLookupTable::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkLogLookupTable*
vtkLogLookupTable::New()
		CODE:
		RETVAL = vtkLogLookupTable::New();
		OUTPUT:
		RETVAL


void
vtkLogLookupTable::SetTableRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float 	arg1
		float 	arg2
		CODE:
		THIS->SetTableRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLogLookupTable::SetTableRange\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::LongArray PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkLongArray::Allocate(sz, ext)
		int 	sz
		int 	ext
		CODE:
		RETVAL = THIS->Allocate(sz, ext);
		OUTPUT:
		RETVAL


void
vtkLongArray::DeepCopy(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLongArray::DeepCopy\n");



const char *
vtkLongArray::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkLongArray::GetDataType()
		CODE:
		RETVAL = THIS->GetDataType();
		OUTPUT:
		RETVAL


long
vtkLongArray::GetValue(id)
		int 	id
		CODE:
		RETVAL = THIS->GetValue(id);
		OUTPUT:
		RETVAL


void *
vtkLongArray::GetVoidPointer(id)
		int 	id
		CODE:
		RETVAL = THIS->GetVoidPointer(id);
		OUTPUT:
		RETVAL


void
vtkLongArray::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


int
vtkLongArray::InsertNextValue(arg1)
		long 	arg1
		CODE:
		RETVAL = THIS->InsertNextValue(arg1);
		OUTPUT:
		RETVAL


void
vtkLongArray::InsertValue(id, i)
		int 	id
		long 	i
		CODE:
		THIS->InsertValue(id, i);
		XSRETURN_EMPTY;


static vtkLongArray*
vtkLongArray::New()
		CODE:
		RETVAL = vtkLongArray::New();
		OUTPUT:
		RETVAL


void
vtkLongArray::SetNumberOfTuples(number)
		int 	number
		CODE:
		THIS->SetNumberOfTuples(number);
		XSRETURN_EMPTY;


void
vtkLongArray::SetNumberOfValues(number)
		int 	number
		CODE:
		THIS->SetNumberOfValues(number);
		XSRETURN_EMPTY;


void
vtkLongArray::SetValue(id, value)
		int 	id
		long 	value
		CODE:
		THIS->SetValue(id, value);
		XSRETURN_EMPTY;


void
vtkLongArray::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::LookupTable PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkLookupTable::Allocate(sz, ext)
		int 	sz
		int 	ext
		CODE:
		RETVAL = THIS->Allocate(sz, ext);
		OUTPUT:
		RETVAL


void
vtkLookupTable::Build()
		CODE:
		THIS->Build();
		XSRETURN_EMPTY;


float  *
vtkLookupTable::GetAlphaRange()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetAlphaRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


const char *
vtkLookupTable::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float *
vtkLookupTable::GetColor(arg1 = 0)
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


float  *
vtkLookupTable::GetHueRange()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetHueRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


int
vtkLookupTable::GetNumberOfColors()
		CODE:
		RETVAL = THIS->GetNumberOfColors();
		OUTPUT:
		RETVAL


float
vtkLookupTable::GetOpacity(v)
		float 	v
		CODE:
		RETVAL = THIS->GetOpacity(v);
		OUTPUT:
		RETVAL


float  *
vtkLookupTable::GetSaturationRange()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetSaturationRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


float  *
vtkLookupTable::GetTableRange()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetTableRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


float *
vtkLookupTable::GetTableValue(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetTableValue(arg1);
		EXTEND(SP, 4);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));


float  *
vtkLookupTable::GetValueRange()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetValueRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


static vtkLookupTable*
vtkLookupTable::New()
		CODE:
		RETVAL = vtkLookupTable::New();
		OUTPUT:
		RETVAL


void
vtkLookupTable::SetAlphaRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetAlphaRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLookupTable::SetAlphaRange\n");



void
vtkLookupTable::SetHueRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetHueRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLookupTable::SetHueRange\n");



void
vtkLookupTable::SetNumberOfColors(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfColors(arg1);
		XSRETURN_EMPTY;


void
vtkLookupTable::SetNumberOfTableValues(number)
		int 	number
		CODE:
		THIS->SetNumberOfTableValues(number);
		XSRETURN_EMPTY;


void
vtkLookupTable::SetRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float 	arg1
		float 	arg2
		CODE:
		THIS->SetRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLookupTable::SetRange\n");



void
vtkLookupTable::SetSaturationRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetSaturationRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLookupTable::SetSaturationRange\n");



void
vtkLookupTable::SetTableRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float 	arg1
		float 	arg2
		CODE:
		THIS->SetTableRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLookupTable::SetTableRange\n");



void
vtkLookupTable::SetTableValue(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0)
	CASE: items == 6
		int 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		CODE:
		THIS->SetTableValue(arg1, arg2, arg3, arg4, arg5);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLookupTable::SetTableValue\n");



void
vtkLookupTable::SetValueRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetValueRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkLookupTable::SetValueRange\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Mapper2D PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkMapper2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkMapper2D*
vtkMapper2D::New()
		CODE:
		RETVAL = vtkMapper2D::New();
		OUTPUT:
		RETVAL


void
vtkMapper2D::RenderOpaqueGeometry(arg1, arg2)
		vtkViewport *	arg1
		vtkActor2D *	arg2
		CODE:
		THIS->RenderOpaqueGeometry(arg1, arg2);
		XSRETURN_EMPTY;


void
vtkMapper2D::RenderOverlay(arg1, arg2)
		vtkViewport *	arg1
		vtkActor2D *	arg2
		CODE:
		THIS->RenderOverlay(arg1, arg2);
		XSRETURN_EMPTY;


void
vtkMapper2D::RenderTranslucentGeometry(arg1, arg2)
		vtkViewport *	arg1
		vtkActor2D *	arg2
		CODE:
		THIS->RenderTranslucentGeometry(arg1, arg2);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Math PREFIX = vtk

PROTOTYPES: DISABLE



float
vtkMath::DegreesToRadians()
		CODE:
		RETVAL = THIS->DegreesToRadians();
		OUTPUT:
		RETVAL


double
vtkMath::Determinant2x2(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		double 	arg1
		double 	arg2
		double 	arg3
		double 	arg4
		CODE:
		RETVAL = THIS->Determinant2x2(arg1, arg2, arg3, arg4);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkMath::Determinant2x2\n");



double
vtkMath::Determinant3x3(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0, arg7 = 0, arg8 = 0, arg9 = 0)
	CASE: items == 10
		double 	arg1
		double 	arg2
		double 	arg3
		double 	arg4
		double 	arg5
		double 	arg6
		double 	arg7
		double 	arg8
		double 	arg9
		CODE:
		RETVAL = THIS->Determinant3x3(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkMath::Determinant3x3\n");



double
vtkMath::DoubleDegreesToRadians()
		CODE:
		RETVAL = THIS->DoubleDegreesToRadians();
		OUTPUT:
		RETVAL


const char *
vtkMath::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkMath*
vtkMath::New()
		CODE:
		RETVAL = vtkMath::New();
		OUTPUT:
		RETVAL


float
vtkMath::Pi()
		CODE:
		RETVAL = THIS->Pi();
		OUTPUT:
		RETVAL


float
vtkMath::Random(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float 	arg1
		float 	arg2
		CODE:
		RETVAL = THIS->Random(arg1, arg2);
		OUTPUT:
		RETVAL
	CASE: items == 1
		CODE:
		RETVAL = THIS->Random();
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkMath::Random\n");



void
vtkMath::RandomSeed(s)
		long 	s
		CODE:
		THIS->RandomSeed(s);
		XSRETURN_EMPTY;


double *
vtkMath::SolveCubic(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		double 	arg1
		double 	arg2
		double 	arg3
		double 	arg4
		PREINIT:
		double * retval;
		PPCODE:
		retval = THIS->SolveCubic(arg1, arg2, arg3, arg4);
		EXTEND(SP, 4);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));


double *
vtkMath::SolveQuadratic(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double 	arg1
		double 	arg2
		double 	arg3
		PREINIT:
		double * retval;
		PPCODE:
		retval = THIS->SolveQuadratic(arg1, arg2, arg3);
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Matrix4x4 PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkMatrix4x4::Adjoint(in, out)
		vtkMatrix4x4 *	in
		vtkMatrix4x4 *	out
		CODE:
		THIS->Adjoint(in, out);
		XSRETURN_EMPTY;


void
vtkMatrix4x4::DeepCopy(arg1 = 0)
	CASE: items == 2
		vtkMatrix4x4 *	arg1
		CODE:
		THIS->DeepCopy(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkMatrix4x4::DeepCopy\n");



double
vtkMatrix4x4::Determinant()
		CODE:
		RETVAL = THIS->Determinant();
		OUTPUT:
		RETVAL


const char *
vtkMatrix4x4::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


void
vtkMatrix4x4::Identity()
		CODE:
		THIS->Identity();
		XSRETURN_EMPTY;


void
vtkMatrix4x4::Invert(arg1 = 0, arg2 = 0)
	CASE: items == 3
		vtkMatrix4x4 *	arg1
		vtkMatrix4x4 *	arg2
		CODE:
		THIS->Invert(arg1, arg2);
		XSRETURN_EMPTY;
	CASE: items == 1
		CODE:
		THIS->Invert();
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkMatrix4x4::Invert\n");



void
vtkMatrix4x4::Multiply4x4(a, b, c)
		vtkMatrix4x4 *	a
		vtkMatrix4x4 *	b
		vtkMatrix4x4 *	c
		CODE:
		THIS->Multiply4x4(a, b, c);
		XSRETURN_EMPTY;


void
vtkMatrix4x4::SetElement(i, j, value)
		int 	i
		int 	j
		double 	value
		CODE:
		THIS->SetElement(i, j, value);
		XSRETURN_EMPTY;


void
vtkMatrix4x4::Transpose(arg1 = 0, arg2 = 0)
	CASE: items == 3
		vtkMatrix4x4 *	arg1
		vtkMatrix4x4 *	arg2
		CODE:
		THIS->Transpose(arg1, arg2);
		XSRETURN_EMPTY;
	CASE: items == 1
		CODE:
		THIS->Transpose();
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkMatrix4x4::Transpose\n");



void
vtkMatrix4x4::Zero()
		CODE:
		THIS->Zero();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::MatrixToHomogeneousTransform PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkMatrixToHomogeneousTransform::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkMatrix4x4 *
vtkMatrixToHomogeneousTransform::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkMatrix4x4";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkMatrixToHomogeneousTransform::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


void
vtkMatrixToHomogeneousTransform::Inverse()
		CODE:
		THIS->Inverse();
		XSRETURN_EMPTY;


vtkAbstractTransform *
vtkMatrixToHomogeneousTransform::MakeTransform()
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


static vtkMatrixToHomogeneousTransform*
vtkMatrixToHomogeneousTransform::New()
		CODE:
		RETVAL = vtkMatrixToHomogeneousTransform::New();
		OUTPUT:
		RETVAL


void
vtkMatrixToHomogeneousTransform::SetInput(arg1)
		vtkMatrix4x4 *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;


void
vtkMatrixToHomogeneousTransform::SetMatrix(matrix)
		vtkMatrix4x4 *	matrix
		CODE:
		THIS->SetMatrix(matrix);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::MatrixToLinearTransform PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkMatrixToLinearTransform::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkMatrix4x4 *
vtkMatrixToLinearTransform::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkMatrix4x4";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkMatrixToLinearTransform::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


void
vtkMatrixToLinearTransform::Inverse()
		CODE:
		THIS->Inverse();
		XSRETURN_EMPTY;


vtkAbstractTransform *
vtkMatrixToLinearTransform::MakeTransform()
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


static vtkMatrixToLinearTransform*
vtkMatrixToLinearTransform::New()
		CODE:
		RETVAL = vtkMatrixToLinearTransform::New();
		OUTPUT:
		RETVAL


void
vtkMatrixToLinearTransform::SetInput(arg1)
		vtkMatrix4x4 *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;


void
vtkMatrixToLinearTransform::SetMatrix(matrix)
		vtkMatrix4x4 *	matrix
		CODE:
		THIS->SetMatrix(matrix);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::MergePoints2D PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkMergePoints2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkMergePoints2D*
vtkMergePoints2D::New()
		CODE:
		RETVAL = vtkMergePoints2D::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::MultiThreader PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkMultiThreader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkMultiThreader::GetGlobalDefaultNumberOfThreads()
		CODE:
		RETVAL = THIS->GetGlobalDefaultNumberOfThreads();
		OUTPUT:
		RETVAL


int
vtkMultiThreader::GetGlobalMaximumNumberOfThreads()
		CODE:
		RETVAL = THIS->GetGlobalMaximumNumberOfThreads();
		OUTPUT:
		RETVAL


int
vtkMultiThreader::GetNumberOfThreads()
		CODE:
		RETVAL = THIS->GetNumberOfThreads();
		OUTPUT:
		RETVAL


static vtkMultiThreader*
vtkMultiThreader::New()
		CODE:
		RETVAL = vtkMultiThreader::New();
		OUTPUT:
		RETVAL


void
vtkMultiThreader::SetGlobalDefaultNumberOfThreads(val)
		int 	val
		CODE:
		THIS->SetGlobalDefaultNumberOfThreads(val);
		XSRETURN_EMPTY;


void
vtkMultiThreader::SetGlobalMaximumNumberOfThreads(val)
		int 	val
		CODE:
		THIS->SetGlobalMaximumNumberOfThreads(val);
		XSRETURN_EMPTY;


void
vtkMultiThreader::SetNumberOfThreads(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfThreads(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::MutexLock PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkMutexLock::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


void
vtkMutexLock::Lock()
		CODE:
		THIS->Lock();
		XSRETURN_EMPTY;


static vtkMutexLock*
vtkMutexLock::New()
		CODE:
		RETVAL = vtkMutexLock::New();
		OUTPUT:
		RETVAL


void
vtkMutexLock::Unlock()
		CODE:
		THIS->Unlock();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Normals PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkNormals::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float *
vtkNormals::GetNormal(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetNormal(arg1);
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


void
vtkNormals::GetNormals(arg1 = 0, arg2 = 0)
	CASE: items == 3 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::IdList")
		vtkIdList *	arg1
		vtkNormals *	arg2
		CODE:
		THIS->GetNormals(* arg1, * arg2);
		XSRETURN_EMPTY;
	CASE: items == 3 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::IdList")
		vtkIdList *	arg1
		vtkNormals *	arg2
		CODE:
		THIS->GetNormals(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkNormals::GetNormals\n");



int
vtkNormals::GetNumberOfNormals()
		CODE:
		RETVAL = THIS->GetNumberOfNormals();
		OUTPUT:
		RETVAL


int
vtkNormals::InsertNextNormal(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double 	arg1
		double 	arg2
		double 	arg3
		CODE:
		RETVAL = THIS->InsertNextNormal(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkNormals::InsertNextNormal\n");



void
vtkNormals::InsertNormal(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		int 	arg1
		double 	arg2
		double 	arg3
		double 	arg4
		CODE:
		THIS->InsertNormal(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkNormals::InsertNormal\n");



static vtkNormals*
vtkNormals::New(arg1 = 0)
	CASE: items == 2
		int 	arg1
		CODE:
		RETVAL = vtkNormals::New(arg1);
		OUTPUT:
		RETVAL
	CASE: items == 1
		CODE:
		RETVAL = vtkNormals::New();
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkNormals::New\n");



void
vtkNormals::SetNormal(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		int 	arg1
		double 	arg2
		double 	arg3
		double 	arg4
		CODE:
		THIS->SetNormal(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkNormals::SetNormal\n");



void
vtkNormals::SetNumberOfNormals(number)
		int 	number
		CODE:
		THIS->SetNumberOfNormals(number);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Object PREFIX = vtk

PROTOTYPES: DISABLE

char *
vtkObject::Print()
		CODE:
		ostrstream ostrm;
		THIS->Print(ostrm);
		RETVAL = ostrm.str();
		OUTPUT:
		RETVAL
		


void
vtkObject::BreakOnError()
		CODE:
		THIS->BreakOnError();
		XSRETURN_EMPTY;


void
vtkObject::DebugOff()
		CODE:
		THIS->DebugOff();
		XSRETURN_EMPTY;


void
vtkObject::DebugOn()
		CODE:
		THIS->DebugOn();
		XSRETURN_EMPTY;


void
vtkObject::Delete()
		CODE:
		THIS->Delete();
		XSRETURN_EMPTY;


const char *
vtkObject::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


unsigned char
vtkObject::GetDebug()
		CODE:
		RETVAL = THIS->GetDebug();
		OUTPUT:
		RETVAL


int
vtkObject::GetGlobalWarningDisplay()
		CODE:
		RETVAL = THIS->GetGlobalWarningDisplay();
		OUTPUT:
		RETVAL


unsigned long
vtkObject::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


int
vtkObject::GetReferenceCount()
		CODE:
		RETVAL = THIS->GetReferenceCount();
		OUTPUT:
		RETVAL


void
vtkObject::GlobalWarningDisplayOff()
		CODE:
		THIS->GlobalWarningDisplayOff();
		XSRETURN_EMPTY;


void
vtkObject::GlobalWarningDisplayOn()
		CODE:
		THIS->GlobalWarningDisplayOn();
		XSRETURN_EMPTY;


int
vtkObject::HasObserver(arg1 = 0)
	CASE: items == 2 && SvPOK(ST(1))
		char *	arg1
		CODE:
		RETVAL = THIS->HasObserver(arg1);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkObject::HasObserver\n");



int
vtkObject::IsTypeOf(name)
		char *	name
		CODE:
		RETVAL = THIS->IsTypeOf(name);
		OUTPUT:
		RETVAL


void
vtkObject::Modified()
		CODE:
		THIS->Modified();
		XSRETURN_EMPTY;


static vtkObject*
vtkObject::New()
		CODE:
		RETVAL = vtkObject::New();
		OUTPUT:
		RETVAL


void
vtkObject::Register(o)
		vtkObject *	o
		CODE:
		THIS->Register(o);
		XSRETURN_EMPTY;


void
vtkObject::RemoveObserver(tag)
		unsigned long 	tag
		CODE:
		THIS->RemoveObserver(tag);
		XSRETURN_EMPTY;


vtkObject *
vtkObject::SafeDownCast(o)
		vtkObject *	o
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkObject";
		CODE:
		RETVAL = THIS->SafeDownCast(o);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkObject::SetDebug(debugFlag)
		unsigned char 	debugFlag
		CODE:
		THIS->SetDebug(debugFlag);
		XSRETURN_EMPTY;


void
vtkObject::SetGlobalWarningDisplay(val)
		int 	val
		CODE:
		THIS->SetGlobalWarningDisplay(val);
		XSRETURN_EMPTY;


void
vtkObject::SetReferenceCount(arg1)
		int 	arg1
		CODE:
		THIS->SetReferenceCount(arg1);
		XSRETURN_EMPTY;


void
vtkObject::UnRegister(o)
		vtkObject *	o
		CODE:
		THIS->UnRegister(o);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::OutputWindow PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkOutputWindow::DisplayText(arg1)
		char *	arg1
		CODE:
		THIS->DisplayText(arg1);
		XSRETURN_EMPTY;


const char *
vtkOutputWindow::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkOutputWindow *
vtkOutputWindow::GetInstance()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkOutputWindow";
		CODE:
		RETVAL = THIS->GetInstance();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkOutputWindow*
vtkOutputWindow::New()
		CODE:
		RETVAL = vtkOutputWindow::New();
		OUTPUT:
		RETVAL


void
vtkOutputWindow::PromptUserOff()
		CODE:
		THIS->PromptUserOff();
		XSRETURN_EMPTY;


void
vtkOutputWindow::PromptUserOn()
		CODE:
		THIS->PromptUserOn();
		XSRETURN_EMPTY;


void
vtkOutputWindow::SetInstance(instance)
		vtkOutputWindow *	instance
		CODE:
		THIS->SetInstance(instance);
		XSRETURN_EMPTY;


void
vtkOutputWindow::SetPromptUser(arg1)
		int 	arg1
		CODE:
		THIS->SetPromptUser(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::PerspectiveTransform PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkPerspectiveTransform::AdjustViewport(oldXMin, oldXMax, oldYMin, oldYMax, newXMin, newXMax, newYMin, newYMax)
		double 	oldXMin
		double 	oldXMax
		double 	oldYMin
		double 	oldYMax
		double 	newXMin
		double 	newXMax
		double 	newYMin
		double 	newYMax
		CODE:
		THIS->AdjustViewport(oldXMin, oldXMax, oldYMin, oldYMax, newXMin, newXMax, newYMin, newYMax);
		XSRETURN_EMPTY;


void
vtkPerspectiveTransform::AdjustZBuffer(oldNearZ, oldFarZ, newNearZ, newFarZ)
		double 	oldNearZ
		double 	oldFarZ
		double 	newNearZ
		double 	newFarZ
		CODE:
		THIS->AdjustZBuffer(oldNearZ, oldFarZ, newNearZ, newFarZ);
		XSRETURN_EMPTY;


int
vtkPerspectiveTransform::CircuitCheck(transform)
		vtkAbstractTransform *	transform
		CODE:
		RETVAL = THIS->CircuitCheck(transform);
		OUTPUT:
		RETVAL


void
vtkPerspectiveTransform::Concatenate(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::Matrix4x4")
		vtkMatrix4x4 *	arg1
		CODE:
		THIS->Concatenate(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::HomogeneousTransform")
		vtkHomogeneousTransform *	arg1
		CODE:
		THIS->Concatenate(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPerspectiveTransform::Concatenate\n");



void
vtkPerspectiveTransform::Frustum(xmin, xmax, ymin, ymax, znear, zfar)
		double 	xmin
		double 	xmax
		double 	ymin
		double 	ymax
		double 	znear
		double 	zfar
		CODE:
		THIS->Frustum(xmin, xmax, ymin, ymax, znear, zfar);
		XSRETURN_EMPTY;


const char *
vtkPerspectiveTransform::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkHomogeneousTransform *
vtkPerspectiveTransform::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkHomogeneousTransform";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkPerspectiveTransform::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


void
vtkPerspectiveTransform::Identity()
		CODE:
		THIS->Identity();
		XSRETURN_EMPTY;


void
vtkPerspectiveTransform::Inverse()
		CODE:
		THIS->Inverse();
		XSRETURN_EMPTY;


vtkAbstractTransform *
vtkPerspectiveTransform::MakeTransform()
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


static vtkPerspectiveTransform*
vtkPerspectiveTransform::New()
		CODE:
		RETVAL = vtkPerspectiveTransform::New();
		OUTPUT:
		RETVAL


void
vtkPerspectiveTransform::Ortho(xmin, xmax, ymin, ymax, znear, zfar)
		double 	xmin
		double 	xmax
		double 	ymin
		double 	ymax
		double 	znear
		double 	zfar
		CODE:
		THIS->Ortho(xmin, xmax, ymin, ymax, znear, zfar);
		XSRETURN_EMPTY;


void
vtkPerspectiveTransform::Perspective(angle, aspect, znear, zfar)
		double 	angle
		double 	aspect
		double 	znear
		double 	zfar
		CODE:
		THIS->Perspective(angle, aspect, znear, zfar);
		XSRETURN_EMPTY;


void
vtkPerspectiveTransform::Pop()
		CODE:
		THIS->Pop();
		XSRETURN_EMPTY;


void
vtkPerspectiveTransform::PostMultiply()
		CODE:
		THIS->PostMultiply();
		XSRETURN_EMPTY;


void
vtkPerspectiveTransform::PreMultiply()
		CODE:
		THIS->PreMultiply();
		XSRETURN_EMPTY;


void
vtkPerspectiveTransform::Push()
		CODE:
		THIS->Push();
		XSRETURN_EMPTY;


void
vtkPerspectiveTransform::RotateWXYZ(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		double 	arg1
		double 	arg2
		double 	arg3
		double 	arg4
		CODE:
		THIS->RotateWXYZ(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPerspectiveTransform::RotateWXYZ\n");



void
vtkPerspectiveTransform::RotateX(angle)
		double 	angle
		CODE:
		THIS->RotateX(angle);
		XSRETURN_EMPTY;


void
vtkPerspectiveTransform::RotateY(angle)
		double 	angle
		CODE:
		THIS->RotateY(angle);
		XSRETURN_EMPTY;


void
vtkPerspectiveTransform::RotateZ(angle)
		double 	angle
		CODE:
		THIS->RotateZ(angle);
		XSRETURN_EMPTY;


void
vtkPerspectiveTransform::Scale(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double 	arg1
		double 	arg2
		double 	arg3
		CODE:
		THIS->Scale(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPerspectiveTransform::Scale\n");



void
vtkPerspectiveTransform::SetInput(input)
		vtkHomogeneousTransform *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;


void
vtkPerspectiveTransform::SetMatrix(arg1 = 0)
	CASE: items == 2
		vtkMatrix4x4 *	arg1
		CODE:
		THIS->SetMatrix(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPerspectiveTransform::SetMatrix\n");



void
vtkPerspectiveTransform::Shear(dxdz, dydz, zplane)
		double 	dxdz
		double 	dydz
		double 	zplane
		CODE:
		THIS->Shear(dxdz, dydz, zplane);
		XSRETURN_EMPTY;


void
vtkPerspectiveTransform::Stereo(angle, focaldistance)
		double 	angle
		double 	focaldistance
		CODE:
		THIS->Stereo(angle, focaldistance);
		XSRETURN_EMPTY;


void
vtkPerspectiveTransform::Translate(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double 	arg1
		double 	arg2
		double 	arg3
		CODE:
		THIS->Translate(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPerspectiveTransform::Translate\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Pixel PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkPixel::Clip(value, cellScalars, locator, polys, inPd, outPd, inCd, cellId, outCd, insideOut)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	polys
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		int 	insideOut
		CODE:
		THIS->Clip(value, cellScalars, locator, polys, inPd, outPd, inCd, cellId, outCd, insideOut);
		XSRETURN_EMPTY;


void
vtkPixel::Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	verts
		vtkCellArray *	lines
		vtkCellArray *	polys
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		CODE:
		THIS->Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd);
		XSRETURN_EMPTY;


int
vtkPixel::GetCellDimension()
		CODE:
		RETVAL = THIS->GetCellDimension();
		OUTPUT:
		RETVAL


int
vtkPixel::GetCellType()
		CODE:
		RETVAL = THIS->GetCellType();
		OUTPUT:
		RETVAL


const char *
vtkPixel::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkCell *
vtkPixel::GetEdge(edgeId)
		int 	edgeId
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetEdge(edgeId);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkCell *
vtkPixel::GetFace(arg1)
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetFace(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkPixel::GetNumberOfEdges()
		CODE:
		RETVAL = THIS->GetNumberOfEdges();
		OUTPUT:
		RETVAL


int
vtkPixel::GetNumberOfFaces()
		CODE:
		RETVAL = THIS->GetNumberOfFaces();
		OUTPUT:
		RETVAL


static vtkPixel*
vtkPixel::New()
		CODE:
		RETVAL = vtkPixel::New();
		OUTPUT:
		RETVAL


int
vtkPixel::Triangulate(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, * arg2, * arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPixel::Triangulate\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Plane PREFIX = vtk

PROTOTYPES: DISABLE



float
vtkPlane::EvaluateFunction(arg1 = 0, arg2 = 0, arg3 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkPlane::EvaluateFunction\n");



const char *
vtkPlane::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkPlane::GetNormal()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetNormal();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkPlane::GetOrigin()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetOrigin();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


static vtkPlane*
vtkPlane::New()
		CODE:
		RETVAL = vtkPlane::New();
		OUTPUT:
		RETVAL


void
vtkPlane::SetNormal(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetNormal(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPlane::SetNormal\n");



void
vtkPlane::SetOrigin(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetOrigin(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPlane::SetOrigin\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::PlaneCollection PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkPlaneCollection::AddItem(arg1 = 0)
	CASE: items == 2
		vtkPlane *	arg1
		CODE:
		THIS->AddItem(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPlaneCollection::AddItem\n");



const char *
vtkPlaneCollection::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkPlane *
vtkPlaneCollection::GetNextItem()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPlane";
		CODE:
		RETVAL = THIS->GetNextItem();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkPlaneCollection*
vtkPlaneCollection::New()
		CODE:
		RETVAL = vtkPlaneCollection::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::PointData PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkPointData::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkPointData*
vtkPointData::New()
		CODE:
		RETVAL = vtkPointData::New();
		OUTPUT:
		RETVAL


void
vtkPointData::NullPoint(ptId)
		int 	ptId
		CODE:
		THIS->NullPoint(ptId);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::PointLocator PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkPointLocator::BuildLocator()
		CODE:
		THIS->BuildLocator();
		XSRETURN_EMPTY;


void
vtkPointLocator::FindClosestNPoints(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0)
	CASE: items == 6
		int 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		vtkIdList *	arg5
		CODE:
		THIS->FindClosestNPoints(arg1, arg2, arg3, arg4, arg5);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPointLocator::FindClosestNPoints\n");



int
vtkPointLocator::FindClosestPoint(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		RETVAL = THIS->FindClosestPoint(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPointLocator::FindClosestPoint\n");



void
vtkPointLocator::FindDistributedPoints(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		vtkIdList *	arg5
		int 	arg6
		CODE:
		THIS->FindDistributedPoints(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPointLocator::FindDistributedPoints\n");



void
vtkPointLocator::FindPointsWithinRadius(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0)
	CASE: items == 6
		float 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		vtkIdList *	arg5
		CODE:
		THIS->FindPointsWithinRadius(arg1, arg2, arg3, arg4, arg5);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPointLocator::FindPointsWithinRadius\n");



void
vtkPointLocator::FreeSearchStructure()
		CODE:
		THIS->FreeSearchStructure();
		XSRETURN_EMPTY;


void
vtkPointLocator::GenerateRepresentation(level, pd)
		int 	level
		vtkPolyData *	pd
		CODE:
		THIS->GenerateRepresentation(level, pd);
		XSRETURN_EMPTY;


const char *
vtkPointLocator::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int  *
vtkPointLocator::GetDivisions()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetDivisions();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkPointLocator::GetNumberOfPointsPerBucket()
		CODE:
		RETVAL = THIS->GetNumberOfPointsPerBucket();
		OUTPUT:
		RETVAL


void
vtkPointLocator::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


int
vtkPointLocator::IsInsertedPoint(arg1 = 0, arg2 = 0, arg3 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkPointLocator::IsInsertedPoint\n");



static vtkPointLocator*
vtkPointLocator::New()
		CODE:
		RETVAL = vtkPointLocator::New();
		OUTPUT:
		RETVAL


void
vtkPointLocator::SetDivisions(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int  	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetDivisions(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPointLocator::SetDivisions\n");



void
vtkPointLocator::SetNumberOfPointsPerBucket(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfPointsPerBucket(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::PointLocator2D PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkPointLocator2D::BuildLocator()
		CODE:
		THIS->BuildLocator();
		XSRETURN_EMPTY;


void
vtkPointLocator2D::FindClosestNPoints(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		int 	arg1
		float 	arg2
		float 	arg3
		vtkIdList *	arg4
		CODE:
		THIS->FindClosestNPoints(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPointLocator2D::FindClosestNPoints\n");



void
vtkPointLocator2D::FindDistributedPoints(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0)
	CASE: items == 6
		int 	arg1
		float 	arg2
		float 	arg3
		vtkIdList *	arg4
		int 	arg5
		CODE:
		THIS->FindDistributedPoints(arg1, arg2, arg3, arg4, arg5);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPointLocator2D::FindDistributedPoints\n");



void
vtkPointLocator2D::FindPointsWithinRadius(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		float 	arg1
		float 	arg2
		float 	arg3
		vtkIdList *	arg4
		CODE:
		THIS->FindPointsWithinRadius(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPointLocator2D::FindPointsWithinRadius\n");



void
vtkPointLocator2D::FreeSearchStructure()
		CODE:
		THIS->FreeSearchStructure();
		XSRETURN_EMPTY;


void
vtkPointLocator2D::GenerateRepresentation(level, pd)
		int 	level
		vtkPolyData *	pd
		CODE:
		THIS->GenerateRepresentation(level, pd);
		XSRETURN_EMPTY;


const char *
vtkPointLocator2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int  *
vtkPointLocator2D::GetDivisions()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetDivisions();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


int
vtkPointLocator2D::GetNumberOfPointsPerBucket()
		CODE:
		RETVAL = THIS->GetNumberOfPointsPerBucket();
		OUTPUT:
		RETVAL


vtkPoints *
vtkPointLocator2D::GetPoints()
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


void
vtkPointLocator2D::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


static vtkPointLocator2D*
vtkPointLocator2D::New()
		CODE:
		RETVAL = vtkPointLocator2D::New();
		OUTPUT:
		RETVAL


void
vtkPointLocator2D::SetDivisions(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int  	arg1
		int 	arg2
		CODE:
		THIS->SetDivisions(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPointLocator2D::SetDivisions\n");



void
vtkPointLocator2D::SetNumberOfPointsPerBucket(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfPointsPerBucket(arg1);
		XSRETURN_EMPTY;


void
vtkPointLocator2D::SetPoints(arg1)
		vtkPoints *	arg1
		CODE:
		THIS->SetPoints(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Points PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkPoints::ComputeBounds()
		CODE:
		THIS->ComputeBounds();
		XSRETURN_EMPTY;


float *
vtkPoints::GetBounds()
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
vtkPoints::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkPoints::GetNumberOfPoints()
		CODE:
		RETVAL = THIS->GetNumberOfPoints();
		OUTPUT:
		RETVAL


float *
vtkPoints::GetPoint(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetPoint(arg1);
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


void
vtkPoints::GetPoints(arg1 = 0, arg2 = 0)
	CASE: items == 3 && sv_isobject(ST(2)) && sv_derived_from(ST(2),"Graphics::VTK::Points")
		vtkIdList *	arg1
		vtkPoints *	arg2
		CODE:
		THIS->GetPoints(* arg1, * arg2);
		XSRETURN_EMPTY;
	CASE: items == 3 && sv_isobject(ST(2)) && sv_derived_from(ST(2),"Graphics::VTK::Points")
		vtkIdList *	arg1
		vtkPoints *	arg2
		CODE:
		THIS->GetPoints(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPoints::GetPoints\n");



int
vtkPoints::InsertNextPoint(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double 	arg1
		double 	arg2
		double 	arg3
		CODE:
		RETVAL = THIS->InsertNextPoint(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPoints::InsertNextPoint\n");



void
vtkPoints::InsertPoint(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		int 	arg1
		double 	arg2
		double 	arg3
		double 	arg4
		CODE:
		THIS->InsertPoint(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPoints::InsertPoint\n");



static vtkPoints*
vtkPoints::New()
		CODE:
		RETVAL = vtkPoints::New();
		OUTPUT:
		RETVAL


void
vtkPoints::SetNumberOfPoints(number)
		int 	number
		CODE:
		THIS->SetNumberOfPoints(number);
		XSRETURN_EMPTY;


void
vtkPoints::SetPoint(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		int 	arg1
		double 	arg2
		double 	arg3
		double 	arg4
		CODE:
		THIS->SetPoint(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPoints::SetPoint\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::PolyData PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkPolyData::AddCellReference(cellId)
		int 	cellId
		CODE:
		THIS->AddCellReference(cellId);
		XSRETURN_EMPTY;


void
vtkPolyData::AddReferenceToCell(ptId, cellId)
		int 	ptId
		int 	cellId
		CODE:
		THIS->AddReferenceToCell(ptId, cellId);
		XSRETURN_EMPTY;


void
vtkPolyData::Allocate(numCells, extSize)
		int 	numCells
		int 	extSize
		CODE:
		THIS->Allocate(numCells, extSize);
		XSRETURN_EMPTY;


void
vtkPolyData::BuildCells()
		CODE:
		THIS->BuildCells();
		XSRETURN_EMPTY;


void
vtkPolyData::BuildLinks()
		CODE:
		THIS->BuildLinks();
		XSRETURN_EMPTY;


void
vtkPolyData::ComputeBounds()
		CODE:
		THIS->ComputeBounds();
		XSRETURN_EMPTY;


void
vtkPolyData::CopyCells(pd, idList, locatorNULL)
		vtkPolyData *	pd
		vtkIdList *	idList
		vtkPointLocator *	locatorNULL
		CODE:
		THIS->CopyCells(pd, idList, locatorNULL);
		XSRETURN_EMPTY;


void
vtkPolyData::CopyStructure(ds)
		vtkDataSet *	ds
		CODE:
		THIS->CopyStructure(ds);
		XSRETURN_EMPTY;


void
vtkPolyData::DeepCopy(src)
		vtkDataObject *	src
		CODE:
		THIS->DeepCopy(src);
		XSRETURN_EMPTY;


void
vtkPolyData::DeleteCell(cellId)
		int 	cellId
		CODE:
		THIS->DeleteCell(cellId);
		XSRETURN_EMPTY;


void
vtkPolyData::DeleteCells()
		CODE:
		THIS->DeleteCells();
		XSRETURN_EMPTY;


void
vtkPolyData::DeleteLinks()
		CODE:
		THIS->DeleteLinks();
		XSRETURN_EMPTY;


void
vtkPolyData::DeletePoint(ptId)
		int 	ptId
		CODE:
		THIS->DeletePoint(ptId);
		XSRETURN_EMPTY;


unsigned long
vtkPolyData::GetActualMemorySize()
		CODE:
		RETVAL = THIS->GetActualMemorySize();
		OUTPUT:
		RETVAL


vtkCell *
vtkPolyData::GetCell(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		vtkGenericCell *	arg2
		CODE:
		THIS->GetCell(arg1, arg2);
		XSRETURN_EMPTY;
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetCell(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPolyData::GetCell\n");



void
vtkPolyData::GetCellEdgeNeighbors(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5 && sv_isobject(ST(4)) && sv_derived_from(ST(4),"Graphics::VTK::IdList")
		int 	arg1
		int 	arg2
		int 	arg3
		vtkIdList *	arg4
		CODE:
		THIS->GetCellEdgeNeighbors(arg1, arg2, arg3, * arg4);
		XSRETURN_EMPTY;
	CASE: items == 5 && sv_isobject(ST(4)) && sv_derived_from(ST(4),"Graphics::VTK::IdList")
		int 	arg1
		int 	arg2
		int 	arg3
		vtkIdList *	arg4
		CODE:
		THIS->GetCellEdgeNeighbors(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPolyData::GetCellEdgeNeighbors\n");



void
vtkPolyData::GetCellNeighbors(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		vtkIdList *	arg2
		vtkIdList *	arg3
		CODE:
		THIS->GetCellNeighbors(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPolyData::GetCellNeighbors\n");



void
vtkPolyData::GetCellPoints(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		vtkIdList *	arg2
		CODE:
		THIS->GetCellPoints(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPolyData::GetCellPoints\n");



int
vtkPolyData::GetCellType(cellId)
		int 	cellId
		CODE:
		RETVAL = THIS->GetCellType(cellId);
		OUTPUT:
		RETVAL


const char *
vtkPolyData::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkPolyData::GetDataObjectType()
		CODE:
		RETVAL = THIS->GetDataObjectType();
		OUTPUT:
		RETVAL


int
vtkPolyData::GetGhostLevel()
		CODE:
		RETVAL = THIS->GetGhostLevel();
		OUTPUT:
		RETVAL


vtkCellArray *
vtkPolyData::GetLines()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCellArray";
		CODE:
		RETVAL = THIS->GetLines();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkPolyData::GetMaxCellSize()
		CODE:
		RETVAL = THIS->GetMaxCellSize();
		OUTPUT:
		RETVAL


int
vtkPolyData::GetNumberOfCells()
		CODE:
		RETVAL = THIS->GetNumberOfCells();
		OUTPUT:
		RETVAL


int
vtkPolyData::GetNumberOfLines()
		CODE:
		RETVAL = THIS->GetNumberOfLines();
		OUTPUT:
		RETVAL


int
vtkPolyData::GetNumberOfPieces()
		CODE:
		RETVAL = THIS->GetNumberOfPieces();
		OUTPUT:
		RETVAL


int
vtkPolyData::GetNumberOfPolys()
		CODE:
		RETVAL = THIS->GetNumberOfPolys();
		OUTPUT:
		RETVAL


int
vtkPolyData::GetNumberOfStrips()
		CODE:
		RETVAL = THIS->GetNumberOfStrips();
		OUTPUT:
		RETVAL


int
vtkPolyData::GetNumberOfVerts()
		CODE:
		RETVAL = THIS->GetNumberOfVerts();
		OUTPUT:
		RETVAL


int
vtkPolyData::GetPiece()
		CODE:
		RETVAL = THIS->GetPiece();
		OUTPUT:
		RETVAL


void
vtkPolyData::GetPointCells(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		vtkIdList *	arg2
		CODE:
		THIS->GetPointCells(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPolyData::GetPointCells\n");



vtkCellArray *
vtkPolyData::GetPolys()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCellArray";
		CODE:
		RETVAL = THIS->GetPolys();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkCellArray *
vtkPolyData::GetStrips()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCellArray";
		CODE:
		RETVAL = THIS->GetStrips();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int  *
vtkPolyData::GetUpdateExtent(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->GetUpdateExtent(arg1, arg2, arg3);
		XSRETURN_EMPTY;
		OUTPUT:
		arg1
		arg2
		arg3
	CASE: items == 1
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetUpdateExtent();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


vtkCellArray *
vtkPolyData::GetVerts()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCellArray";
		CODE:
		RETVAL = THIS->GetVerts();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkPolyData::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


int
vtkPolyData::InsertNextCell(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		vtkIdList *	arg2
		CODE:
		RETVAL = THIS->InsertNextCell(arg1, arg2);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPolyData::InsertNextCell\n");



int
vtkPolyData::IsEdge(v1, v2)
		int 	v1
		int 	v2
		CODE:
		RETVAL = THIS->IsEdge(v1, v2);
		OUTPUT:
		RETVAL


int
vtkPolyData::IsPointUsedByCell(ptId, cellId)
		int 	ptId
		int 	cellId
		CODE:
		RETVAL = THIS->IsPointUsedByCell(ptId, cellId);
		OUTPUT:
		RETVAL


int
vtkPolyData::IsTriangle(v1, v2, v3)
		int 	v1
		int 	v2
		int 	v3
		CODE:
		RETVAL = THIS->IsTriangle(v1, v2, v3);
		OUTPUT:
		RETVAL


static vtkPolyData*
vtkPolyData::New()
		CODE:
		RETVAL = vtkPolyData::New();
		OUTPUT:
		RETVAL


void
vtkPolyData::RemoveCellReference(cellId)
		int 	cellId
		CODE:
		THIS->RemoveCellReference(cellId);
		XSRETURN_EMPTY;


void
vtkPolyData::RemoveReferenceToCell(ptId, cellId)
		int 	ptId
		int 	cellId
		CODE:
		THIS->RemoveReferenceToCell(ptId, cellId);
		XSRETURN_EMPTY;


void
vtkPolyData::ReplaceCellPoint(cellId, oldPtId, newPtId)
		int 	cellId
		int 	oldPtId
		int 	newPtId
		CODE:
		THIS->ReplaceCellPoint(cellId, oldPtId, newPtId);
		XSRETURN_EMPTY;


void
vtkPolyData::Reset()
		CODE:
		THIS->Reset();
		XSRETURN_EMPTY;


void
vtkPolyData::ResizeCellList(ptId, size)
		int 	ptId
		int 	size
		CODE:
		THIS->ResizeCellList(ptId, size);
		XSRETURN_EMPTY;


void
vtkPolyData::ReverseCell(cellId)
		int 	cellId
		CODE:
		THIS->ReverseCell(cellId);
		XSRETURN_EMPTY;


void
vtkPolyData::SetLines(l)
		vtkCellArray *	l
		CODE:
		THIS->SetLines(l);
		XSRETURN_EMPTY;


void
vtkPolyData::SetPolys(p)
		vtkCellArray *	p
		CODE:
		THIS->SetPolys(p);
		XSRETURN_EMPTY;


void
vtkPolyData::SetStrips(s)
		vtkCellArray *	s
		CODE:
		THIS->SetStrips(s);
		XSRETURN_EMPTY;


void
vtkPolyData::SetUpdateExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int 	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetUpdateExtent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetUpdateExtent(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 3
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetUpdateExtent(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPolyData::SetUpdateExtent\n");



void
vtkPolyData::SetVerts(v)
		vtkCellArray *	v
		CODE:
		THIS->SetVerts(v);
		XSRETURN_EMPTY;


void
vtkPolyData::ShallowCopy(src)
		vtkDataObject *	src
		CODE:
		THIS->ShallowCopy(src);
		XSRETURN_EMPTY;


void
vtkPolyData::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::PolyDataSource PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkPolyDataSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkPolyData *
vtkPolyDataSource::GetOutput(arg1 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkPolyDataSource::GetOutput\n");



static vtkPolyDataSource*
vtkPolyDataSource::New()
		CODE:
		RETVAL = vtkPolyDataSource::New();
		OUTPUT:
		RETVAL


void
vtkPolyDataSource::SetOutput(output)
		vtkPolyData *	output
		CODE:
		THIS->SetOutput(output);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::PolyLine PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkPolyLine::Clip(value, cellScalars, locator, lines, inPd, outPd, inCd, cellId, outCd, insideOut)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	lines
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		int 	insideOut
		CODE:
		THIS->Clip(value, cellScalars, locator, lines, inPd, outPd, inCd, cellId, outCd, insideOut);
		XSRETURN_EMPTY;


void
vtkPolyLine::Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	verts
		vtkCellArray *	lines
		vtkCellArray *	polys
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		CODE:
		THIS->Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd);
		XSRETURN_EMPTY;


int
vtkPolyLine::GenerateSlidingNormals(arg1, arg2, arg3)
		vtkPoints *	arg1
		vtkCellArray *	arg2
		vtkNormals *	arg3
		CODE:
		RETVAL = THIS->GenerateSlidingNormals(arg1, arg2, arg3);
		OUTPUT:
		RETVAL


int
vtkPolyLine::GetCellDimension()
		CODE:
		RETVAL = THIS->GetCellDimension();
		OUTPUT:
		RETVAL


int
vtkPolyLine::GetCellType()
		CODE:
		RETVAL = THIS->GetCellType();
		OUTPUT:
		RETVAL


const char *
vtkPolyLine::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkCell *
vtkPolyLine::GetEdge(arg1)
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetEdge(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkCell *
vtkPolyLine::GetFace(arg1)
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetFace(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkPolyLine::GetNumberOfEdges()
		CODE:
		RETVAL = THIS->GetNumberOfEdges();
		OUTPUT:
		RETVAL


int
vtkPolyLine::GetNumberOfFaces()
		CODE:
		RETVAL = THIS->GetNumberOfFaces();
		OUTPUT:
		RETVAL


static vtkPolyLine*
vtkPolyLine::New()
		CODE:
		RETVAL = vtkPolyLine::New();
		OUTPUT:
		RETVAL


int
vtkPolyLine::Triangulate(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, * arg2, * arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPolyLine::Triangulate\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::PolyVertex PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkPolyVertex::Clip(value, cellScalars, locator, verts, inPd, outPd, inCd, cellId, outCd, insideOut)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	verts
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		int 	insideOut
		CODE:
		THIS->Clip(value, cellScalars, locator, verts, inPd, outPd, inCd, cellId, outCd, insideOut);
		XSRETURN_EMPTY;


void
vtkPolyVertex::Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	verts
		vtkCellArray *	lines
		vtkCellArray *	polys
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		CODE:
		THIS->Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd);
		XSRETURN_EMPTY;


int
vtkPolyVertex::GetCellDimension()
		CODE:
		RETVAL = THIS->GetCellDimension();
		OUTPUT:
		RETVAL


int
vtkPolyVertex::GetCellType()
		CODE:
		RETVAL = THIS->GetCellType();
		OUTPUT:
		RETVAL


const char *
vtkPolyVertex::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkCell *
vtkPolyVertex::GetEdge(arg1)
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetEdge(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkCell *
vtkPolyVertex::GetFace(arg1)
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetFace(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkPolyVertex::GetNumberOfEdges()
		CODE:
		RETVAL = THIS->GetNumberOfEdges();
		OUTPUT:
		RETVAL


int
vtkPolyVertex::GetNumberOfFaces()
		CODE:
		RETVAL = THIS->GetNumberOfFaces();
		OUTPUT:
		RETVAL


static vtkPolyVertex*
vtkPolyVertex::New()
		CODE:
		RETVAL = vtkPolyVertex::New();
		OUTPUT:
		RETVAL


int
vtkPolyVertex::Triangulate(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, * arg2, * arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPolyVertex::Triangulate\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Polygon PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkPolygon::Clip(value, cellScalars, locator, tris, inPd, outPd, inCd, cellId, outCd, insideOut)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	tris
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		int 	insideOut
		CODE:
		THIS->Clip(value, cellScalars, locator, tris, inPd, outPd, inCd, cellId, outCd, insideOut);
		XSRETURN_EMPTY;


void
vtkPolygon::Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	verts
		vtkCellArray *	lines
		vtkCellArray *	polys
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		CODE:
		THIS->Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd);
		XSRETURN_EMPTY;


int
vtkPolygon::GetCellDimension()
		CODE:
		RETVAL = THIS->GetCellDimension();
		OUTPUT:
		RETVAL


int
vtkPolygon::GetCellType()
		CODE:
		RETVAL = THIS->GetCellType();
		OUTPUT:
		RETVAL


const char *
vtkPolygon::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkCell *
vtkPolygon::GetEdge(edgeId)
		int 	edgeId
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetEdge(edgeId);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkCell *
vtkPolygon::GetFace(arg1)
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetFace(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkPolygon::GetNumberOfEdges()
		CODE:
		RETVAL = THIS->GetNumberOfEdges();
		OUTPUT:
		RETVAL


int
vtkPolygon::GetNumberOfFaces()
		CODE:
		RETVAL = THIS->GetNumberOfFaces();
		OUTPUT:
		RETVAL


static vtkPolygon*
vtkPolygon::New()
		CODE:
		RETVAL = vtkPolygon::New();
		OUTPUT:
		RETVAL


int
vtkPolygon::Triangulate(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::IdList")
		vtkIdList *	arg1
		CODE:
		RETVAL = THIS->Triangulate(arg1);
		OUTPUT:
		RETVAL
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::IdList")
		vtkIdList *	arg1
		CODE:
		RETVAL = THIS->Triangulate(* arg1);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPolygon::Triangulate\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::PriorityQueue PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkPriorityQueue::Allocate(sz, ext)
		int 	sz
		int 	ext
		CODE:
		THIS->Allocate(sz, ext);
		XSRETURN_EMPTY;


float
vtkPriorityQueue::DeleteId(id)
		int 	id
		CODE:
		RETVAL = THIS->DeleteId(id);
		OUTPUT:
		RETVAL


const char *
vtkPriorityQueue::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkPriorityQueue::GetNumberOfItems()
		CODE:
		RETVAL = THIS->GetNumberOfItems();
		OUTPUT:
		RETVAL


float
vtkPriorityQueue::GetPriority(id)
		int 	id
		CODE:
		RETVAL = THIS->GetPriority(id);
		OUTPUT:
		RETVAL


void
vtkPriorityQueue::Insert(priority, id)
		float 	priority
		int 	id
		CODE:
		THIS->Insert(priority, id);
		XSRETURN_EMPTY;


static vtkPriorityQueue*
vtkPriorityQueue::New()
		CODE:
		RETVAL = vtkPriorityQueue::New();
		OUTPUT:
		RETVAL


int
vtkPriorityQueue::Peek(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float 	arg1
		int 	arg2
		CODE:
		RETVAL = THIS->Peek(arg1, arg2);
		OUTPUT:
		arg1
		RETVAL
	CASE: items == 2
		int 	arg1
		CODE:
		RETVAL = THIS->Peek(arg1);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPriorityQueue::Peek\n");



int
vtkPriorityQueue::Pop(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float 	arg1
		int 	arg2
		CODE:
		RETVAL = THIS->Pop(arg1, arg2);
		OUTPUT:
		arg1
		RETVAL
	CASE: items == 2
		int 	arg1
		CODE:
		RETVAL = THIS->Pop(arg1);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPriorityQueue::Pop\n");



void
vtkPriorityQueue::Reset()
		CODE:
		THIS->Reset();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::ProcessObject PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkProcessObject::AbortExecuteOff()
		CODE:
		THIS->AbortExecuteOff();
		XSRETURN_EMPTY;


void
vtkProcessObject::AbortExecuteOn()
		CODE:
		THIS->AbortExecuteOn();
		XSRETURN_EMPTY;


int
vtkProcessObject::GetAbortExecute()
		CODE:
		RETVAL = THIS->GetAbortExecute();
		OUTPUT:
		RETVAL


const char *
vtkProcessObject::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkProcessObject::GetNumberOfInputs()
		CODE:
		RETVAL = THIS->GetNumberOfInputs();
		OUTPUT:
		RETVAL


float
vtkProcessObject::GetProgress()
		CODE:
		RETVAL = THIS->GetProgress();
		OUTPUT:
		RETVAL


char *
vtkProcessObject::GetProgressText()
		CODE:
		RETVAL = THIS->GetProgressText();
		OUTPUT:
		RETVAL


static vtkProcessObject*
vtkProcessObject::New()
		CODE:
		RETVAL = vtkProcessObject::New();
		OUTPUT:
		RETVAL


void
vtkProcessObject::RemoveAllInputs()
		CODE:
		THIS->RemoveAllInputs();
		XSRETURN_EMPTY;


void
vtkProcessObject::SetAbortExecute(arg1)
		int 	arg1
		CODE:
		THIS->SetAbortExecute(arg1);
		XSRETURN_EMPTY;


void
vtkProcessObject::SetEndMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetEndMethod",0), newRV(func), 0);
		}
		THIS->SetEndMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkProcessObject::SetProgress(arg1)
		float 	arg1
		CODE:
		THIS->SetProgress(arg1);
		XSRETURN_EMPTY;


void
vtkProcessObject::SetProgressMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetProgressMethod",0), newRV(func), 0);
		}
		THIS->SetProgressMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkProcessObject::SetProgressText(arg1)
		char *	arg1
		CODE:
		THIS->SetProgressText(arg1);
		XSRETURN_EMPTY;


void
vtkProcessObject::SetStartMethod(func)
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
		    hv_store_ent(HashEntry, newSVpv("SetStartMethod",0), newRV(func), 0);
		}
		THIS->SetStartMethod(callperlsub, func);
		XSRETURN_EMPTY;


void
vtkProcessObject::SqueezeInputArray()
		CODE:
		THIS->SqueezeInputArray();
		XSRETURN_EMPTY;


void
vtkProcessObject::UpdateProgress(amount)
		float 	amount
		CODE:
		THIS->UpdateProgress(amount);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Prop PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkProp::DragableOff()
		CODE:
		THIS->DragableOff();
		XSRETURN_EMPTY;


void
vtkProp::DragableOn()
		CODE:
		THIS->DragableOn();
		XSRETURN_EMPTY;


void
vtkProp::GetActors(arg1)
		vtkPropCollection *	arg1
		CODE:
		THIS->GetActors(arg1);
		XSRETURN_EMPTY;


void
vtkProp::GetActors2D(arg1)
		vtkPropCollection *	arg1
		CODE:
		THIS->GetActors2D(arg1);
		XSRETURN_EMPTY;


const char *
vtkProp::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkProp::GetDragable()
		CODE:
		RETVAL = THIS->GetDragable();
		OUTPUT:
		RETVAL


vtkMatrix4x4 *
vtkProp::GetMatrix()
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


vtkMatrix4x4 *
vtkProp::GetMatrixPointer()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkMatrix4x4";
		CODE:
		RETVAL = THIS->GetMatrixPointer();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkAssemblyPath *
vtkProp::GetNextPath()
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
vtkProp::GetNumberOfPaths()
		CODE:
		RETVAL = THIS->GetNumberOfPaths();
		OUTPUT:
		RETVAL


int
vtkProp::GetPickable()
		CODE:
		RETVAL = THIS->GetPickable();
		OUTPUT:
		RETVAL


unsigned long
vtkProp::GetRedrawMTime()
		CODE:
		RETVAL = THIS->GetRedrawMTime();
		OUTPUT:
		RETVAL


int
vtkProp::GetVisibility()
		CODE:
		RETVAL = THIS->GetVisibility();
		OUTPUT:
		RETVAL


void
vtkProp::GetVolumes(arg1)
		vtkPropCollection *	arg1
		CODE:
		THIS->GetVolumes(arg1);
		XSRETURN_EMPTY;


void
vtkProp::InitPathTraversal()
		CODE:
		THIS->InitPathTraversal();
		XSRETURN_EMPTY;


static vtkProp*
vtkProp::New()
		CODE:
		RETVAL = vtkProp::New();
		OUTPUT:
		RETVAL


void
vtkProp::Pick()
		CODE:
		THIS->Pick();
		XSRETURN_EMPTY;


void
vtkProp::PickableOff()
		CODE:
		THIS->PickableOff();
		XSRETURN_EMPTY;


void
vtkProp::PickableOn()
		CODE:
		THIS->PickableOn();
		XSRETURN_EMPTY;


void
vtkProp::PokeMatrix(arg1)
		vtkMatrix4x4 *	arg1
		CODE:
		THIS->PokeMatrix(arg1);
		XSRETURN_EMPTY;


void
vtkProp::SetDragable(arg1)
		int 	arg1
		CODE:
		THIS->SetDragable(arg1);
		XSRETURN_EMPTY;


void
vtkProp::SetPickMethod(func)
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
vtkProp::SetPickable(arg1)
		int 	arg1
		CODE:
		THIS->SetPickable(arg1);
		XSRETURN_EMPTY;


void
vtkProp::SetVisibility(arg1)
		int 	arg1
		CODE:
		THIS->SetVisibility(arg1);
		XSRETURN_EMPTY;


void
vtkProp::ShallowCopy(prop)
		vtkProp *	prop
		CODE:
		THIS->ShallowCopy(prop);
		XSRETURN_EMPTY;


void
vtkProp::VisibilityOff()
		CODE:
		THIS->VisibilityOff();
		XSRETURN_EMPTY;


void
vtkProp::VisibilityOn()
		CODE:
		THIS->VisibilityOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::PropAssembly PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkPropAssembly::AddPart(arg1)
		vtkProp *	arg1
		CODE:
		THIS->AddPart(arg1);
		XSRETURN_EMPTY;


const char *
vtkPropAssembly::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


unsigned long
vtkPropAssembly::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


vtkAssemblyPath *
vtkPropAssembly::GetNextPath()
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
vtkPropAssembly::GetNumberOfPaths()
		CODE:
		RETVAL = THIS->GetNumberOfPaths();
		OUTPUT:
		RETVAL


vtkPropCollection *
vtkPropAssembly::GetParts()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkPropCollection";
		CODE:
		RETVAL = THIS->GetParts();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkPropAssembly::InitPathTraversal()
		CODE:
		THIS->InitPathTraversal();
		XSRETURN_EMPTY;


int
vtkPropAssembly::InitializeRayCasting(arg1)
		vtkViewport *	arg1
		CODE:
		RETVAL = THIS->InitializeRayCasting(arg1);
		OUTPUT:
		RETVAL


static vtkPropAssembly*
vtkPropAssembly::New()
		CODE:
		RETVAL = vtkPropAssembly::New();
		OUTPUT:
		RETVAL


void
vtkPropAssembly::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;


void
vtkPropAssembly::RemovePart(arg1)
		vtkProp *	arg1
		CODE:
		THIS->RemovePart(arg1);
		XSRETURN_EMPTY;


int
vtkPropAssembly::RenderIntoImage(arg1)
		vtkViewport *	arg1
		CODE:
		RETVAL = THIS->RenderIntoImage(arg1);
		OUTPUT:
		RETVAL


int
vtkPropAssembly::RenderOpaqueGeometry(ren)
		vtkViewport *	ren
		CODE:
		RETVAL = THIS->RenderOpaqueGeometry(ren);
		OUTPUT:
		RETVAL


int
vtkPropAssembly::RenderOverlay(arg1)
		vtkViewport *	arg1
		CODE:
		RETVAL = THIS->RenderOverlay(arg1);
		OUTPUT:
		RETVAL


int
vtkPropAssembly::RenderTranslucentGeometry(ren)
		vtkViewport *	ren
		CODE:
		RETVAL = THIS->RenderTranslucentGeometry(ren);
		OUTPUT:
		RETVAL


void
vtkPropAssembly::ShallowCopy(Prop)
		vtkProp *	Prop
		CODE:
		THIS->ShallowCopy(Prop);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::PropCollection PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkPropCollection::AddItem(arg1 = 0)
	CASE: items == 2
		vtkProp *	arg1
		CODE:
		THIS->AddItem(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPropCollection::AddItem\n");



const char *
vtkPropCollection::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkProp *
vtkPropCollection::GetLastProp()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkProp";
		CODE:
		RETVAL = THIS->GetLastProp();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkProp *
vtkPropCollection::GetNextProp()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkProp";
		CODE:
		RETVAL = THIS->GetNextProp();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkPropCollection::GetNumberOfPaths()
		CODE:
		RETVAL = THIS->GetNumberOfPaths();
		OUTPUT:
		RETVAL


static vtkPropCollection*
vtkPropCollection::New()
		CODE:
		RETVAL = vtkPropCollection::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Property2D PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkProperty2D::DeepCopy(p)
		vtkProperty2D *	p
		CODE:
		THIS->DeepCopy(p);
		XSRETURN_EMPTY;


const char *
vtkProperty2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkProperty2D::GetColor()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetColor();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkProperty2D::GetDisplayLocation()
		CODE:
		RETVAL = THIS->GetDisplayLocation();
		OUTPUT:
		RETVAL


float
vtkProperty2D::GetLineWidth()
		CODE:
		RETVAL = THIS->GetLineWidth();
		OUTPUT:
		RETVAL


float
vtkProperty2D::GetOpacity()
		CODE:
		RETVAL = THIS->GetOpacity();
		OUTPUT:
		RETVAL


float
vtkProperty2D::GetPointSize()
		CODE:
		RETVAL = THIS->GetPointSize();
		OUTPUT:
		RETVAL


static vtkProperty2D*
vtkProperty2D::New()
		CODE:
		RETVAL = vtkProperty2D::New();
		OUTPUT:
		RETVAL


void
vtkProperty2D::Render(arg1)
		vtkViewport *	arg1
		CODE:
		THIS->Render(arg1);
		XSRETURN_EMPTY;


void
vtkProperty2D::SetColor(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetColor(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkProperty2D::SetColor\n");



void
vtkProperty2D::SetDisplayLocation(arg1)
		int 	arg1
		CODE:
		THIS->SetDisplayLocation(arg1);
		XSRETURN_EMPTY;


void
vtkProperty2D::SetDisplayLocationToBackground()
		CODE:
		THIS->SetDisplayLocationToBackground();
		XSRETURN_EMPTY;


void
vtkProperty2D::SetDisplayLocationToForeground()
		CODE:
		THIS->SetDisplayLocationToForeground();
		XSRETURN_EMPTY;


void
vtkProperty2D::SetLineWidth(arg1)
		float 	arg1
		CODE:
		THIS->SetLineWidth(arg1);
		XSRETURN_EMPTY;


void
vtkProperty2D::SetOpacity(arg1)
		float 	arg1
		CODE:
		THIS->SetOpacity(arg1);
		XSRETURN_EMPTY;


void
vtkProperty2D::SetPointSize(arg1)
		float 	arg1
		CODE:
		THIS->SetPointSize(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Pyramid PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkPyramid::Clip(value, cellScalars, locator, cells, inPd, outPd, inCd, cellId, outCd, insideOut)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	cells
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		int 	insideOut
		CODE:
		THIS->Clip(value, cellScalars, locator, cells, inPd, outPd, inCd, cellId, outCd, insideOut);
		XSRETURN_EMPTY;


void
vtkPyramid::Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	verts
		vtkCellArray *	lines
		vtkCellArray *	polys
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		CODE:
		THIS->Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd);
		XSRETURN_EMPTY;


int
vtkPyramid::GetCellDimension()
		CODE:
		RETVAL = THIS->GetCellDimension();
		OUTPUT:
		RETVAL


int
vtkPyramid::GetCellType()
		CODE:
		RETVAL = THIS->GetCellType();
		OUTPUT:
		RETVAL


const char *
vtkPyramid::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkCell *
vtkPyramid::GetEdge(edgeId)
		int 	edgeId
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetEdge(edgeId);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkCell *
vtkPyramid::GetFace(faceId)
		int 	faceId
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetFace(faceId);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkPyramid::GetNumberOfEdges()
		CODE:
		RETVAL = THIS->GetNumberOfEdges();
		OUTPUT:
		RETVAL


int
vtkPyramid::GetNumberOfFaces()
		CODE:
		RETVAL = THIS->GetNumberOfFaces();
		OUTPUT:
		RETVAL


static vtkPyramid*
vtkPyramid::New()
		CODE:
		RETVAL = vtkPyramid::New();
		OUTPUT:
		RETVAL


int
vtkPyramid::Triangulate(index, ptIds, pts)
		int 	index
		vtkIdList *	ptIds
		vtkPoints *	pts
		CODE:
		RETVAL = THIS->Triangulate(index, ptIds, pts);
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Quad PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkQuad::Clip(value, cellScalars, locator, polys, inPd, outPd, inCd, cellId, outCd, insideOut)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	polys
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		int 	insideOut
		CODE:
		THIS->Clip(value, cellScalars, locator, polys, inPd, outPd, inCd, cellId, outCd, insideOut);
		XSRETURN_EMPTY;


void
vtkQuad::Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	verts
		vtkCellArray *	lines
		vtkCellArray *	polys
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		CODE:
		THIS->Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd);
		XSRETURN_EMPTY;


int
vtkQuad::GetCellDimension()
		CODE:
		RETVAL = THIS->GetCellDimension();
		OUTPUT:
		RETVAL


int
vtkQuad::GetCellType()
		CODE:
		RETVAL = THIS->GetCellType();
		OUTPUT:
		RETVAL


const char *
vtkQuad::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkCell *
vtkQuad::GetEdge(edgeId)
		int 	edgeId
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetEdge(edgeId);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkCell *
vtkQuad::GetFace(arg1)
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetFace(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkQuad::GetNumberOfEdges()
		CODE:
		RETVAL = THIS->GetNumberOfEdges();
		OUTPUT:
		RETVAL


int
vtkQuad::GetNumberOfFaces()
		CODE:
		RETVAL = THIS->GetNumberOfFaces();
		OUTPUT:
		RETVAL


static vtkQuad*
vtkQuad::New()
		CODE:
		RETVAL = vtkQuad::New();
		OUTPUT:
		RETVAL


int
vtkQuad::Triangulate(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, * arg2, * arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkQuad::Triangulate\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Quadric PREFIX = vtk

PROTOTYPES: DISABLE



float
vtkQuadric::EvaluateFunction(arg1 = 0, arg2 = 0, arg3 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkQuadric::EvaluateFunction\n");



const char *
vtkQuadric::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkQuadric::GetCoefficients()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetCoefficients();
		EXTEND(SP, 10);
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


static vtkQuadric*
vtkQuadric::New()
		CODE:
		RETVAL = vtkQuadric::New();
		OUTPUT:
		RETVAL


void
vtkQuadric::SetCoefficients(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0, arg7 = 0, arg8 = 0, arg9 = 0, arg10 = 0)
	CASE: items == 11
		float 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		float 	arg6
		float 	arg7
		float 	arg8
		float 	arg9
		float 	arg10
		CODE:
		THIS->SetCoefficients(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkQuadric::SetCoefficients\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::RectilinearGrid PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkRectilinearGrid::ComputeBounds()
		CODE:
		THIS->ComputeBounds();
		XSRETURN_EMPTY;


void
vtkRectilinearGrid::CopyStructure(ds)
		vtkDataSet *	ds
		CODE:
		THIS->CopyStructure(ds);
		XSRETURN_EMPTY;


void
vtkRectilinearGrid::DeepCopy(src)
		vtkDataObject *	src
		CODE:
		THIS->DeepCopy(src);
		XSRETURN_EMPTY;


int
vtkRectilinearGrid::FindPoint(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		RETVAL = THIS->FindPoint(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkRectilinearGrid::FindPoint\n");



unsigned long
vtkRectilinearGrid::GetActualMemorySize()
		CODE:
		RETVAL = THIS->GetActualMemorySize();
		OUTPUT:
		RETVAL


vtkCell *
vtkRectilinearGrid::GetCell(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		vtkGenericCell *	arg2
		CODE:
		THIS->GetCell(arg1, arg2);
		XSRETURN_EMPTY;
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetCell(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkRectilinearGrid::GetCell\n");



void
vtkRectilinearGrid::GetCellNeighbors(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		vtkIdList *	arg2
		vtkIdList *	arg3
		CODE:
		THIS->GetCellNeighbors(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkRectilinearGrid::GetCellNeighbors\n");



void
vtkRectilinearGrid::GetCellPoints(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		vtkIdList *	arg2
		CODE:
		THIS->GetCellPoints(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkRectilinearGrid::GetCellPoints\n");



int
vtkRectilinearGrid::GetCellType(cellId)
		int 	cellId
		CODE:
		RETVAL = THIS->GetCellType(cellId);
		OUTPUT:
		RETVAL


const char *
vtkRectilinearGrid::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkRectilinearGrid::GetDataDimension()
		CODE:
		RETVAL = THIS->GetDataDimension();
		OUTPUT:
		RETVAL


int
vtkRectilinearGrid::GetDataObjectType()
		CODE:
		RETVAL = THIS->GetDataObjectType();
		OUTPUT:
		RETVAL


int  *
vtkRectilinearGrid::GetDimensions()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetDimensions();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int  *
vtkRectilinearGrid::GetExtent()
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


int
vtkRectilinearGrid::GetMaxCellSize()
		CODE:
		RETVAL = THIS->GetMaxCellSize();
		OUTPUT:
		RETVAL


int
vtkRectilinearGrid::GetNumberOfCells()
		CODE:
		RETVAL = THIS->GetNumberOfCells();
		OUTPUT:
		RETVAL


int
vtkRectilinearGrid::GetNumberOfPoints()
		CODE:
		RETVAL = THIS->GetNumberOfPoints();
		OUTPUT:
		RETVAL


void
vtkRectilinearGrid::GetPointCells(arg1 = 0, arg2 = 0)
	CASE: items == 3 && sv_isobject(ST(2)) && sv_derived_from(ST(2),"Graphics::VTK::IdList")
		int 	arg1
		vtkIdList *	arg2
		CODE:
		THIS->GetPointCells(arg1, * arg2);
		XSRETURN_EMPTY;
	CASE: items == 3 && sv_isobject(ST(2)) && sv_derived_from(ST(2),"Graphics::VTK::IdList")
		int 	arg1
		vtkIdList *	arg2
		CODE:
		THIS->GetPointCells(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkRectilinearGrid::GetPointCells\n");



vtkScalars *
vtkRectilinearGrid::GetXCoordinates()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkScalars";
		CODE:
		RETVAL = THIS->GetXCoordinates();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkScalars *
vtkRectilinearGrid::GetYCoordinates()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkScalars";
		CODE:
		RETVAL = THIS->GetYCoordinates();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkScalars *
vtkRectilinearGrid::GetZCoordinates()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkScalars";
		CODE:
		RETVAL = THIS->GetZCoordinates();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkRectilinearGrid::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


static vtkRectilinearGrid*
vtkRectilinearGrid::New()
		CODE:
		RETVAL = vtkRectilinearGrid::New();
		OUTPUT:
		RETVAL


void
vtkRectilinearGrid::SetDimensions(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetDimensions(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkRectilinearGrid::SetDimensions\n");



void
vtkRectilinearGrid::SetExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkRectilinearGrid::SetExtent\n");



void
vtkRectilinearGrid::SetUpdateExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int 	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetUpdateExtent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetUpdateExtent(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 3
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetUpdateExtent(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkRectilinearGrid::SetUpdateExtent\n");



void
vtkRectilinearGrid::SetXCoordinates(arg1)
		vtkScalars *	arg1
		CODE:
		THIS->SetXCoordinates(arg1);
		XSRETURN_EMPTY;


void
vtkRectilinearGrid::SetYCoordinates(arg1)
		vtkScalars *	arg1
		CODE:
		THIS->SetYCoordinates(arg1);
		XSRETURN_EMPTY;


void
vtkRectilinearGrid::SetZCoordinates(arg1)
		vtkScalars *	arg1
		CODE:
		THIS->SetZCoordinates(arg1);
		XSRETURN_EMPTY;


void
vtkRectilinearGrid::ShallowCopy(src)
		vtkDataObject *	src
		CODE:
		THIS->ShallowCopy(src);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::ReferenceCount PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkReferenceCount::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkReferenceCount*
vtkReferenceCount::New()
		CODE:
		RETVAL = vtkReferenceCount::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Scalars PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkScalars::ComputeRange()
		CODE:
		THIS->ComputeRange();
		XSRETURN_EMPTY;


void
vtkScalars::CreateDefaultLookupTable()
		CODE:
		THIS->CreateDefaultLookupTable();
		XSRETURN_EMPTY;


int
vtkScalars::GetActiveComponent()
		CODE:
		RETVAL = THIS->GetActiveComponent();
		OUTPUT:
		RETVAL


const char *
vtkScalars::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


double
vtkScalars::GetDataTypeMax()
		CODE:
		RETVAL = THIS->GetDataTypeMax();
		OUTPUT:
		RETVAL


double
vtkScalars::GetDataTypeMin()
		CODE:
		RETVAL = THIS->GetDataTypeMin();
		OUTPUT:
		RETVAL


vtkLookupTable *
vtkScalars::GetLookupTable()
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
vtkScalars::GetNumberOfComponents()
		CODE:
		RETVAL = THIS->GetNumberOfComponents();
		OUTPUT:
		RETVAL


int
vtkScalars::GetNumberOfScalars()
		CODE:
		RETVAL = THIS->GetNumberOfScalars();
		OUTPUT:
		RETVAL


float *
vtkScalars::GetRange()
	CASE: items == 1
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


float
vtkScalars::GetScalar(id)
		int 	id
		CODE:
		RETVAL = THIS->GetScalar(id);
		OUTPUT:
		RETVAL


void
vtkScalars::GetScalars(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Scalars")
		int 	arg1
		int 	arg2
		vtkScalars *	arg3
		CODE:
		THIS->GetScalars(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Scalars")
		int 	arg1
		int 	arg2
		vtkScalars *	arg3
		CODE:
		THIS->GetScalars(arg1, arg2, * arg3);
		XSRETURN_EMPTY;
	CASE: items == 3
		vtkIdList *	arg1
		vtkScalars *	arg2
		CODE:
		THIS->GetScalars(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkScalars::GetScalars\n");



int
vtkScalars::InitColorTraversal(alpha, lut, colorModeVTK_COLOR_MODE_DEFAULT)
		float 	alpha
		vtkScalarsToColors *	lut
		int 	colorModeVTK_COLOR_MODE_DEFAULT
		CODE:
		RETVAL = THIS->InitColorTraversal(alpha, lut, colorModeVTK_COLOR_MODE_DEFAULT);
		OUTPUT:
		RETVAL


int
vtkScalars::InsertNextScalar(s)
		float 	s
		CODE:
		RETVAL = THIS->InsertNextScalar(s);
		OUTPUT:
		RETVAL


void
vtkScalars::InsertScalar(id, s)
		int 	id
		float 	s
		CODE:
		THIS->InsertScalar(id, s);
		XSRETURN_EMPTY;


static vtkScalars*
vtkScalars::New(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		int 	arg2
		CODE:
		RETVAL = vtkScalars::New(arg1, arg2);
		OUTPUT:
		RETVAL
	CASE: items == 1
		CODE:
		RETVAL = vtkScalars::New();
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkScalars::New\n");



void
vtkScalars::SetActiveComponent(arg1)
		int 	arg1
		CODE:
		THIS->SetActiveComponent(arg1);
		XSRETURN_EMPTY;


void
vtkScalars::SetData(arg1)
		vtkDataArray *	arg1
		CODE:
		THIS->SetData(arg1);
		XSRETURN_EMPTY;


void
vtkScalars::SetLookupTable(lut)
		vtkLookupTable *	lut
		CODE:
		THIS->SetLookupTable(lut);
		XSRETURN_EMPTY;


void
vtkScalars::SetNumberOfComponents(num)
		int 	num
		CODE:
		THIS->SetNumberOfComponents(num);
		XSRETURN_EMPTY;


void
vtkScalars::SetNumberOfScalars(number)
		int 	number
		CODE:
		THIS->SetNumberOfScalars(number);
		XSRETURN_EMPTY;


void
vtkScalars::SetScalar(id, s)
		int 	id
		float 	s
		CODE:
		THIS->SetScalar(id, s);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::ShortArray PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkShortArray::Allocate(sz, ext)
		int 	sz
		int 	ext
		CODE:
		RETVAL = THIS->Allocate(sz, ext);
		OUTPUT:
		RETVAL


void
vtkShortArray::DeepCopy(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkShortArray::DeepCopy\n");



const char *
vtkShortArray::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkShortArray::GetComponent(i, j)
		int 	i
		int 	j
		CODE:
		RETVAL = THIS->GetComponent(i, j);
		OUTPUT:
		RETVAL


int
vtkShortArray::GetDataType()
		CODE:
		RETVAL = THIS->GetDataType();
		OUTPUT:
		RETVAL


short
vtkShortArray::GetValue(id)
		int 	id
		CODE:
		RETVAL = THIS->GetValue(id);
		OUTPUT:
		RETVAL


void *
vtkShortArray::GetVoidPointer(id)
		int 	id
		CODE:
		RETVAL = THIS->GetVoidPointer(id);
		OUTPUT:
		RETVAL


void
vtkShortArray::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


void
vtkShortArray::InsertComponent(i, j, c)
		int 	i
		int 	j
		float 	c
		CODE:
		THIS->InsertComponent(i, j, c);
		XSRETURN_EMPTY;


int
vtkShortArray::InsertNextValue(arg1)
		short 	arg1
		CODE:
		RETVAL = THIS->InsertNextValue(arg1);
		OUTPUT:
		RETVAL


void
vtkShortArray::InsertValue(id, i)
		int 	id
		short 	i
		CODE:
		THIS->InsertValue(id, i);
		XSRETURN_EMPTY;


static vtkShortArray*
vtkShortArray::New()
		CODE:
		RETVAL = vtkShortArray::New();
		OUTPUT:
		RETVAL


void
vtkShortArray::SetComponent(i, j, c)
		int 	i
		int 	j
		float 	c
		CODE:
		THIS->SetComponent(i, j, c);
		XSRETURN_EMPTY;


void
vtkShortArray::SetNumberOfTuples(number)
		int 	number
		CODE:
		THIS->SetNumberOfTuples(number);
		XSRETURN_EMPTY;


void
vtkShortArray::SetNumberOfValues(number)
		int 	number
		CODE:
		THIS->SetNumberOfValues(number);
		XSRETURN_EMPTY;


void
vtkShortArray::SetValue(id, value)
		int 	id
		short 	value
		CODE:
		THIS->SetValue(id, value);
		XSRETURN_EMPTY;


void
vtkShortArray::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Source PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkSource::ComputeInputUpdateExtents(output)
		vtkDataObject *	output
		CODE:
		THIS->ComputeInputUpdateExtents(output);
		XSRETURN_EMPTY;


void
vtkSource::EnlargeOutputUpdateExtents(arg1)
		vtkDataObject *	arg1
		CODE:
		THIS->EnlargeOutputUpdateExtents(arg1);
		XSRETURN_EMPTY;


const char *
vtkSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkSource::GetNumberOfOutputs()
		CODE:
		RETVAL = THIS->GetNumberOfOutputs();
		OUTPUT:
		RETVAL


int
vtkSource::GetReleaseDataFlag()
		CODE:
		RETVAL = THIS->GetReleaseDataFlag();
		OUTPUT:
		RETVAL


int
vtkSource::InRegisterLoop(arg1)
		vtkObject *	arg1
		CODE:
		RETVAL = THIS->InRegisterLoop(arg1);
		OUTPUT:
		RETVAL


static vtkSource*
vtkSource::New()
		CODE:
		RETVAL = vtkSource::New();
		OUTPUT:
		RETVAL


void
vtkSource::PropagateUpdateExtent(output)
		vtkDataObject *	output
		CODE:
		THIS->PropagateUpdateExtent(output);
		XSRETURN_EMPTY;


void
vtkSource::ReleaseDataFlagOff()
		CODE:
		THIS->ReleaseDataFlagOff();
		XSRETURN_EMPTY;


void
vtkSource::ReleaseDataFlagOn()
		CODE:
		THIS->ReleaseDataFlagOn();
		XSRETURN_EMPTY;


void
vtkSource::SetReleaseDataFlag(arg1)
		int 	arg1
		CODE:
		THIS->SetReleaseDataFlag(arg1);
		XSRETURN_EMPTY;


void
vtkSource::TriggerAsynchronousUpdate()
		CODE:
		THIS->TriggerAsynchronousUpdate();
		XSRETURN_EMPTY;


void
vtkSource::UnRegister(o)
		vtkObject *	o
		CODE:
		THIS->UnRegister(o);
		XSRETURN_EMPTY;


void
vtkSource::UnRegisterAllOutputs()
		CODE:
		THIS->UnRegisterAllOutputs();
		XSRETURN_EMPTY;


void
vtkSource::Update()
		CODE:
		THIS->Update();
		XSRETURN_EMPTY;


void
vtkSource::UpdateData(output)
		vtkDataObject *	output
		CODE:
		THIS->UpdateData(output);
		XSRETURN_EMPTY;


void
vtkSource::UpdateInformation()
		CODE:
		THIS->UpdateInformation();
		XSRETURN_EMPTY;


void
vtkSource::UpdateWholeExtent()
		CODE:
		THIS->UpdateWholeExtent();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Stack PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkStack::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkStack::GetNumberOfItems()
		CODE:
		RETVAL = THIS->GetNumberOfItems();
		OUTPUT:
		RETVAL


vtkObject *
vtkStack::GetTop()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkObject";
		CODE:
		RETVAL = THIS->GetTop();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkStack*
vtkStack::New()
		CODE:
		RETVAL = vtkStack::New();
		OUTPUT:
		RETVAL


vtkObject *
vtkStack::Pop()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkObject";
		CODE:
		RETVAL = THIS->Pop();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkStack::Push(arg1)
		vtkObject *	arg1
		CODE:
		THIS->Push(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::StructuredData PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkStructuredData::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkStructuredData::GetDataDimension(dataDescription)
		int 	dataDescription
		CODE:
		RETVAL = THIS->GetDataDimension(dataDescription);
		OUTPUT:
		RETVAL


static vtkStructuredData*
vtkStructuredData::New()
		CODE:
		RETVAL = vtkStructuredData::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::StructuredGrid PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkStructuredGrid::BlankPoint(ptId)
		int 	ptId
		CODE:
		THIS->BlankPoint(ptId);
		XSRETURN_EMPTY;


void
vtkStructuredGrid::BlankingOff()
		CODE:
		THIS->BlankingOff();
		XSRETURN_EMPTY;


void
vtkStructuredGrid::BlankingOn()
		CODE:
		THIS->BlankingOn();
		XSRETURN_EMPTY;


void
vtkStructuredGrid::CopyStructure(ds)
		vtkDataSet *	ds
		CODE:
		THIS->CopyStructure(ds);
		XSRETURN_EMPTY;


void
vtkStructuredGrid::DeepCopy(src)
		vtkDataObject *	src
		CODE:
		THIS->DeepCopy(src);
		XSRETURN_EMPTY;


unsigned long
vtkStructuredGrid::GetActualMemorySize()
		CODE:
		RETVAL = THIS->GetActualMemorySize();
		OUTPUT:
		RETVAL


int
vtkStructuredGrid::GetBlanking()
		CODE:
		RETVAL = THIS->GetBlanking();
		OUTPUT:
		RETVAL


vtkCell *
vtkStructuredGrid::GetCell(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		vtkGenericCell *	arg2
		CODE:
		THIS->GetCell(arg1, arg2);
		XSRETURN_EMPTY;
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetCell(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkStructuredGrid::GetCell\n");



void
vtkStructuredGrid::GetCellNeighbors(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		vtkIdList *	arg2
		vtkIdList *	arg3
		CODE:
		THIS->GetCellNeighbors(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkStructuredGrid::GetCellNeighbors\n");



void
vtkStructuredGrid::GetCellPoints(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		vtkIdList *	arg2
		CODE:
		THIS->GetCellPoints(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkStructuredGrid::GetCellPoints\n");



int
vtkStructuredGrid::GetCellType(cellId)
		int 	cellId
		CODE:
		RETVAL = THIS->GetCellType(cellId);
		OUTPUT:
		RETVAL


const char *
vtkStructuredGrid::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkStructuredGrid::GetDataDimension()
		CODE:
		RETVAL = THIS->GetDataDimension();
		OUTPUT:
		RETVAL


int
vtkStructuredGrid::GetDataObjectType()
		CODE:
		RETVAL = THIS->GetDataObjectType();
		OUTPUT:
		RETVAL


int  *
vtkStructuredGrid::GetDimensions()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetDimensions();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int  *
vtkStructuredGrid::GetExtent()
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


int
vtkStructuredGrid::GetMaxCellSize()
		CODE:
		RETVAL = THIS->GetMaxCellSize();
		OUTPUT:
		RETVAL


int
vtkStructuredGrid::GetNumberOfCells()
		CODE:
		RETVAL = THIS->GetNumberOfCells();
		OUTPUT:
		RETVAL


int
vtkStructuredGrid::GetNumberOfPoints()
		CODE:
		RETVAL = THIS->GetNumberOfPoints();
		OUTPUT:
		RETVAL


float *
vtkStructuredGrid::GetPoint(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetPoint(arg1);
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


void
vtkStructuredGrid::GetPointCells(arg1 = 0, arg2 = 0)
	CASE: items == 3 && sv_isobject(ST(2)) && sv_derived_from(ST(2),"Graphics::VTK::IdList")
		int 	arg1
		vtkIdList *	arg2
		CODE:
		THIS->GetPointCells(arg1, * arg2);
		XSRETURN_EMPTY;
	CASE: items == 3 && sv_isobject(ST(2)) && sv_derived_from(ST(2),"Graphics::VTK::IdList")
		int 	arg1
		vtkIdList *	arg2
		CODE:
		THIS->GetPointCells(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkStructuredGrid::GetPointCells\n");



void
vtkStructuredGrid::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


int
vtkStructuredGrid::IsPointVisible(ptId)
		int 	ptId
		CODE:
		RETVAL = THIS->IsPointVisible(ptId);
		OUTPUT:
		RETVAL


static vtkStructuredGrid*
vtkStructuredGrid::New()
		CODE:
		RETVAL = vtkStructuredGrid::New();
		OUTPUT:
		RETVAL


void
vtkStructuredGrid::SetDimensions(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetDimensions(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkStructuredGrid::SetDimensions\n");



void
vtkStructuredGrid::SetExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkStructuredGrid::SetExtent\n");



void
vtkStructuredGrid::SetUpdateExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int 	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetUpdateExtent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetUpdateExtent(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 3
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetUpdateExtent(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkStructuredGrid::SetUpdateExtent\n");



void
vtkStructuredGrid::ShallowCopy(src)
		vtkDataObject *	src
		CODE:
		THIS->ShallowCopy(src);
		XSRETURN_EMPTY;


void
vtkStructuredGrid::UnBlankPoint(ptId)
		int 	ptId
		CODE:
		THIS->UnBlankPoint(ptId);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::StructuredPoints PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkStructuredPoints::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkStructuredPoints::GetDataObjectType()
		CODE:
		RETVAL = THIS->GetDataObjectType();
		OUTPUT:
		RETVAL


static vtkStructuredPoints*
vtkStructuredPoints::New()
		CODE:
		RETVAL = vtkStructuredPoints::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::TCoords PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkTCoords::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkTCoords::GetNumberOfComponents()
		CODE:
		RETVAL = THIS->GetNumberOfComponents();
		OUTPUT:
		RETVAL


int
vtkTCoords::GetNumberOfTCoords()
		CODE:
		RETVAL = THIS->GetNumberOfTCoords();
		OUTPUT:
		RETVAL


float *
vtkTCoords::GetTCoord(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetTCoord(arg1);
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


void
vtkTCoords::GetTCoords(arg1 = 0, arg2 = 0)
	CASE: items == 3 && sv_isobject(ST(2)) && sv_derived_from(ST(2),"Graphics::VTK::TCoords")
		vtkIdList *	arg1
		vtkTCoords *	arg2
		CODE:
		THIS->GetTCoords(arg1, arg2);
		XSRETURN_EMPTY;
	CASE: items == 3 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::IdList")
		vtkIdList *	arg1
		vtkTCoords *	arg2
		CODE:
		THIS->GetTCoords(* arg1, * arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTCoords::GetTCoords\n");



int
vtkTCoords::InsertNextTCoord(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		RETVAL = THIS->InsertNextTCoord(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTCoords::InsertNextTCoord\n");



void
vtkTCoords::InsertTCoord(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		int 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		CODE:
		THIS->InsertTCoord(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTCoords::InsertTCoord\n");



static vtkTCoords*
vtkTCoords::New(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		int 	arg2
		CODE:
		RETVAL = vtkTCoords::New(arg1, arg2);
		OUTPUT:
		RETVAL
	CASE: items == 1
		CODE:
		RETVAL = vtkTCoords::New();
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTCoords::New\n");



void
vtkTCoords::SetData(arg1)
		vtkDataArray *	arg1
		CODE:
		THIS->SetData(arg1);
		XSRETURN_EMPTY;


void
vtkTCoords::SetNumberOfComponents(num)
		int 	num
		CODE:
		THIS->SetNumberOfComponents(num);
		XSRETURN_EMPTY;


void
vtkTCoords::SetNumberOfTCoords(number)
		int 	number
		CODE:
		THIS->SetNumberOfTCoords(number);
		XSRETURN_EMPTY;


void
vtkTCoords::SetTCoord(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		int 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		CODE:
		THIS->SetTCoord(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTCoords::SetTCoord\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Tensor PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkTensor::AddComponent(i, j, v)
		int 	i
		int 	j
		float 	v
		CODE:
		THIS->AddComponent(i, j, v);
		XSRETURN_EMPTY;


void
vtkTensor::DeepCopy(arg1 = 0)
	CASE: items == 2
		vtkTensor *	arg1
		CODE:
		THIS->DeepCopy(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTensor::DeepCopy\n");



const char *
vtkTensor::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkTensor::GetComponent(i, j)
		int 	i
		int 	j
		CODE:
		RETVAL = THIS->GetComponent(i, j);
		OUTPUT:
		RETVAL


void
vtkTensor::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


static vtkTensor*
vtkTensor::New()
		CODE:
		RETVAL = vtkTensor::New();
		OUTPUT:
		RETVAL


void
vtkTensor::SetComponent(i, j, v)
		int 	i
		int 	j
		float 	v
		CODE:
		THIS->SetComponent(i, j, v);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Tensors PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkTensors::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkTensors::GetNumberOfTensors()
		CODE:
		RETVAL = THIS->GetNumberOfTensors();
		OUTPUT:
		RETVAL


vtkTensor *
vtkTensors::GetTensor(arg1 = 0, arg2 = 0)
	CASE: items == 3 && sv_isobject(ST(2)) && sv_derived_from(ST(2),"Graphics::VTK::Tensor")
		int 	arg1
		vtkTensor *	arg2
		CODE:
		THIS->GetTensor(arg1, * arg2);
		XSRETURN_EMPTY;
	CASE: items == 3 && sv_isobject(ST(2)) && sv_derived_from(ST(2),"Graphics::VTK::Tensor")
		int 	arg1
		vtkTensor *	arg2
		CODE:
		THIS->GetTensor(arg1, arg2);
		XSRETURN_EMPTY;
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkTensor";
		CODE:
		RETVAL = THIS->GetTensor(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTensors::GetTensor\n");



void
vtkTensors::GetTensors(arg1 = 0, arg2 = 0)
	CASE: items == 3
		vtkIdList *	arg1
		vtkTensors *	arg2
		CODE:
		THIS->GetTensors(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTensors::GetTensors\n");



int
vtkTensors::InsertNextTensor(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0, arg7 = 0, arg8 = 0, arg9 = 0)
	CASE: items == 2
		vtkTensor *	arg1
		CODE:
		RETVAL = THIS->InsertNextTensor(arg1);
		OUTPUT:
		RETVAL
	CASE: items == 10
		float 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		float 	arg6
		float 	arg7
		float 	arg8
		float 	arg9
		CODE:
		RETVAL = THIS->InsertNextTensor(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTensors::InsertNextTensor\n");



void
vtkTensors::InsertTensor(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0, arg7 = 0, arg8 = 0, arg9 = 0, arg10 = 0)
	CASE: items == 3
		int 	arg1
		vtkTensor *	arg2
		CODE:
		THIS->InsertTensor(arg1, arg2);
		XSRETURN_EMPTY;
	CASE: items == 11
		int 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		float 	arg6
		float 	arg7
		float 	arg8
		float 	arg9
		float 	arg10
		CODE:
		THIS->InsertTensor(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTensors::InsertTensor\n");



static vtkTensors*
vtkTensors::New(arg1 = 0)
	CASE: items == 2
		int 	arg1
		CODE:
		RETVAL = vtkTensors::New(arg1);
		OUTPUT:
		RETVAL
	CASE: items == 1
		CODE:
		RETVAL = vtkTensors::New();
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTensors::New\n");



void
vtkTensors::SetNumberOfTensors(number)
		int 	number
		CODE:
		THIS->SetNumberOfTensors(number);
		XSRETURN_EMPTY;


void
vtkTensors::SetTensor(id, t)
		int 	id
		vtkTensor *	t
		CODE:
		THIS->SetTensor(id, t);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Tetra PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkTetra::Clip(value, cellScalars, locator, tetras, inPd, outPd, inCd, cellId, outCd, insideOut)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	tetras
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		int 	insideOut
		CODE:
		THIS->Clip(value, cellScalars, locator, tetras, inPd, outPd, inCd, cellId, outCd, insideOut);
		XSRETURN_EMPTY;


void
vtkTetra::Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	verts
		vtkCellArray *	lines
		vtkCellArray *	polys
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		CODE:
		THIS->Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd);
		XSRETURN_EMPTY;


int
vtkTetra::GetCellDimension()
		CODE:
		RETVAL = THIS->GetCellDimension();
		OUTPUT:
		RETVAL


int
vtkTetra::GetCellType()
		CODE:
		RETVAL = THIS->GetCellType();
		OUTPUT:
		RETVAL


const char *
vtkTetra::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkCell *
vtkTetra::GetEdge(edgeId)
		int 	edgeId
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetEdge(edgeId);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkCell *
vtkTetra::GetFace(faceId)
		int 	faceId
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetFace(faceId);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkTetra::GetNumberOfEdges()
		CODE:
		RETVAL = THIS->GetNumberOfEdges();
		OUTPUT:
		RETVAL


int
vtkTetra::GetNumberOfFaces()
		CODE:
		RETVAL = THIS->GetNumberOfFaces();
		OUTPUT:
		RETVAL


static vtkTetra*
vtkTetra::New()
		CODE:
		RETVAL = vtkTetra::New();
		OUTPUT:
		RETVAL


int
vtkTetra::Triangulate(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, * arg2, * arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTetra::Triangulate\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::TimeStamp PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkTimeStamp::Delete()
		CODE:
		THIS->Delete();
		XSRETURN_EMPTY;


const char *
vtkTimeStamp::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


unsigned long
vtkTimeStamp::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


void
vtkTimeStamp::Modified()
		CODE:
		THIS->Modified();
		XSRETURN_EMPTY;


static vtkTimeStamp*
vtkTimeStamp::New()
		CODE:
		RETVAL = vtkTimeStamp::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::TimerLog PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkTimerLog::AllocateLog()
		CODE:
		THIS->AllocateLog();
		XSRETURN_EMPTY;


void
vtkTimerLog::DumpLog(filename)
		char *	filename
		CODE:
		THIS->DumpLog(filename);
		XSRETURN_EMPTY;


double
vtkTimerLog::GetCPUTime()
		CODE:
		RETVAL = THIS->GetCPUTime();
		OUTPUT:
		RETVAL


const char *
vtkTimerLog::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


double
vtkTimerLog::GetCurrentTime()
		CODE:
		RETVAL = THIS->GetCurrentTime();
		OUTPUT:
		RETVAL


double
vtkTimerLog::GetElapsedTime()
		CODE:
		RETVAL = THIS->GetElapsedTime();
		OUTPUT:
		RETVAL


int
vtkTimerLog::GetMaxEntries()
		CODE:
		RETVAL = THIS->GetMaxEntries();
		OUTPUT:
		RETVAL


void
vtkTimerLog::MarkEvent(EventString)
		char *	EventString
		CODE:
		THIS->MarkEvent(EventString);
		XSRETURN_EMPTY;


static vtkTimerLog*
vtkTimerLog::New()
		CODE:
		RETVAL = vtkTimerLog::New();
		OUTPUT:
		RETVAL


void
vtkTimerLog::ResetLog()
		CODE:
		THIS->ResetLog();
		XSRETURN_EMPTY;


void
vtkTimerLog::SetMaxEntries(a)
		int 	a
		CODE:
		THIS->SetMaxEntries(a);
		XSRETURN_EMPTY;


void
vtkTimerLog::StartTimer()
		CODE:
		THIS->StartTimer();
		XSRETURN_EMPTY;


void
vtkTimerLog::StopTimer()
		CODE:
		THIS->StopTimer();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Transform PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkTransform::CircuitCheck(transform)
		vtkAbstractTransform *	transform
		CODE:
		RETVAL = THIS->CircuitCheck(transform);
		OUTPUT:
		RETVAL


void
vtkTransform::Concatenate(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::Matrix4x4")
		vtkMatrix4x4 *	arg1
		CODE:
		THIS->Concatenate(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::LinearTransform")
		vtkLinearTransform *	arg1
		CODE:
		THIS->Concatenate(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTransform::Concatenate\n");



const char *
vtkTransform::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkLinearTransform *
vtkTransform::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkLinearTransform";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkAbstractTransform *
vtkTransform::GetInverse(arg1 = 0)
	CASE: items == 2
		vtkMatrix4x4 *	arg1
		CODE:
		THIS->GetInverse(arg1);
		XSRETURN_EMPTY;
	CASE: items == 1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkAbstractTransform";
		CODE:
		RETVAL = THIS->GetInverse();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTransform::GetInverse\n");



unsigned long
vtkTransform::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


float *
vtkTransform::GetOrientationWXYZ()
	CASE: items == 1
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetOrientationWXYZ();
		EXTEND(SP, 4);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));


float *
vtkTransform::GetOrientation()
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
vtkTransform::GetPosition()
	CASE: items == 1
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetPosition();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float *
vtkTransform::GetScale()
	CASE: items == 1
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetScale();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


void
vtkTransform::GetTranspose(arg1 = 0)
	CASE: items == 2
		vtkMatrix4x4 *	arg1
		CODE:
		THIS->GetTranspose(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTransform::GetTranspose\n");



void
vtkTransform::Identity()
		CODE:
		THIS->Identity();
		XSRETURN_EMPTY;


void
vtkTransform::Inverse()
		CODE:
		THIS->Inverse();
		XSRETURN_EMPTY;


vtkAbstractTransform *
vtkTransform::MakeTransform()
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


void
vtkTransform::MultiplyNormals(inNormals, outNormals)
		vtkNormals *	inNormals
		vtkNormals *	outNormals
		CODE:
		THIS->MultiplyNormals(inNormals, outNormals);
		XSRETURN_EMPTY;


void
vtkTransform::MultiplyPoints(inPts, outPts)
		vtkPoints *	inPts
		vtkPoints *	outPts
		CODE:
		THIS->MultiplyPoints(inPts, outPts);
		XSRETURN_EMPTY;


void
vtkTransform::MultiplyVectors(inVectors, outVectors)
		vtkVectors *	inVectors
		vtkVectors *	outVectors
		CODE:
		THIS->MultiplyVectors(inVectors, outVectors);
		XSRETURN_EMPTY;


static vtkTransform*
vtkTransform::New()
		CODE:
		RETVAL = vtkTransform::New();
		OUTPUT:
		RETVAL


void
vtkTransform::Pop()
		CODE:
		THIS->Pop();
		XSRETURN_EMPTY;


void
vtkTransform::PostMultiply()
		CODE:
		THIS->PostMultiply();
		XSRETURN_EMPTY;


void
vtkTransform::PreMultiply()
		CODE:
		THIS->PreMultiply();
		XSRETURN_EMPTY;


void
vtkTransform::Push()
		CODE:
		THIS->Push();
		XSRETURN_EMPTY;


void
vtkTransform::RotateWXYZ(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		double 	arg1
		double 	arg2
		double 	arg3
		double 	arg4
		CODE:
		THIS->RotateWXYZ(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTransform::RotateWXYZ\n");



void
vtkTransform::RotateX(angle)
		double 	angle
		CODE:
		THIS->RotateX(angle);
		XSRETURN_EMPTY;


void
vtkTransform::RotateY(angle)
		double 	angle
		CODE:
		THIS->RotateY(angle);
		XSRETURN_EMPTY;


void
vtkTransform::RotateZ(angle)
		double 	angle
		CODE:
		THIS->RotateZ(angle);
		XSRETURN_EMPTY;


void
vtkTransform::Scale(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double 	arg1
		double 	arg2
		double 	arg3
		CODE:
		THIS->Scale(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTransform::Scale\n");



void
vtkTransform::SetInput(input)
		vtkLinearTransform *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;


void
vtkTransform::SetMatrix(arg1 = 0)
	CASE: items == 2
		vtkMatrix4x4 *	arg1
		CODE:
		THIS->SetMatrix(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTransform::SetMatrix\n");



void
vtkTransform::Translate(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double 	arg1
		double 	arg2
		double 	arg3
		CODE:
		THIS->Translate(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTransform::Translate\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::TransformCollection PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkTransformCollection::AddItem(arg1 = 0)
	CASE: items == 2
		vtkTransform *	arg1
		CODE:
		THIS->AddItem(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTransformCollection::AddItem\n");



const char *
vtkTransformCollection::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkTransform *
vtkTransformCollection::GetNextItem()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkTransform";
		CODE:
		RETVAL = THIS->GetNextItem();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkTransformCollection*
vtkTransformCollection::New()
		CODE:
		RETVAL = vtkTransformCollection::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Triangle PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkTriangle::Clip(value, cellScalars, locator, polys, inPd, outPd, inCd, cellId, outCd, insideOut)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	polys
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		int 	insideOut
		CODE:
		THIS->Clip(value, cellScalars, locator, polys, inPd, outPd, inCd, cellId, outCd, insideOut);
		XSRETURN_EMPTY;


void
vtkTriangle::Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	verts
		vtkCellArray *	lines
		vtkCellArray *	polys
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		CODE:
		THIS->Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd);
		XSRETURN_EMPTY;


int
vtkTriangle::GetCellDimension()
		CODE:
		RETVAL = THIS->GetCellDimension();
		OUTPUT:
		RETVAL


int
vtkTriangle::GetCellType()
		CODE:
		RETVAL = THIS->GetCellType();
		OUTPUT:
		RETVAL


const char *
vtkTriangle::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkCell *
vtkTriangle::GetEdge(edgeId)
		int 	edgeId
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetEdge(edgeId);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkCell *
vtkTriangle::GetFace(arg1)
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetFace(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkTriangle::GetNumberOfEdges()
		CODE:
		RETVAL = THIS->GetNumberOfEdges();
		OUTPUT:
		RETVAL


int
vtkTriangle::GetNumberOfFaces()
		CODE:
		RETVAL = THIS->GetNumberOfFaces();
		OUTPUT:
		RETVAL


static vtkTriangle*
vtkTriangle::New()
		CODE:
		RETVAL = vtkTriangle::New();
		OUTPUT:
		RETVAL


int
vtkTriangle::Triangulate(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, * arg2, * arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTriangle::Triangulate\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::TriangleStrip PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkTriangleStrip::Clip(value, cellScalars, locator, polys, inPd, outPd, inCd, cellId, outCd, insideOut)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	polys
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		int 	insideOut
		CODE:
		THIS->Clip(value, cellScalars, locator, polys, inPd, outPd, inCd, cellId, outCd, insideOut);
		XSRETURN_EMPTY;


void
vtkTriangleStrip::Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	verts
		vtkCellArray *	lines
		vtkCellArray *	polys
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		CODE:
		THIS->Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd);
		XSRETURN_EMPTY;


int
vtkTriangleStrip::GetCellDimension()
		CODE:
		RETVAL = THIS->GetCellDimension();
		OUTPUT:
		RETVAL


int
vtkTriangleStrip::GetCellType()
		CODE:
		RETVAL = THIS->GetCellType();
		OUTPUT:
		RETVAL


const char *
vtkTriangleStrip::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkCell *
vtkTriangleStrip::GetEdge(edgeId)
		int 	edgeId
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetEdge(edgeId);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkCell *
vtkTriangleStrip::GetFace(arg1)
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetFace(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkTriangleStrip::GetNumberOfEdges()
		CODE:
		RETVAL = THIS->GetNumberOfEdges();
		OUTPUT:
		RETVAL


int
vtkTriangleStrip::GetNumberOfFaces()
		CODE:
		RETVAL = THIS->GetNumberOfFaces();
		OUTPUT:
		RETVAL


static vtkTriangleStrip*
vtkTriangleStrip::New()
		CODE:
		RETVAL = vtkTriangleStrip::New();
		OUTPUT:
		RETVAL


int
vtkTriangleStrip::Triangulate(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, * arg2, * arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTriangleStrip::Triangulate\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::UnsignedCharArray PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkUnsignedCharArray::Allocate(sz, ext)
		int 	sz
		int 	ext
		CODE:
		RETVAL = THIS->Allocate(sz, ext);
		OUTPUT:
		RETVAL


void
vtkUnsignedCharArray::DeepCopy(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkUnsignedCharArray::DeepCopy\n");



const char *
vtkUnsignedCharArray::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkUnsignedCharArray::GetComponent(i, j)
		int 	i
		int 	j
		CODE:
		RETVAL = THIS->GetComponent(i, j);
		OUTPUT:
		RETVAL


int
vtkUnsignedCharArray::GetDataType()
		CODE:
		RETVAL = THIS->GetDataType();
		OUTPUT:
		RETVAL


unsigned char
vtkUnsignedCharArray::GetValue(id)
		int 	id
		CODE:
		RETVAL = THIS->GetValue(id);
		OUTPUT:
		RETVAL


void *
vtkUnsignedCharArray::GetVoidPointer(id)
		int 	id
		CODE:
		RETVAL = THIS->GetVoidPointer(id);
		OUTPUT:
		RETVAL


void
vtkUnsignedCharArray::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


void
vtkUnsignedCharArray::InsertComponent(i, j, c)
		int 	i
		int 	j
		float 	c
		CODE:
		THIS->InsertComponent(i, j, c);
		XSRETURN_EMPTY;


int
vtkUnsignedCharArray::InsertNextValue(c)
		unsigned char 	c
		CODE:
		RETVAL = THIS->InsertNextValue(c);
		OUTPUT:
		RETVAL


void
vtkUnsignedCharArray::InsertValue(id, c)
		int 	id
		unsigned char 	c
		CODE:
		THIS->InsertValue(id, c);
		XSRETURN_EMPTY;


static vtkUnsignedCharArray*
vtkUnsignedCharArray::New()
		CODE:
		RETVAL = vtkUnsignedCharArray::New();
		OUTPUT:
		RETVAL


void
vtkUnsignedCharArray::SetComponent(i, j, c)
		int 	i
		int 	j
		float 	c
		CODE:
		THIS->SetComponent(i, j, c);
		XSRETURN_EMPTY;


void
vtkUnsignedCharArray::SetNumberOfTuples(number)
		int 	number
		CODE:
		THIS->SetNumberOfTuples(number);
		XSRETURN_EMPTY;


void
vtkUnsignedCharArray::SetNumberOfValues(number)
		int 	number
		CODE:
		THIS->SetNumberOfValues(number);
		XSRETURN_EMPTY;


void
vtkUnsignedCharArray::SetValue(id, value)
		int 	id
		unsigned char 	value
		CODE:
		THIS->SetValue(id, value);
		XSRETURN_EMPTY;


void
vtkUnsignedCharArray::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::UnsignedIntArray PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkUnsignedIntArray::Allocate(sz, ext)
		int 	sz
		int 	ext
		CODE:
		RETVAL = THIS->Allocate(sz, ext);
		OUTPUT:
		RETVAL


void
vtkUnsignedIntArray::DeepCopy(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkUnsignedIntArray::DeepCopy\n");



const char *
vtkUnsignedIntArray::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkUnsignedIntArray::GetDataType()
		CODE:
		RETVAL = THIS->GetDataType();
		OUTPUT:
		RETVAL


unsigned int
vtkUnsignedIntArray::GetValue(id)
		int 	id
		CODE:
		RETVAL = THIS->GetValue(id);
		OUTPUT:
		RETVAL


void *
vtkUnsignedIntArray::GetVoidPointer(id)
		int 	id
		CODE:
		RETVAL = THIS->GetVoidPointer(id);
		OUTPUT:
		RETVAL


void
vtkUnsignedIntArray::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


int
vtkUnsignedIntArray::InsertNextValue(arg1)
		unsigned int 	arg1
		CODE:
		RETVAL = THIS->InsertNextValue(arg1);
		OUTPUT:
		RETVAL


void
vtkUnsignedIntArray::InsertValue(id, i)
		int 	id
		unsigned int 	i
		CODE:
		THIS->InsertValue(id, i);
		XSRETURN_EMPTY;


static vtkUnsignedIntArray*
vtkUnsignedIntArray::New()
		CODE:
		RETVAL = vtkUnsignedIntArray::New();
		OUTPUT:
		RETVAL


void
vtkUnsignedIntArray::SetNumberOfTuples(number)
		int 	number
		CODE:
		THIS->SetNumberOfTuples(number);
		XSRETURN_EMPTY;


void
vtkUnsignedIntArray::SetNumberOfValues(number)
		int 	number
		CODE:
		THIS->SetNumberOfValues(number);
		XSRETURN_EMPTY;


void
vtkUnsignedIntArray::SetValue(id, value)
		int 	id
		unsigned int 	value
		CODE:
		THIS->SetValue(id, value);
		XSRETURN_EMPTY;


void
vtkUnsignedIntArray::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::UnsignedLongArray PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkUnsignedLongArray::Allocate(sz, ext)
		int 	sz
		int 	ext
		CODE:
		RETVAL = THIS->Allocate(sz, ext);
		OUTPUT:
		RETVAL


void
vtkUnsignedLongArray::DeepCopy(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkUnsignedLongArray::DeepCopy\n");



const char *
vtkUnsignedLongArray::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkUnsignedLongArray::GetDataType()
		CODE:
		RETVAL = THIS->GetDataType();
		OUTPUT:
		RETVAL


unsigned long
vtkUnsignedLongArray::GetValue(id)
		int 	id
		CODE:
		RETVAL = THIS->GetValue(id);
		OUTPUT:
		RETVAL


void *
vtkUnsignedLongArray::GetVoidPointer(id)
		int 	id
		CODE:
		RETVAL = THIS->GetVoidPointer(id);
		OUTPUT:
		RETVAL


void
vtkUnsignedLongArray::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


int
vtkUnsignedLongArray::InsertNextValue(arg1)
		unsigned long 	arg1
		CODE:
		RETVAL = THIS->InsertNextValue(arg1);
		OUTPUT:
		RETVAL


void
vtkUnsignedLongArray::InsertValue(id, i)
		int 	id
		unsigned long 	i
		CODE:
		THIS->InsertValue(id, i);
		XSRETURN_EMPTY;


static vtkUnsignedLongArray*
vtkUnsignedLongArray::New()
		CODE:
		RETVAL = vtkUnsignedLongArray::New();
		OUTPUT:
		RETVAL


void
vtkUnsignedLongArray::SetNumberOfTuples(number)
		int 	number
		CODE:
		THIS->SetNumberOfTuples(number);
		XSRETURN_EMPTY;


void
vtkUnsignedLongArray::SetNumberOfValues(number)
		int 	number
		CODE:
		THIS->SetNumberOfValues(number);
		XSRETURN_EMPTY;


void
vtkUnsignedLongArray::SetValue(id, value)
		int 	id
		unsigned long 	value
		CODE:
		THIS->SetValue(id, value);
		XSRETURN_EMPTY;


void
vtkUnsignedLongArray::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::UnsignedShortArray PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkUnsignedShortArray::Allocate(sz, ext)
		int 	sz
		int 	ext
		CODE:
		RETVAL = THIS->Allocate(sz, ext);
		OUTPUT:
		RETVAL


void
vtkUnsignedShortArray::DeepCopy(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkUnsignedShortArray::DeepCopy\n");



const char *
vtkUnsignedShortArray::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkUnsignedShortArray::GetComponent(i, j)
		int 	i
		int 	j
		CODE:
		RETVAL = THIS->GetComponent(i, j);
		OUTPUT:
		RETVAL


int
vtkUnsignedShortArray::GetDataType()
		CODE:
		RETVAL = THIS->GetDataType();
		OUTPUT:
		RETVAL


unsigned short
vtkUnsignedShortArray::GetValue(id)
		int 	id
		CODE:
		RETVAL = THIS->GetValue(id);
		OUTPUT:
		RETVAL


void *
vtkUnsignedShortArray::GetVoidPointer(id)
		int 	id
		CODE:
		RETVAL = THIS->GetVoidPointer(id);
		OUTPUT:
		RETVAL


void
vtkUnsignedShortArray::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


void
vtkUnsignedShortArray::InsertComponent(i, j, c)
		int 	i
		int 	j
		float 	c
		CODE:
		THIS->InsertComponent(i, j, c);
		XSRETURN_EMPTY;


int
vtkUnsignedShortArray::InsertNextValue(arg1)
		unsigned short 	arg1
		CODE:
		RETVAL = THIS->InsertNextValue(arg1);
		OUTPUT:
		RETVAL


void
vtkUnsignedShortArray::InsertValue(id, i)
		int 	id
		unsigned short 	i
		CODE:
		THIS->InsertValue(id, i);
		XSRETURN_EMPTY;


static vtkUnsignedShortArray*
vtkUnsignedShortArray::New()
		CODE:
		RETVAL = vtkUnsignedShortArray::New();
		OUTPUT:
		RETVAL


void
vtkUnsignedShortArray::SetComponent(i, j, c)
		int 	i
		int 	j
		float 	c
		CODE:
		THIS->SetComponent(i, j, c);
		XSRETURN_EMPTY;


void
vtkUnsignedShortArray::SetNumberOfTuples(number)
		int 	number
		CODE:
		THIS->SetNumberOfTuples(number);
		XSRETURN_EMPTY;


void
vtkUnsignedShortArray::SetNumberOfValues(number)
		int 	number
		CODE:
		THIS->SetNumberOfValues(number);
		XSRETURN_EMPTY;


void
vtkUnsignedShortArray::SetValue(id, value)
		int 	id
		unsigned short 	value
		CODE:
		THIS->SetValue(id, value);
		XSRETURN_EMPTY;


void
vtkUnsignedShortArray::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::UnstructuredGrid PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkUnstructuredGrid::AddReferenceToCell(ptId, cellId)
		int 	ptId
		int 	cellId
		CODE:
		THIS->AddReferenceToCell(ptId, cellId);
		XSRETURN_EMPTY;


void
vtkUnstructuredGrid::Allocate(numCells, extSize)
		int 	numCells
		int 	extSize
		CODE:
		THIS->Allocate(numCells, extSize);
		XSRETURN_EMPTY;


void
vtkUnstructuredGrid::BuildLinks()
		CODE:
		THIS->BuildLinks();
		XSRETURN_EMPTY;


void
vtkUnstructuredGrid::CopyStructure(ds)
		vtkDataSet *	ds
		CODE:
		THIS->CopyStructure(ds);
		XSRETURN_EMPTY;


void
vtkUnstructuredGrid::DeepCopy(src)
		vtkDataObject *	src
		CODE:
		THIS->DeepCopy(src);
		XSRETURN_EMPTY;


unsigned long
vtkUnstructuredGrid::GetActualMemorySize()
		CODE:
		RETVAL = THIS->GetActualMemorySize();
		OUTPUT:
		RETVAL


vtkCell *
vtkUnstructuredGrid::GetCell(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		vtkGenericCell *	arg2
		CODE:
		THIS->GetCell(arg1, arg2);
		XSRETURN_EMPTY;
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetCell(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkUnstructuredGrid::GetCell\n");



vtkCellLinks *
vtkUnstructuredGrid::GetCellLinks()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCellLinks";
		CODE:
		RETVAL = THIS->GetCellLinks();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkUnstructuredGrid::GetCellNeighbors(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		vtkIdList *	arg2
		vtkIdList *	arg3
		CODE:
		THIS->GetCellNeighbors(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkUnstructuredGrid::GetCellNeighbors\n");



void
vtkUnstructuredGrid::GetCellPoints(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		vtkIdList *	arg2
		CODE:
		THIS->GetCellPoints(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkUnstructuredGrid::GetCellPoints\n");



int
vtkUnstructuredGrid::GetCellType(cellId)
		int 	cellId
		CODE:
		RETVAL = THIS->GetCellType(cellId);
		OUTPUT:
		RETVAL


vtkCellArray *
vtkUnstructuredGrid::GetCells()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCellArray";
		CODE:
		RETVAL = THIS->GetCells();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


const char *
vtkUnstructuredGrid::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkUnstructuredGrid::GetDataObjectType()
		CODE:
		RETVAL = THIS->GetDataObjectType();
		OUTPUT:
		RETVAL


int
vtkUnstructuredGrid::GetGhostLevel()
		CODE:
		RETVAL = THIS->GetGhostLevel();
		OUTPUT:
		RETVAL


int
vtkUnstructuredGrid::GetMaxCellSize()
		CODE:
		RETVAL = THIS->GetMaxCellSize();
		OUTPUT:
		RETVAL


int
vtkUnstructuredGrid::GetNumberOfCells()
		CODE:
		RETVAL = THIS->GetNumberOfCells();
		OUTPUT:
		RETVAL


int
vtkUnstructuredGrid::GetNumberOfPieces()
		CODE:
		RETVAL = THIS->GetNumberOfPieces();
		OUTPUT:
		RETVAL


int
vtkUnstructuredGrid::GetPiece()
		CODE:
		RETVAL = THIS->GetPiece();
		OUTPUT:
		RETVAL


void
vtkUnstructuredGrid::GetPointCells(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		vtkIdList *	arg2
		CODE:
		THIS->GetPointCells(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkUnstructuredGrid::GetPointCells\n");



int  *
vtkUnstructuredGrid::GetUpdateExtent(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->GetUpdateExtent(arg1, arg2, arg3);
		XSRETURN_EMPTY;
		OUTPUT:
		arg1
		arg2
		arg3
	CASE: items == 1
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetUpdateExtent();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


void
vtkUnstructuredGrid::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


int
vtkUnstructuredGrid::InsertNextCell(arg1 = 0, arg2 = 0)
	CASE: items == 3 && sv_isobject(ST(2)) && sv_derived_from(ST(2),"Graphics::VTK::IdList")
		int 	arg1
		vtkIdList *	arg2
		CODE:
		RETVAL = THIS->InsertNextCell(arg1, * arg2);
		OUTPUT:
		RETVAL
	CASE: items == 3 && sv_isobject(ST(2)) && sv_derived_from(ST(2),"Graphics::VTK::IdList")
		int 	arg1
		vtkIdList *	arg2
		CODE:
		RETVAL = THIS->InsertNextCell(arg1, arg2);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkUnstructuredGrid::InsertNextCell\n");



static vtkUnstructuredGrid*
vtkUnstructuredGrid::New()
		CODE:
		RETVAL = vtkUnstructuredGrid::New();
		OUTPUT:
		RETVAL


void
vtkUnstructuredGrid::RemoveReferenceToCell(ptId, cellId)
		int 	ptId
		int 	cellId
		CODE:
		THIS->RemoveReferenceToCell(ptId, cellId);
		XSRETURN_EMPTY;


void
vtkUnstructuredGrid::Reset()
		CODE:
		THIS->Reset();
		XSRETURN_EMPTY;


void
vtkUnstructuredGrid::ResizeCellList(ptId, size)
		int 	ptId
		int 	size
		CODE:
		THIS->ResizeCellList(ptId, size);
		XSRETURN_EMPTY;


void
vtkUnstructuredGrid::SetUpdateExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int 	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetUpdateExtent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetUpdateExtent(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 3
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetUpdateExtent(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkUnstructuredGrid::SetUpdateExtent\n");



void
vtkUnstructuredGrid::ShallowCopy(src)
		vtkDataObject *	src
		CODE:
		THIS->ShallowCopy(src);
		XSRETURN_EMPTY;


void
vtkUnstructuredGrid::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Vectors PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkVectors::ComputeMaxNorm()
		CODE:
		THIS->ComputeMaxNorm();
		XSRETURN_EMPTY;


const char *
vtkVectors::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


double
vtkVectors::GetMaxNorm()
		CODE:
		RETVAL = THIS->GetMaxNorm();
		OUTPUT:
		RETVAL


int
vtkVectors::GetNumberOfVectors()
		CODE:
		RETVAL = THIS->GetNumberOfVectors();
		OUTPUT:
		RETVAL


float *
vtkVectors::GetVector(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetVector(arg1);
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


void
vtkVectors::GetVectors(arg1 = 0, arg2 = 0)
	CASE: items == 3 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::IdList")
		vtkIdList *	arg1
		vtkVectors *	arg2
		CODE:
		THIS->GetVectors(* arg1, * arg2);
		XSRETURN_EMPTY;
	CASE: items == 3 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::IdList")
		vtkIdList *	arg1
		vtkVectors *	arg2
		CODE:
		THIS->GetVectors(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVectors::GetVectors\n");



int
vtkVectors::InsertNextVector(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		double 	arg1
		double 	arg2
		double 	arg3
		CODE:
		RETVAL = THIS->InsertNextVector(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVectors::InsertNextVector\n");



void
vtkVectors::InsertVector(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		int 	arg1
		double 	arg2
		double 	arg3
		double 	arg4
		CODE:
		THIS->InsertVector(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVectors::InsertVector\n");



static vtkVectors*
vtkVectors::New(arg1 = 0)
	CASE: items == 2
		int 	arg1
		CODE:
		RETVAL = vtkVectors::New(arg1);
		OUTPUT:
		RETVAL
	CASE: items == 1
		CODE:
		RETVAL = vtkVectors::New();
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVectors::New\n");



void
vtkVectors::SetNumberOfVectors(number)
		int 	number
		CODE:
		THIS->SetNumberOfVectors(number);
		XSRETURN_EMPTY;


void
vtkVectors::SetVector(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		int 	arg1
		double 	arg2
		double 	arg3
		double 	arg4
		CODE:
		THIS->SetVector(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVectors::SetVector\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Version PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkVersion::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkVersion::GetVTKBuildVersion()
		CODE:
		RETVAL = THIS->GetVTKBuildVersion();
		OUTPUT:
		RETVAL


int
vtkVersion::GetVTKMajorVersion()
		CODE:
		RETVAL = THIS->GetVTKMajorVersion();
		OUTPUT:
		RETVAL


int
vtkVersion::GetVTKMinorVersion()
		CODE:
		RETVAL = THIS->GetVTKMinorVersion();
		OUTPUT:
		RETVAL


const char *
vtkVersion::GetVTKSourceVersion()
		CODE:
		RETVAL = THIS->GetVTKSourceVersion();
		OUTPUT:
		RETVAL


const char *
vtkVersion::GetVTKVersion()
		CODE:
		RETVAL = THIS->GetVTKVersion();
		OUTPUT:
		RETVAL


static vtkVersion*
vtkVersion::New()
		CODE:
		RETVAL = vtkVersion::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Vertex PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkVertex::Clip(value, cellScalars, locator, pts, inPd, outPd, inCd, cellId, outCd, insideOut)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	pts
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		int 	insideOut
		CODE:
		THIS->Clip(value, cellScalars, locator, pts, inPd, outPd, inCd, cellId, outCd, insideOut);
		XSRETURN_EMPTY;


void
vtkVertex::Contour(value, cellScalars, locator, verts1, lines, verts2, inPd, outPd, inCd, cellId, outCd)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	verts1
		vtkCellArray *	lines
		vtkCellArray *	verts2
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		CODE:
		THIS->Contour(value, cellScalars, locator, verts1, lines, verts2, inPd, outPd, inCd, cellId, outCd);
		XSRETURN_EMPTY;


int
vtkVertex::GetCellDimension()
		CODE:
		RETVAL = THIS->GetCellDimension();
		OUTPUT:
		RETVAL


int
vtkVertex::GetCellType()
		CODE:
		RETVAL = THIS->GetCellType();
		OUTPUT:
		RETVAL


const char *
vtkVertex::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkCell *
vtkVertex::GetEdge(arg1)
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetEdge(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkCell *
vtkVertex::GetFace(arg1)
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetFace(arg1);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkVertex::GetNumberOfEdges()
		CODE:
		RETVAL = THIS->GetNumberOfEdges();
		OUTPUT:
		RETVAL


int
vtkVertex::GetNumberOfFaces()
		CODE:
		RETVAL = THIS->GetNumberOfFaces();
		OUTPUT:
		RETVAL


static vtkVertex*
vtkVertex::New()
		CODE:
		RETVAL = vtkVertex::New();
		OUTPUT:
		RETVAL


int
vtkVertex::Triangulate(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, * arg2, * arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVertex::Triangulate\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::VoidArray PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkVoidArray::Allocate(sz, ext)
		int 	sz
		int 	ext
		CODE:
		RETVAL = THIS->Allocate(sz, ext);
		OUTPUT:
		RETVAL


void
vtkVoidArray::DeepCopy(arg1 = 0)
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(arg1);
		XSRETURN_EMPTY;
	CASE: items == 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1),"Graphics::VTK::DataArray")
		vtkDataArray *	arg1
		CODE:
		THIS->DeepCopy(* arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVoidArray::DeepCopy\n");



const char *
vtkVoidArray::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkVoidArray::GetDataType()
		CODE:
		RETVAL = THIS->GetDataType();
		OUTPUT:
		RETVAL


void *
vtkVoidArray::GetPointer(id)
		int 	id
		CODE:
		RETVAL = THIS->GetPointer(id);
		OUTPUT:
		RETVAL


void *
vtkVoidArray::GetValue(id)
		int 	id
		CODE:
		RETVAL = THIS->GetValue(id);
		OUTPUT:
		RETVAL


void *
vtkVoidArray::GetVoidPointer(id)
		int 	id
		CODE:
		RETVAL = THIS->GetVoidPointer(id);
		OUTPUT:
		RETVAL


void
vtkVoidArray::Initialize()
		CODE:
		THIS->Initialize();
		XSRETURN_EMPTY;


static vtkVoidArray*
vtkVoidArray::New()
		CODE:
		RETVAL = vtkVoidArray::New();
		OUTPUT:
		RETVAL


void
vtkVoidArray::SetNumberOfTuples(number)
		int 	number
		CODE:
		THIS->SetNumberOfTuples(number);
		XSRETURN_EMPTY;


void
vtkVoidArray::SetNumberOfValues(number)
		int 	number
		CODE:
		THIS->SetNumberOfValues(number);
		XSRETURN_EMPTY;


void
vtkVoidArray::Squeeze()
		CODE:
		THIS->Squeeze();
		XSRETURN_EMPTY;


void *
vtkVoidArray::WritePointer(id, number)
		int 	id
		int 	number
		CODE:
		RETVAL = THIS->WritePointer(id, number);
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Voxel PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkVoxel::Clip(value, cellScalars, locator, tetras, inPd, outPd, inCd, cellId, outCd, insideOut)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	tetras
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		int 	insideOut
		CODE:
		THIS->Clip(value, cellScalars, locator, tetras, inPd, outPd, inCd, cellId, outCd, insideOut);
		XSRETURN_EMPTY;


void
vtkVoxel::Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	verts
		vtkCellArray *	lines
		vtkCellArray *	polys
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		CODE:
		THIS->Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd);
		XSRETURN_EMPTY;


int
vtkVoxel::GetCellDimension()
		CODE:
		RETVAL = THIS->GetCellDimension();
		OUTPUT:
		RETVAL


int
vtkVoxel::GetCellType()
		CODE:
		RETVAL = THIS->GetCellType();
		OUTPUT:
		RETVAL


const char *
vtkVoxel::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkCell *
vtkVoxel::GetEdge(edgeId)
		int 	edgeId
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetEdge(edgeId);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkCell *
vtkVoxel::GetFace(faceId)
		int 	faceId
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetFace(faceId);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkVoxel::GetNumberOfEdges()
		CODE:
		RETVAL = THIS->GetNumberOfEdges();
		OUTPUT:
		RETVAL


int
vtkVoxel::GetNumberOfFaces()
		CODE:
		RETVAL = THIS->GetNumberOfFaces();
		OUTPUT:
		RETVAL


static vtkVoxel*
vtkVoxel::New()
		CODE:
		RETVAL = vtkVoxel::New();
		OUTPUT:
		RETVAL


int
vtkVoxel::Triangulate(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, arg2, arg3);
		OUTPUT:
		RETVAL
	CASE: items == 4 && sv_isobject(ST(3)) && sv_derived_from(ST(3),"Graphics::VTK::Points")
		int 	arg1
		vtkIdList *	arg2
		vtkPoints *	arg3
		CODE:
		RETVAL = THIS->Triangulate(arg1, * arg2, * arg3);
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkVoxel::Triangulate\n");


MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Wedge PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkWedge::Clip(value, cellScalars, locator, wedges, inPd, outPd, inCd, cellId, outCd, insideOut)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	wedges
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		int 	insideOut
		CODE:
		THIS->Clip(value, cellScalars, locator, wedges, inPd, outPd, inCd, cellId, outCd, insideOut);
		XSRETURN_EMPTY;


void
vtkWedge::Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd)
		float 	value
		vtkScalars *	cellScalars
		vtkPointLocator *	locator
		vtkCellArray *	verts
		vtkCellArray *	lines
		vtkCellArray *	polys
		vtkPointData *	inPd
		vtkPointData *	outPd
		vtkCellData *	inCd
		int 	cellId
		vtkCellData *	outCd
		CODE:
		THIS->Contour(value, cellScalars, locator, verts, lines, polys, inPd, outPd, inCd, cellId, outCd);
		XSRETURN_EMPTY;


int
vtkWedge::GetCellDimension()
		CODE:
		RETVAL = THIS->GetCellDimension();
		OUTPUT:
		RETVAL


int
vtkWedge::GetCellType()
		CODE:
		RETVAL = THIS->GetCellType();
		OUTPUT:
		RETVAL


const char *
vtkWedge::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkCell *
vtkWedge::GetEdge(edgeId)
		int 	edgeId
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetEdge(edgeId);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkCell *
vtkWedge::GetFace(faceId)
		int 	faceId
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCell";
		CODE:
		RETVAL = THIS->GetFace(faceId);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkWedge::GetNumberOfEdges()
		CODE:
		RETVAL = THIS->GetNumberOfEdges();
		OUTPUT:
		RETVAL


int
vtkWedge::GetNumberOfFaces()
		CODE:
		RETVAL = THIS->GetNumberOfFaces();
		OUTPUT:
		RETVAL


static vtkWedge*
vtkWedge::New()
		CODE:
		RETVAL = vtkWedge::New();
		OUTPUT:
		RETVAL


int
vtkWedge::Triangulate(index, ptIds, pts)
		int 	index
		vtkIdList *	ptIds
		vtkPoints *	pts
		CODE:
		RETVAL = THIS->Triangulate(index, ptIds, pts);
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::WindowLevelLookupTable PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkWindowLevelLookupTable::Build()
		CODE:
		THIS->Build();
		XSRETURN_EMPTY;


const char *
vtkWindowLevelLookupTable::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkWindowLevelLookupTable::GetInverseVideo()
		CODE:
		RETVAL = THIS->GetInverseVideo();
		OUTPUT:
		RETVAL


float
vtkWindowLevelLookupTable::GetLevel()
		CODE:
		RETVAL = THIS->GetLevel();
		OUTPUT:
		RETVAL


unsigned char  *
vtkWindowLevelLookupTable::GetMaximumColor()
		PREINIT:
		unsigned char  * retval;
		PPCODE:
		retval = THIS->GetMaximumColor();
		EXTEND(SP, 4);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));


unsigned char  *
vtkWindowLevelLookupTable::GetMinimumColor()
		PREINIT:
		unsigned char  * retval;
		PPCODE:
		retval = THIS->GetMinimumColor();
		EXTEND(SP, 4);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));


float
vtkWindowLevelLookupTable::GetWindow()
		CODE:
		RETVAL = THIS->GetWindow();
		OUTPUT:
		RETVAL


void
vtkWindowLevelLookupTable::InverseVideoOff()
		CODE:
		THIS->InverseVideoOff();
		XSRETURN_EMPTY;


void
vtkWindowLevelLookupTable::InverseVideoOn()
		CODE:
		THIS->InverseVideoOn();
		XSRETURN_EMPTY;


static vtkWindowLevelLookupTable*
vtkWindowLevelLookupTable::New()
		CODE:
		RETVAL = vtkWindowLevelLookupTable::New();
		OUTPUT:
		RETVAL


void
vtkWindowLevelLookupTable::SetInverseVideo(arg1)
		int 	arg1
		CODE:
		THIS->SetInverseVideo(arg1);
		XSRETURN_EMPTY;


void
vtkWindowLevelLookupTable::SetLevel(arg1)
		float 	arg1
		CODE:
		THIS->SetLevel(arg1);
		XSRETURN_EMPTY;


void
vtkWindowLevelLookupTable::SetMaximumColor(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		unsigned char  	arg1
		unsigned char 	arg2
		unsigned char 	arg3
		unsigned char 	arg4
		CODE:
		THIS->SetMaximumColor(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkWindowLevelLookupTable::SetMaximumColor\n");



void
vtkWindowLevelLookupTable::SetMinimumColor(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		unsigned char  	arg1
		unsigned char 	arg2
		unsigned char 	arg3
		unsigned char 	arg4
		CODE:
		THIS->SetMinimumColor(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkWindowLevelLookupTable::SetMinimumColor\n");



void
vtkWindowLevelLookupTable::SetWindow(arg1)
		float 	arg1
		CODE:
		THIS->SetWindow(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::WindowToImageFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkWindowToImageFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkWindow *
vtkWindowToImageFilter::GetInput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkWindow";
		CODE:
		RETVAL = THIS->GetInput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkWindowToImageFilter*
vtkWindowToImageFilter::New()
		CODE:
		RETVAL = vtkWindowToImageFilter::New();
		OUTPUT:
		RETVAL


void
vtkWindowToImageFilter::SetInput(input)
		vtkWindow *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::InterpolatedVelocityField PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkInterpolatedVelocityField::CachingOff()
		CODE:
		THIS->CachingOff();
		XSRETURN_EMPTY;


void
vtkInterpolatedVelocityField::CachingOn()
		CODE:
		THIS->CachingOn();
		XSRETURN_EMPTY;


void
vtkInterpolatedVelocityField::ClearLastCellId()
		CODE:
		THIS->ClearLastCellId();
		XSRETURN_EMPTY;


int
vtkInterpolatedVelocityField::GetCacheHit()
		CODE:
		RETVAL = THIS->GetCacheHit();
		OUTPUT:
		RETVAL


int
vtkInterpolatedVelocityField::GetCacheMiss()
		CODE:
		RETVAL = THIS->GetCacheMiss();
		OUTPUT:
		RETVAL


int
vtkInterpolatedVelocityField::GetCaching()
		CODE:
		RETVAL = THIS->GetCaching();
		OUTPUT:
		RETVAL


const char *
vtkInterpolatedVelocityField::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkInterpolatedVelocityField::GetDataSet()
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
vtkInterpolatedVelocityField::GetLastCellId()
		CODE:
		RETVAL = THIS->GetLastCellId();
		OUTPUT:
		RETVAL


static vtkInterpolatedVelocityField*
vtkInterpolatedVelocityField::New()
		CODE:
		RETVAL = vtkInterpolatedVelocityField::New();
		OUTPUT:
		RETVAL


void
vtkInterpolatedVelocityField::SetCaching(arg1)
		int 	arg1
		CODE:
		THIS->SetCaching(arg1);
		XSRETURN_EMPTY;


void
vtkInterpolatedVelocityField::SetDataSet(dataset)
		vtkDataSet *	dataset
		CODE:
		THIS->SetDataSet(dataset);
		XSRETURN_EMPTY;


void
vtkInterpolatedVelocityField::SetLastCellId(arg1)
		int 	arg1
		CODE:
		THIS->SetLastCellId(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::RungeKutta2 PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkRungeKutta2::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkRungeKutta2*
vtkRungeKutta2::New()
		CODE:
		RETVAL = vtkRungeKutta2::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::RungeKutta4 PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkRungeKutta4::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkRungeKutta4*
vtkRungeKutta4::New()
		CODE:
		RETVAL = vtkRungeKutta4::New();
		OUTPUT:
		RETVAL

#ifdef WIN32

MODULE = Graphics::VTK::Common	PACKAGE = Graphics::VTK::Win32OutputWindow PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkWin32OutputWindow::DisplayText(arg1)
		char *	arg1
		CODE:
		THIS->DisplayText(arg1);
		XSRETURN_EMPTY;


const char *
vtkWin32OutputWindow::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkWin32OutputWindow*
vtkWin32OutputWindow::New()
		CODE:
		RETVAL = vtkWin32OutputWindow::New();
		OUTPUT:
		RETVAL

#endif


