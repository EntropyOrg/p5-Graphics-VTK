
package Graphics::VTK::Patented;
use 5.004;
use strict;
use Carp;

use vars qw/ $VERSION @ISA/;

require DynaLoader;

$VERSION = '3.2.001';

@ISA = qw/ DynaLoader /;

bootstrap Graphics::VTK::Patented $VERSION;


=head1 NAME

VTKPatented  - A Perl interface to VTKPatented library

=head1 SYNOPSIS

C<use Graphics::VTK;>
C<use Graphics::VTK::Patented;>

=head1 DESCRIPTION

Graphics::VTK::Patented is an interface to the Patented libaray of the C++ visualization toolkit VTK..

=head1 AUTHOR

Original PerlVTK Package: Roberto De Leo <rdl@math.umd.edu>

Additional Refinements: John Cerney <j-cerney1@raytheon.com>

=cut

package Graphics::VTK::Decimate;


@Graphics::VTK::Decimate::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::Decimate

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BoundaryVertexDeletionOff ();
   void BoundaryVertexDeletionOn ();
   void GenerateErrorScalarsOff ();
   void GenerateErrorScalarsOn ();
   float GetAspectRatio ();
   int GetBoundaryVertexDeletion ();
   const char *GetClassName();
   int GetDegree ();
   float GetErrorIncrement ();
   float GetFeatureAngleIncrement ();
   int GetGenerateErrorScalars ();
   float GetInitialError ();
   float GetInitialFeatureAngle ();
   float GetMaximumError ();
   float GetMaximumFeatureAngle ();
   int GetMaximumIterations ();
   int GetMaximumNumberOfSquawks ();
   int GetMaximumSubIterations ();
   int GetPreserveEdges ();
   int GetPreserveTopology ();
   float GetTargetReduction ();
   vtkDecimate *New ();
   void PreserveEdgesOff ();
   void PreserveEdgesOn ();
   void PreserveTopologyOff ();
   void PreserveTopologyOn ();
   void SetAspectRatio (float );
   void SetBoundaryVertexDeletion (int );
   void SetDegree (int );
   void SetErrorIncrement (float );
   void SetFeatureAngleIncrement (float );
   void SetGenerateErrorScalars (int );
   void SetInitialError (float );
   void SetInitialFeatureAngle (float );
   void SetMaximumError (float );
   void SetMaximumFeatureAngle (float );
   void SetMaximumIterations (int );
   void SetMaximumNumberOfSquawks (int );
   void SetMaximumSubIterations (int );
   void SetPreserveEdges (int );
   void SetPreserveTopology (int );
   void SetTargetReduction (float );


