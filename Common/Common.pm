
package Graphics::VTK::Common;
use 5.004;
use strict;
use Carp;

use vars qw/ $VERSION @ISA/;

require DynaLoader;

$VERSION = '3.2.001';

@ISA = qw/ DynaLoader /;

bootstrap Graphics::VTK::Common $VERSION;


=head1 NAME

VTKCommon  - A Perl interface to VTKCommon library

=head1 SYNOPSIS

C<use Graphics::VTK;>
C<use Graphics::VTK::Common;>

=head1 DESCRIPTION

Graphics::VTK::Common is an interface to the Common libaray of the C++ visualization toolkit VTK..

=head1 AUTHOR

Original PerlVTK Package: Roberto De Leo <rdl@math.umd.edu>

Additional Refinements: John Cerney <j-cerney1@raytheon.com>

=cut

package Graphics::VTK::AbstractMapper;


@Graphics::VTK::AbstractMapper::ISA = qw( Graphics::VTK::ProcessObject );

=head1 Graphics::VTK::AbstractMapper

=over 1

=item *

Inherits from ProcessObject

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetTimeToDraw ();
   virtual void ReleaseGraphicsResources (vtkWindow *);


B<vtkAbstractMapper Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::AbstractTransform;


@Graphics::VTK::AbstractTransform::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::AbstractTransform

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual int CircuitCheck (vtkAbstractTransform *transform);
   void DeepCopy (vtkAbstractTransform *);
   const char *GetClassName();
   vtkAbstractTransform *GetInverse ();
   unsigned long GetMTime ();
   void Identity ();
   virtual void Inverse () = 0;
   virtual vtkAbstractTransform *MakeTransform () = 0;
   void SetInverse (vtkAbstractTransform *transform);
   double *TransformDoublePoint (double x, double y, double z);
      (Returns a 3-element Perl list)
   float *TransformFloatPoint (float x, float y, float z);
      (Returns a 3-element Perl list)
   double *TransformPoint (double x, double y, double z);
      (Returns a 3-element Perl list)
   virtual void TransformPoints (vtkPoints *inPts, vtkPoints *outPts);
   virtual void TransformPointsNormalsVectors (vtkPoints *inPts, vtkPoints *outPts, vtkNormals *inNms, vtkNormals *outNms, vtkVectors *inVrs, vtkVectors *outVrs);
   void UnRegister (vtkObject *O);
   void Update ();