B<vtkDecimate Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int BuildLoop (int ptId, unsigned short nTris, int *tris);
      Don't know the size of pointer arg number 3

   int CanSplitLoop (vtkLocalVertexPtr fedges[2], int numVerts, vtkLocalVertexPtr verts[], int &n1, vtkLocalVertexPtr l1[], int &n2, vtkLocalVertexPtr l2[], float &ar);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float InitialFeatureAnglefloat FeatureAngleIncrementfloat MaximumFeatureAngleint PreserveEdgesint BoundaryVertexDeletionfloat InitialErrorfloat ErrorIncrementfloat MaximumErrorfloat TargetReductionint MaximumIterationsint MaximumSubIterationsfloat AspectRatioint Degreeint StatsVTK_NUMBER_STATISTICS []int GenerateErrorScalarsint MaximumNumberOfSquawksint PreserveTopologyvtkIdList *NeighborsvtkVertexArray *VvtkTriArray *Tvoid CreateOutput (int numPts, int numTris, int numEliminated, vtkPointData *pd, vtkPoints *inPts);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateLoop (int &vtype, int &numFEdges, vtkLocalVertexPtr fedges[]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SplitLoop (vtkLocalVertexPtr fedges[2], int numVerts, vtkLocalVertexPtr *verts, int &n1, vtkLocalVertexPtr *l1, int &n2, vtkLocalVertexPtr *l2);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Triangulate (int numVerts, vtkLocalVertexPtr verts[]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::DividingCubes;


@Graphics::VTK::DividingCubes::ISA = qw( Graphics::VTK::StructuredPointsToPolyDataFilter );

=head1 Graphics::VTK::DividingCubes

=over 1

=item *

Inherits from StructuredPointsToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetDistance ();
   int GetIncrement ();
   float GetValue ();
   vtkDividingCubes *New ();
   void SetDistance (float );
   void SetIncrement (int );
   void SetValue (float );


B<vtkDividingCubes Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SubDivide (float origin[3], int dim[3], float h[3], float values[8]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::GridSynchronizedTemplates3D;


@Graphics::VTK::GridSynchronizedTemplates3D::ISA = qw( Graphics::VTK::StructuredGridToPolyDataFilter );

=head1 Graphics::VTK::GridSynchronizedTemplates3D

=over 1

=item *

Inherits from StructuredGridToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ComputeGradientsOff ();
   void ComputeGradientsOn ();
   void ComputeNormalsOff ();
   void ComputeNormalsOn ();
   void ComputeScalarsOff ();
   void ComputeScalarsOn ();
   void GenerateValues (int numContours, float rangeStart, float rangeEnd);
   const char *GetClassName();
   int GetComputeGradients ();
   int GetComputeNormals ();
   int GetComputeScalars ();
   unsigned long GetMTime ();
   int GetNumberOfContours ();
   int GetNumberOfThreads ();
   float GetValue (int i);
   vtkGridSynchronizedTemplates3D *New ();
   void SetComputeGradients (int );
   void SetComputeNormals (int );
   void SetComputeScalars (int );
   void SetInputMemoryLimit (long limit);
   void SetNumberOfContours (int number);
   void SetNumberOfThreads (int );
   void SetValue (int i, float value);


B<vtkGridSynchronizedTemplates3D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GenerateValues (int numContours, float range[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int *GetExecuteExtent ();
      Can't Handle 'int *' return type without a hint

   float *GetValues ();
      Can't Handle 'float *' return type without a hint

   void GetValues (float *contourValues);
      Don't know the size of pointer arg number 1

   int NumberOfThreadsvtkMultiThreader *Threaderint MinimumPieceSize[3]int ExecuteExtent[6]vtkPolyData *ThreadsVTK_MAX_THREADS []void InitializeOutput (int *ext, vtkPolyData *o);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   int SplitExtent (int piece, int numPieces, int *ext);
      Don't know the size of pointer arg number 3

   void ThreadedExecute (int *exExt, int threadId);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::ImageMarchingCubes;


@Graphics::VTK::ImageMarchingCubes::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::ImageMarchingCubes

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddLocatorPoint (int cellX, int cellY, int edge, int ptId);
   void ComputeGradientsOff ();
   void ComputeGradientsOn ();
   void ComputeNormalsOff ();
   void ComputeNormalsOn ();
   void ComputeScalarsOff ();
   void ComputeScalarsOn ();
   void GenerateValues (int numContours, float rangeStart, float rangeEnd);
   const char *GetClassName();
   int GetComputeGradients ();
   int GetComputeNormals ();
   int GetComputeScalars ();
   vtkImageData *GetInput ();
   int GetInputMemoryLimit ();
   int ComputeScalarsint ComputeNormalsint ComputeGradientsint NeedGradientsvtkCellArray *TrianglesvtkScalars *ScalarsvtkPoints *PointsvtkNormals *NormalsvtkVectors *Gradientsint GetLocatorPoint (int cellX, int cellY, int edge);
   unsigned long GetMTime ();
   int GetNumberOfContours ();
   float GetValue (int i);
   void IncrementLocatorZ ();
   vtkImageMarchingCubes *New ();
   void SetComputeGradients (int );
   void SetComputeNormals (int );
   void SetComputeScalars (int );
   void SetInput (vtkImageData *input);
   void SetInputMemoryLimit (int );
   void SetNumberOfContours (int number);
   void SetValue (int i, float value);
   void Update ();


B<vtkImageMarchingCubes Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GenerateValues (int numContours, float range[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float *GetValues ();
      Can't Handle 'float *' return type without a hint

   void GetValues (float *contourValues);
      Don't know the size of pointer arg number 1

   void March (vtkImageData *inData, int chunkMin, int chunkMax, int numContours, float *values);
      Don't know the size of pointer arg number 5

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::KitwareContourFilter;


@Graphics::VTK::KitwareContourFilter::ISA = qw( Graphics::VTK::ContourFilter );

=head1 Graphics::VTK::KitwareContourFilter

=over 1

=item *

Inherits from ContourFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkKitwareContourFilter *New ();

=cut

package Graphics::VTK::MarchingContourFilter;


@Graphics::VTK::MarchingContourFilter::ISA = qw( Graphics::VTK::DataSetToPolyDataFilter );

=head1 Graphics::VTK::MarchingContourFilter

=over 1

=item *

Inherits from DataSetToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ComputeGradientsOff ();
   void ComputeGradientsOn ();
   void ComputeNormalsOff ();
   void ComputeNormalsOn ();
   void ComputeScalarsOff ();
   void ComputeScalarsOn ();
   void CreateDefaultLocator ();
   void GenerateValues (int numContours, float rangeStart, float rangeEnd);
   const char *GetClassName();
   int GetComputeGradients ();
   int GetComputeNormals ();
   int GetComputeScalars ();
   vtkPointLocator *GetLocator ();
   unsigned long GetMTime ();
   int GetNumberOfContours ();
   int GetUseScalarTree ();
   float GetValue (int i);
   vtkMarchingContourFilter *New ();
   void SetComputeGradients (int );
   void SetComputeNormals (int );
   void SetComputeScalars (int );
   void SetLocator (vtkPointLocator *locator);
   void SetLocator (vtkPointLocator &locator);
   void SetNumberOfContours (int number);
   void SetUseScalarTree (int );
   void SetValue (int i, float value);
   void UseScalarTreeOff ();
   void UseScalarTreeOn ();


B<vtkMarchingContourFilter Unsupported Funcs:>

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

package Graphics::VTK::MarchingCubes;


@Graphics::VTK::MarchingCubes::ISA = qw( Graphics::VTK::StructuredPointsToPolyDataFilter );

=head1 Graphics::VTK::MarchingCubes

=over 1

=item *

Inherits from StructuredPointsToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ComputeGradientsOff ();
   void ComputeGradientsOn ();
   void ComputeNormalsOff ();
   void ComputeNormalsOn ();
   void ComputeScalarsOff ();
   void ComputeScalarsOn ();
   void CreateDefaultLocator ();
   void GenerateValues (int numContours, float rangeStart, float rangeEnd);
   const char *GetClassName();
   int GetComputeGradients ();
   int GetComputeNormals ();
   int GetComputeScalars ();
   vtkPointLocator *GetLocator ();
   unsigned long GetMTime ();
   int GetNumberOfContours ();
   float GetValue (int i);
   vtkMarchingCubes *New ();
   void SetComputeGradients (int );
   void SetComputeNormals (int );
   void SetComputeScalars (int );
   void SetLocator (vtkPointLocator *locator);
   void SetLocator (vtkPointLocator &locator);
   void SetNumberOfContours (int number);
   void SetValue (int i, float value);


B<vtkMarchingCubes Unsupported Funcs:>

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

package Graphics::VTK::MarchingSquares;


@Graphics::VTK::MarchingSquares::ISA = qw( Graphics::VTK::StructuredPointsToPolyDataFilter );

=head1 Graphics::VTK::MarchingSquares

=over 1

=item *

Inherits from StructuredPointsToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CreateDefaultLocator ();
   void GenerateValues (int numContours, float rangeStart, float rangeEnd);
   const char *GetClassName();
   int  *GetImageRange ();
      (Returns a 6-element Perl list)
   vtkPointLocator *GetLocator ();
   unsigned long GetMTime ();
   int GetNumberOfContours ();
   float GetValue (int i);
   vtkMarchingSquares *New ();
   void SetImageRange (int imin, int imax, int jmin, int jmax, int kmin, int kmax);
   void SetLocator (vtkPointLocator *locator);
   void SetLocator (vtkPointLocator &locator);
   void SetNumberOfContours (int number);
   void SetValue (int i, float value);


B<vtkMarchingSquares Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GenerateValues (int numContours, float range[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float *GetValues ();
      Can't Handle 'float *' return type without a hint

   void GetValues (float *contourValues);
      Don't know the size of pointer arg number 1

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetImageRange (int  [6]);
      Method is redundant. Same as SetImageRange( int, int, int, int, int, int)


=cut

package Graphics::VTK::SliceCubes;


@Graphics::VTK::SliceCubes::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::SliceCubes

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   char *GetFileName ();
   char *GetLimitsFileName ();
   vtkVolumeReader *GetReader ();
   float GetValue ();
   vtkSliceCubes *New ();
   void SetFileName (char *);
   void SetLimitsFileName (char *);
   void SetReader (vtkVolumeReader *);
   void SetValue (float );
   void Update ();
   void Write ();


B<vtkSliceCubes Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::SweptSurface;


@Graphics::VTK::SweptSurface::ISA = qw( Graphics::VTK::StructuredPointsToStructuredPointsFilter );

=head1 Graphics::VTK::SweptSurface

=over 1

=item *

Inherits from StructuredPointsToStructuredPointsFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AdjustBoundsOff ();
   void AdjustBoundsOn ();
   void CappingOff ();
   void CappingOn ();
   int GetAdjustBounds ();
   float GetAdjustDistance ();
   int GetCapping ();
   const char *GetClassName();
   float GetFillValue ();
   unsigned long GetMTime ();
   int GetMaximumNumberOfInterpolationSteps ();
   float  *GetModelBounds ();
      (Returns a 6-element Perl list)
   int GetNumberOfInterpolationSteps ();
   int  *GetSampleDimensions ();
      (Returns a 3-element Perl list)
   vtkTransformCollection *GetTransforms ();
   vtkSweptSurface *New ();
   void SetAdjustBounds (int );
   void SetAdjustDistance (float );
   void SetCapping (int );
   void SetFillValue (float );
   void SetMaximumNumberOfInterpolationSteps (int );
   void SetModelBounds (float xmin, float xmax, float ymin, float ymax, float zmin, float zmax);
   void SetNumberOfInterpolationSteps (int );
   void SetSampleDimensions (int  , int , int );
   void SetTransforms (vtkTransformCollection *);


B<vtkSweptSurface Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeBounds (float origin[3], float ar[3], float bbox[24]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeFootprint (vtkMatrix4x4 *m, int inDim[3], float inOrigin[3], float inSpacing[3], int Indicies[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int ComputeNumberOfSteps (vtkTransform *t1, vtkTransform *t2, float bbox[24]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   vtkMatrix4x4 *GetActorMatrixPointer (vtkTransform &t, float origin[3], float position[3], float orientation[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetRelativePosition (vtkTransform &t, float *origin, float *position);
      Don't know the size of pointer arg number 2

   virtual void InterpolateStates (float *pos1, float *pos2, float *euler1, float *euler2, float t, float *posOut, float *eulerOut);
      Don't know the size of pointer arg number 1

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SampleInput (vtkMatrix4x4 *m, int inDim[3], float inOrigin[3], float inAr[3], vtkScalars *in, vtkScalars *out);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetModelBounds (float  [6]);
      Method is redundant. Same as SetModelBounds( float, float, float, float, float, float)

   void SetSampleDimensions (int  a[3]);
      Method is redundant. Same as SetSampleDimensions( int, int, int)


=cut

package Graphics::VTK::SynchronizedTemplates2D;


@Graphics::VTK::SynchronizedTemplates2D::ISA = qw( Graphics::VTK::StructuredPointsToPolyDataFilter );

=head1 Graphics::VTK::SynchronizedTemplates2D

=over 1

=item *

Inherits from StructuredPointsToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void GenerateValues (int numContours, float rangeStart, float rangeEnd);
   const char *GetClassName();
   unsigned long GetMTime ();
   int GetNumberOfContours ();
   float GetValue (int i);
   vtkSynchronizedTemplates2D *New ();
   void SetNumberOfContours (int number);
   void SetValue (int i, float value);


B<vtkSynchronizedTemplates2D Unsupported Funcs:>

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

package Graphics::VTK::SynchronizedTemplates3D;


@Graphics::VTK::SynchronizedTemplates3D::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::SynchronizedTemplates3D

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ComputeGradientsOff ();
   void ComputeGradientsOn ();
   void ComputeNormalsOff ();
   void ComputeNormalsOn ();
   void ComputeScalarsOff ();
   void ComputeScalarsOn ();
   void GenerateValues (int numContours, float rangeStart, float rangeEnd);
   const char *GetClassName();
   int GetComputeGradients ();
   int GetComputeNormals ();
   int GetComputeScalars ();
   vtkImageData *GetInput ();
   unsigned long GetInputMemoryLimit ();
   unsigned long GetMTime ();
   int GetNumberOfContours ();
   int GetNumberOfThreads ();
   float GetValue (int i);
   vtkSynchronizedTemplates3D *New ();
   void SetComputeGradients (int );
   void SetComputeNormals (int );
   void SetComputeScalars (int );
   void SetInput (vtkImageData *input);
   void SetInputMemoryLimit (unsigned long limit);
   void SetNumberOfContours (int number);
   void SetNumberOfThreads (int );
   void SetValue (int i, float value);


B<vtkSynchronizedTemplates3D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GenerateValues (int numContours, float range[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int *GetExecuteExtent ();
      Can't Handle 'int *' return type without a hint

   float *GetValues ();
      Can't Handle 'float *' return type without a hint

   void GetValues (float *contourValues);
      Don't know the size of pointer arg number 1

   int ExecuteExtent[6]int NumberOfThreadsvtkMultiThreader *ThreadervtkPolyData *ThreadsVTK_MAX_THREADS []void InitializeOutput (int *ext, vtkPolyData *o);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ThreadedExecute (vtkImageData *data, int *exExt, int threadId);
      Don't know the size of pointer arg number 2


=cut

1;