B<vtkAbstractTransform Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void InternalTransformDerivative (float in[3], float out[3], float derivative[3][3]) = 0;
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void InternalTransformDerivative (double in[3], double out[3], double derivative[3][3]) = 0;
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void InternalTransformPoint (float in[3], float out[3]) = 0;
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void InternalTransformPoint (double in[3], double out[3]) = 0;
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   double *TransformDoubleNormalAtPoint (double point[3], double normal[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   double *TransformDoublePoint (double point[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   double *TransformDoubleVectorAtPoint (double point[3], double vector[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float *TransformFloatNormalAtPoint (float point[3], float normal[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float *TransformFloatPoint (float point[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float *TransformFloatVectorAtPoint (float point[3], float vector[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void TransformNormalAtPoint (float point[3], float in[3], float out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void TransformNormalAtPoint (double point[3], double in[3], double out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   double *TransformNormalAtPoint (double point[3], double normal[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void TransformPoint (float in[3], float out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void TransformPoint (double in[3], double out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   double *TransformPoint (double point[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void TransformVectorAtPoint (float point[3], float in[3], float out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void TransformVectorAtPoint (double point[3], double in[3], double out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   double *TransformVectorAtPoint (double point[3], double vector[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::AttributeData;


@Graphics::VTK::AttributeData::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::AttributeData

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual int Allocate (int sz, int ext);
   virtual void DeepCopy (vtkAttributeData *ad);
   unsigned long GetActualMemorySize ();
   const char *GetClassName();
   vtkDataArray *GetData ();
   virtual int GetDataType ();
   void *GetVoidPointer (int id);
   virtual void Initialize ();
   virtual void Reset ();
   virtual void SetData (vtkDataArray *);
   virtual void SetDataType (int dataType);
   void SetDataTypeToBit ();
   void SetDataTypeToChar ();
   void SetDataTypeToDouble ();
   void SetDataTypeToFloat ();
   void SetDataTypeToInt ();
   void SetDataTypeToLong ();
   void SetDataTypeToShort ();
   void SetDataTypeToUnsignedChar ();
   void SetDataTypeToUnsignedInt ();
   void SetDataTypeToUnsignedLong ();
   void SetDataTypeToUnsignedShort ();
   virtual void ShallowCopy (vtkAttributeData *ad);
   void ShallowCopy (vtkAttributeData &ad);
   virtual void Squeeze ();


B<vtkAttributeData Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void DeepCopy (vtkAttributeData &ad);
      Method is marked 'Do Not Use' in its descriptions

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Cell;


@Graphics::VTK::Cell::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::Cell

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual void Clip (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *connectivity, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd, int insideOut) = 0;
   virtual void Contour (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *verts, vtkCellArray *lines, vtkCellArray *polys, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd) = 0;
   virtual void DeepCopy (vtkCell *c);
   float *GetBounds ();
      (Returns a 6-element Perl list)
   virtual int GetCellDimension () = 0;
   virtual int GetCellType () = 0;
   const char *GetClassName();
   virtual vtkCell *GetEdge (int edgeId) = 0;
   virtual vtkCell *GetFace (int faceId) = 0;
   virtual int GetInterpolationOrder ();
   float GetLength2 ();
   virtual int GetNumberOfEdges () = 0;
   virtual int GetNumberOfFaces () = 0;
   int GetNumberOfPoints ();
   int GetPointId (int ptId);
   vtkIdList *GetPointIds ();
   vtkPoints *GetPoints ();
   virtual void ShallowCopy (vtkCell *c);
   void ShallowCopy (vtkCell &c);
   virtual int Triangulate (int index, vtkIdList *ptIds, vtkPoints *pts) = 0;


B<vtkCell Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual int CellBoundary (int subId, float pcoords[3], vtkIdList *pts) = 0;
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   vtkPoints *PointsvtkIdList *PointIdsvoid DeepCopy (vtkCell &c);
      Method is marked 'Do Not Use' in its descriptions

   virtual void Derivatives (int subId, float pcoords[3], float *values, int dim, float *derivs) = 0;
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void EvaluateLocation (int &subId, float pcoords[3], float x[3], float *weights) = 0;
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual int EvaluatePosition (float x[3], float *closestPoint, int &subId, float pcoords[3], float &dist2, float *weights) = 0;
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetBounds (float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual int GetParametricCenter (float pcoords[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   char HitBBox (float bounds[6], float origin[3], float dir[3], float coord[3], float &t);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Initialize (int npts, int *pts, vtkPoints *p);
      Don't know the size of pointer arg number 2

   virtual int IntersectWithLine (float p1[3], float p2[3], float tol, float &t, float x[3], float pcoords[3], int &subId) = 0;
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Command;


=head1 Graphics::VTK::Command

=over 1

=item *

Inherits from 

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Delete ();
   unsigned long GetEventIdFromString (char *event);
   char *GetStringFromEventId (unsigned long event);
   vtkCommand *New ();


B<vtkCommand Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void Execute (vtkObject *caller, unsigned long , void *callData) = 0;
      Don't know the size of pointer arg number 3


=cut

package Graphics::VTK::DataArray;


@Graphics::VTK::DataArray::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::DataArray

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual int Allocate (int sz, int ext) = 0;
   virtual void DeepCopy (vtkDataArray *da);
   void DeepCopy (vtkDataArray &da);
   unsigned long GetActualMemorySize ();
   const char *GetClassName();
   virtual float GetComponent (int i, int j);
   virtual void GetData (int tupleMin, int tupleMax, int compMin, int compMax, vtkFloatArray &data);
   virtual int GetDataType () = 0;
   int GetExtend ();
   int GetMaxId ();
   int GetNumberOfComponents ();
   int GetNumberOfTuples ();
   int GetSize ();
   virtual void *GetVoidPointer (int id) = 0;
   virtual void Initialize () = 0;
   virtual void InsertComponent (int i, int j, float c);
   void Reset ();
   virtual void SetComponent (int i, int j, float c);
   void SetNumberOfComponents (int );
   virtual void SetNumberOfTuples (int number) = 0;
   virtual void Squeeze () = 0;


B<vtkDataArray Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual float *GetTuple (int i) = 0;
      Can't Handle 'float *' return type without a hint

   virtual void GetTuple (int i, float *tuple) = 0;
      Don't know the size of pointer arg number 2

   virtual void GetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   virtual int InsertNextTuple (float *tuple) = 0;
      Don't know the size of pointer arg number 1

   virtual int InsertNextTuple (double *tuple);
      Don't know the size of pointer arg number 1

   virtual void InsertTuple (int i, float *tuple) = 0;
      Don't know the size of pointer arg number 2

   virtual void InsertTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   virtual void SetTuple (int i, float *tuple) = 0;
      Don't know the size of pointer arg number 2

   virtual void SetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   virtual void SetVoidArray (void *, int , int );
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::DataSet;


@Graphics::VTK::DataSet::ISA = qw( Graphics::VTK::DataObject );

=head1 Graphics::VTK::DataSet

=over 1

=item *

Inherits from DataObject

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual void ComputeBounds ();
   virtual void CopyStructure (vtkDataSet *ds) = 0;
   void DeepCopy (vtkDataObject *src);
   int FindPoint (float x, float y, float z);
   unsigned long GetActualMemorySize ();
   float *GetBounds ();
      (Returns a 6-element Perl list)
   virtual void GetCell (int cellId, vtkGenericCell *cell) = 0;
   virtual vtkCell *GetCell (int cellId) = 0;
   vtkCellData *GetCellData ();
   virtual void GetCellNeighbors (int cellId, vtkIdList *ptIds, vtkIdList *cellIds);
   virtual void GetCellPoints (int cellId, vtkIdList *ptIds) = 0;
   virtual int GetCellType (int cellId) = 0;
   virtual void GetCellTypes (vtkCellTypes *types);
   float *GetCenter ();
      (Returns a 3-element Perl list)
   const char *GetClassName();
   int GetDataObjectType ();
   virtual int GetDataSetType ();
   float GetLength ();
   unsigned long GetMTime ();
   virtual int GetMaxCellSize () = 0;
   virtual int GetNumberOfCells () = 0;
   virtual int GetNumberOfPoints () = 0;
   virtual float *GetPoint (int ptId) = 0;
      (Returns a 3-element Perl list)
   virtual void GetPointCells (int ptId, vtkIdList *cellIds) = 0;
   vtkPointData *GetPointData ();
   float *GetScalarRange ();
      (Returns a 2-element Perl list)
   void Initialize ();
   void ShallowCopy (vtkDataObject *src);
   virtual void Squeeze ();


B<vtkDataSet Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual vtkCell *FindAndGetCell (float x[3], vtkCell *cell, int cellId, float tol2, int &subId, float pcoords[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual int FindCell (float x[3], vtkCell *cell, int cellId, float tol2, int &subId, float pcoords[3], float *weights) = 0;
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual int FindCell (float x[3], vtkCell *cell, vtkGenericCell *gencell, int cellId, float tol2, int &subId, float pcoords[3], float *weights) = 0;
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual int FindPoint (float x[3]) = 0;
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetBounds (float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void GetCellBounds (int cellId, float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetCellNeighbors (int cellId, vtkIdList &ptIds, vtkIdList &cellIds);
      Method is marked 'Do Not Use' in its descriptions

   void GetCellPoints (int cellId, vtkIdList &ptIds);
      Method is marked 'Do Not Use' in its descriptions

   void GetCenter (float center[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetPointCells (int ptId, vtkIdList &cellIds);
      Method is marked 'Do Not Use' in its descriptions

   virtual void GetPoint (int id, float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetScalarRange (float range[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   vtkCellData *CellDatavtkPointData *PointDatavtkTimeStamp ComputeTimefloat Bounds[6]float ScalarRange[2]float Center[3]void InternalDataSetCopy (vtkDataSet *src);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::HomogeneousTransform;


@Graphics::VTK::HomogeneousTransform::ISA = qw( Graphics::VTK::AbstractTransform );

=head1 Graphics::VTK::HomogeneousTransform

=over 1

=item *

Inherits from AbstractTransform

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkHomogeneousTransform *GetHomogeneousInverse ();
   void GetMatrix (vtkMatrix4x4 *m);
   vtkMatrix4x4 *GetMatrix ();
   vtkMatrix4x4 *GetMatrixPointer ();
   void TransformPoints (vtkPoints *inPts, vtkPoints *outPts);
   void TransformPointsNormalsVectors (vtkPoints *inPts, vtkPoints *outPts, vtkNormals *inNms, vtkNormals *outNms, vtkVectors *inVrs, vtkVectors *outVrs);


B<vtkHomogeneousTransform Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void InternalTransformDerivative (float in[3], float out[3], float derivative[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InternalTransformDerivative (double in[3], double out[3], double derivative[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InternalTransformPoint (float in[3], float out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InternalTransformPoint (double in[3], double out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::LinearTransform;


@Graphics::VTK::LinearTransform::ISA = qw( Graphics::VTK::HomogeneousTransform );

=head1 Graphics::VTK::LinearTransform

=over 1

=item *

Inherits from HomogeneousTransform

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkLinearTransform *GetLinearInverse ();
   double *TransformDoubleNormal (double x, double y, double z);
      (Returns a 3-element Perl list)
   double *TransformDoubleVector (double x, double y, double z);
      (Returns a 3-element Perl list)
   float *TransformFloatNormal (float x, float y, float z);
      (Returns a 3-element Perl list)
   float *TransformFloatVector (float x, float y, float z);
      (Returns a 3-element Perl list)
   double *TransformNormal (double x, double y, double z);
      (Returns a 3-element Perl list)
   virtual void TransformNormals (vtkNormals *inNms, vtkNormals *outNms);
   void TransformPoints (vtkPoints *inPts, vtkPoints *outPts);
   void TransformPointsNormalsVectors (vtkPoints *inPts, vtkPoints *outPts, vtkNormals *inNms, vtkNormals *outNms, vtkVectors *inVrs, vtkVectors *outVrs);
   double *TransformVector (double x, double y, double z);
      (Returns a 3-element Perl list)
   virtual void TransformVectors (vtkVectors *inVrs, vtkVectors *outVrs);


B<vtkLinearTransform Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void InternalTransformDerivative (float in[3], float out[3], float derivative[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InternalTransformDerivative (double in[3], double out[3], double derivative[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void InternalTransformNormal (float in[3], float out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void InternalTransformNormal (double in[3], double out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InternalTransformPoint (float in[3], float out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InternalTransformPoint (double in[3], double out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void InternalTransformVector (float in[3], float out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void InternalTransformVector (double in[3], double out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   double *TransformDoubleNormal (double normal[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   double *TransformDoubleVector (double vec[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float *TransformFloatNormal (float normal[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float *TransformFloatVector (float vec[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void TransformNormal (float in[3], float out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void TransformNormal (double in[3], double out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   double *TransformNormal (double normal[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   double *TransformVector (double normal[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void TransformVector (float in[3], float out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void TransformVector (double in[3], double out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImplicitFunction;


@Graphics::VTK::ImplicitFunction::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::ImplicitFunction

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float EvaluateFunction (float x, float y, float z);
   float *FunctionGradient (float x, float y, float z);
      (Returns a 3-element Perl list)
   float FunctionValue (float x, float y, float z);
   const char *GetClassName();
   unsigned long GetMTime ();
   vtkAbstractTransform *GetTransform ();
   void SetTransform (vtkAbstractTransform *);


B<vtkImplicitFunction Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual float EvaluateFunction (float x[3]) = 0;
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void EvaluateGradient (float x[3], float g[3]) = 0;
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void FunctionGradient (float x[3], float g[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float *FunctionGradient (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float FunctionValue (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Locator;


@Graphics::VTK::Locator::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::Locator

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AutomaticOff ();
   void AutomaticOn ();
   virtual void BuildLocator () = 0;
   virtual void FreeSearchStructure () = 0;
   virtual void GenerateRepresentation (int level, vtkPolyData *pd) = 0;
   int GetAutomatic ();
   long unsigned GetBuildTime ();
   const char *GetClassName();
   vtkDataSet *GetDataSet ();
   int GetLevel ();
   int GetMaxLevel ();
   int GetRetainCellLists ();
   float GetTolerance ();
   virtual void Initialize ();
   void RetainCellListsOff ();
   void RetainCellListsOn ();
   void SetAutomatic (int );
   void SetDataSet (vtkDataSet *);
   void SetMaxLevel (int );
   void SetRetainCellLists (int );
   void SetTolerance (float );
   virtual void Update ();


B<vtkLocator Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ObjectFactory;


@Graphics::VTK::ObjectFactory::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::ObjectFactory

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   vtkObject *CreateInstance (char *vtkclassname);
   virtual void Disable (char *className);
   const char *GetClassName();
   virtual char *GetClassOverrideName (int index);
   virtual char *GetClassOverrideWithName (int index);
   virtual char *GetDescription (int index);
   virtual char *GetDescription () = 0;
   virtual int GetEnableFlag (char *className, char *subclassName);
   virtual int GetEnableFlag (int index);
   char *GetLibraryPath ();
   virtual int GetNumberOfOverrides ();
   vtkObjectFactoryCollection *GetRegisteredFactories ();
   virtual char *GetVTKSourceVersion () = 0;
   void ReHash ();
   void RegisterFactory (vtkObjectFactory *);
   virtual void SetEnableFlag (int flag, char *className, char *subclassName);
   void UnRegisterAllFactories ();
   void UnRegisterFactory (vtkObjectFactory *);


B<vtkObjectFactory Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::PointSet;


@Graphics::VTK::PointSet::ISA = qw( Graphics::VTK::DataSet );

=head1 Graphics::VTK::PointSet

=over 1

=item *

Inherits from DataSet

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ComputeBounds ();
   void CopyStructure (vtkDataSet *pd);
   void DeepCopy (vtkDataObject *src);
   int FindPoint (float x, float y, float z);
   unsigned long GetActualMemorySize ();
   const char *GetClassName();
   unsigned long GetMTime ();
   virtual int GetNetReferenceCount ();
   int GetNumberOfPoints ();
   float *GetPoint (int ptId);
      (Returns a 3-element Perl list)
   vtkPoints *GetPoints ();
   void Initialize ();
   void SetPoints (vtkPoints *);
   void ShallowCopy (vtkDataObject *src);
   void Squeeze ();
   void UnRegister (vtkObject *o);


B<vtkPointSet Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int FindCell (float x[3], vtkCell *cell, int cellId, float tol2, int &subId, float pcoords[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int FindCell (float x[3], vtkCell *cell, vtkGenericCell *gencell, int cellId, float tol2, int &subId, float pcoords[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int FindPoint (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetPoint (int ptId, float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ScalarsToColors;


@Graphics::VTK::ScalarsToColors::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::ScalarsToColors

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual void Build ();
   const char *GetClassName();
   float *GetColor (float v);
      (Returns a 3-element Perl list)
   float GetLuminance (float x);
   virtual float GetOpacity (float );
   virtual void SetRange (float min, float max) = 0;


B<vtkScalarsToColors Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void GetColor (float v, float rgb[3]) = 0;
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual float *GetRange () = 0;
      Can't Handle 'float *' return type without a hint

   void MapScalarsThroughTable (vtkScalars *scalars, unsigned char *output, int outputFormat);
      Don't know the size of pointer arg number 2

   virtual void MapScalarsThroughTable2 (void *input, unsigned char *output, int inputDataType, int numberOfValues, int inputIncrement, int outputFormat) = 0;
      Don't know the size of pointer arg number 1

   void MapScalarsThroughTable (vtkScalars *scalars, unsigned char *output);
      Don't know the size of pointer arg number 2

   virtual unsigned char *MapValue (float v) = 0;
      Can't Handle 'unsigned char *' return type without a hint

   void SetRange (float rng[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::Viewport;


@Graphics::VTK::Viewport::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::Viewport

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddActor2D (vtkProp *p);
   void AddProp (vtkProp *);
   void ComputeAspect ();
   virtual void DisplayToLocalDisplay (float &x, float &y);
   virtual void DisplayToNormalizedDisplay (float &u, float &v);
   virtual void DisplayToView ();
   void DisplayToWorld ();
   vtkActor2DCollection *GetActors2D ();
   float  *GetAspect ();
      (Returns a 2-element Perl list)
   float  *GetBackground ();
      (Returns a 3-element Perl list)
   virtual float *GetCenter ();
      (Returns a 3-element Perl list)
   const char *GetClassName();
   float  *GetDisplayPoint ();
      (Returns a 3-element Perl list)
   int GetIsPicking ();
   int *GetOrigin ();
      (Returns a 2-element Perl list)
   float GetPickX ();
   float GetPickY ();
   virtual float GetPickedZ () = 0;
   vtkPropCollection *GetProps ();
   int *GetSize ();
      (Returns a 2-element Perl list)
   virtual vtkWindow *GetVTKWindow () = 0;
   float  *GetViewPoint ();
      (Returns a 3-element Perl list)
   float  *GetViewport ();
      (Returns a 4-element Perl list)
   float  *GetWorldPoint ();
      (Returns a 4-element Perl list)
   virtual int IsInViewport (int x, int y);
   virtual void LocalDisplayToDisplay (float &x, float &y);
   virtual void NormalizedDisplayToDisplay (float &u, float &v);
   virtual void NormalizedDisplayToViewport (float &x, float &y);
   virtual void NormalizedViewportToView (float &x, float &y, float &z);
   virtual void NormalizedViewportToViewport (float &u, float &v);
   virtual vtkAssemblyPath *PickProp (float selectionX, float selectionY) = 0;
   vtkAssemblyPath *PickPropFrom (float selectionX, float selectionY, vtkPropCollection *);
   void RemoveActor2D (vtkProp *p);
   void RemoveProp (vtkProp *);
   void SetAspect (float  , float );
   void SetBackground (float  , float , float );
   void SetDisplayPoint (float  , float , float );
   void SetEndRenderMethod (void (*func)(void *) , void *arg);
   void SetStartRenderMethod (void (*func)(void *) , void *arg);
   void SetViewPoint (float  , float , float );
   void SetViewport (float  , float , float , float );
   void SetWorldPoint (float  , float , float , float );
   virtual void ViewToDisplay ();
   virtual void ViewToNormalizedViewport (float &x, float &y, float &z);
   virtual void ViewToWorld (float &, float &, float &);
   virtual void ViewToWorld ();
   virtual void ViewportToNormalizedDisplay (float &x, float &y);
   virtual void ViewportToNormalizedViewport (float &u, float &v);
   void WorldToDisplay ();
   virtual void WorldToView (float &, float &, float &);
   virtual void WorldToView ();


B<vtkViewport Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GetDisplayPoint (double *a);
      Don't know the size of pointer arg number 1

   void GetWorldPoint (double *a);
      Don't know the size of pointer arg number 1

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetAspect (float  a[2]);
      Method is redundant. Same as SetAspect( float, float)

   void SetBackground (float  a[3]);
      Method is redundant. Same as SetBackground( float, float, float)

   void SetDisplayPoint (float  a[3]);
      Method is redundant. Same as SetDisplayPoint( float, float, float)

   void SetEndRenderMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetStartRenderMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetViewPoint (float  a[3]);
      Method is redundant. Same as SetViewPoint( float, float, float)

   void SetViewport (float  a[4]);
      Method is redundant. Same as SetViewport( float, float, float, float)

   void SetWorldPoint (float  a[4]);
      Method is redundant. Same as SetWorldPoint( float, float, float, float)


=cut

package Graphics::VTK::WarpTransform;


@Graphics::VTK::WarpTransform::ISA = qw( Graphics::VTK::AbstractTransform );

=head1 Graphics::VTK::WarpTransform

=over 1

=item *

Inherits from AbstractTransform

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetInverseIterations ();
   double GetInverseTolerance ();
   void Inverse ();
   void SetInverseIterations (int );
   void SetInverseTolerance (double );


B<vtkWarpTransform Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void ForwardTransformDerivative (float in[3], float out[3], float derivative[3][3]) = 0;
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void ForwardTransformDerivative (double in[3], double out[3], double derivative[3][3]) = 0;
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void ForwardTransformPoint (float in[3], float out[3]) = 0;
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void ForwardTransformPoint (double in[3], double out[3]) = 0;
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InternalTransformDerivative (float in[3], float out[3], float derivative[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InternalTransformDerivative (double in[3], double out[3], double derivative[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InternalTransformPoint (float in[3], float out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InternalTransformPoint (double in[3], double out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void InverseTransformDerivative (float in[3], float out[3], float derivative[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void InverseTransformDerivative (double in[3], double out[3], double derivative[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void InverseTransformPoint (float in[3], float out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void InverseTransformPoint (double in[3], double out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Window;


@Graphics::VTK::Window::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::Window

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void DoubleBufferOff ();
   void DoubleBufferOn ();
   void EraseOff ();
   void EraseOn ();
   const char *GetClassName();
   int GetDPI ();
   int GetDoubleBuffer ();
   int GetErase ();
   virtual void *GetGenericContext () = 0;
   virtual void *GetGenericDisplayId () = 0;
   virtual void *GetGenericDrawable () = 0;
   virtual void *GetGenericParentId () = 0;
   virtual void *GetGenericWindowId () = 0;
   int GetMapped ();
   int GetOffScreenRendering ();
   virtual int *GetPosition ();
      (Returns a 2-element Perl list)
   virtual int *GetSize ();
      (Returns a 2-element Perl list)
   char *GetWindowName ();
   virtual void MakeCurrent ();
   void MappedOff ();
   void MappedOn ();
   void OffScreenRenderingOff ();
   void OffScreenRenderingOn ();
   virtual void Render () = 0;
   void SetDPI (int );
   void SetDoubleBuffer (int );
   void SetErase (int );
   void SetMapped (int );
   void SetOffScreenRendering (int );
   virtual void SetPosition (int , int );
   virtual void SetSize (int , int );
   virtual void SetWindowInfo (char *) = 0;
   virtual void SetWindowName (char *);


B<vtkWindow Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual unsigned char *GetPixelData (int , int , int , int , int );
      Can't Handle 'unsigned char *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   virtual void SetDisplayId (void *) = 0;
      Don't know the size of pointer arg number 1

   virtual void SetParentId (void *) = 0;
      Don't know the size of pointer arg number 1

   virtual void SetPosition (int a[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void SetSize (int a[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void SetWindowId (void *) = 0;
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::FunctionSet;


@Graphics::VTK::FunctionSet::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::FunctionSet

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   virtual int GetNumberOfFunctions ();
   virtual int GetNumberOfIndependentVariables ();


B<vtkFunctionSet Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual int FunctionValues (float *x, float *f) = 0;
      Don't know the size of pointer arg number 1

   virtual void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::InitialValueProblemSolver;


@Graphics::VTK::InitialValueProblemSolver::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::InitialValueProblemSolver

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkFunctionSet *GetFunctionSet ();
   virtual void SetFunctionSet (vtkFunctionSet *functionset);


B<vtkInitialValueProblemSolver Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual float ComputeNextStep (float *xprev, float *xnext, float t, float delT);
      Don't know the size of pointer arg number 1

   virtual float ComputeNextStep (float *xprev, float *dxprev, float *xnext, float t, float delT) = 0;
      Don't know the size of pointer arg number 1

   virtual void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ObjectFactoryCollection;


@Graphics::VTK::ObjectFactoryCollection::ISA = qw( Graphics::VTK::Collection );

=head1 Graphics::VTK::ObjectFactoryCollection

=over 1

=item *

Inherits from Collection

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddItem (vtkObjectFactory *t);
   const char *GetClassName();
   vtkObjectFactory *GetNextItem ();
   vtkObjectFactoryCollection *New ();

=cut

package Graphics::VTK::Actor2D;


@Graphics::VTK::Actor2D::ISA = qw( Graphics::VTK::Prop );

=head1 Graphics::VTK::Actor2D

=over 1

=item *

Inherits from Prop

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual void GetActors2D (vtkPropCollection *pc);
   const char *GetClassName();
   float GetHeight ();
   int GetLayerNumber ();
   unsigned long GetMTime ();
   vtkMapper2D *GetMapper ();
   float *GetPosition ();
      (Returns a 2-element Perl list)
   float *GetPosition2 ();
      (Returns a 2-element Perl list)
   vtkCoordinate *GetPosition2Coordinate ();
   vtkCoordinate *GetPositionCoordinate ();
   vtkProperty2D *GetProperty ();
   float GetWidth ();
   vtkActor2D *New ();
   virtual void ReleaseGraphicsResources (vtkWindow *);
   int RenderOpaqueGeometry (vtkViewport *viewport);
   int RenderOverlay (vtkViewport *viewport);
   int RenderTranslucentGeometry (vtkViewport *viewport);
   void SetDisplayPosition (int , int );
   void SetHeight (float h);
   void SetLayerNumber (int );
   void SetMapper (vtkMapper2D *mapper);
   void SetPosition (float , float);
   void SetPosition2 (float , float);
   void SetProperty (vtkProperty2D *);
   void SetWidth (float w);
   void ShallowCopy (vtkProp *prop);


B<vtkActor2D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetPosition2 (float a[2]);
      Method is redundant. Same as SetPosition2( float, float)

   void SetPosition (float a[2]);
      Method is redundant. Same as SetPosition( float, float)


=cut

package Graphics::VTK::Actor2DCollection;


@Graphics::VTK::Actor2DCollection::ISA = qw( Graphics::VTK::PropCollection );

=head1 Graphics::VTK::Actor2DCollection

=over 1

=item *

Inherits from PropCollection

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddItem (vtkActor2D *a);
   const char *GetClassName();
   vtkActor2D *GetLastActor2D ();
   vtkActor2D *GetLastItem ();
   vtkActor2D *GetNextActor2D ();
   vtkActor2D *GetNextItem ();
   int IsItemPresent (vtkActor2D *a);
   vtkActor2DCollection *New ();
   void RenderOverlay (vtkViewport *viewport);
   void Sort ();

=cut

package Graphics::VTK::AssemblyNode;


@Graphics::VTK::AssemblyNode::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::AssemblyNode

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   virtual unsigned long GetMTime ();
   vtkMatrix4x4 *GetMatrix ();
   vtkProp *GetProp ();
   vtkAssemblyNode *New ();
   void SetMatrix (vtkMatrix4x4 *matrix);
   void SetProp (vtkProp *prop);


B<vtkAssemblyNode Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::AssemblyPath;


@Graphics::VTK::AssemblyPath::ISA = qw( Graphics::VTK::Collection );

=head1 Graphics::VTK::AssemblyPath

=over 1

=item *

Inherits from Collection

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddNode (vtkProp *p, vtkMatrix4x4 *m);
   void DeleteLastNode ();
   const char *GetClassName();
   vtkAssemblyNode *GetFirstNode ();
   vtkAssemblyNode *GetLastNode ();
   virtual unsigned long GetMTime ();
   vtkAssemblyNode *GetNextNode ();
   vtkAssemblyPath *New ();
   void ShallowCopy (vtkAssemblyPath *path);


B<vtkAssemblyPath Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::AssemblyPaths;


@Graphics::VTK::AssemblyPaths::ISA = qw( Graphics::VTK::Collection );

=head1 Graphics::VTK::AssemblyPaths

=over 1

=item *

Inherits from Collection

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddItem (vtkAssemblyPath *p);
   char *GetClassName ();
   virtual unsigned long GetMTime ();
   vtkAssemblyPath *GetNextItem ();
   int IsItemPresent (vtkAssemblyPath *p);
   vtkAssemblyPaths *New ();
   void RemoveItem (vtkAssemblyPath *p);

=cut

package Graphics::VTK::BitArray;


@Graphics::VTK::BitArray::ISA = qw( Graphics::VTK::DataArray );

=head1 Graphics::VTK::BitArray

=over 1

=item *

Inherits from DataArray

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int Allocate (int sz, int ext);
   void DeepCopy (vtkDataArray *da);
   void DeepCopy (vtkBitArray &da);
   const char *GetClassName();
   int GetDataType ();
   int GetValue (int id);
   void *GetVoidPointer (int id);
   void Initialize ();
   int InsertNextValue (int i);
   void InsertValue (int id, int i);
   vtkBitArray *New ();
   void SetNumberOfTuples (int number);
   void SetNumberOfValues (int number);
   void SetValue (int id, int value);
   void Squeeze ();


B<vtkBitArray Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   unsigned char *GetPointer (int id);
      Can't Handle 'unsigned char *' return type without a hint

   float *GetTuple (int i);
      Can't Handle 'float *' return type without a hint

   void GetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void GetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   int InsertNextTuple (float *tuple);
      Don't know the size of pointer arg number 1

   int InsertNextTuple (double *tuple);
      Don't know the size of pointer arg number 1

   void InsertTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void InsertTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetArray (unsigned char *array, int size, int save);
      Don't know the size of pointer arg number 1

   void SetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void SetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void SetVoidArray (void *array, int size, int save);
      Don't know the size of pointer arg number 1

   unsigned char *WritePointer (int id, int number);
      Can't Handle 'unsigned char *' return type without a hint


=cut

package Graphics::VTK::ByteSwap;


@Graphics::VTK::ByteSwap::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::ByteSwap

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkByteSwap *New ();
   void Swap2BERange (char *c, int num);
   void Swap2LERange (char *c, int num);
   void Swap4BE (char *c);
   void Swap4BERange (char *c, int num);
   void Swap4LE (char *c);
   void Swap4LERange (char *c, int num);


B<vtkByteSwap Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void Swap2BE (short *s);
      Don't know the size of pointer arg number 1

   void Swap2BERange (short *i, int num);
      Don't know the size of pointer arg number 1

   void Swap2LE (short *s);
      Don't know the size of pointer arg number 1

   void Swap2LERange (short *i, int num);
      Don't know the size of pointer arg number 1

   void Swap4BERange (float *p, int num);
      Don't know the size of pointer arg number 1

   void Swap4BERange (int *i, int num);
      Don't know the size of pointer arg number 1

   void Swap4BERange (unsigned long *i, int num);
      Don't know the size of pointer arg number 1

   void Swap4BE (float *p);
      Don't know the size of pointer arg number 1

   void Swap4BE (int *i);
      Don't know the size of pointer arg number 1

   void Swap4BE (unsigned long *i);
      Don't know the size of pointer arg number 1

   void Swap4LERange (unsigned char *c, int num);
      Don't know the size of pointer arg number 1

   void Swap4LERange (float *p, int num);
      Don't know the size of pointer arg number 1

   void Swap4LERange (int *i, int num);
      Don't know the size of pointer arg number 1

   void Swap4LERange (unsigned long *i, int num);
      Don't know the size of pointer arg number 1

   void Swap4LE (float *p);
      Don't know the size of pointer arg number 1

   void Swap4LE (int *i);
      Don't know the size of pointer arg number 1

   void Swap4LE (unsigned long *i);
      Don't know the size of pointer arg number 1

   void Swap4LE (long *i);
      Don't know the size of pointer arg number 1

   void SwapVoidRange (void *buffer, int numWords, int wordSize);
      Don't know the size of pointer arg number 1

   void SwapWrite2BERange (char *c, int num, FILE *fp);
      Don't know the size of pointer arg number 3

   void SwapWrite2BERange (short *i, int num, FILE *fp);
      Don't know the size of pointer arg number 1

   void SwapWrite2BERange (char *c, int num, ostream *fp);
      I/O Streams not Supported yet

   void SwapWrite2BERange (short *i, int num, ostream *fp);
      I/O Streams not Supported yet

   void SwapWrite4BERange (char *c, int num, FILE *fp);
      Don't know the size of pointer arg number 3

   void SwapWrite4BERange (float *p, int num, FILE *fp);
      Don't know the size of pointer arg number 1

   void SwapWrite4BERange (int *i, int num, FILE *fp);
      Don't know the size of pointer arg number 1

   void SwapWrite4BERange (unsigned long *i, int num, FILE *fp);
      Don't know the size of pointer arg number 1

   void SwapWrite4BERange (char *c, int num, ostream *fp);
      I/O Streams not Supported yet

   void SwapWrite4BERange (float *p, int num, ostream *fp);
      I/O Streams not Supported yet

   void SwapWrite4BERange (int *i, int num, ostream *fp);
      I/O Streams not Supported yet

   void SwapWrite4BERange (unsigned long *i, int num, ostream *fp);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::CellArray;


@Graphics::VTK::CellArray::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::CellArray

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int Allocate (int sz, int ext);
   void DeepCopy (vtkCellArray *ca);
   int EstimateSize (int numCells, int maxPtsPerCell);
   unsigned long GetActualMemorySize ();
   const char *GetClassName();
   vtkDataArray *GetData ();
   int GetInsertLocation (int npts);
   int GetMaxCellSize ();
   int GetNumberOfCells ();
   int GetNumberOfConnectivityEntries ();
   int GetSize ();
   int GetTraversalLocation (int npts);
   int GetTraversalLocation ();
   void InitTraversal ();
   void Initialize ();
   void InsertCellPoint (int id);
   int InsertNextCell (vtkIdList *pts);
   int InsertNextCell (vtkCell *cell);
   int InsertNextCell (int npts);
   vtkCellArray *New ();
   void Reset ();
   void ReverseCell (int loc);
   void SetCells (int ncells, vtkIntArray *cells);
   void SetTraversalLocation (int loc);
   void Squeeze ();
   void UpdateCellCount (int npts);


B<vtkCellArray Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GetCell (int loc, int &npts, int &pts);
      Don't know the size of pointer arg number 3

   int GetNextCell (int &npts, int &pts);
      Don't know the size of pointer arg number 2

   int *GetPointer ();
      Can't Handle 'int *' return type without a hint

   int InsertNextCell (int npts, int *pts);
      Don't know the size of pointer arg number 2

   int InsertNextCell (vtkIdList &pts);
      Method is marked 'Do Not Use' in its descriptions

   void ReplaceCell (int loc, int npts, int *pts);
      Don't know the size of pointer arg number 3

   int *WritePointer (int ncells, int size);
      Can't Handle 'int *' return type without a hint


=cut

package Graphics::VTK::CellData;


@Graphics::VTK::CellData::ISA = qw( Graphics::VTK::DataSetAttributes );

=head1 Graphics::VTK::CellData

=over 1

=item *

Inherits from DataSetAttributes

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkCellData *New ();
   void NullCell (int cellId);


B<vtkCellData Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::CellLinks;


@Graphics::VTK::CellLinks::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::CellLinks

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddCellReference (int cellId, int ptId);
   void Allocate (int numLinks, int ext);
   void BuildLinks (vtkDataSet *data, vtkCellArray *Connectivity);
   void BuildLinks (vtkDataSet *data);
   void DeepCopy (vtkCellLinks *src);
   void DeletePoint (int ptId);
   unsigned long GetActualMemorySize ();
   const char *GetClassName();
   unsigned short GetNcells (int ptId);
   void InsertNextCellReference (int ptId, int cellId);
   int InsertNextPoint (int numLinks);
   vtkLink_s unsigned short ncells int cells vtkCellLinks *New ();
   void RemoveCellReference (int cellId, int ptId);
   void Reset ();
   void ResizeCellList (int ptId, int size);
   void Squeeze ();


B<vtkCellLinks Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int *GetCells (int ptId);
      Can't Handle 'int *' return type without a hint

   _vtkLink_s &GetLink (int ptId);
      Can't Handle _vtkLink_s return type yet

   _vtkLink_s *Arrayint Sizeint MaxIdint Extend_vtkLink_s *Resize (int sz);
      Can't Handle _vtkLink_s return type yet


=cut

package Graphics::VTK::CellTypes;


@Graphics::VTK::CellTypes::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::CellTypes

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int Allocate (int sz, int ext);
   void DeepCopy (vtkCellTypes *src);
   void DeleteCell (int cellId);
   unsigned long GetActualMemorySize ();
   int GetCellLocation (int cellId);
   unsigned char GetCellType (int cellId);
   const char *GetClassName();
   int GetNumberOfTypes ();
   void InsertCell (int id, unsigned char type, int loc);
   int InsertNextCell (unsigned char type, int loc);
   int InsertNextType (unsigned char type);
   int IsType (unsigned char type);
   vtkCell_s unsigned char type int loc vtkCellTypes *New ();
   void Reset ();
   void Squeeze ();


B<vtkCellTypes Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   _vtkCell_s &GetCell (int id);
      Can't Handle _vtkCell_s return type yet

   _vtkCell_s *Arrayint Sizeint MaxIdint Extend_vtkCell_s *Resize (int sz);
      Can't Handle _vtkCell_s return type yet


=cut

package Graphics::VTK::CharArray;


@Graphics::VTK::CharArray::ISA = qw( Graphics::VTK::DataArray );

=head1 Graphics::VTK::CharArray

=over 1

=item *

Inherits from DataArray

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int Allocate (int sz, int ext);
   void DeepCopy (vtkDataArray *ia);
   void DeepCopy (vtkDataArray &ia);
   const char *GetClassName();
   float GetComponent (int i, int j);
   int GetDataType ();
   char *GetPointer (int id);
   char GetValue (int id);
   void *GetVoidPointer (int id);
   void Initialize ();
   void InsertComponent (int i, int j, float c);
   int InsertNextValue (char c);
   void InsertValue (int id, char c);
   vtkCharArray *New ();
   void SetArray (char *array, int size, int save);
   void SetComponent (int i, int j, float c);
   void SetNumberOfTuples (int number);
   void SetNumberOfValues (int number);
   void SetValue (int id, char value);
   void Squeeze ();
   char *WritePointer (int id, int number);


B<vtkCharArray Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float *GetTuple (int i);
      Can't Handle 'float *' return type without a hint

   void GetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void GetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   int InsertNextTuple (float *tuple);
      Don't know the size of pointer arg number 1

   int InsertNextTuple (double *tuple);
      Don't know the size of pointer arg number 1

   void InsertTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void InsertTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void SetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void SetVoidArray (void *array, int size, int save);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::Collection;


@Graphics::VTK::Collection::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::Collection

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddItem (vtkObject *);
   const char *GetClassName();
   vtkObject *GetItemAsObject (int i);
   vtkObject *GetNextItemAsObject ();
   int GetNumberOfItems ();
   void InitTraversal ();
   int IsItemPresent (vtkObject *);
   vtkCollection *New ();
   void RemoveAllItems ();
   void RemoveItem (vtkObject *);
   void RemoveItem (int i);
   void ReplaceItem (int i, vtkObject *);


B<vtkCollection Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ContourValues;


@Graphics::VTK::ContourValues::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::ContourValues

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void GenerateValues (int numContours, float rangeStart, float rangeEnd);
   const char *GetClassName();
   int GetNumberOfContours ();
   float GetValue (int i);
   vtkContourValues *New ();
   void SetNumberOfContours (int number);
   void SetValue (int i, float value);


B<vtkContourValues Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GenerateValues (int numContours, float range[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float *GetValues ();
      Can't Handle 'float *' return type without a hint

   void GetValues (float *contourValues);
      Don't know the size of pointer arg number 1

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Coordinate;


@Graphics::VTK::Coordinate::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::Coordinate

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int *GetComputedDisplayValue (vtkViewport *);
      (Returns a 2-element Perl list)
   int *GetComputedLocalDisplayValue (vtkViewport *);
      (Returns a 2-element Perl list)
   int *GetComputedViewportValue (vtkViewport *);
      (Returns a 2-element Perl list)
   float *GetComputedWorldValue (vtkViewport *);
      (Returns a 3-element Perl list)
   int GetCoordinateSystem ();
   char *GetCoordinateSystemAsString ();
   vtkCoordinate *GetReferenceCoordinate ();
   float  *GetValue ();
      (Returns a 3-element Perl list)
   vtkViewport *GetViewport ();
   vtkCoordinate *New ();
   void SetCoordinateSystem (int );
   void SetCoordinateSystemToDisplay ();
   void SetCoordinateSystemToNormalizedDisplay ();
   void SetCoordinateSystemToNormalizedViewport ();
   void SetCoordinateSystemToView ();
   void SetCoordinateSystemToViewport ();
   void SetCoordinateSystemToWorld ();
   void SetReferenceCoordinate (vtkCoordinate *);
   void SetValue (float  , float , float );
   void SetValue (float a, float b);
   void SetViewport (vtkViewport *viewport);


B<vtkCoordinate Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float *GetComputedFloatDisplayValue (vtkViewport *);
      Can't Handle 'float *' return type without a hint

   float *GetComputedFloatViewportValue (vtkViewport *);
      Can't Handle 'float *' return type without a hint

   virtual float *GetComputedUserDefinedValue (vtkViewport *);
      Can't Handle 'float *' return type without a hint

   float *GetComputedValue (vtkViewport *);
      Can't Handle 'float *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetValue (float  a[3]);
      Method is redundant. Same as SetValue( float, float, float)


=cut

package Graphics::VTK::CriticalSection;


@Graphics::VTK::CriticalSection::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::CriticalSection

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   void Lock (void );
   vtkCriticalSection *New ();
   void Unlock (void );


B<vtkCriticalSection Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::DataObject;


@Graphics::VTK::DataObject::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::DataObject

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CopyInformation (vtkDataObject *data);
   virtual void CopyTypeSpecificInformation (vtkDataObject *data);
   void DataHasBeenGenerated ();
   virtual void DeepCopy (vtkDataObject *src);
   virtual unsigned long GetActualMemorySize ();
   const char *GetClassName();
   virtual int GetDataObjectType ();
   int GetDataReleased ();
   virtual unsigned long GetEstimatedMemorySize ();
   unsigned long GetEstimatedPipelineMemorySize ();
   vtkExtentTranslator *GetExtentTranslator ();
   vtkFieldData *GetFieldData ();
   int GetGlobalReleaseDataFlag ();
   float GetLocality ();
   unsigned long GetMTime ();
   virtual int GetNetReferenceCount ();
   long unsigned GetPipelineMTime ();
   int GetReleaseDataFlag ();
   vtkSource *GetSource ();
   int  *GetUpdateExtent ();
      (Returns a 6-element Perl list)
   int GetUpdateGhostLevel ();
   int GetUpdateNumberOfPieces ();
   int GetUpdatePiece ();
   unsigned long GetUpdateTime ();
   int  *GetWholeExtent ();
      (Returns a 6-element Perl list)
   void GlobalReleaseDataFlagOff ();
   void GlobalReleaseDataFlagOn ();
   virtual void Initialize ();
   vtkDataObject *New ();
   virtual void PrepareForNewData ();
   virtual void PropagateUpdateExtent ();
   void ReleaseData ();
   void ReleaseDataFlagOff ();
   void ReleaseDataFlagOn ();
   void SetExtentTranslator (vtkExtentTranslator *translator);
   void SetFieldData (vtkFieldData *);
   void SetGlobalReleaseDataFlag (int val);
   void SetLocality (float );
   void SetPipelineMTime (unsigned long time);
   void SetReleaseDataFlag (int );
   void SetSource (vtkSource *s);
   virtual void SetUpdateExtent (int x1, int x2, int y1, int y2, int z1, int z2);
   virtual void SetUpdateExtent (int , int , int );
   void SetUpdateExtent (int piece, int numPieces);
   void SetUpdateExtentToWholeExtent ();
   void SetUpdateGhostLevel (int level);
   void SetUpdateNumberOfPieces (int num);
   void SetUpdatePiece (int piece);
   void SetWholeExtent (int  , int , int , int , int , int );
   virtual void ShallowCopy (vtkDataObject *src);
   int ShouldIReleaseData ();
   virtual void TriggerAsynchronousUpdate ();
   void UnRegister (vtkObject *o);
   virtual void Update ();
   virtual void UpdateData ();
   virtual void UpdateInformation ();


B<vtkDataObject Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeEstimatedPipelineMemorySize (unsigned long sizes[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int WholeExtent[6]int Extent[6]int UpdateExtent[6]unsigned char UpdateExtentInitializedvtkExtentTranslator *ExtentTranslatorint NumberOfPiecesint Pieceint UpdateNumberOfPiecesint UpdatePieceint GhostLevelint UpdateGhostLevelint ReleaseDataFlagvtkTimeStamp UpdateTimeunsigned long EstimatedWholeMemorySizeunsigned long PipelineMTimeint LastUpdateExtentWasOutsideOfTheExtentfloat Localityvoid InternalDataObjectCopy (vtkDataObject *src);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   virtual void SetUpdateExtent (int ext[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetWholeExtent (int  a[6]);
      Method is redundant. Same as SetWholeExtent( int, int, int, int, int, int)


=cut

package Graphics::VTK::DataObjectCollection;


@Graphics::VTK::DataObjectCollection::ISA = qw( Graphics::VTK::Collection );

=head1 Graphics::VTK::DataObjectCollection

=over 1

=item *

Inherits from Collection

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddItem (vtkDataObject *ds);
   const char *GetClassName();
   vtkDataObject *GetItem (int i);
   vtkDataObject *GetNextItem ();
   vtkDataObjectCollection *New ();

=cut

package Graphics::VTK::DataSetAttributes;


@Graphics::VTK::DataSetAttributes::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::DataSetAttributes

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CopyAllOff ();
   void CopyAllOn ();
   void CopyAllocate (vtkDataSetAttributes *pd, int sze, int ext);
   void CopyData (vtkDataSetAttributes *fromPd, int fromId, int toId);
   void CopyFieldDataOff ();
   void CopyFieldDataOn ();
   void CopyGhostLevelsOff ();
   void CopyGhostLevelsOn ();
   void CopyNormalsOff ();
   void CopyNormalsOn ();
   void CopyScalarsOff ();
   void CopyScalarsOn ();
   void CopyTCoordsOff ();
   void CopyTCoordsOn ();
   void CopyTensorsOff ();
   void CopyTensorsOn ();
   void CopyTuple (vtkDataArray *fromData, vtkDataArray *toData, int fromId, int toId);
   void CopyVectorsOff ();
   void CopyVectorsOn ();
   void DeepCopy (vtkDataSetAttributes *pd);
   unsigned long GetActualMemorySize ();
   int GetAnyEnabled ();
   const char *GetClassName();
   int GetCopyFieldData ();
   int GetCopyGhostLevels ();
   int GetCopyNormals ();
   int GetCopyScalars ();
   int GetCopyTCoords ();
   int GetCopyTensors ();
   int GetCopyVectors ();
   vtkFieldData *GetFieldData ();
   vtkGhostLevels *GetGhostLevels ();
   unsigned long GetMTime ();
   vtkNormals *GetNormals ();
   vtkScalars *GetScalars ();
   vtkTCoords *GetTCoords ();
   vtkTensors *GetTensors ();
   vtkVectors *GetVectors ();
   void Initialize ();
   void InterpolateAllocate (vtkDataSetAttributes *pd, int sze, int ext);
   void InterpolateEdge (vtkDataSetAttributes *fromPd, int toId, int p1, int p2, float t);
   void InterpolateTime (vtkDataSetAttributes *from1, vtkDataSetAttributes *from2, int id, float t);
   vtkDataSetAttributes *New ();
   void PassData (vtkDataSetAttributes *pd);
   void PassNoReplaceData (vtkDataSetAttributes *pd);
   void SetCopyFieldData (int );
   void SetCopyGhostLevels (int );
   void SetCopyNormals (int );
   void SetCopyScalars (int );
   void SetCopyTCoords (int );
   void SetCopyTensors (int );
   void SetCopyVectors (int );
   void SetFieldData (vtkFieldData *);
   void SetGhostLevels (vtkGhostLevels *);
   void SetNormals (vtkNormals *);
   void SetScalars (vtkScalars *);
   void SetTCoords (vtkTCoords *);
   void SetTensors (vtkTensors *);
   void SetVectors (vtkVectors *);
   void ShallowCopy (vtkDataSetAttributes *pd);
   void ShallowCopy (vtkDataSetAttributes &pd);
   void Squeeze ();
   virtual void Update ();


B<vtkDataSetAttributes Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void DeepCopy (vtkDataSetAttributes &pd);
      Method is marked 'Do Not Use' in its descriptions

   void InterpolatePoint (vtkDataSetAttributes *fromPd, int toId, vtkIdList *ids, float *weights);
      Don't know the size of pointer arg number 4

   void InterpolateTuple (vtkDataArray *fromData, vtkDataArray *toData, int toId, vtkIdList *ptIds, float *weights);
      Don't know the size of pointer arg number 5

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::DataSetCollection;


@Graphics::VTK::DataSetCollection::ISA = qw( Graphics::VTK::Collection );

=head1 Graphics::VTK::DataSetCollection

=over 1

=item *

Inherits from Collection

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddItem (vtkDataSet *ds);
   const char *GetClassName();
   vtkDataSet *GetItem (int i);
   vtkDataSet *GetNextItem ();
   vtkDataSetCollection *New ();

=cut

package Graphics::VTK::DebugLeaks;


@Graphics::VTK::DebugLeaks::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::DebugLeaks

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ConstructClass (char *classname);
   void DeleteTable ();
   void DestructClass (char *classname);
   const char *GetClassName();
   vtkDebugLeaks *New ();
   void PrintCurrentLeaks ();

=cut

package Graphics::VTK::Directory;


@Graphics::VTK::Directory::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::Directory

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   char *GetFile (int index);
   int GetNumberOfFiles ();
   vtkDirectory *New ();
   int Open (char *dir);


B<vtkDirectory Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::DynamicLoader;


@Graphics::VTK::DynamicLoader::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::DynamicLoader

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   void *GetSymbolAddress (vtkLibHandle , char *);
   char *LastError ();
   char *LibExtension ();
   char *LibPrefix ();
   vtkDynamicLoader *New ();

=cut

package Graphics::VTK::DoubleArray;


@Graphics::VTK::DoubleArray::ISA = qw( Graphics::VTK::DataArray );

=head1 Graphics::VTK::DoubleArray

=over 1

=item *

Inherits from DataArray

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int Allocate (int sz, int ext);
   void DeepCopy (vtkDataArray *da);
   void DeepCopy (vtkDataArray &da);
   const char *GetClassName();
   int GetDataType ();
   double GetValue (int id);
   void *GetVoidPointer (int id);
   void Initialize ();
   int InsertNextValue (double f);
   void InsertValue (int id, double f);
   vtkDoubleArray *New ();
   void SetNumberOfTuples (int number);
   void SetNumberOfValues (int number);
   void SetValue (int id, double value);
   void Squeeze ();


B<vtkDoubleArray Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   double *GetPointer (int id);
      Can't Handle 'double *' return type without a hint

   float *GetTuple (int i);
      Can't Handle 'float *' return type without a hint

   void GetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void GetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   int InsertNextTuple (float *tuple);
      Don't know the size of pointer arg number 1

   int InsertNextTuple (double *tuple);
      Don't know the size of pointer arg number 1

   void InsertTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void InsertTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetArray (double *array, int size, int save);
      Don't know the size of pointer arg number 1

   void SetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void SetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void SetVoidArray (void *array, int size, int save);
      Don't know the size of pointer arg number 1

   double *WritePointer (int id, int number);
      Can't Handle 'double *' return type without a hint


=cut

package Graphics::VTK::EdgeTable;


@Graphics::VTK::EdgeTable::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::EdgeTable

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetNextEdge (int &p1, int &p2);
   int GetNumberOfEdges ();
   int InitEdgeInsertion (int numPoints, int storeAttributes);
   int InitPointInsertion (vtkPoints *newPts, int estSize);
   void InitTraversal ();
   void Initialize ();
   void InsertEdge (int p1, int p2, int attributeId);
   int InsertEdge (int p1, int p2);
   int IsEdge (int p1, int p2);
   vtkEdgeTable *New ();
   void Reset ();


B<vtkEdgeTable Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int InsertUniquePoint (int p1, int p2, float x[3], int &ptId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   vtkIdList *TablevtkIdList *Attributesint StoreAttributesint TableMaxIdint TableSizeint Position[2]int Extendint NumberOfEdgesvtkPoints *PointsvtkIdList *Resize (int size);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::EmptyCell;


@Graphics::VTK::EmptyCell::ISA = qw( Graphics::VTK::Cell );

=head1 Graphics::VTK::EmptyCell

=over 1

=item *

Inherits from Cell

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Clip (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *pts, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd, int insideOut);
   void Contour (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *verts1, vtkCellArray *lines, vtkCellArray *verts2, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd);
   int GetCellDimension ();
   int GetCellType ();
   const char *GetClassName();
   vtkCell *GetEdge (int );
   vtkCell *GetFace (int );
   int GetNumberOfEdges ();
   int GetNumberOfFaces ();
   vtkEmptyCell *New ();
   int Triangulate (int index, vtkIdList *ptIds, vtkPoints *pts);
   int Triangulate (int index, vtkIdList &ptIds, vtkPoints &pts);


B<vtkEmptyCell Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int CellBoundary (int subId, float pcoords[3], vtkIdList *pts);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int CellBoundary (int subId, float pcoords[3], vtkIdList &pts);
      Method is marked 'Do Not Use' in its descriptions

   void Derivatives (int subId, float pcoords[3], float *values, int dim, float *derivs);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateLocation (int &subId, float pcoords[3], float x[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int EvaluatePosition (float x[3], float *closestPoint, int &subId, float pcoords[3], float &dist2, float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int IntersectWithLine (float p1[3], float p2[3], float tol, float &t, float x[3], float pcoords[3], int &subId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ExtentTranslator;


@Graphics::VTK::ExtentTranslator::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::ExtentTranslator

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int  *GetExtent ();
      (Returns a 6-element Perl list)
   int GetGhostLevel ();
   int GetNumberOfPieces ();
   int GetPiece ();
   int  *GetWholeExtent ();
      (Returns a 6-element Perl list)
   vtkExtentTranslator *New ();
   virtual int PieceToExtent ();
   void SetExtent (int  , int , int , int , int , int );
   void SetGhostLevel (int );
   void SetNumberOfPieces (int );
   void SetPiece (int );
   void SetWholeExtent (int  , int , int , int , int , int );


B<vtkExtentTranslator Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetExtent (int  a[6]);
      Method is redundant. Same as SetExtent( int, int, int, int, int, int)

   void SetWholeExtent (int  a[6]);
      Method is redundant. Same as SetWholeExtent( int, int, int, int, int, int)

   int SplitExtent (int piece, int numPieces, int *extent);
      Don't know the size of pointer arg number 3


=cut

package Graphics::VTK::FieldData;


@Graphics::VTK::FieldData::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::FieldData

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int AddArray (vtkDataArray *array, char *name);
   int AddArray (vtkDataArray *array);
   int AddNoReplaceArray (vtkDataArray *array, char *name);
   int AddReplaceArray (vtkDataArray *array, char *name);
   int Allocate (int sz, int ext);
   void DeepCopy (vtkFieldData *da);
   virtual unsigned long GetActualMemorySize ();
   vtkDataArray *GetArray (char *arrayName, int &index);
   vtkDataArray *GetArray (char *arrayName);
   vtkDataArray *GetArray (int i);
   int GetArrayContainingComponent (int i, int &arrayComp);
   char *GetArrayName (int i);
   const char *GetClassName();
   float GetComponent (int i, int j);
   void GetField (vtkIdList *ptId, vtkFieldData *f);
   void GetField (vtkIdList &ptId, vtkFieldData &f);
   int GetNumberOfArrays ();
   int GetNumberOfComponents ();
   int GetNumberOfTuples ();
   void Initialize ();
   void InsertComponent (int i, int j, float c);
   vtkFieldData *New ();
   void Reset ();
   void SetArray (int i, vtkDataArray *);
   void SetArrayName (int i, char *name);
   void SetComponent (int i, int j, float c);
   void SetNumberOfArrays (int num);
   void SetNumberOfTuples (int number);
   void ShallowCopy (vtkFieldData *da);
   void Squeeze ();


B<vtkFieldData Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void DeepCopy (vtkFieldData &da);
      Method is marked 'Do Not Use' in its descriptions

   float *GetTuple (int i);
      Can't Handle 'float *' return type without a hint

   void GetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   int InsertNextTuple (float *tuple);
      Don't know the size of pointer arg number 1

   void InsertTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void ShallowCopy (vtkFieldData &da);
      Method is marked 'Do Not Use' in its descriptions


=cut

package Graphics::VTK::FileOutputWindow;


@Graphics::VTK::FileOutputWindow::ISA = qw( Graphics::VTK::OutputWindow );

=head1 Graphics::VTK::FileOutputWindow

=over 1

=item *

Inherits from OutputWindow

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AppendOff ();
   void AppendOn ();
   virtual void DisplayText (char *);
   void FlushOff ();
   void FlushOn ();
   int GetAppend ();
   const char *GetClassName();
   char *GetFileName ();
   int GetFlush ();
   vtkFileOutputWindow *New ();
   void SetAppend (int );
   void SetFileName (char *);
   void SetFlush (int );


B<vtkFileOutputWindow Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::FloatArray;


@Graphics::VTK::FloatArray::ISA = qw( Graphics::VTK::DataArray );

=head1 Graphics::VTK::FloatArray

=over 1

=item *

Inherits from DataArray

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int Allocate (int sz, int ext);
   void DeepCopy (vtkDataArray *fa);
   void DeepCopy (vtkDataArray &fa);
   const char *GetClassName();
   float GetComponent (int i, int j);
   int GetDataType ();
   float GetValue (int id);
   void *GetVoidPointer (int id);
   void Initialize ();
   void InsertComponent (int i, int j, float c);
   int InsertNextValue (float f);
   void InsertValue (int id, float f);
   vtkFloatArray *New ();
   void SetComponent (int i, int j, float c);
   void SetNumberOfTuples (int number);
   void SetNumberOfValues (int number);
   void SetValue (int id, float value);
   void Squeeze ();


B<vtkFloatArray Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float *GetPointer (int id);
      Can't Handle 'float *' return type without a hint

   float *GetTuple (int i);
      Can't Handle 'float *' return type without a hint

   void GetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void GetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   int InsertNextTuple (float *tuple);
      Don't know the size of pointer arg number 1

   int InsertNextTuple (double *tuple);
      Don't know the size of pointer arg number 1

   void InsertTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void InsertTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetArray (float *array, int size, int save);
      Don't know the size of pointer arg number 1

   void SetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void SetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void SetVoidArray (void *array, int size, int save);
      Method is marked 'Do Not Use' in its descriptions

   float *WritePointer (int id, int number);
      Can't Handle 'float *' return type without a hint


=cut

package Graphics::VTK::FloatNormals;


@Graphics::VTK::FloatNormals::ISA = qw( Graphics::VTK::Normals );

=head1 Graphics::VTK::FloatNormals

=over 1

=item *

Inherits from Normals

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   vtkFloatNormals *New ();
   void SetData (vtkDataArray *);
   void SetDataType (int dataType);


B<vtkFloatNormals Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float *GetPointer (int id);
      Can't Handle 'float *' return type without a hint

   float *WritePointer (int id, int number);
      Can't Handle 'float *' return type without a hint


=cut

package Graphics::VTK::FloatPoints;


@Graphics::VTK::FloatPoints::ISA = qw( Graphics::VTK::Points );

=head1 Graphics::VTK::FloatPoints

=over 1

=item *

Inherits from Points

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   vtkFloatPoints *New ();
   void SetData (vtkDataArray *);
   void SetDataType (int dataType);


B<vtkFloatPoints Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float *GetPointer (int id);
      Can't Handle 'float *' return type without a hint

   float *WritePointer (int id, int number);
      Can't Handle 'float *' return type without a hint


=cut

package Graphics::VTK::FloatScalars;


@Graphics::VTK::FloatScalars::ISA = qw( Graphics::VTK::Scalars );

=head1 Graphics::VTK::FloatScalars

=over 1

=item *

Inherits from Scalars

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   vtkFloatScalars *New ();
   void SetData (vtkDataArray *);
   void SetDataType (int dataType);


B<vtkFloatScalars Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float *GetPointer (int id);
      Can't Handle 'float *' return type without a hint

   float *WritePointer (int id, int number);
      Can't Handle 'float *' return type without a hint


=cut

package Graphics::VTK::FloatTCoords;


@Graphics::VTK::FloatTCoords::ISA = qw( Graphics::VTK::TCoords );

=head1 Graphics::VTK::FloatTCoords

=over 1

=item *

Inherits from TCoords

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   vtkFloatTCoords *New ();
   void SetData (vtkDataArray *);
   void SetDataType (int dataType);


B<vtkFloatTCoords Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float *GetPointer (int id);
      Can't Handle 'float *' return type without a hint

   float *WritePointer (int id, int number);
      Can't Handle 'float *' return type without a hint


=cut

package Graphics::VTK::FloatTensors;


@Graphics::VTK::FloatTensors::ISA = qw( Graphics::VTK::Tensors );

=head1 Graphics::VTK::FloatTensors

=over 1

=item *

Inherits from Tensors

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   vtkFloatTensors *New ();
   void SetData (vtkDataArray *);
   void SetDataType (int dataType);


B<vtkFloatTensors Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float *GetPointer (int id);
      Can't Handle 'float *' return type without a hint

   float *WritePointer (int id, int number);
      Can't Handle 'float *' return type without a hint


=cut

package Graphics::VTK::FloatVectors;


@Graphics::VTK::FloatVectors::ISA = qw( Graphics::VTK::Vectors );

=head1 Graphics::VTK::FloatVectors

=over 1

=item *

Inherits from Vectors

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   vtkFloatVectors *New ();
   void SetData (vtkDataArray *);
   void SetDataType (int dataType);


B<vtkFloatVectors Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float *GetPointer (int id);
      Can't Handle 'float *' return type without a hint

   float *WritePointer (int id, int number);
      Can't Handle 'float *' return type without a hint


=cut

package Graphics::VTK::GeneralTransform;


@Graphics::VTK::GeneralTransform::ISA = qw( Graphics::VTK::AbstractTransform );

=head1 Graphics::VTK::GeneralTransform

=over 1

=item *

Inherits from AbstractTransform

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int CircuitCheck (vtkAbstractTransform *transform);
   void Concatenate (vtkMatrix4x4 *matrix);
   void Concatenate (vtkAbstractTransform *transform);
   const char *GetClassName();
   vtkAbstractTransform *GetInput ();
   unsigned long GetMTime ();
   void Identity ();
   void Inverse ();
   vtkAbstractTransform *MakeTransform ();
   vtkGeneralTransform *New ();
   void Pop ();
   void PostMultiply ();
   void PreMultiply ();
   void Push ();
   void RotateWXYZ (double angle, double x, double y, double z);
   void RotateX (double angle);
   void RotateY (double angle);
   void RotateZ (double angle);
   void Scale (double x, double y, double z);
   void SetInput (vtkAbstractTransform *input);
   void Translate (double x, double y, double z);


B<vtkGeneralTransform Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void Concatenate (double elements[16]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InternalTransformDerivative (float in[3], float out[3], float derivative[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InternalTransformDerivative (double in[3], double out[3], double derivative[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InternalTransformPoint (float in[3], float out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InternalTransformPoint (double in[3], double out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void RotateWXYZ (double angle, double axis[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void RotateWXYZ (double angle, float axis[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Scale (double s[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Scale (float s[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Translate (double x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Translate (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::GenericCell;


@Graphics::VTK::GenericCell::ISA = qw( Graphics::VTK::Cell );

=head1 Graphics::VTK::GenericCell

=over 1

=item *

Inherits from Cell

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Clip (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *connectivity, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd, int insideOut);
   void Contour (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *verts, vtkCellArray *lines, vtkCellArray *polys, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd);
   void DeepCopy (vtkCell *c);
   int GetCellDimension ();
   int GetCellType ();
   const char *GetClassName();
   vtkCell *GetEdge (int edgeId);
   vtkCell *GetFace (int faceId);
   int GetInterpolationOrder ();
   int GetNumberOfEdges ();
   int GetNumberOfFaces ();
   vtkGenericCell *New ();
   void SetCellType (int cellType);
   void SetCellTypeToEmptyCell ();
   void SetCellTypeToHexahedron ();
   void SetCellTypeToLine ();
   void SetCellTypeToPixel ();
   void SetCellTypeToPolyLine ();
   void SetCellTypeToPolyVertex ();
   void SetCellTypeToPolygon ();
   void SetCellTypeToQuad ();
   void SetCellTypeToTetra ();
   void SetCellTypeToTriangle ();
   void SetCellTypeToTriangleStrip ();
   void SetCellTypeToVertex ();
   void SetCellTypeToVoxel ();
   void SetCellTypeToWedge ();
   void ShallowCopy (vtkCell *c);
   void ShallowCopy (vtkCell &c);
   int Triangulate (int index, vtkIdList *ptIds, vtkPoints *pts);


B<vtkGenericCell Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int CellBoundary (int subId, float pcoords[3], vtkIdList *pts);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void DeepCopy (vtkCell &c);
      Method is marked 'Do Not Use' in its descriptions

   void Derivatives (int subId, float pcoords[3], float *values, int dim, float *derivs);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateLocation (int &subId, float pcoords[3], float x[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int EvaluatePosition (float x[3], float *closestPoint, int &subId, float pcoords[3], float &dist2, float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int GetParametricCenter (float pcoords[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int IntersectWithLine (float p1[3], float p2[3], float tol, float &t, float x[3], float pcoords[3], int &subId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetCellTypeToPyramid ();
      Method is marked 'Do Not Use' in its descriptions


=cut

package Graphics::VTK::GhostLevels;


@Graphics::VTK::GhostLevels::ISA = qw( Graphics::VTK::AttributeData );

=head1 Graphics::VTK::GhostLevels

=over 1

=item *

Inherits from AttributeData

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   unsigned char GetGhostLevel (int id);
   void GetGhostLevels (vtkIdList *ptId, vtkGhostLevels *fn);
   int GetNumberOfGhostLevels ();
   void InsertGhostLevel (int id, unsigned char lev);
   int InsertNextGhostLevel (unsigned char lev);
   vtkGhostLevels *New ();
   void SetGhostLevel (int id, unsigned char lev);
   void SetNumberOfGhostLevels (int number);


B<vtkGhostLevels Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Hexahedron;


@Graphics::VTK::Hexahedron::ISA = qw( Graphics::VTK::Cell );

=head1 Graphics::VTK::Hexahedron

=over 1

=item *

Inherits from Cell

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Clip (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *tetras, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd, int insideOut);
   void Contour (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *verts, vtkCellArray *lines, vtkCellArray *polys, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd);
   int GetCellDimension ();
   int GetCellType ();
   const char *GetClassName();
   vtkCell *GetEdge (int edgeId);
   vtkCell *GetFace (int faceId);
   int GetNumberOfEdges ();
   int GetNumberOfFaces ();
   vtkHexahedron *New ();
   int Triangulate (int index, vtkIdList *ptIds, vtkPoints *pts);
   int Triangulate (int index, vtkIdList &ptIds, vtkPoints &pts);


B<vtkHexahedron Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int CellBoundary (int subId, float pcoords[3], vtkIdList *pts);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int CellBoundary (int subId, float pcoords[3], vtkIdList &pts);
      Method is marked 'Do Not Use' in its descriptions

   void Derivatives (int subId, float pcoords[3], float *values, int dim, float *derivs);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateLocation (int &subId, float pcoords[3], float x[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int EvaluatePosition (float x[3], float *closestPoint, int &subId, float pcoords[3], float &dist2, float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int *GetFaceArray (int faceId);
      Can't Handle 'int *' return type without a hint

   void InterpolationDerivs (float pcoords[3], float derivs[24]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InterpolationFunctions (float pcoords[3], float weights[8]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int IntersectWithLine (float p1[3], float p2[3], float tol, float &t, float x[3], float pcoords[3], int &subId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void JacobianInverse (float pcoords[3], double *inverse, float derivs[24]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::IdentityTransform;


@Graphics::VTK::IdentityTransform::ISA = qw( Graphics::VTK::LinearTransform );

=head1 Graphics::VTK::IdentityTransform

=over 1

=item *

Inherits from LinearTransform

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   void Inverse ();
   vtkAbstractTransform *MakeTransform ();
   vtkIdentityTransform *New ();
   void TransformNormals (vtkNormals *inNms, vtkNormals *outNms);
   void TransformPoints (vtkPoints *inPts, vtkPoints *outPts);
   void TransformPointsNormalsVectors (vtkPoints *inPts, vtkPoints *outPts, vtkNormals *inNms, vtkNormals *outNms, vtkVectors *inVrs, vtkVectors *outVrs);
   void TransformVectors (vtkVectors *inVrs, vtkVectors *outVrs);


B<vtkIdentityTransform Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void InternalTransformDerivative (float in[3], float out[3], float derivative[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InternalTransformDerivative (double in[3], double out[3], double derivative[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InternalTransformNormal (float in[3], float out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InternalTransformNormal (double in[3], double out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InternalTransformPoint (float in[3], float out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InternalTransformPoint (double in[3], double out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InternalTransformVector (float in[3], float out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InternalTransformVector (double in[3], double out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::IdList;


@Graphics::VTK::IdList::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::IdList

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int Allocate (int sz, int strategy);
   void DeepCopy (vtkIdList *ids);
   void DeleteId (int id);
   const char *GetClassName();
   int GetId (int i);
   int GetNumberOfIds ();
   void Initialize ();
   void InsertId (int i, int id);
   int InsertNextId (int id);
   int InsertUniqueId (int id);
   void IntersectWith (vtkIdList &otherIds);
   int IsId (int id);
   vtkIdList *New ();
   void Reset ();
   void SetId (int i, int id);
   void SetNumberOfIds (int number);
   void Squeeze ();


B<vtkIdList Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int *GetPointer (int i);
      Can't Handle 'int *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   int *WritePointer (int i, int number);
      Can't Handle 'int *' return type without a hint


=cut

package Graphics::VTK::ImageData;


@Graphics::VTK::ImageData::ISA = qw( Graphics::VTK::DataSet );

=head1 Graphics::VTK::ImageData

=over 1

=item *

Inherits from DataSet

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AllocateScalars ();
   void ComputeBounds ();
   void CopyStructure (vtkDataSet *ds);
   void CopyTypeSpecificInformation (vtkDataObject *image);
   void DeepCopy (vtkDataObject *src);
   int FindPoint (float x, float y, float z);
   unsigned long GetActualMemorySize ();
   void GetAxisUpdateExtent (int axis, int &min, int &max);
   void GetCell (int cellId, vtkGenericCell *cell);
   vtkCell *GetCell (int cellId);
   void GetCellPoints (int cellId, vtkIdList *ptIds);
   int GetCellType (int cellId);
   const char *GetClassName();
   int GetDataDimension ();
   int GetDataObjectType ();
   int *GetDimensions ();
      (Returns a 3-element Perl list)
   virtual unsigned long GetEstimatedMemorySize ();
   int  *GetExtent ();
      (Returns a 6-element Perl list)
   void GetIncrements (int &incX, int &incY, int &incZ);
   int GetMaxCellSize ();
   int GetNumberOfCells ();
   int GetNumberOfPoints ();
   int GetNumberOfScalarComponents ();
   float  *GetOrigin ();
      (Returns a 3-element Perl list)
   void GetPointCells (int ptId, vtkIdList *cellIds);
   float GetScalarComponentAsFloat (int x, int y, int z, int component);
   void *GetScalarPointer (int x, int y, int z);
   void *GetScalarPointer ();
   int GetScalarSize ();
   int GetScalarType ();
   double GetScalarTypeMax ();
   double GetScalarTypeMin ();
   float  *GetSpacing ();
      (Returns a 3-element Perl list)
   void GetVoxelGradient (int i, int j, int k, vtkScalars *s, vtkVectors *g);
   vtkImageToStructuredPoints *MakeImageToStructuredPoints ();
   vtkImageData *New ();
   virtual void PrepareForNewData ();
   void SetAxisUpdateExtent (int axis, int min, int max);
   void SetDimensions (int i, int j, int k);
   void SetExtent (int x1, int x2, int y1, int y2, int z1, int z2);
   void SetNumberOfScalarComponents (int n);
   void SetOrigin (float  , float , float );
   void SetScalarType (int );
   void SetSpacing (float  , float , float );
   void SetUpdateExtent (int x1, int x2, int y1, int y2, int z1, int z2);
   void SetUpdateExtent (int piece, int numPieces, int ghostLevel);
   void SetUpdateExtent (int piece, int numPieces);
   void ShallowCopy (vtkDataObject *src);
   vtkImageData *UpdateAndReturnData ();
   void UpdateData ();


B<vtkImageData Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int ComputeCellId (int ijk[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int Dimensions[3]int DataDescriptionint Increments[3]float Origin[3]float Spacing[3]int ScalarTypeint NumberOfScalarComponentsvoid ComputeIncrements ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int ComputePointId (int ijk[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int ComputeStructuredCoordinates (float x[3], int ijk[3], float pcoords[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void CopyAndCastFrom (vtkImageData *inData, int extent[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   vtkCell *FindAndGetCell (float x[3], vtkCell *cell, int cellId, float tol2, int &subId, float pcoords[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int FindCell (float x[3], vtkCell *cell, int cellId, float tol2, int &subId, float pcoords[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int FindCell (float x[3], vtkCell *cell, vtkGenericCell *gencell, int cellId, float tol2, int &subId, float pcoords[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int FindPoint (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetCellBounds (int cellId, float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetCellPoints (int cellId, vtkIdList &ptIds);
      Method is marked 'Do Not Use' in its descriptions

   void GetContinuousIncrements (int extent[6], int &incX, int &incY, int &incZ);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetDimensions (int dims[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int *GetIncrements ();
      Can't Handle 'int *' return type without a hint

   void GetIncrements (int inc[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float *GetPoint (int ptId);
      Can't Handle 'float *' return type without a hint

   void GetPointCells (int ptId, vtkIdList &cellIds);
      Method is marked 'Do Not Use' in its descriptions

   void GetPointGradient (int i, int j, int k, vtkScalars *s, float g[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetPoint (int id, float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void *GetScalarPointer (int coordinates[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void *GetScalarPointerForExtent (int coordinates[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetVoxelGradient (int i, int j, int k, vtkScalars *s, vtkVectors &g);
      Method is marked 'Do Not Use' in its descriptions

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetDimensions (int dims[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetExtent (int extent[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetOrigin (float  a[3]);
      Method is redundant. Same as SetOrigin( float, float, float)

   void SetSpacing (float  a[3]);
      Method is redundant. Same as SetSpacing( float, float, float)

   void SetUpdateExtent (int ext[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageSource;


@Graphics::VTK::ImageSource::ISA = qw( Graphics::VTK::Source );

=head1 Graphics::VTK::ImageSource

=over 1

=item *

Inherits from Source

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageData *GetOutput (int idx);
   vtkImageData *GetOutput ();
   vtkImageSource *New ();
   virtual void PropagateUpdateExtent (vtkDataObject *output);
   void SetOutput (vtkImageData *output);


B<vtkImageSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeRequiredInputUpdateExtent (int *, int *);
      Don't know the size of pointer arg number 1

   int ExecuteExtent[6]void Execute ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int *GetExecuteExtent ();
      Can't Handle 'int *' return type without a hint

   virtual void InterceptCacheUpdate ();
      Method is marked 'Do Not Use' in its descriptions


=cut

package Graphics::VTK::ImageToStructuredPoints;


@Graphics::VTK::ImageToStructuredPoints::ISA = qw( Graphics::VTK::Source );

=head1 Graphics::VTK::ImageToStructuredPoints

=over 1

=item *

Inherits from Source

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageData *GetInput ();
   vtkStructuredPoints *GetOutput (int idx);
   vtkStructuredPoints *GetOutput ();
   vtkImageData *GetVectorInput ();
   vtkImageToStructuredPoints *New ();
   void SetInput (vtkImageData *input);
   void SetVectorInput (vtkImageData *input);


B<vtkImageToStructuredPoints Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int Translate[3]void Execute ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ImplicitFunctionCollection;


@Graphics::VTK::ImplicitFunctionCollection::ISA = qw( Graphics::VTK::Collection );

=head1 Graphics::VTK::ImplicitFunctionCollection

=over 1

=item *

Inherits from Collection

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddItem (vtkImplicitFunction *);
   const char *GetClassName();
   vtkImplicitFunction *GetNextItem ();
   vtkImplicitFunctionCollection *New ();

=cut

package Graphics::VTK::Indent;


=head1 Graphics::VTK::Indent

=over 1

=item *

Inherits from 

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Delete ();
   virtual char *GetClassName ();
   vtkIndent *New ();


B<vtkIndent Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   vtkIndent GetNextIndent ();
      Can't return vtk Object Types that aren't a pointer


=cut

package Graphics::VTK::IntArray;


@Graphics::VTK::IntArray::ISA = qw( Graphics::VTK::DataArray );

=head1 Graphics::VTK::IntArray

=over 1

=item *

Inherits from DataArray

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int Allocate (int sz, int ext);
   void DeepCopy (vtkDataArray *ia);
   void DeepCopy (vtkDataArray &ia);
   const char *GetClassName();
   int GetDataType ();
   int GetValue (int id);
   void *GetVoidPointer (int id);
   void Initialize ();
   int InsertNextValue (int i);
   void InsertValue (int id, int i);
   vtkIntArray *New ();
   void SetNumberOfTuples (int number);
   void SetNumberOfValues (int number);
   void SetValue (int id, int value);
   void Squeeze ();


B<vtkIntArray Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int *GetPointer (int id);
      Can't Handle 'int *' return type without a hint

   float *GetTuple (int i);
      Can't Handle 'float *' return type without a hint

   void GetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void GetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   int InsertNextTuple (float *tuple);
      Don't know the size of pointer arg number 1

   int InsertNextTuple (double *tuple);
      Don't know the size of pointer arg number 1

   void InsertTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void InsertTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetArray (int *array, int size, int save);
      Don't know the size of pointer arg number 1

   void SetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void SetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void SetVoidArray (void *array, int size, int save);
      Don't know the size of pointer arg number 1

   int *WritePointer (int id, int number);
      Can't Handle 'int *' return type without a hint


=cut

package Graphics::VTK::Line;


@Graphics::VTK::Line::ISA = qw( Graphics::VTK::Cell );

=head1 Graphics::VTK::Line

=over 1

=item *

Inherits from Cell

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Clip (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *lines, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd, int insideOut);
   void Contour (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *verts, vtkCellArray *lines, vtkCellArray *polys, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd);
   int GetCellDimension ();
   int GetCellType ();
   const char *GetClassName();
   vtkCell *GetEdge (int );
   vtkCell *GetFace (int );
   int GetNumberOfEdges ();
   int GetNumberOfFaces ();
   vtkLine *New ();
   int Triangulate (int index, vtkIdList *ptIds, vtkPoints *pts);
   int Triangulate (int index, vtkIdList &ptIds, vtkPoints &pts);


B<vtkLine Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int CellBoundary (int subId, float pcoords[3], vtkIdList *pts);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int CellBoundary (int subId, float pcoords[3], vtkIdList &pts);
      Method is marked 'Do Not Use' in its descriptions

   void Derivatives (int subId, float pcoords[3], float *values, int dim, float *derivs);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float DistanceToLine (float x[3], float p1[3], float p2[3], float &t, float closestPoint[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float DistanceToLine (float x[3], float p1[3], float p2[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateLocation (int &subId, float pcoords[3], float x[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int EvaluatePosition (float x[3], float *closestPoint, int &subId, float pcoords[3], float &dist2, float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InterpolationFunctions (float pcoords[3], float weights[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int IntersectWithLine (float p1[3], float p2[3], float tol, float &t, float x[3], float pcoords[3], int &subId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int Intersection (float p1[3], float p2[3], float x1[3], float x2[3], float &u, float &v);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::LogLookupTable;


@Graphics::VTK::LogLookupTable::ISA = qw( Graphics::VTK::LookupTable );

=head1 Graphics::VTK::LogLookupTable

=over 1

=item *

Inherits from LookupTable

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkLogLookupTable *New ();
   void SetTableRange (float min, float max);


B<vtkLogLookupTable Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void MapScalarsThroughTable2 (void *input, unsigned char *output, int inputDataType, int numberOfValues, int inputIncrement, int outputIncrement);
      Don't know the size of pointer arg number 1

   unsigned char *MapValue (float v);
      Can't Handle 'unsigned char *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetTableRange (float r[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::LongArray;


@Graphics::VTK::LongArray::ISA = qw( Graphics::VTK::DataArray );

=head1 Graphics::VTK::LongArray

=over 1

=item *

Inherits from DataArray

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int Allocate (int sz, int ext);
   void DeepCopy (vtkDataArray *da);
   void DeepCopy (vtkDataArray &da);
   const char *GetClassName();
   int GetDataType ();
   long GetValue (int id);
   void *GetVoidPointer (int id);
   void Initialize ();
   int InsertNextValue (long );
   void InsertValue (int id, long i);
   vtkLongArray *New ();
   void SetNumberOfTuples (int number);
   void SetNumberOfValues (int number);
   void SetValue (int id, long value);
   void Squeeze ();


B<vtkLongArray Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   long *GetPointer (int id);
      Can't Handle 'long *' return type without a hint

   float *GetTuple (int i);
      Can't Handle 'float *' return type without a hint

   void GetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void GetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   int InsertNextTuple (float *tuple);
      Don't know the size of pointer arg number 1

   int InsertNextTuple (double *tuple);
      Don't know the size of pointer arg number 1

   void InsertTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void InsertTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetArray (long *array, int size, int save);
      Don't know the size of pointer arg number 1

   void SetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void SetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void SetVoidArray (void *array, int size, int save);
      Don't know the size of pointer arg number 1

   long *WritePointer (int id, int number);
      Can't Handle 'long *' return type without a hint


=cut

package Graphics::VTK::LookupTable;


@Graphics::VTK::LookupTable::ISA = qw( Graphics::VTK::ScalarsToColors );

=head1 Graphics::VTK::LookupTable

=over 1

=item *

Inherits from ScalarsToColors

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int Allocate (int sz, int ext);
   virtual void Build ();
   float  *GetAlphaRange ();
      (Returns a 2-element Perl list)
   const char *GetClassName();
   float *GetColor (float x);
      (Returns a 3-element Perl list)
   float  *GetHueRange ();
      (Returns a 2-element Perl list)
   int GetNumberOfColors ();
   float GetOpacity (float v);
   float  *GetSaturationRange ();
      (Returns a 2-element Perl list)
   float  *GetTableRange ();
      (Returns a 2-element Perl list)
   float *GetTableValue (int id);
      (Returns a 4-element Perl list)
   float  *GetValueRange ();
      (Returns a 2-element Perl list)
   vtkLookupTable *New ();
   void SetAlphaRange (float  , float );
   void SetHueRange (float  , float );
   void SetNumberOfColors (int );
   void SetNumberOfTableValues (int number);
   void SetRange (float min, float max);
   void SetSaturationRange (float  , float );
   virtual void SetTableRange (float min, float max);
   void SetTableValue (int indx, float r, float g, float b, float a);
   void SetValueRange (float  , float );


B<vtkLookupTable Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GetColor (float x, float rgb[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   unsigned char *GetPointer (int id);
      Can't Handle 'unsigned char *' return type without a hint

   float *GetRange ();
      Can't Handle 'float *' return type without a hint

   void GetTableValue (int id, float rgba[4]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void MapScalarsThroughTable2 (void *input, unsigned char *output, int inputDataType, int numberOfValues, int inputIncrement, int outputIncrement);
      Don't know the size of pointer arg number 1

   unsigned char *MapValue (float v);
      Can't Handle 'unsigned char *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetAlphaRange (float  a[2]);
      Method is redundant. Same as SetAlphaRange( float, float)

   void SetHueRange (float  a[2]);
      Method is redundant. Same as SetHueRange( float, float)

   void SetRange (float rng[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetSaturationRange (float  a[2]);
      Method is redundant. Same as SetSaturationRange( float, float)

   void SetTableRange (float r[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetTableValue (int indx, float rgba[4]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetValueRange (float  a[2]);
      Method is redundant. Same as SetValueRange( float, float)

   unsigned char *WritePointer (int id, int number);
      Can't Handle 'unsigned char *' return type without a hint


=cut

package Graphics::VTK::Mapper2D;


@Graphics::VTK::Mapper2D::ISA = qw( Graphics::VTK::AbstractMapper );

=head1 Graphics::VTK::Mapper2D

=over 1

=item *

Inherits from AbstractMapper

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkMapper2D *New ();
   virtual void RenderOpaqueGeometry (vtkViewport *, vtkActor2D *);
   virtual void RenderOverlay (vtkViewport *, vtkActor2D *);
   virtual void RenderTranslucentGeometry (vtkViewport *, vtkActor2D *);


B<vtkMapper2D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Math;


@Graphics::VTK::Math::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::Math

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float DegreesToRadians ();
   double Determinant2x2 (double a, double b, double c, double d);
   double Determinant3x3 (double a1, double a2, double a3, double b1, double b2, double b3, double c1, double c2, double c3);
   double DoubleDegreesToRadians ();
   const char *GetClassName();
   vtkMath *New ();
   float Pi ();
   float Random (float min, float max);
   float Random ();
   void RandomSeed (long s);
   double *SolveCubic (double c0, double c1, double c2, double c3);
      (Returns a 4-element Perl list)
   double *SolveQuadratic (double c0, double c1, double c2);
      (Returns a 3-element Perl list)


B<vtkMath Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void Cross (float x[3], float y[3], float z[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Cross (double x[3], double y[3], double z[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float Determinant2x2 (float c1[2], float c2[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   double Determinant3x3 (float A[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   double Determinant3x3 (double A[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float Determinant3x3 (float c1[3], float c2[3], float c3[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Diagonalize3x3 (float A[3][3], float w[3], float V[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Diagonalize3x3 (double A[3][3], double w[3], double V[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float Distance2BetweenPoints (float x[3], float y[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   double Distance2BetweenPoints (double x[3], double y[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float Dot (float x[3], float y[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float Dot2D (float x[3], float y[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   double Dot2D (double x[3], double y[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   double Dot (double x[3], double y[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   double EstimateMatrixCondition (double *A, int size);
      Don't know the size of pointer arg number 1

   void Identity3x3 (float A[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Identity3x3 (double A[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Invert3x3 (float A[3][3], float AI[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Invert3x3 (double A[3][3], double AI[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int InvertMatrix (double *A, double *AI, int size);
      Don't know the size of pointer arg number 1

   int InvertMatrix (double *A, double *AI, int size, int *tmp1Size, double *tmp2Size);
      Don't know the size of pointer arg number 1

   int Jacobi (float *a, float *w, float *v);
      Don't know the size of pointer arg number 1

   int JacobiN (float *a, int n, float *w, float *v);
      Don't know the size of pointer arg number 1

   int JacobiN (double *a, int n, double *w, double *v);
      Don't know the size of pointer arg number 1

   int Jacobi (double *a, double *w, double *v);
      Don't know the size of pointer arg number 1

   void LUFactor3x3 (float A[3][3], int index[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void LUFactor3x3 (double A[3][3], int index[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int LUFactorLinearSystem (double *A, int *index, int size);
      Don't know the size of pointer arg number 1

   int LUFactorLinearSystem (double *A, int *index, int size, double *tmpSize);
      Don't know the size of pointer arg number 1

   void LUSolve3x3 (float A[3][3], int index[3], float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void LUSolve3x3 (double A[3][3], int index[3], double x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void LUSolveLinearSystem (double *A, int *index, double *x, int size);
      Don't know the size of pointer arg number 1

   void LinearSolve3x3 (float A[3][3], float x[3], float y[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void LinearSolve3x3 (double A[3][3], double x[3], double y[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Matrix3x3ToQuaternion (float A[3][3], float quat[4]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Matrix3x3ToQuaternion (double A[3][3], double quat[4]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Multiply3x3 (float A[3][3], float x[3], float y[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Multiply3x3 (double A[3][3], double x[3], double y[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Multiply3x3 (float A[3][3], float B[3][3], float C[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Multiply3x3 (double A[3][3], double B[3][3], double C[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float Norm (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float Norm2D (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   double Norm2D (double x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   double Norm (double x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float Normalize (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float Normalize2D (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   double Normalize2D (double x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   double Normalize (double x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Orthogonalize3x3 (float A[3][3], float B[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Orthogonalize3x3 (double A[3][3], double B[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Perpendiculars (double x[3], double y[3], double z[3], double theta);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Perpendiculars (float x[3], float y[3], float z[3], double theta);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void QuaternionToMatrix3x3 (float quat[4], float A[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void QuaternionToMatrix3x3 (double quat[4], double A[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SingularValueDecomposition3x3 (float A[3][3], float U[3][3], float w[3], float VT[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SingularValueDecomposition3x3 (double A[3][3], double U[3][3], double w[3], double VT[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int SolveCubic (double c0, double c1, double c2, double c3, double *r1, double *r2, double *r3, int *num_roots);
      Don't know the size of pointer arg number 5

   int SolveLeastSquares (int numberOfSamples, double *xt, int xOrder, double *yt, int yOrder, double *mt);
      Don't know the size of pointer arg number 2

   double *SolveLinear (double c0, double c1);
      Can't Handle 'double *' return type without a hint

   int SolveLinearSystem (double *A, double *x, int size);
      Don't know the size of pointer arg number 1

   int SolveLinear (double c0, double c1, double *r1, int *num_roots);
      Don't know the size of pointer arg number 3

   int SolveQuadratic (double c0, double c1, double c2, double *r1, double *r2, int *num_roots);
      Don't know the size of pointer arg number 4

   void Transpose3x3 (float A[3][3], float AT[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Transpose3x3 (double A[3][3], double AT[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::Matrix4x4;


@Graphics::VTK::Matrix4x4::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::Matrix4x4

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Adjoint (vtkMatrix4x4 *in, vtkMatrix4x4 *out);
   void DeepCopy (vtkMatrix4x4 *source);
   double Determinant ();
   const char *GetClassName();
   void Identity ();
   void Invert (vtkMatrix4x4 *in, vtkMatrix4x4 *out);
   void Invert ();
   void Multiply4x4 (vtkMatrix4x4 *a, vtkMatrix4x4 *b, vtkMatrix4x4 *c);
   void SetElement (int i, int j, double value);
   void Transpose (vtkMatrix4x4 *in, vtkMatrix4x4 *out);
   void Transpose ();
   void Zero ();


B<vtkMatrix4x4 Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void DeepCopy (double Elements[16]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   double GetElement (int i, int j);
      Method is marked 'Do Not Use' in its descriptions

   double *MultiplyDoublePoint (double in[4]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float *MultiplyFloatPoint (float in[4]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void MultiplyPoint (float in[4], float out[4]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void MultiplyPoint (double in[4], double out[4]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float *MultiplyPoint (float in[4]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   vtkMatrix4x4 *New ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PointMultiply (float in[4], float out[4]);
      Method is marked 'Do Not Use' in its descriptions

   void PointMultiply (double in[4], double out[4]);
      Method is marked 'Do Not Use' in its descriptions

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::MatrixToHomogeneousTransform;


@Graphics::VTK::MatrixToHomogeneousTransform::ISA = qw( Graphics::VTK::HomogeneousTransform );

=head1 Graphics::VTK::MatrixToHomogeneousTransform

=over 1

=item *

Inherits from HomogeneousTransform

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkMatrix4x4 *GetInput ();
   unsigned long GetMTime ();
   void Inverse ();
   vtkAbstractTransform *MakeTransform ();
   vtkMatrixToHomogeneousTransform *New ();
   void SetInput (vtkMatrix4x4 *);
   void SetMatrix (vtkMatrix4x4 *matrix);


B<vtkMatrixToHomogeneousTransform Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::MatrixToLinearTransform;


@Graphics::VTK::MatrixToLinearTransform::ISA = qw( Graphics::VTK::LinearTransform );

=head1 Graphics::VTK::MatrixToLinearTransform

=over 1

=item *

Inherits from LinearTransform

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkMatrix4x4 *GetInput ();
   unsigned long GetMTime ();
   void Inverse ();
   vtkAbstractTransform *MakeTransform ();
   vtkMatrixToLinearTransform *New ();
   void SetInput (vtkMatrix4x4 *);
   void SetMatrix (vtkMatrix4x4 *matrix);


B<vtkMatrixToLinearTransform Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::MergePoints2D;


@Graphics::VTK::MergePoints2D::ISA = qw( Graphics::VTK::PointLocator2D );

=head1 Graphics::VTK::MergePoints2D

=over 1

=item *

Inherits from PointLocator2D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkMergePoints2D *New ();


B<vtkMergePoints2D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int IsInsertedPoint (float x[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::MultiThreader;


@Graphics::VTK::MultiThreader::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::MultiThreader

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetGlobalDefaultNumberOfThreads ();
   int GetGlobalMaximumNumberOfThreads ();
   int GetNumberOfThreads ();
   vtkMultiThreader *New ();
   void SetGlobalDefaultNumberOfThreads (int val);
   void SetGlobalMaximumNumberOfThreads (int val);
   void SetNumberOfThreads (int );


B<vtkMultiThreader Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::MutexLock;


@Graphics::VTK::MutexLock::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::MutexLock

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   void Lock (void );
   vtkMutexLock *New ();
   void Unlock (void );


B<vtkMutexLock Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Normals;


@Graphics::VTK::Normals::ISA = qw( Graphics::VTK::AttributeData );

=head1 Graphics::VTK::Normals

=over 1

=item *

Inherits from AttributeData

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float *GetNormal (int id);
      (Returns a 3-element Perl list)
   void GetNormals (vtkIdList &ptId, vtkNormals &fn);
   void GetNormals (vtkIdList *ptId, vtkNormals *fn);
   int GetNumberOfNormals ();
   int InsertNextNormal (double nx, double ny, double nz);
   void InsertNormal (int id, double nx, double ny, double nz);
   vtkNormals *New (int dataType);
   vtkNormals *New ();
   void SetNormal (int id, double nx, double ny, double nz);
   void SetNumberOfNormals (int number);


B<vtkNormals Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GetNormal (int id, float n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetNormal (int id, double n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int InsertNextNormal (float n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int InsertNextNormal (double n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InsertNormal (int id, double n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InsertNormal (int id, float n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetNormal (int id, float n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetNormal (int id, double n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::Object;


=head1 Graphics::VTK::Object

=over 1

=item *

Inherits from 

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BreakOnError ();
   virtual void DebugOff ();
   virtual void DebugOn ();
   virtual void Delete ();
   virtual char *GetClassName ();
   unsigned char GetDebug ();
   int GetGlobalWarningDisplay ();
   virtual unsigned long GetMTime ();
   int GetReferenceCount ();
   void GlobalWarningDisplayOff ();
   void GlobalWarningDisplayOn ();
   int HasObserver (char *event);
   int IsTypeOf (char *name);
   virtual void Modified ();
   vtkObject *New ();
   void Register (vtkObject *o);
   void RemoveObserver (unsigned long tag);
   vtkObject *SafeDownCast (vtkObject *o);
   void SetDebug (unsigned char debugFlag);
   void SetGlobalWarningDisplay (int val);
   void SetReferenceCount (int );
   virtual void UnRegister (vtkObject *o);


B<vtkObject Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int HasObserver (unsigned long event);
      Can't Handle Function Signature for this overloaded method

   void *new size_t tSize
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void delete void p
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void vtkObject
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Print (ostream &os);
      I/O Streams not Supported yet

   virtual void PrintHeader (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   virtual void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   virtual void PrintTrailer (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::OutputWindow;


@Graphics::VTK::OutputWindow::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::OutputWindow

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual void DisplayText (char *);
   const char *GetClassName();
   vtkOutputWindow *GetInstance ();
   vtkOutputWindow *New ();
   void PromptUserOff ();
   void PromptUserOn ();
   void SetInstance (vtkOutputWindow *instance);
   void SetPromptUser (int );


B<vtkOutputWindow Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::PerspectiveTransform;


@Graphics::VTK::PerspectiveTransform::ISA = qw( Graphics::VTK::HomogeneousTransform );

=head1 Graphics::VTK::PerspectiveTransform

=over 1

=item *

Inherits from HomogeneousTransform

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AdjustViewport (double oldXMin, double oldXMax, double oldYMin, double oldYMax, double newXMin, double newXMax, double newYMin, double newYMax);
   void AdjustZBuffer (double oldNearZ, double oldFarZ, double newNearZ, double newFarZ);
   int CircuitCheck (vtkAbstractTransform *transform);
   void Concatenate (vtkMatrix4x4 *matrix);
   void Concatenate (vtkHomogeneousTransform *transform);
   void Frustum (double xmin, double xmax, double ymin, double ymax, double znear, double zfar);
   const char *GetClassName();
   vtkHomogeneousTransform *GetInput ();
   unsigned long GetMTime ();
   void Identity ();
   void Inverse ();
   vtkAbstractTransform *MakeTransform ();
   vtkPerspectiveTransform *New ();
   void Ortho (double xmin, double xmax, double ymin, double ymax, double znear, double zfar);
   void Perspective (double angle, double aspect, double znear, double zfar);
   void Pop ();
   void PostMultiply ();
   void PreMultiply ();
   void Push ();
   void RotateWXYZ (double angle, double x, double y, double z);
   void RotateX (double angle);
   void RotateY (double angle);
   void RotateZ (double angle);
   void Scale (double x, double y, double z);
   void SetInput (vtkHomogeneousTransform *input);
   void SetMatrix (vtkMatrix4x4 *matrix);
   void Shear (double dxdz, double dydz, double zplane);
   void Stereo (double angle, double focaldistance);
   void Translate (double x, double y, double z);


B<vtkPerspectiveTransform Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void Concatenate (double elements[16]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void RotateWXYZ (double angle, double axis[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void RotateWXYZ (double angle, float axis[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Scale (double s[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Scale (float s[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetMatrix (double elements[16]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetupCamera (double position[3], double focalpoint[3], double viewup[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Translate (double x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Translate (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::Pixel;


@Graphics::VTK::Pixel::ISA = qw( Graphics::VTK::Cell );

=head1 Graphics::VTK::Pixel

=over 1

=item *

Inherits from Cell

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Clip (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *polys, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd, int insideOut);
   void Contour (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *verts, vtkCellArray *lines, vtkCellArray *polys, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd);
   int GetCellDimension ();
   int GetCellType ();
   const char *GetClassName();
   vtkCell *GetEdge (int edgeId);
   vtkCell *GetFace (int );
   int GetNumberOfEdges ();
   int GetNumberOfFaces ();
   vtkPixel *New ();
   int Triangulate (int index, vtkIdList *ptIds, vtkPoints *pts);
   int Triangulate (int index, vtkIdList &ptIds, vtkPoints &pts);


B<vtkPixel Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int CellBoundary (int subId, float pcoords[3], vtkIdList *pts);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int CellBoundary (int subId, float pcoords[3], vtkIdList &pts);
      Method is marked 'Do Not Use' in its descriptions

   void Derivatives (int subId, float pcoords[3], float *values, int dim, float *derivs);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateLocation (int &subId, float pcoords[3], float x[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int EvaluatePosition (float x[3], float *closestPoint, int &subId, float pcoords[3], float &dist2, float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InterpolationDerivs (float pcoords[3], float derivs[8]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InterpolationFunctions (float pcoords[3], float weights[4]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int IntersectWithLine (float p1[3], float p2[3], float tol, float &t, float x[3], float pcoords[3], int &subId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::Plane;


@Graphics::VTK::Plane::ISA = qw( Graphics::VTK::ImplicitFunction );

=head1 Graphics::VTK::Plane

=over 1

=item *

Inherits from ImplicitFunction

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float EvaluateFunction (float x, float y, float z);
   const char *GetClassName();
   float  *GetNormal ();
      (Returns a 3-element Perl list)
   float  *GetOrigin ();
      (Returns a 3-element Perl list)
   vtkPlane *New ();
   void SetNormal (float  , float , float );
   void SetOrigin (float  , float , float );


B<vtkPlane Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float DistanceToPlane (float x[3], float n[3], float p0[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float Evaluate (float normal[3], float origin[3], float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float EvaluateFunction (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateGradient (float x[3], float g[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float Evaluate (double normal[3], double origin[3], double x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GeneralizedProjectPoint (float x[3], float origin[3], float normal[3], float xproj[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int IntersectWithLine (float p1[3], float p2[3], float n[3], float p0[3], float &t, float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ProjectPoint (float x[3], float origin[3], float normal[3], float xproj[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ProjectPoint (double x[3], double origin[3], double normal[3], double xproj[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetNormal (float  a[3]);
      Method is redundant. Same as SetNormal( float, float, float)

   void SetOrigin (float  a[3]);
      Method is redundant. Same as SetOrigin( float, float, float)


=cut

package Graphics::VTK::PlaneCollection;


@Graphics::VTK::PlaneCollection::ISA = qw( Graphics::VTK::Collection );

=head1 Graphics::VTK::PlaneCollection

=over 1

=item *

Inherits from Collection

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddItem (vtkPlane *);
   const char *GetClassName();
   vtkPlane *GetNextItem ();
   vtkPlaneCollection *New ();

=cut

package Graphics::VTK::PointData;


@Graphics::VTK::PointData::ISA = qw( Graphics::VTK::DataSetAttributes );

=head1 Graphics::VTK::PointData

=over 1

=item *

Inherits from DataSetAttributes

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkPointData *New ();
   void NullPoint (int ptId);


B<vtkPointData Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::PointLocator;


@Graphics::VTK::PointLocator::ISA = qw( Graphics::VTK::Locator );

=head1 Graphics::VTK::PointLocator

=over 1

=item *

Inherits from Locator

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BuildLocator ();
   virtual void FindClosestNPoints (int N, float x, float y, float z, vtkIdList *result);
   int FindClosestPoint (float x, float y, float z);
   virtual void FindDistributedPoints (int N, float x, float y, float z, vtkIdList *result, int M);
   virtual void FindPointsWithinRadius (float R, float x, float y, float z, vtkIdList *result);
   void FreeSearchStructure ();
   void GenerateRepresentation (int level, vtkPolyData *pd);
   const char *GetClassName();
   int  *GetDivisions ();
      (Returns a 3-element Perl list)
   int GetNumberOfPointsPerBucket ();
   void Initialize ();
   int IsInsertedPoint (float x, float y, float z);
   vtkPointLocator *New ();
   void SetDivisions (int  , int , int );
   void SetNumberOfPointsPerBucket (int );


B<vtkPointLocator Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float Distance2ToBounds (float x[3], float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float Distance2ToBucket (float x[3], int nei[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual int FindClosestInsertedPoint (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void FindClosestNPoints (int N, float x[3], vtkIdList *result);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual int FindClosestPoint (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int FindClosestPointWithinRadius (float radius, float x[3], float &dist2);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int FindClosestPointWithinRadius (float radius, float x[3], float inputDataLength, float &dist2);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void FindDistributedPoints (int N, float x[3], vtkIdList *result, int M);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void FindPointsWithinRadius (float R, float x[3], vtkIdList *result);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetBucketNeighbors (vtkNeighborPoints *buckets, int ijk[3], int ndivs[3], int level);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetOverlappingBuckets (vtkNeighborPoints *buckets, float x[3], int ijk[3], float dist, int level);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetOverlappingBuckets (vtkNeighborPoints *buckets, float x[3], float dist, int prevMinLevel[3], int prevMaxLevel[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual vtkIdList *GetPointsInBucket (float x[3], int ijk[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual int InitPointInsertion (vtkPoints *newPts, float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual int InitPointInsertion (vtkPoints *newPts, float bounds[6], int estSize);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual int InsertNextPoint (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void InsertPoint (int ptId, float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual int InsertUniquePoint (float x[3], int &ptId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual int IsInsertedPoint (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetDivisions (int  a[3]);
      Method is redundant. Same as SetDivisions( int, int, int)


=cut

package Graphics::VTK::PointLocator2D;


@Graphics::VTK::PointLocator2D::ISA = qw( Graphics::VTK::Locator );

=head1 Graphics::VTK::PointLocator2D

=over 1

=item *

Inherits from Locator

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BuildLocator ();
   virtual void FindClosestNPoints (int N, float x, float y, vtkIdList *result);
   virtual void FindDistributedPoints (int N, float x, float y, vtkIdList *result, int M);
   virtual void FindPointsWithinRadius (float R, float x, float y, vtkIdList *result);
   void FreeSearchStructure ();
   void GenerateRepresentation (int level, vtkPolyData *pd);
   const char *GetClassName();
   int  *GetDivisions ();
      (Returns a 2-element Perl list)
   int GetNumberOfPointsPerBucket ();
   vtkPoints *GetPoints ();
   void Initialize ();
   vtkPointLocator2D *New ();
   void SetDivisions (int  , int );
   void SetNumberOfPointsPerBucket (int );
   void SetPoints (vtkPoints *);


B<vtkPointLocator2D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void FindClosestNPoints (int N, float x[2], vtkIdList *result);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual int FindClosestPoint (float x[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void FindDistributedPoints (int N, float x[2], vtkIdList *result, int M);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void FindPointsWithinRadius (float R, float x[2], vtkIdList *result);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetBucketNeighbors (int ijk[2], int ndivs[2], int level);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetOverlappingBuckets (float x[2], int ijk[2], float dist, int level);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual int IsInsertedPoint (float x[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetDivisions (int  a[2]);
      Method is redundant. Same as SetDivisions( int, int)


=cut

package Graphics::VTK::Points;


@Graphics::VTK::Points::ISA = qw( Graphics::VTK::AttributeData );

=head1 Graphics::VTK::Points

=over 1

=item *

Inherits from AttributeData

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual void ComputeBounds ();
   float *GetBounds ();
      (Returns a 6-element Perl list)
   const char *GetClassName();
   int GetNumberOfPoints ();
   float *GetPoint (int id);
      (Returns a 3-element Perl list)
   void GetPoints (vtkIdList &ptId, vtkPoints &fp);
   void GetPoints (vtkIdList *ptId, vtkPoints *fp);
   int InsertNextPoint (double x, double y, double z);
   void InsertPoint (int id, double x, double y, double z);
   vtkPoints *New ();
   void SetNumberOfPoints (int number);
   void SetPoint (int id, double x, double y, double z);


B<vtkPoints Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GetBounds (float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetPoint (int id, float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetPoint (int id, double x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int InsertNextPoint (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int InsertNextPoint (double x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InsertPoint (int id, float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InsertPoint (int id, double x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetPoint (int id, float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetPoint (int id, double x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::PolyData;


@Graphics::VTK::PolyData::ISA = qw( Graphics::VTK::PointSet );

=head1 Graphics::VTK::PolyData

=over 1

=item *

Inherits from PointSet

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddCellReference (int cellId);
   void AddReferenceToCell (int ptId, int cellId);
   void Allocate (int numCells, int extSize);
   void BuildCells ();
   void BuildLinks ();
   void ComputeBounds ();
   void CopyCells (vtkPolyData *pd, vtkIdList *idList, vtkPointLocator *locatorNULL);
   void CopyStructure (vtkDataSet *ds);
   void DeepCopy (vtkDataObject *src);
   void DeleteCell (int cellId);
   void DeleteCells ();
   void DeleteLinks ();
   void DeletePoint (int ptId);
   unsigned long GetActualMemorySize ();
   void GetCell (int cellId, vtkGenericCell *cell);
   vtkCell *GetCell (int cellId);
   void GetCellEdgeNeighbors (int cellId, int p1, int p2, vtkIdList &cellIds);
   void GetCellEdgeNeighbors (int cellId, int p1, int p2, vtkIdList *cellIds);
   void GetCellNeighbors (int cellId, vtkIdList *ptIds, vtkIdList *cellIds);
   void GetCellPoints (int cellId, vtkIdList *ptIds);
   int GetCellType (int cellId);
   const char *GetClassName();
   int GetDataObjectType ();
   int GetGhostLevel ();
   vtkCellArray *GetLines ();
   int GetMaxCellSize ();
   int GetNumberOfCells ();
   int GetNumberOfLines ();
   int GetNumberOfPieces ();
   int GetNumberOfPolys ();
   int GetNumberOfStrips ();
   int GetNumberOfVerts ();
   int GetPiece ();
   void GetPointCells (int ptId, vtkIdList *cellIds);
   vtkCellArray *GetPolys ();
   vtkCellArray *GetStrips ();
   void GetUpdateExtent (int &piece, int &numPieces, int &ghostLevel);
   int  *GetUpdateExtent ();
      (Returns a 6-element Perl list)
   vtkCellArray *GetVerts ();
   virtual void Initialize ();
   int InsertNextCell (int type, vtkIdList *pts);
   int IsEdge (int v1, int v2);
   int IsPointUsedByCell (int ptId, int cellId);
   int IsTriangle (int v1, int v2, int v3);
   vtkPolyData *New ();
   void RemoveCellReference (int cellId);
   void RemoveReferenceToCell (int ptId, int cellId);
   void ReplaceCellPoint (int cellId, int oldPtId, int newPtId);
   void Reset ();
   void ResizeCellList (int ptId, int size);
   void ReverseCell (int cellId);
   void SetLines (vtkCellArray *l);
   void SetPolys (vtkCellArray *p);
   void SetStrips (vtkCellArray *s);
   void SetUpdateExtent (int x1, int x2, int y1, int y2, int z1, int z2);
   void SetUpdateExtent (int piece, int numPieces, int ghostLevel);
   void SetUpdateExtent (int piece, int numPieces);
   void SetVerts (vtkCellArray *v);
   void ShallowCopy (vtkDataObject *src);
   void Squeeze ();


B<vtkPolyData Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GetCellBounds (int cellId, float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetCellPoints (int cellId, int &npts, int &pts);
      Don't know the size of pointer arg number 3

   void GetCellPoints (int cellId, vtkIdList &ptIds);
      Method is marked 'Do Not Use' in its descriptions

   void GetPointCells (int ptId, unsigned short &ncells, int &cells);
      Arg types of 'unsigned short &' not supported yet
   void GetPointCells (int ptId, vtkIdList &cellIds);
      Method is marked 'Do Not Use' in its descriptions

   int InsertNextCell (int type, int npts, int *pts);
      Don't know the size of pointer arg number 3

   int InsertNextCell (int type, vtkIdList &pts);
      Method is marked 'Do Not Use' in its descriptions

   int InsertNextLinkedCell (int type, int npts, int *pts);
      Don't know the size of pointer arg number 3

   int InsertNextLinkedPoint (float x[3], int numLinks);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ReplaceCell (int cellId, int npts, int *pts);
      Don't know the size of pointer arg number 3

   void ReplaceLinkedCell (int cellId, int npts, int *pts);
      Don't know the size of pointer arg number 3

   void SetUpdateExtent (int ext[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::PolyDataSource;


@Graphics::VTK::PolyDataSource::ISA = qw( Graphics::VTK::Source );

=head1 Graphics::VTK::PolyDataSource

=over 1

=item *

Inherits from Source

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkPolyData *GetOutput (int idx);
   vtkPolyData *GetOutput ();
   vtkPolyDataSource *New ();
   void SetOutput (vtkPolyData *output);

=cut

package Graphics::VTK::PolyLine;


@Graphics::VTK::PolyLine::ISA = qw( Graphics::VTK::Cell );

=head1 Graphics::VTK::PolyLine

=over 1

=item *

Inherits from Cell

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Clip (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *lines, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd, int insideOut);
   void Contour (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *verts, vtkCellArray *lines, vtkCellArray *polys, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd);
   int GenerateSlidingNormals (vtkPoints *, vtkCellArray *, vtkNormals *);
   int GetCellDimension ();
   int GetCellType ();
   const char *GetClassName();
   vtkCell *GetEdge (int );
   vtkCell *GetFace (int );
   int GetNumberOfEdges ();
   int GetNumberOfFaces ();
   vtkPolyLine *New ();
   int Triangulate (int index, vtkIdList *ptIds, vtkPoints *pts);
   int Triangulate (int index, vtkIdList &ptIds, vtkPoints &pts);


B<vtkPolyLine Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int CellBoundary (int subId, float pcoords[3], vtkIdList *pts);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int CellBoundary (int subId, float pcoords[3], vtkIdList &pts);
      Method is marked 'Do Not Use' in its descriptions

   void Derivatives (int subId, float pcoords[3], float *values, int dim, float *derivs);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateLocation (int &subId, float pcoords[3], float x[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int EvaluatePosition (float x[3], float *closestPoint, int &subId, float pcoords[3], float &dist2, float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int GetParametricCenter (float pcoords[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int IntersectWithLine (float p1[3], float p2[3], float tol, float &t, float x[3], float pcoords[3], int &subId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::PolyVertex;


@Graphics::VTK::PolyVertex::ISA = qw( Graphics::VTK::Cell );

=head1 Graphics::VTK::PolyVertex

=over 1

=item *

Inherits from Cell

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Clip (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *verts, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd, int insideOut);
   void Contour (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *verts, vtkCellArray *lines, vtkCellArray *polys, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd);
   int GetCellDimension ();
   int GetCellType ();
   const char *GetClassName();
   vtkCell *GetEdge (int );
   vtkCell *GetFace (int );
   int GetNumberOfEdges ();
   int GetNumberOfFaces ();
   vtkPolyVertex *New ();
   int Triangulate (int index, vtkIdList *ptIds, vtkPoints *pts);
   int Triangulate (int index, vtkIdList &ptIds, vtkPoints &pts);


B<vtkPolyVertex Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int CellBoundary (int subId, float pcoords[3], vtkIdList *pts);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int CellBoundary (int subId, float pcoords[3], vtkIdList &pts);
      Method is marked 'Do Not Use' in its descriptions

   void Derivatives (int subId, float pcoords[3], float *values, int dim, float *derivs);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateLocation (int &subId, float pcoords[3], float x[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int EvaluatePosition (float x[3], float *closestPoint, int &subId, float pcoords[3], float &dist2, float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int GetParametricCenter (float pcoords[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int IntersectWithLine (float p1[3], float p2[3], float tol, float &t, float x[3], float pcoords[3], int &subId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::Polygon;


@Graphics::VTK::Polygon::ISA = qw( Graphics::VTK::Cell );

=head1 Graphics::VTK::Polygon

=over 1

=item *

Inherits from Cell

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Clip (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *tris, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd, int insideOut);
   void Contour (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *verts, vtkCellArray *lines, vtkCellArray *polys, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd);
   int GetCellDimension ();
   int GetCellType ();
   const char *GetClassName();
   vtkCell *GetEdge (int edgeId);
   vtkCell *GetFace (int );
   int GetNumberOfEdges ();
   int GetNumberOfFaces ();
   vtkPolygon *New ();
   int Triangulate (int index, vtkIdList *ptIds, vtkPoints *pts);
   int Triangulate (vtkIdList *outTris);
   int Triangulate (vtkIdList &outTris);


B<vtkPolygon Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int CellBoundary (int subId, float pcoords[3], vtkIdList *pts);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int CellBoundary (int subId, float pcoords[3], vtkIdList &pts);
      Method is marked 'Do Not Use' in its descriptions

   void ComputeNormal (vtkPoints *p, int numPts, int *pts, float n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeNormal (vtkPoints *p, float n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeNormal (int numPts, float *pts, float n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeWeights (float x[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Derivatives (int subId, float pcoords[3], float *values, int dim, float *derivs);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float Toleranceint SuccessfulTriangulationfloat Normal[3]vtkIdList *TrisvtkTriangle *TrianglevtkQuad *QuadvtkScalars *TriScalarsvtkLine *Lineint EarCutTriangulation ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateLocation (int &subId, float pcoords[3], float x[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int EvaluatePosition (float x[3], float *closestPoint, int &subId, float pcoords[3], float &dist2, float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int IntersectPolygonWithPolygon (int npts, float *pts, float bounds[6], int npts2, float *pts2, float bounds2[3], float tol, float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int IntersectWithLine (float p1[3], float p2[3], float tol, float &t, float x[3], float pcoords[3], int &subId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int ParameterizePolygon (float p0[3], float p10[3], float &l10, float p20[3], float &l20, float n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int PointInPolygon (float x[3], int numPts, float *pts, float bounds[6], float n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int Triangulate (int index, vtkIdList &ptIds, vtkPoints &pts);
      Method is marked 'Do Not Use' in its descriptions


=cut

package Graphics::VTK::PriorityQueue;


@Graphics::VTK::PriorityQueue::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::PriorityQueue

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Allocate (int sz, int ext);
   float DeleteId (int id);
   const char *GetClassName();
   int GetNumberOfItems ();
   float GetPriority (int id);
   void Insert (float priority, int id);
   vtkPriorityQueue *New ();
   int Peek (float &priority, int location);
   int Peek (int location);
   int Pop (float &priority, int location);
   int Pop (int location);
   void Reset ();


B<vtkPriorityQueue Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ProcessObject;


@Graphics::VTK::ProcessObject::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::ProcessObject

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AbortExecuteOff ();
   void AbortExecuteOn ();
   int GetAbortExecute ();
   const char *GetClassName();
   int GetNumberOfInputs ();
   float GetProgress ();
   char *GetProgressText ();
   vtkProcessObject *New ();
   void RemoveAllInputs ();
   void SetAbortExecute (int );
   void SetEndMethod (void (*func)(void *) , void *arg);
   void SetProgress (float );
   void SetProgressMethod (void (*func)(void *) , void *arg);
   void SetProgressText (char *);
   void SetStartMethod (void (*func)(void *) , void *arg);
   void SqueezeInputArray ();
   void UpdateProgress (float amount);


B<vtkProcessObject Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int AbortExecutevtkDataObject *GetInputs ();
      Can't Handle 'vtkDataObject**' return type yet

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetEndMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetProgressMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetStartMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::Prop;


@Graphics::VTK::Prop::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::Prop

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void DragableOff ();
   void DragableOn ();
   virtual void GetActors (vtkPropCollection *);
   virtual void GetActors2D (vtkPropCollection *);
   const char *GetClassName();
   int GetDragable ();
   virtual vtkMatrix4x4 *GetMatrix ();
   virtual vtkMatrix4x4 *GetMatrixPointer ();
   virtual vtkAssemblyPath *GetNextPath ();
   virtual int GetNumberOfPaths ();
   int GetPickable ();
   virtual unsigned long GetRedrawMTime ();
   int GetVisibility ();
   virtual void GetVolumes (vtkPropCollection *);
   virtual void InitPathTraversal ();
   vtkProp *New ();
   virtual void Pick ();
   void PickableOff ();
   void PickableOn ();
   virtual void PokeMatrix (vtkMatrix4x4 *);
   void SetDragable (int );
   void SetPickMethod (void (*func)(void *) , void *arg);
   void SetPickable (int );
   void SetVisibility (int );
   virtual void ShallowCopy (vtkProp *prop);
   void VisibilityOff ();
   void VisibilityOn ();


B<vtkProp Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual float *GetBounds ();
      Can't Handle 'float *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetPickMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::PropAssembly;


@Graphics::VTK::PropAssembly::ISA = qw( Graphics::VTK::Prop );

=head1 Graphics::VTK::PropAssembly

=over 1

=item *

Inherits from Prop

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddPart (vtkProp *);
   const char *GetClassName();
   unsigned long GetMTime ();
   vtkAssemblyPath *GetNextPath ();
   int GetNumberOfPaths ();
   vtkPropCollection *GetParts ();
   void InitPathTraversal ();
   int InitializeRayCasting (vtkViewport *);
   vtkPropAssembly *New ();
   void ReleaseGraphicsResources (vtkWindow *);
   void RemovePart (vtkProp *);
   int RenderIntoImage (vtkViewport *);
   int RenderOpaqueGeometry (vtkViewport *ren);
   int RenderOverlay (vtkViewport *);
   int RenderTranslucentGeometry (vtkViewport *ren);
   void ShallowCopy (vtkProp *Prop);


B<vtkPropAssembly Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int CastViewRay (VTKRayCastRayInfo *);
      Don't know the size of pointer arg number 1

   float *GetBounds ();
      Can't Handle 'float *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   vtkPropCollection *Partsfloat Bounds[6]vtkTimeStamp PathTimevoid UpdatePaths ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::PropCollection;


@Graphics::VTK::PropCollection::ISA = qw( Graphics::VTK::Collection );

=head1 Graphics::VTK::PropCollection

=over 1

=item *

Inherits from Collection

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddItem (vtkProp *a);
   const char *GetClassName();
   vtkProp *GetLastProp ();
   vtkProp *GetNextProp ();
   int GetNumberOfPaths ();
   vtkPropCollection *New ();

=cut

package Graphics::VTK::Property2D;


@Graphics::VTK::Property2D::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::Property2D

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void DeepCopy (vtkProperty2D *p);
   const char *GetClassName();
   float  *GetColor ();
      (Returns a 3-element Perl list)
   int GetDisplayLocation ();
   float GetLineWidth ();
   float GetOpacity ();
   float GetPointSize ();
   vtkProperty2D *New ();
   virtual void Render (vtkViewport *);
   void SetColor (float  , float , float );
   void SetDisplayLocation (int );
   void SetDisplayLocationToBackground ();
   void SetDisplayLocationToForeground ();
   void SetLineWidth (float );
   void SetOpacity (float );
   void SetPointSize (float );


B<vtkProperty2D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetColor (float  a[3]);
      Method is redundant. Same as SetColor( float, float, float)


=cut

package Graphics::VTK::Pyramid;


@Graphics::VTK::Pyramid::ISA = qw( Graphics::VTK::Cell );

=head1 Graphics::VTK::Pyramid

=over 1

=item *

Inherits from Cell

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Clip (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *cells, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd, int insideOut);
   void Contour (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *verts, vtkCellArray *lines, vtkCellArray *polys, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd);
   int GetCellDimension ();
   int GetCellType ();
   const char *GetClassName();
   vtkCell *GetEdge (int edgeId);
   vtkCell *GetFace (int faceId);
   int GetNumberOfEdges ();
   int GetNumberOfFaces ();
   vtkPyramid *New ();
   int Triangulate (int index, vtkIdList *ptIds, vtkPoints *pts);


B<vtkPyramid Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int CellBoundary (int subId, float pcoords[3], vtkIdList *pts);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Derivatives (int subId, float pcoords[3], float *values, int dim, float *derivs);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateLocation (int &subId, float pcoords[3], float x[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int EvaluatePosition (float x[3], float *closestPoint, int &subId, float pcoords[3], float &dist2, float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int *GetFaceArray (int faceId);
      Can't Handle 'int *' return type without a hint

   int GetParametricCenter (float pcoords[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InterpolationDerivs (float pcoords[3], float derivs[15]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InterpolationFunctions (float pcoords[3], float weights[5]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int IntersectWithLine (float p1[3], float p2[3], float tol, float &t, float x[3], float pcoords[3], int &subId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int JacobianInverse (float pcoords[3], double *inverse, float derivs[15]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::Quad;


@Graphics::VTK::Quad::ISA = qw( Graphics::VTK::Cell );

=head1 Graphics::VTK::Quad

=over 1

=item *

Inherits from Cell

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Clip (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *polys, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd, int insideOut);
   void Contour (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *verts, vtkCellArray *lines, vtkCellArray *polys, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd);
   int GetCellDimension ();
   int GetCellType ();
   const char *GetClassName();
   vtkCell *GetEdge (int edgeId);
   vtkCell *GetFace (int );
   int GetNumberOfEdges ();
   int GetNumberOfFaces ();
   vtkQuad *New ();
   int Triangulate (int index, vtkIdList *ptIds, vtkPoints *pts);
   int Triangulate (int index, vtkIdList &ptIds, vtkPoints &pts);


B<vtkQuad Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int CellBoundary (int subId, float pcoords[3], vtkIdList *pts);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int CellBoundary (int subId, float pcoords[3], vtkIdList &pts);
      Method is marked 'Do Not Use' in its descriptions

   void Derivatives (int subId, float pcoords[3], float *values, int dim, float *derivs);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateLocation (int &subId, float pcoords[3], float x[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int EvaluatePosition (float x[3], float *closestPoint, int &subId, float pcoords[3], float &dist2, float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InterpolationDerivs (float pcoords[3], float derivs[8]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InterpolationFunctions (float pcoords[3], float sf[4]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int IntersectWithLine (float p1[3], float p2[3], float tol, float &t, float x[3], float pcoords[3], int &subId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::Quadric;


@Graphics::VTK::Quadric::ISA = qw( Graphics::VTK::ImplicitFunction );

=head1 Graphics::VTK::Quadric

=over 1

=item *

Inherits from ImplicitFunction

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float EvaluateFunction (float x, float y, float z);
   const char *GetClassName();
   float  *GetCoefficients ();
      (Returns a 10-element Perl list)
   vtkQuadric *New ();
   void SetCoefficients (float a0, float a1, float a2, float a3, float a4, float a5, float a6, float a7, float a8, float a9);


B<vtkQuadric Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float EvaluateFunction (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateGradient (float x[3], float g[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetCoefficients (float a[10]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::RectilinearGrid;


@Graphics::VTK::RectilinearGrid::ISA = qw( Graphics::VTK::DataSet );

=head1 Graphics::VTK::RectilinearGrid

=over 1

=item *

Inherits from DataSet

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ComputeBounds ();
   void CopyStructure (vtkDataSet *ds);
   void DeepCopy (vtkDataObject *src);
   int FindPoint (float x, float y, float z);
   unsigned long GetActualMemorySize ();
   void GetCell (int cellId, vtkGenericCell *cell);
   vtkCell *GetCell (int cellId);
   void GetCellNeighbors (int cellId, vtkIdList *ptIds, vtkIdList *cellIds);
   void GetCellPoints (int cellId, vtkIdList *ptIds);
   int GetCellType (int cellId);
   const char *GetClassName();
   int GetDataDimension ();
   int GetDataObjectType ();
   int  *GetDimensions ();
      (Returns a 3-element Perl list)
   int  *GetExtent ();
      (Returns a 6-element Perl list)
   int GetMaxCellSize ();
   int GetNumberOfCells ();
   int GetNumberOfPoints ();
   void GetPointCells (int ptId, vtkIdList &cellIds);
   void GetPointCells (int ptId, vtkIdList *cellIds);
   vtkScalars *GetXCoordinates ();
   vtkScalars *GetYCoordinates ();
   vtkScalars *GetZCoordinates ();
   void Initialize ();
   vtkRectilinearGrid *New ();
   void SetDimensions (int i, int j, int k);
   void SetExtent (int x1, int x2, int y1, int y2, int z1, int z2);
   void SetUpdateExtent (int x1, int x2, int y1, int y2, int z1, int z2);
   void SetUpdateExtent (int piece, int numPieces, int ghostLevel);
   void SetUpdateExtent (int piece, int numPieces);
   void SetXCoordinates (vtkScalars *);
   void SetYCoordinates (vtkScalars *);
   void SetZCoordinates (vtkScalars *);
   void ShallowCopy (vtkDataObject *src);


B<vtkRectilinearGrid Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int ComputeCellId (int ijk[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int ComputePointId (int ijk[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int ComputeStructuredCoordinates (float x[3], int ijk[3], float pcoords[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   vtkCell *FindAndGetCell (float x[3], vtkCell *cell, int cellId, float tol2, int &subId, float pcoords[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int FindCell (float x[3], vtkCell *cell, int cellId, float tol2, int &subId, float pcoords[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int FindCell (float x[3], vtkCell *cell, vtkGenericCell *gencell, int cellId, float tol2, int &subId, float pcoords[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int FindPoint (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetCellBounds (int cellId, float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int Dimensions[3]int DataDescriptionvtkScalars *XCoordinatesvtkScalars *YCoordinatesvtkScalars *ZCoordinatesfloat PointReturn[3]void GetCellNeighbors (int cellId, vtkIdList &ptIds, vtkIdList &cellIds);
      Method is marked 'Do Not Use' in its descriptions

   void GetCellPoints (int cellId, vtkIdList &ptIds);
      Method is marked 'Do Not Use' in its descriptions

   float *GetPoint (int ptId);
      Can't Handle 'float *' return type without a hint

   void GetPoint (int id, float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetDimensions (int dim[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetExtent (int extent[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetUpdateExtent (int ext[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ReferenceCount;


@Graphics::VTK::ReferenceCount::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::ReferenceCount

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkReferenceCount *New ();


B<vtkReferenceCount Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Scalars;


@Graphics::VTK::Scalars::ISA = qw( Graphics::VTK::AttributeData );

=head1 Graphics::VTK::Scalars

=over 1

=item *

Inherits from AttributeData

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ComputeRange ();
   virtual void CreateDefaultLookupTable ();
   int GetActiveComponent ();
   const char *GetClassName();
   double GetDataTypeMax ();
   double GetDataTypeMin ();
   vtkLookupTable *GetLookupTable ();
   int GetNumberOfComponents ();
   int GetNumberOfScalars ();
   float *GetRange ();
      (Returns a 2-element Perl list)
   float GetScalar (int id);
   void GetScalars (int p1, int p2, vtkScalars *fs);
   void GetScalars (int p1, int p2, vtkScalars &fs);
   void GetScalars (vtkIdList *ptIds, vtkScalars *fv);
   int InitColorTraversal (float alpha, vtkScalarsToColors *lut, int colorModeVTK_COLOR_MODE_DEFAULT);
   int InsertNextScalar (float s);
   void InsertScalar (int id, float s);
   vtkScalars *New (int dataType, int numComp);
   vtkScalars *New ();
   void SetActiveComponent (int );
   void SetData (vtkDataArray *);
   void SetLookupTable (vtkLookupTable *lut);
   void SetNumberOfComponents (int num);
   void SetNumberOfScalars (int number);
   void SetScalar (int id, float s);


B<vtkScalars Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   unsigned char *GetColor (int id);
      Can't Handle 'unsigned char *' return type without a hint

   void GetDataTypeRange (double range[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetRange (float range[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetScalars (vtkIdList &ptIds, vtkScalars &fv);
      Method is marked 'Do Not Use' in its descriptions

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ShortArray;


@Graphics::VTK::ShortArray::ISA = qw( Graphics::VTK::DataArray );

=head1 Graphics::VTK::ShortArray

=over 1

=item *

Inherits from DataArray

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int Allocate (int sz, int ext);
   void DeepCopy (vtkDataArray *da);
   void DeepCopy (vtkDataArray &da);
   const char *GetClassName();
   float GetComponent (int i, int j);
   int GetDataType ();
   short GetValue (int id);
   void *GetVoidPointer (int id);
   void Initialize ();
   void InsertComponent (int i, int j, float c);
   int InsertNextValue (short );
   void InsertValue (int id, short i);
   vtkShortArray *New ();
   void SetComponent (int i, int j, float c);
   void SetNumberOfTuples (int number);
   void SetNumberOfValues (int number);
   void SetValue (int id, short value);
   void Squeeze ();


B<vtkShortArray Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   short *GetPointer (int id);
      Can't Handle 'short *' return type without a hint

   float *GetTuple (int i);
      Can't Handle 'float *' return type without a hint

   void GetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void GetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   int InsertNextTuple (float *tuple);
      Don't know the size of pointer arg number 1

   int InsertNextTuple (double *tuple);
      Don't know the size of pointer arg number 1

   void InsertTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void InsertTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetArray (short *array, int size, int save);
      Don't know the size of pointer arg number 1

   void SetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void SetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void SetVoidArray (void *array, int size, int save);
      Don't know the size of pointer arg number 1

   short *WritePointer (int id, int number);
      Can't Handle 'short *' return type without a hint


=cut

package Graphics::VTK::Source;


@Graphics::VTK::Source::ISA = qw( Graphics::VTK::ProcessObject );

=head1 Graphics::VTK::Source

=over 1

=item *

Inherits from ProcessObject

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual void ComputeInputUpdateExtents (vtkDataObject *output);
   virtual void EnlargeOutputUpdateExtents (vtkDataObject *);
   const char *GetClassName();
   int GetNumberOfOutputs ();
   virtual int GetReleaseDataFlag ();
   virtual int InRegisterLoop (vtkObject *);
   vtkSource *New ();
   virtual void PropagateUpdateExtent (vtkDataObject *output);
   void ReleaseDataFlagOff ();
   void ReleaseDataFlagOn ();
   virtual void SetReleaseDataFlag (int );
   virtual void TriggerAsynchronousUpdate ();
   void UnRegister (vtkObject *o);
   void UnRegisterAllOutputs (void );
   virtual void Update ();
   virtual void UpdateData (vtkDataObject *output);
   virtual void UpdateInformation ();
   virtual void UpdateWholeExtent ();


B<vtkSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void ComputeEstimatedOutputMemorySize (vtkDataObject *output, unsigned long *inputSize, unsigned long size[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeEstimatedPipelineMemorySize (vtkDataObject *output, unsigned long size[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   vtkDataObject *GetOutputs ();
      Can't Handle 'vtkDataObject **' return type yet

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Stack;


@Graphics::VTK::Stack::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::Stack

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetNumberOfItems ();
   vtkObject *GetTop ();
   vtkStack *New ();
   vtkObject *Pop ();
   void Push (vtkObject *);


B<vtkStack Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::StructuredData;


@Graphics::VTK::StructuredData::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::StructuredData

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetDataDimension (int dataDescription);
   vtkStructuredData *New ();


B<vtkStructuredData Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int ComputeCellId (int dim[3], int ijk[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int ComputePointId (int dim[3], int ijk[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetCellNeigbors (int cellId, vtkIdList *ptIds, vtkIdList *cellIds, int dim[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetCellPoints (int cellId, vtkIdList *ptIds, int dataDescription, int dim[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetCellPoints (int cellId, vtkIdList &ptIds, int dataDescription, int dim[3]);
      Method is marked 'Do Not Use' in its descriptions

   void GetPointCells (int ptId, vtkIdList *cellIds, int dim[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetPointCells (int ptId, vtkIdList &cellIds, int dim[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int SetDimensions (int inDim[3], int dim[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int SetExtent (int inExt[3], int ext[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::StructuredGrid;


@Graphics::VTK::StructuredGrid::ISA = qw( Graphics::VTK::PointSet );

=head1 Graphics::VTK::StructuredGrid

=over 1

=item *

Inherits from PointSet

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BlankPoint (int ptId);
   void BlankingOff ();
   void BlankingOn ();
   void CopyStructure (vtkDataSet *ds);
   void DeepCopy (vtkDataObject *src);
   unsigned long GetActualMemorySize ();
   int GetBlanking ();
   void GetCell (int cellId, vtkGenericCell *cell);
   vtkCell *GetCell (int cellId);
   void GetCellNeighbors (int cellId, vtkIdList *ptIds, vtkIdList *cellIds);
   void GetCellPoints (int cellId, vtkIdList *ptIds);
   int GetCellType (int cellId);
   const char *GetClassName();
   int GetDataDimension ();
   int GetDataObjectType ();
   int  *GetDimensions ();
      (Returns a 3-element Perl list)
   int  *GetExtent ();
      (Returns a 6-element Perl list)
   int GetMaxCellSize ();
   int GetNumberOfCells ();
   int GetNumberOfPoints ();
   float *GetPoint (int ptId);
      (Returns a 3-element Perl list)
   void GetPointCells (int ptId, vtkIdList &cellIds);
   void GetPointCells (int ptId, vtkIdList *cellIds);
   void Initialize ();
   int IsPointVisible (int ptId);
   vtkStructuredGrid *New ();
   void SetDimensions (int i, int j, int k);
   void SetExtent (int x1, int x2, int y1, int y2, int z1, int z2);
   void SetUpdateExtent (int x1, int x2, int y1, int y2, int z1, int z2);
   void SetUpdateExtent (int piece, int numPieces, int ghostLevel);
   void SetUpdateExtent (int piece, int numPieces);
   void ShallowCopy (vtkDataObject *src);
   void UnBlankPoint (int ptId);


B<vtkStructuredGrid Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int Dimensions[3]int DataDescriptionint BlankingvtkScalars *PointVisibilityvoid AllocatePointVisibility ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetCellBounds (int cellId, float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetCellPoints (int cellId, vtkIdList &ptIds);
      Method is marked 'Do Not Use' in its descriptions

   void GetPoint (int ptId, float p[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetDimensions (int dim[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetExtent (int extent[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetUpdateExtent (int ext[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::StructuredPoints;


@Graphics::VTK::StructuredPoints::ISA = qw( Graphics::VTK::ImageData );

=head1 Graphics::VTK::StructuredPoints

=over 1

=item *

Inherits from ImageData

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetDataObjectType ();
   vtkStructuredPoints *New ();

=cut

package Graphics::VTK::TCoords;


@Graphics::VTK::TCoords::ISA = qw( Graphics::VTK::AttributeData );

=head1 Graphics::VTK::TCoords

=over 1

=item *

Inherits from AttributeData

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetNumberOfComponents ();
   int GetNumberOfTCoords ();
   float *GetTCoord (int id);
      (Returns a 3-element Perl list)
   void GetTCoords (vtkIdList *ptId, vtkTCoords *fv);
   void GetTCoords (vtkIdList &ptId, vtkTCoords &fv);
   int InsertNextTCoord (float tx, float ty, float tz);
   void InsertTCoord (int id, float tx, float ty, float tz);
   vtkTCoords *New (int dataType, int dim);
   vtkTCoords *New ();
   void SetData (vtkDataArray *);
   void SetNumberOfComponents (int num);
   void SetNumberOfTCoords (int number);
   void SetTCoord (int id, float r, float s, float t);


B<vtkTCoords Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GetTCoord (int id, float tc[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int InsertNextTCoord (float tc[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InsertTCoord (int id, float tc[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetTCoord (int id, float tc[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::Tensor;


@Graphics::VTK::Tensor::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::Tensor

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddComponent (int i, int j, float v);
   void DeepCopy (vtkTensor *t);
   const char *GetClassName();
   float GetComponent (int i, int j);
   void Initialize ();
   vtkTensor *New ();
   void SetComponent (int i, int j, float v);


B<vtkTensor Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void DeepCopy (vtkTensor &t);
      Method is marked 'Do Not Use' in its descriptions

   float *GetColumn (int j);
      Can't Handle 'float *' return type without a hint

   void vtkTensor
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::Tensors;


@Graphics::VTK::Tensors::ISA = qw( Graphics::VTK::AttributeData );

=head1 Graphics::VTK::Tensors

=over 1

=item *

Inherits from AttributeData

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetNumberOfTensors ();
   void GetTensor (int id, vtkTensor &t);
   void GetTensor (int id, vtkTensor *t);
   vtkTensor *GetTensor (int id);
   void GetTensors (vtkIdList *ptId, vtkTensors *fv);
   int InsertNextTensor (vtkTensor *t);
   int InsertNextTensor (float t11, float t12, float t13, float t21, float t22, float t23, float t31, float t32, float t33);
   void InsertTensor (int id, vtkTensor *t);
   void InsertTensor (int id, float t11, float t12, float t13, float t21, float t22, float t23, float t31, float t32, float t33);
   vtkTensors *New (int dataType);
   vtkTensors *New ();
   void SetNumberOfTensors (int number);
   void SetTensor (int id, vtkTensor *t);


B<vtkTensors Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GetTensors (vtkIdList &ptId, vtkTensors &fv);
      Method is marked 'Do Not Use' in its descriptions

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Tetra;


@Graphics::VTK::Tetra::ISA = qw( Graphics::VTK::Cell );

=head1 Graphics::VTK::Tetra

=over 1

=item *

Inherits from Cell

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Clip (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *tetras, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd, int insideOut);
   void Contour (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *verts, vtkCellArray *lines, vtkCellArray *polys, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd);
   int GetCellDimension ();
   int GetCellType ();
   const char *GetClassName();
   vtkCell *GetEdge (int edgeId);
   vtkCell *GetFace (int faceId);
   int GetNumberOfEdges ();
   int GetNumberOfFaces ();
   vtkTetra *New ();
   int Triangulate (int index, vtkIdList *ptIds, vtkPoints *pts);
   int Triangulate (int index, vtkIdList &ptIds, vtkPoints &pts);


B<vtkTetra Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int BarycentricCoords (double x[3], double x1[3], double x2[3], double x3[3], double x4[3], double bcoords[4]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int CellBoundary (int subId, float pcoords[3], vtkIdList *pts);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int CellBoundary (int subId, float pcoords[3], vtkIdList &pts);
      Method is marked 'Do Not Use' in its descriptions

   double Circumsphere (double p1[3], double p2[3], double p3[3], double p4[3], double center[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Derivatives (int subId, float pcoords[3], float *values, int dim, float *derivs);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateLocation (int &subId, float pcoords[3], float x[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int EvaluatePosition (float x[3], float *closestPoint, int &subId, float pcoords[3], float &dist2, float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int *GetFaceArray (int faceId);
      Can't Handle 'int *' return type without a hint

   int GetParametricCenter (float pcoords[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InterpolationDerivs (float derivs[12]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InterpolationFunctions (float pcoords[3], float weights[4]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int IntersectWithLine (float p1[3], float p2[3], float tol, float &t, float x[3], float pcoords[3], int &subId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int JacobianInverse (double *inverse, float derivs[12]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void TetraCenter (float p1[3], float p2[3], float p3[3], float p4[3], float center[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::TimeStamp;


=head1 Graphics::VTK::TimeStamp

=over 1

=item *

Inherits from 

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Delete ();
   virtual char *GetClassName ();
   unsigned long GetMTime ();
   void Modified ();
   vtkTimeStamp *New ();


B<vtkTimeStamp Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int vtkTimeStamp ts return this ModifiedTime ts ModifiedTime
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   unsigned long return this ModifiedTime
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::TimerLog;


@Graphics::VTK::TimerLog::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::TimerLog

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AllocateLog ();
   void DumpLog (char *filename);
   double GetCPUTime ();
   const char *GetClassName();
   double GetCurrentTime ();
   double GetElapsedTime ();
   int GetMaxEntries ();
   void MarkEvent (char *EventString);
   vtkTimerLog *New ();
   void ResetLog ();
   void SetMaxEntries (int a);
   void StartTimer ();
   void StopTimer ();


B<vtkTimerLog Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Transform;


@Graphics::VTK::Transform::ISA = qw( Graphics::VTK::LinearTransform );

=head1 Graphics::VTK::Transform

=over 1

=item *

Inherits from LinearTransform

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int CircuitCheck (vtkAbstractTransform *transform);
   void Concatenate (vtkMatrix4x4 *matrix);
   void Concatenate (vtkLinearTransform *transform);
   const char *GetClassName();
   vtkLinearTransform *GetInput ();
   void GetInverse (vtkMatrix4x4 *inverse);
   vtkAbstractTransform *GetInverse ();
   unsigned long GetMTime ();
   float *GetOrientationWXYZ ();
      (Returns a 4-element Perl list)
   float *GetOrientation ();
      (Returns a 3-element Perl list)
   float *GetPosition ();
      (Returns a 3-element Perl list)
   float *GetScale ();
      (Returns a 3-element Perl list)
   void GetTranspose (vtkMatrix4x4 *transpose);
   void Identity ();
   void Inverse ();
   vtkAbstractTransform *MakeTransform ();
   void MultiplyNormals (vtkNormals *inNormals, vtkNormals *outNormals);
   void MultiplyPoints (vtkPoints *inPts, vtkPoints *outPts);
   void MultiplyVectors (vtkVectors *inVectors, vtkVectors *outVectors);
   vtkTransform *New ();
   void Pop ();
   void PostMultiply ();
   void PreMultiply ();
   void Push ();
   void RotateWXYZ (double angle, double x, double y, double z);
   void RotateX (double angle);
   void RotateY (double angle);
   void RotateZ (double angle);
   void Scale (double x, double y, double z);
   void SetInput (vtkLinearTransform *input);
   void SetMatrix (vtkMatrix4x4 *matrix);
   void Translate (double x, double y, double z);


B<vtkTransform Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void Concatenate (double elements[16]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Concatenate (vtkMatrix4x4 &matrix);
      Method is marked 'Do Not Use' in its descriptions

   double *GetDoublePoint ();
      Method is marked 'Do Not Use' in its descriptions

   void GetInverse (vtkMatrix4x4 &inverse);
      Method is marked 'Do Not Use' in its descriptions

   void GetOrientation (double orient[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetOrientationWXYZ (double wxyz[4]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetOrientationWXYZ (float wxyz[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetOrientation (float orient[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float *GetPoint ();
      Method is marked 'Do Not Use' in its descriptions

   void GetPoint (float p[4]);
      Method is marked 'Do Not Use' in its descriptions

   void GetPosition (double pos[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetPosition (float pos[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetScale (double scale[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetScale (float scale[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetTranspose (vtkMatrix4x4 &transpose);
      Method is marked 'Do Not Use' in its descriptions

   void Multiply4x4 (vtkMatrix4x4 *a, vtkMatrix4x4 *b, vtkMatrix4x4 *c);
      Method is marked 'Do Not Use' in its descriptions

   void Multiply4x4 (double a[16], double b[16], double c[16]);
      Method is marked 'Do Not Use' in its descriptions

   void Multiply4x4 (vtkMatrix4x4 &a, vtkMatrix4x4 &b, vtkMatrix4x4 &c);
      Method is marked 'Do Not Use' in its descriptions

   void MultiplyPoint (float in[4], float out[4]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void MultiplyPoint (double in[4], double out[4]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void RotateWXYZ (double angle, double axis[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void RotateWXYZ (double angle, float axis[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Scale (double s[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Scale (float s[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetDoublePoint (double  , double , double , double );
      Method is marked 'Do Not Use' in its descriptions

   void SetDoublePoint (double  a[4]);
      Method is marked 'Do Not Use' in its descriptions

   void SetMatrix (double elements[16]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetMatrix (vtkMatrix4x4 &m);
      Method is marked 'Do Not Use' in its descriptions

   void SetPoint (float  , float , float , float );
      Method is marked 'Do Not Use' in its descriptions

   void SetPoint (float  a[4]);
      Method is marked 'Do Not Use' in its descriptions

   void Translate (double x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Translate (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Transpose ();
      Method is marked 'Do Not Use' in its descriptions


=cut

package Graphics::VTK::TransformCollection;


@Graphics::VTK::TransformCollection::ISA = qw( Graphics::VTK::Collection );

=head1 Graphics::VTK::TransformCollection

=over 1

=item *

Inherits from Collection

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddItem (vtkTransform *);
   const char *GetClassName();
   vtkTransform *GetNextItem ();
   vtkTransformCollection *New ();

=cut

package Graphics::VTK::Triangle;


@Graphics::VTK::Triangle::ISA = qw( Graphics::VTK::Cell );

=head1 Graphics::VTK::Triangle

=over 1

=item *

Inherits from Cell

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Clip (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *polys, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd, int insideOut);
   void Contour (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *verts, vtkCellArray *lines, vtkCellArray *polys, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd);
   int GetCellDimension ();
   int GetCellType ();
   const char *GetClassName();
   vtkCell *GetEdge (int edgeId);
   vtkCell *GetFace (int );
   int GetNumberOfEdges ();
   int GetNumberOfFaces ();
   vtkTriangle *New ();
   int Triangulate (int index, vtkIdList *ptIds, vtkPoints *pts);
   int Triangulate (int index, vtkIdList &ptIds, vtkPoints &pts);


B<vtkTriangle Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int BarycentricCoords (double x[2], double x1[2], double x2[2], double x3[2], double bcoords[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int CellBoundary (int subId, float pcoords[3], vtkIdList *pts);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int CellBoundary (int subId, float pcoords[3], vtkIdList &pts);
      Method is marked 'Do Not Use' in its descriptions

   double Circumcircle (double p1[2], double p2[2], double p3[2], double center[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeNormal (vtkPoints *p, int numPts, int *pts, float n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeNormalDirection (float v1[3], float v2[3], float v3[3], float n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeNormalDirection (double v1[3], double v2[3], double v3[3], double n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeNormal (float v1[3], float v2[3], float v3[3], float n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeNormal (double v1[3], double v2[3], double v3[3], double n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeQuadric (float x1[3], float x2[3], float x3[3], float quadric[4][4]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeQuadric (float x1[3], float x2[3], float x3[3], vtkQuadric *quadric);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Derivatives (int subId, float pcoords[3], float *values, int dim, float *derivs);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateLocation (int &subId, float pcoords[3], float x[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int EvaluatePosition (float x[3], float *closestPoint, int &subId, float pcoords[3], float &dist2, float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int GetParametricCenter (float pcoords[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int IntersectWithLine (float p1[3], float p2[3], float tol, float &t, float x[3], float pcoords[3], int &subId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int PointInTriangle (float x[3], float x1[3], float x2[3], float x3[3], float tol2);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int ProjectTo2D (double x1[3], double x2[3], double x3[3], double v1[2], double v2[2], double v3[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float TriangleArea (float p1[3], float p2[3], float p3[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void TriangleCenter (float p1[3], float p2[3], float p3[3], float center[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::TriangleStrip;


@Graphics::VTK::TriangleStrip::ISA = qw( Graphics::VTK::Cell );

=head1 Graphics::VTK::TriangleStrip

=over 1

=item *

Inherits from Cell

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Clip (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *polys, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd, int insideOut);
   void Contour (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *verts, vtkCellArray *lines, vtkCellArray *polys, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd);
   int GetCellDimension ();
   int GetCellType ();
   const char *GetClassName();
   vtkCell *GetEdge (int edgeId);
   vtkCell *GetFace (int );
   int GetNumberOfEdges ();
   int GetNumberOfFaces ();
   vtkTriangleStrip *New ();
   int Triangulate (int index, vtkIdList *ptIds, vtkPoints *pts);
   int Triangulate (int index, vtkIdList &ptIds, vtkPoints &pts);


B<vtkTriangleStrip Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int CellBoundary (int subId, float pcoords[3], vtkIdList *pts);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int CellBoundary (int subId, float pcoords[3], vtkIdList &pts);
      Method is marked 'Do Not Use' in its descriptions

   void DecomposeStrip (int npts, int *pts, vtkCellArray *tris);
      Don't know the size of pointer arg number 2

   void Derivatives (int subId, float pcoords[3], float *values, int dim, float *derivs);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateLocation (int &subId, float pcoords[3], float x[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int EvaluatePosition (float x[3], float *closestPoint, int &subId, float pcoords[3], float &dist2, float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int GetParametricCenter (float pcoords[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int IntersectWithLine (float p1[3], float p2[3], float tol, float &t, float x[3], float pcoords[3], int &subId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::UnsignedCharArray;


@Graphics::VTK::UnsignedCharArray::ISA = qw( Graphics::VTK::DataArray );

=head1 Graphics::VTK::UnsignedCharArray

=over 1

=item *

Inherits from DataArray

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int Allocate (int sz, int ext);
   void DeepCopy (vtkDataArray *da);
   void DeepCopy (vtkDataArray &da);
   const char *GetClassName();
   float GetComponent (int i, int j);
   int GetDataType ();
   unsigned char GetValue (int id);
   void *GetVoidPointer (int id);
   void Initialize ();
   void InsertComponent (int i, int j, float c);
   int InsertNextValue (unsigned char c);
   void InsertValue (int id, unsigned char c);
   vtkUnsignedCharArray *New ();
   void SetComponent (int i, int j, float c);
   void SetNumberOfTuples (int number);
   void SetNumberOfValues (int number);
   void SetValue (int id, unsigned char value);
   void Squeeze ();


B<vtkUnsignedCharArray Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   unsigned char *GetPointer (int id);
      Can't Handle 'unsigned char *' return type without a hint

   float *GetTuple (int i);
      Can't Handle 'float *' return type without a hint

   void GetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void GetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   int InsertNextTuple (float *tuple);
      Don't know the size of pointer arg number 1

   int InsertNextTuple (double *tuple);
      Don't know the size of pointer arg number 1

   void InsertTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void InsertTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetArray (unsigned char *array, int size, int save);
      Don't know the size of pointer arg number 1

   void SetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void SetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void SetVoidArray (void *array, int size, int save);
      Don't know the size of pointer arg number 1

   unsigned char *WritePointer (int id, int number);
      Can't Handle 'unsigned char *' return type without a hint


=cut

package Graphics::VTK::UnsignedIntArray;


@Graphics::VTK::UnsignedIntArray::ISA = qw( Graphics::VTK::DataArray );

=head1 Graphics::VTK::UnsignedIntArray

=over 1

=item *

Inherits from DataArray

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int Allocate (int sz, int ext);
   void DeepCopy (vtkDataArray *da);
   void DeepCopy (vtkDataArray &da);
   const char *GetClassName();
   int GetDataType ();
   unsigned int GetValue (int id);
   void *GetVoidPointer (int id);
   void Initialize ();
   int InsertNextValue (unsigned int );
   void InsertValue (int id, unsigned int i);
   vtkUnsignedIntArray *New ();
   void SetNumberOfTuples (int number);
   void SetNumberOfValues (int number);
   void SetValue (int id, unsigned int value);
   void Squeeze ();


B<vtkUnsignedIntArray Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   unsigned int *GetPointer (int id);
      Can't Handle 'unsigned int *' return type without a hint

   float *GetTuple (int i);
      Can't Handle 'float *' return type without a hint

   void GetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void GetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   int InsertNextTuple (float *tuple);
      Don't know the size of pointer arg number 1

   int InsertNextTuple (double *tuple);
      Don't know the size of pointer arg number 1

   void InsertTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void InsertTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetArray (unsigned int *array, int size, int save);
      Don't know the size of pointer arg number 1

   void SetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void SetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   unsigned int *WritePointer (int id, int number);
      Can't Handle 'unsigned int *' return type without a hint


=cut

package Graphics::VTK::UnsignedLongArray;


@Graphics::VTK::UnsignedLongArray::ISA = qw( Graphics::VTK::DataArray );

=head1 Graphics::VTK::UnsignedLongArray

=over 1

=item *

Inherits from DataArray

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int Allocate (int sz, int ext);
   void DeepCopy (vtkDataArray *da);
   void DeepCopy (vtkDataArray &da);
   const char *GetClassName();
   int GetDataType ();
   unsigned long GetValue (int id);
   void *GetVoidPointer (int id);
   void Initialize ();
   int InsertNextValue (unsigned long );
   void InsertValue (int id, unsigned long i);
   vtkUnsignedLongArray *New ();
   void SetNumberOfTuples (int number);
   void SetNumberOfValues (int number);
   void SetValue (int id, unsigned long value);
   void Squeeze ();


B<vtkUnsignedLongArray Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   unsigned long *GetPointer (int id);
      Can't Handle 'unsigned long *' return type without a hint

   float *GetTuple (int i);
      Can't Handle 'float *' return type without a hint

   void GetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void GetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   int InsertNextTuple (float *tuple);
      Don't know the size of pointer arg number 1

   int InsertNextTuple (double *tuple);
      Don't know the size of pointer arg number 1

   void InsertTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void InsertTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetArray (unsigned long *array, int size, int save);
      Don't know the size of pointer arg number 1

   void SetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void SetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void SetVoidArray (void *array, int size, int save);
      Don't know the size of pointer arg number 1

   unsigned long *WritePointer (int id, int number);
      Can't Handle 'unsigned long *' return type without a hint


=cut

package Graphics::VTK::UnsignedShortArray;


@Graphics::VTK::UnsignedShortArray::ISA = qw( Graphics::VTK::DataArray );

=head1 Graphics::VTK::UnsignedShortArray

=over 1

=item *

Inherits from DataArray

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int Allocate (int sz, int ext);
   void DeepCopy (vtkDataArray *ia);
   void DeepCopy (vtkDataArray &ia);
   const char *GetClassName();
   float GetComponent (int i, int j);
   int GetDataType ();
   unsigned short GetValue (int id);
   void *GetVoidPointer (int id);
   void Initialize ();
   void InsertComponent (int i, int j, float c);
   int InsertNextValue (unsigned short );
   void InsertValue (int id, unsigned short i);
   vtkUnsignedShortArray *New ();
   void SetComponent (int i, int j, float c);
   void SetNumberOfTuples (int number);
   void SetNumberOfValues (int number);
   void SetValue (int id, unsigned short value);
   void Squeeze ();


B<vtkUnsignedShortArray Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   unsigned short *GetPointer (int id);
      Can't Handle 'unsigned short *' return type without a hint

   float *GetTuple (int i);
      Can't Handle 'float *' return type without a hint

   void GetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void GetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   int InsertNextTuple (float *tuple);
      Don't know the size of pointer arg number 1

   int InsertNextTuple (double *tuple);
      Don't know the size of pointer arg number 1

   void InsertTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void InsertTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetArray (unsigned short *array, int size, int save);
      Don't know the size of pointer arg number 1

   void SetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void SetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void SetVoidArray (void *array, int size, int save);
      Don't know the size of pointer arg number 1

   unsigned short *WritePointer (int id, int number);
      Can't Handle 'unsigned short *' return type without a hint


=cut

package Graphics::VTK::UnstructuredGrid;


@Graphics::VTK::UnstructuredGrid::ISA = qw( Graphics::VTK::PointSet );

=head1 Graphics::VTK::UnstructuredGrid

=over 1

=item *

Inherits from PointSet

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddReferenceToCell (int ptId, int cellId);
   void Allocate (int numCells, int extSize);
   void BuildLinks ();
   void CopyStructure (vtkDataSet *ds);
   void DeepCopy (vtkDataObject *src);
   unsigned long GetActualMemorySize ();
   void GetCell (int cellId, vtkGenericCell *cell);
   vtkCell *GetCell (int cellId);
   vtkCellLinks *GetCellLinks ();
   virtual void GetCellNeighbors (int cellId, vtkIdList *ptIds, vtkIdList *cellIds);
   void GetCellPoints (int cellId, vtkIdList *ptIds);
   int GetCellType (int cellId);
   vtkCellArray *GetCells ();
   const char *GetClassName();
   int GetDataObjectType ();
   int GetGhostLevel ();
   int GetMaxCellSize ();
   int GetNumberOfCells ();
   int GetNumberOfPieces ();
   int GetPiece ();
   void GetPointCells (int ptId, vtkIdList *cellIds);
   void GetUpdateExtent (int &piece, int &numPieces, int &ghostLevel);
   int  *GetUpdateExtent ();
      (Returns a 6-element Perl list)
   void Initialize ();
   int InsertNextCell (int type, vtkIdList &pts);
   int InsertNextCell (int type, vtkIdList *ptIds);
   vtkUnstructuredGrid *New ();
   void RemoveReferenceToCell (int ptId, int cellId);
   void Reset ();
   void ResizeCellList (int ptId, int size);
   void SetUpdateExtent (int x1, int x2, int y1, int y2, int z1, int z2);
   void SetUpdateExtent (int piece, int numPieces, int ghostLevel);
   void SetUpdateExtent (int piece, int numPieces);
   void ShallowCopy (vtkDataObject *src);
   void Squeeze ();


B<vtkUnstructuredGrid Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GetCellBounds (int cellId, float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   vtkVertex *VertexvtkPolyVertex *PolyVertexvtkLine *LinevtkPolyLine *PolyLinevtkTriangle *TrianglevtkTriangleStrip *TriangleStripvtkPixel *PixelvtkQuad *QuadvtkPolygon *PolygonvtkTetra *TetravtkVoxel *VoxelvtkHexahedron *HexahedronvtkWedge *WedgevtkPyramid *PyramidvtkCellTypes *CellsvtkCellArray *ConnectivityvtkCellLinks *Linksvoid GetCellNeighbors (int cellId, vtkIdList &ptIds, vtkIdList &cellIds);
      Method is marked 'Do Not Use' in its descriptions

   void GetCellPoints (int cellId, int &npts, int &pts);
      Don't know the size of pointer arg number 3

   void GetCellPoints (int cellId, vtkIdList &ptIds);
      Method is marked 'Do Not Use' in its descriptions

   void GetPointCells (int ptId, vtkIdList &cellIds);
      Method is marked 'Do Not Use' in its descriptions

   int InsertNextCell (int type, int npts, int *pts);
      Don't know the size of pointer arg number 3

   int InsertNextLinkedCell (int type, int npts, int *pts);
      Don't know the size of pointer arg number 3

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ReplaceCell (int cellId, int npts, int *pts);
      Don't know the size of pointer arg number 3

   void SetCells (int *types, vtkCellArray *cells);
      Don't know the size of pointer arg number 1

   void SetUpdateExtent (int ext[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::Vectors;


@Graphics::VTK::Vectors::ISA = qw( Graphics::VTK::AttributeData );

=head1 Graphics::VTK::Vectors

=over 1

=item *

Inherits from AttributeData

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ComputeMaxNorm ();
   const char *GetClassName();
   double GetMaxNorm ();
   int GetNumberOfVectors ();
   float *GetVector (int id);
      (Returns a 3-element Perl list)
   void GetVectors (vtkIdList &ptId, vtkVectors &fv);
   void GetVectors (vtkIdList *ptId, vtkVectors *fv);
   int InsertNextVector (double vx, double vy, double vz);
   void InsertVector (int id, double vx, double vy, double vz);
   vtkVectors *New (int dataType);
   vtkVectors *New ();
   void SetNumberOfVectors (int number);
   void SetVector (int id, double vx, double vy, double vz);


B<vtkVectors Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GetVector (int id, float v[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetVector (int id, double v[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int InsertNextVector (float v[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int InsertNextVector (double v[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InsertVector (int id, float v[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InsertVector (int id, double v[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetVector (int id, float v[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetVector (int id, double v[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::Version;


@Graphics::VTK::Version::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::Version

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetVTKBuildVersion ();
   int GetVTKMajorVersion ();
   int GetVTKMinorVersion ();
   char *GetVTKSourceVersion ();
   char *GetVTKVersion ();
   vtkVersion *New ();

=cut

package Graphics::VTK::Vertex;


@Graphics::VTK::Vertex::ISA = qw( Graphics::VTK::Cell );

=head1 Graphics::VTK::Vertex

=over 1

=item *

Inherits from Cell

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Clip (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *pts, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd, int insideOut);
   void Contour (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *verts1, vtkCellArray *lines, vtkCellArray *verts2, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd);
   int GetCellDimension ();
   int GetCellType ();
   const char *GetClassName();
   vtkCell *GetEdge (int );
   vtkCell *GetFace (int );
   int GetNumberOfEdges ();
   int GetNumberOfFaces ();
   vtkVertex *New ();
   int Triangulate (int index, vtkIdList *ptIds, vtkPoints *pts);
   int Triangulate (int index, vtkIdList &ptIds, vtkPoints &pts);


B<vtkVertex Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int CellBoundary (int subId, float pcoords[3], vtkIdList *pts);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int CellBoundary (int subId, float pcoords[3], vtkIdList &pts);
      Method is marked 'Do Not Use' in its descriptions

   void Derivatives (int subId, float pcoords[3], float *values, int dim, float *derivs);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateLocation (int &subId, float pcoords[3], float x[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int EvaluatePosition (float x[3], float *closestPoint, int &subId, float pcoords[3], float &dist2, float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InterpolationFunctions (float pcoords[3], float weights[1]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int IntersectWithLine (float p1[3], float p2[3], float tol, float &t, float x[3], float pcoords[3], int &subId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::VoidArray;


@Graphics::VTK::VoidArray::ISA = qw( Graphics::VTK::DataArray );

=head1 Graphics::VTK::VoidArray

=over 1

=item *

Inherits from DataArray

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int Allocate (int sz, int ext);
   void DeepCopy (vtkDataArray *da);
   void DeepCopy (vtkDataArray &da);
   const char *GetClassName();
   int GetDataType ();
   void *GetPointer (int id);
   void *GetValue (int id);
   void *GetVoidPointer (int id);
   void Initialize ();
   vtkVoidArray *New ();
   void SetNumberOfTuples (int number);
   void SetNumberOfValues (int number);
   void Squeeze ();
   void *WritePointer (int id, int number);


B<vtkVoidArray Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float *GetTuple (int i);
      Can't Handle 'float *' return type without a hint

   void GetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void GetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   int InsertNextTuple (float *tuple);
      Don't know the size of pointer arg number 1

   int InsertNextTuple (double *tuple);
      Don't know the size of pointer arg number 1

   int InsertNextValue (void *v);
      Don't know the size of pointer arg number 1

   void InsertTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void InsertTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void InsertValue (int id, void *p);
      Don't know the size of pointer arg number 2

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetTuple (int i, float *tuple);
      Don't know the size of pointer arg number 2

   void SetTuple (int i, double *tuple);
      Don't know the size of pointer arg number 2

   void SetValue (int id, void *value);
      Don't know the size of pointer arg number 2


=cut

package Graphics::VTK::Voxel;


@Graphics::VTK::Voxel::ISA = qw( Graphics::VTK::Cell );

=head1 Graphics::VTK::Voxel

=over 1

=item *

Inherits from Cell

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Clip (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *tetras, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd, int insideOut);
   void Contour (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *verts, vtkCellArray *lines, vtkCellArray *polys, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd);
   int GetCellDimension ();
   int GetCellType ();
   const char *GetClassName();
   vtkCell *GetEdge (int edgeId);
   vtkCell *GetFace (int faceId);
   int GetNumberOfEdges ();
   int GetNumberOfFaces ();
   vtkVoxel *New ();
   int Triangulate (int index, vtkIdList *ptIds, vtkPoints *pts);
   int Triangulate (int index, vtkIdList &ptIds, vtkPoints &pts);


B<vtkVoxel Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int CellBoundary (int subId, float pcoords[3], vtkIdList *pts);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int CellBoundary (int subId, float pcoords[3], vtkIdList &pts);
      Method is marked 'Do Not Use' in its descriptions

   void Derivatives (int subId, float pcoords[3], float *values, int dim, float *derivs);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateLocation (int &subId, float pcoords[3], float x[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int EvaluatePosition (float x[3], float *closestPoint, int &subId, float pcoords[3], float &dist2, float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int *GetFaceArray (int faceId);
      Can't Handle 'int *' return type without a hint

   void InterpolationDerivs (float pcoords[3], float derivs[24]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InterpolationFunctions (float pcoords[3], float weights[8]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int IntersectWithLine (float p1[3], float p2[3], float tol, float &t, float x[3], float pcoords[3], int &subId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::Wedge;


@Graphics::VTK::Wedge::ISA = qw( Graphics::VTK::Cell );

=head1 Graphics::VTK::Wedge

=over 1

=item *

Inherits from Cell

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Clip (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *wedges, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd, int insideOut);
   void Contour (float value, vtkScalars *cellScalars, vtkPointLocator *locator, vtkCellArray *verts, vtkCellArray *lines, vtkCellArray *polys, vtkPointData *inPd, vtkPointData *outPd, vtkCellData *inCd, int cellId, vtkCellData *outCd);
   int GetCellDimension ();
   int GetCellType ();
   const char *GetClassName();
   vtkCell *GetEdge (int edgeId);
   vtkCell *GetFace (int faceId);
   int GetNumberOfEdges ();
   int GetNumberOfFaces ();
   vtkWedge *New ();
   int Triangulate (int index, vtkIdList *ptIds, vtkPoints *pts);


B<vtkWedge Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int CellBoundary (int subId, float pcoords[3], vtkIdList *pts);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Derivatives (int subId, float pcoords[3], float *values, int dim, float *derivs);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateLocation (int &subId, float pcoords[3], float x[3], float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int EvaluatePosition (float x[3], float *closestPoint, int &subId, float pcoords[3], float &dist2, float *weights);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int *GetFaceArray (int faceId);
      Can't Handle 'int *' return type without a hint

   int GetParametricCenter (float pcoords[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InterpolationDerivs (float pcoords[3], float derivs[18]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InterpolationFunctions (float pcoords[3], float weights[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int IntersectWithLine (float p1[3], float p2[3], float tol, float &t, float x[3], float pcoords[3], int &subId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int JacobianInverse (float pcoords[3], double *inverse, float derivs[18]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::WindowLevelLookupTable;


@Graphics::VTK::WindowLevelLookupTable::ISA = qw( Graphics::VTK::LookupTable );

=head1 Graphics::VTK::WindowLevelLookupTable

=over 1

=item *

Inherits from LookupTable

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Build ();
   const char *GetClassName();
   int GetInverseVideo ();
   float GetLevel ();
   unsigned char  *GetMaximumColor ();
      (Returns a 4-element Perl list)
   unsigned char  *GetMinimumColor ();
      (Returns a 4-element Perl list)
   float GetWindow ();
   void InverseVideoOff ();
   void InverseVideoOn ();
   vtkWindowLevelLookupTable *New ();
   void SetInverseVideo (int );
   void SetLevel (float );
   void SetMaximumColor (unsigned char  , unsigned char , unsigned char , unsigned char );
   void SetMinimumColor (unsigned char  , unsigned char , unsigned char , unsigned char );
   void SetWindow (float );


B<vtkWindowLevelLookupTable Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetMaximumColor (unsigned char  a[4]);
      Arg types of 'unsigned char  *' not supported yet
   void SetMinimumColor (unsigned char  a[4]);
      Arg types of 'unsigned char  *' not supported yet

=cut

package Graphics::VTK::WindowToImageFilter;


@Graphics::VTK::WindowToImageFilter::ISA = qw( Graphics::VTK::ImageSource );

=head1 Graphics::VTK::WindowToImageFilter

=over 1

=item *

Inherits from ImageSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkWindow *GetInput ();
   vtkWindowToImageFilter *New ();
   void SetInput (vtkWindow *input);


B<vtkWindowToImageFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::InterpolatedVelocityField;


@Graphics::VTK::InterpolatedVelocityField::ISA = qw( Graphics::VTK::FunctionSet );

=head1 Graphics::VTK::InterpolatedVelocityField

=over 1

=item *

Inherits from FunctionSet

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CachingOff ();
   void CachingOn ();
   void ClearLastCellId ();
   int GetCacheHit ();
   int GetCacheMiss ();
   int GetCaching ();
   const char *GetClassName();
   vtkDataSet *GetDataSet ();
   int GetLastCellId ();
   vtkInterpolatedVelocityField *New ();
   void SetCaching (int );
   virtual void SetDataSet (vtkDataSet *dataset);
   void SetLastCellId (int );


B<vtkInterpolatedVelocityField Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual int FunctionValues (float *x, float *f);
      Don't know the size of pointer arg number 1

   int GetLastLocalCoordinates (float pcoords[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int GetLastWeights (float *w);
      Don't know the size of pointer arg number 1

   virtual void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::RungeKutta2;


@Graphics::VTK::RungeKutta2::ISA = qw( Graphics::VTK::InitialValueProblemSolver );

=head1 Graphics::VTK::RungeKutta2

=over 1

=item *

Inherits from InitialValueProblemSolver

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkRungeKutta2 *New ();


B<vtkRungeKutta2 Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual float ComputeNextStep (float *xprev, float *xnext, float t, float delT);
      Don't know the size of pointer arg number 1

   virtual float ComputeNextStep (float *xprev, float *dxprev, float *xnext, float t, float delT);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::RungeKutta4;


@Graphics::VTK::RungeKutta4::ISA = qw( Graphics::VTK::InitialValueProblemSolver );

=head1 Graphics::VTK::RungeKutta4

=over 1

=item *

Inherits from InitialValueProblemSolver

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkRungeKutta4 *New ();


B<vtkRungeKutta4 Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual float ComputeNextStep (float *xprev, float *xnext, float t, float delT);
      Don't know the size of pointer arg number 1

   virtual float ComputeNextStep (float *xprev, float *dxprev, float *xnext, float t, float delT);
      Don't know the size of pointer arg number 1

   virtual void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Win32OutputWindow;


@Graphics::VTK::Win32OutputWindow::ISA = qw( Graphics::VTK::OutputWindow );

=head1 Graphics::VTK::Win32OutputWindow

=over 1

=item *

Inherits from OutputWindow

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual void DisplayText (char *);
   const char *GetClassName();
   vtkWin32OutputWindow *New ();

=cut

1;
