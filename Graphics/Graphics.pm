
package Graphics::VTK::Graphics;
use 5.004;
use strict;
use Carp;

use vars qw/ $VERSION @ISA/;

require DynaLoader;

$VERSION = '3.2.001';

@ISA = qw/ DynaLoader /;

bootstrap Graphics::VTK::Graphics $VERSION;


=head1 NAME

VTKGraphics  - A Perl interface to VTKGraphics library

=head1 SYNOPSIS

C<use Graphics::VTK;>
C<use Graphics::VTK::Graphics;>

=head1 DESCRIPTION

Graphics::VTK::Graphics is an interface to the Graphics libaray of the C++ visualization toolkit VTK..

=head1 AUTHOR

Original PerlVTK Package: Roberto De Leo <rdl@math.umd.edu>

Additional Refinements: John Cerney <j-cerney1@raytheon.com>

=cut

package Graphics::VTK::Culler;


@Graphics::VTK::Culler::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::Culler

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();


B<vtkCuller Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual float Cull (vtkRenderer *ren, vtkProp *propList, int &listLength, int &initialized) = 0;
      Don't know the size of pointer arg number 2


=cut

package Graphics::VTK::DirectionEncoder;


@Graphics::VTK::DirectionEncoder::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::DirectionEncoder

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   virtual int GetNumberOfEncodedDirections (void ) = 0;


B<vtkDirectionEncoder Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual float *GetDecodedGradient (int value) = 0;
      Can't Handle 'float *' return type without a hint

   virtual float *GetDecodedGradientTable (void ) = 0;
      Can't Handle 'float *' return type without a hint

   virtual int GetEncodedDirection (float n[3]) = 0;
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::RayBounder;


@Graphics::VTK::RayBounder::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::RayBounder

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   virtual void ReleaseGraphicsResources (vtkWindow *);


B<vtkRayBounder Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual float *GetRayBounds (vtkRenderer *ren) = 0;
      Can't Handle 'float *' return type without a hint


=cut

package Graphics::VTK::AbstractMapper3D;


@Graphics::VTK::AbstractMapper3D::ISA = qw( Graphics::VTK::AbstractMapper );

=head1 Graphics::VTK::AbstractMapper3D

=over 1

=item *

Inherits from AbstractMapper

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddClippingPlane (vtkPlane *plane);
   virtual float *GetBounds () = 0;
      (Returns a 6-element Perl list)
   float *GetCenter ();
      (Returns a 3-element Perl list)
   const char *GetClassName();
   vtkPlaneCollection *GetClippingPlanes ();
   float GetLength ();
   virtual int IsARayCastMapper ();
   virtual int IsARenderIntoImageMapper ();
   void RemoveAllClippingPlanes ();
   void RemoveClippingPlane (vtkPlane *plane);
   void SetClippingPlanes (vtkPlanes *planes);
   void SetClippingPlanes (vtkPlaneCollection *);
   virtual void Update () = 0;


B<vtkAbstractMapper3D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void GetBounds (float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::AbstractPicker;


@Graphics::VTK::AbstractPicker::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::AbstractPicker

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddPickList (vtkProp *);
   void DeletePickList (vtkProp *);
   const char *GetClassName();
   int GetPickFromList ();
   vtkPropCollection *GetPickList ();
   float  *GetPickPosition ();
      (Returns a 3-element Perl list)
   vtkRenderer *GetRenderer ();
   float  *GetSelectionPoint ();
      (Returns a 3-element Perl list)
   void InitializePickList ();
   virtual int Pick (float selectionX, float selectionY, float selectionZ, vtkRenderer *renderer) = 0;
   void PickFromListOff ();
   void PickFromListOn ();
   void SetEndPickMethod (void (*func)(void *) , void *arg);
   void SetPickFromList (int );
   void SetPickMethod (void (*func)(void *) , void *arg);
   void SetStartPickMethod (void (*func)(void *) , void *arg);


B<vtkAbstractPicker Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int Pick (float selectionPt[3], vtkRenderer *ren);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetEndPickMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetPickMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetStartPickMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::AbstractPropPicker;


@Graphics::VTK::AbstractPropPicker::ISA = qw( Graphics::VTK::AbstractPicker );

=head1 Graphics::VTK::AbstractPropPicker

=over 1

=item *

Inherits from AbstractPicker

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual vtkActor *GetActor ();
   virtual vtkActor2D *GetActor2D ();
   virtual vtkAssembly *GetAssembly ();
   const char *GetClassName();
   vtkAssemblyPath *GetPath ();
   virtual vtkProp *GetProp ();
   virtual vtkProp3D *GetProp3D ();
   virtual vtkPropAssembly *GetPropAssembly ();
   virtual vtkVolume *GetVolume ();
   void SetPath (vtkAssemblyPath *);


B<vtkAbstractPropPicker Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ApproximatingSubdivisionFilter;


@Graphics::VTK::ApproximatingSubdivisionFilter::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::ApproximatingSubdivisionFilter

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetNumberOfSubdivisions ();
   void SetNumberOfSubdivisions (int );


B<vtkApproximatingSubdivisionFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int InterpolatePosition (vtkPoints *inputPts, vtkPoints *outputPts, vtkIdList *stencil, float *weights);
      Don't know the size of pointer arg number 4

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::DataSetToDataSetFilter;


@Graphics::VTK::DataSetToDataSetFilter::ISA = qw( Graphics::VTK::DataSetSource );

=head1 Graphics::VTK::DataSetToDataSetFilter

=over 1

=item *

Inherits from DataSetSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual void ComputeInputUpdateExtents (vtkDataObject *output);
   const char *GetClassName();
   vtkDataSet *GetInput ();
   vtkDataSet *GetOutput (int idx);
   vtkDataSet *GetOutput ();
   vtkPolyData *GetPolyDataOutput ();
   vtkRectilinearGrid *GetRectilinearGridOutput ();
   vtkStructuredGrid *GetStructuredGridOutput ();
   vtkStructuredPoints *GetStructuredPointsOutput ();
   vtkUnstructuredGrid *GetUnstructuredGridOutput ();
   void SetInput (vtkImageData *cache);
   void SetInput (vtkDataSet *input);

=cut

package Graphics::VTK::DataSetToPolyDataFilter;


@Graphics::VTK::DataSetToPolyDataFilter::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::DataSetToPolyDataFilter

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkDataSet *GetInput ();
   virtual void SetInput (vtkDataSet *input);

=cut

package Graphics::VTK::DataSetToStructuredGridFilter;


@Graphics::VTK::DataSetToStructuredGridFilter::ISA = qw( Graphics::VTK::StructuredGridSource );

=head1 Graphics::VTK::DataSetToStructuredGridFilter

=over 1

=item *

Inherits from StructuredGridSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkDataSet *GetInput ();
   virtual void SetInput (vtkImageData *cache);
   virtual void SetInput (vtkDataSet *input);

=cut

package Graphics::VTK::DataSetToStructuredPointsFilter;


@Graphics::VTK::DataSetToStructuredPointsFilter::ISA = qw( Graphics::VTK::StructuredPointsSource );

=head1 Graphics::VTK::DataSetToStructuredPointsFilter

=over 1

=item *

Inherits from StructuredPointsSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkDataSet *GetInput ();
   virtual void SetInput (vtkImageData *cache);
   virtual void SetInput (vtkDataSet *input);

=cut

package Graphics::VTK::DataSetToUnstructuredGridFilter;


@Graphics::VTK::DataSetToUnstructuredGridFilter::ISA = qw( Graphics::VTK::UnstructuredGridSource );

=head1 Graphics::VTK::DataSetToUnstructuredGridFilter

=over 1

=item *

Inherits from UnstructuredGridSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkDataSet *GetInput ();
   virtual void SetInput (vtkImageData *cache);
   virtual void SetInput (vtkDataSet *input);

=cut

package Graphics::VTK::Dicer;


@Graphics::VTK::Dicer::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::Dicer

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void FieldDataOff ();
   void FieldDataOn ();
   const char *GetClassName();
   int GetDiceMode ();
   int GetFieldData ();
   long unsigned GetMemoryLimit ();
   int GetNumberOfActualPieces ();
   int GetNumberOfPieces ();
   int GetNumberOfPointsPerPiece ();
   void SetDiceMode (int );
   void SetDiceModeToMemoryLimitPerPiece ();
   void SetDiceModeToNumberOfPointsPerPiece ();
   void SetDiceModeToSpecifiedNumberOfPieces ();
   void SetFieldData (int );
   void SetMemoryLimit (unsigned long );
   void SetNumberOfPieces (int );
   void SetNumberOfPointsPerPiece (int );


B<vtkDicer Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::EncodedGradientEstimator;


@Graphics::VTK::EncodedGradientEstimator::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::EncodedGradientEstimator

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BoundsClipOff ();
   void BoundsClipOn ();
   void ComputeGradientMagnitudesOff ();
   void ComputeGradientMagnitudesOn ();
   void CylinderClipOff ();
   void CylinderClipOn ();
   int  *GetBounds ();
      (Returns a 6-element Perl list)
   int GetBoundsClip ();
   const char *GetClassName();
   int GetComputeGradientMagnitudes ();
   int GetCylinderClip ();
   vtkDirectionEncoder *GetDirectionEncoder ();
   int GetEncodedNormalIndex (int x_index, int y_index, int z_index);
   int GetEncodedNormalIndex (int xyz_index);
   float GetGradientMagnitudeBias ();
   float GetGradientMagnitudeScale ();
   vtkImageData *GetInput ();
   float  *GetInputAspect ();
      (Returns a 3-element Perl list)
   float GetLastUpdateTimeInCPUSeconds ();
   float GetLastUpdateTimeInSeconds ();
   int GetNumberOfThreads ();
   int GetUseCylinderClip ();
   float GetZeroNormalThreshold ();
   int GetZeroPad ();
   void SetBounds (int  , int , int , int , int , int );
   void SetBoundsClip (int );
   void SetComputeGradientMagnitudes (int );
   void SetCylinderClip (int );
   void SetDirectionEncoder (vtkDirectionEncoder *direnc);
   void SetGradientMagnitudeBias (float );
   void SetGradientMagnitudeScale (float );
   void SetInput (vtkImageData *);
   void SetNumberOfThreads (int );
   void SetZeroNormalThreshold (float v);
   void SetZeroPad (int );
   void Update (void );
   void ZeroPadOff ();
   void ZeroPadOn ();


B<vtkEncodedGradientEstimator Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int *GetCircleLimits ();
      Can't Handle 'int *' return type without a hint

   unsigned short *GetEncodedNormals (void );
      Can't Handle 'unsigned short *' return type without a hint

   unsigned char *GetGradientMagnitudes (void );
      Can't Handle 'unsigned char *' return type without a hint

   int  *GetInputSize ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent index);
      I/O Streams not Supported yet

   void SetBounds (int  a[6]);
      Method is redundant. Same as SetBounds( int, int, int, int, int, int)


=cut

package Graphics::VTK::Exporter;


@Graphics::VTK::Exporter::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::Exporter

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkRenderWindow *GetInput ();
   unsigned long GetMTime ();
   vtkRenderWindow *GetRenderWindow ();
   void SetEndWrite (void (*func)(void *) , void *arg);
   void SetInput (vtkRenderWindow *renWin);
   void SetRenderWindow (vtkRenderWindow *);
   void SetStartWrite (void (*func)(void *) , void *arg);
   void Update ();
   virtual void Write ();


B<vtkExporter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetEndWriteArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetStartWriteArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::GraphicsFactory;


@Graphics::VTK::GraphicsFactory::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::GraphicsFactory

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   vtkObject *CreateInstance (char *vtkclassname);
   const char *GetClassName();
   char *GetRenderLibrary ();
   vtkGraphicsFactory *New ();

=cut

package Graphics::VTK::Importer;


@Graphics::VTK::Importer::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::Importer

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ComputeNormalsOff ();
   void ComputeNormalsOn ();
   const char *GetClassName();
   int GetComputeNormals ();
   FILE *GetFileFD ();
   char *GetFileName ();
   vtkRenderWindow *GetRenderWindow ();
   vtkRenderer *GetRenderer ();
   void Read ();
   void SetComputeNormals (int );
   void SetFileName (char *);
   void SetRenderWindow (vtkRenderWindow *);
   void Update ();


B<vtkImporter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::InterpolatingSubdivisionFilter;


@Graphics::VTK::InterpolatingSubdivisionFilter::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::InterpolatingSubdivisionFilter

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetNumberOfSubdivisions ();
   void SetNumberOfSubdivisions (int );


B<vtkInterpolatingSubdivisionFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int InterpolatePosition (vtkPoints *inputPts, vtkPoints *outputPts, vtkIdList *stencil, float *weights);
      Don't know the size of pointer arg number 4

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Mapper;


@Graphics::VTK::Mapper::ISA = qw( Graphics::VTK::AbstractMapper3D );

=head1 Graphics::VTK::Mapper

=over 1

=item *

Inherits from AbstractMapper3D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual void CreateDefaultLookupTable ();
   const char *GetClassName();
   int GetColorMode ();
   char *GetColorModeAsString ();
   vtkScalars *GetColors ();
   int GetGlobalImmediateModeRendering ();
   int GetImmediateModeRendering ();
   vtkDataSet *GetInputAsDataSet ();
   vtkScalarsToColors *GetLookupTable ();
   unsigned long GetMTime ();
   float GetRenderTime ();
   int GetResolveCoincidentTopology ();
   double GetResolveCoincidentTopologyZShift ();
   int GetScalarMode ();
   char *GetScalarModeAsString ();
   float  *GetScalarRange ();
      (Returns a 2-element Perl list)
   int GetScalarVisibility ();
   void GlobalImmediateModeRenderingOff ();
   void GlobalImmediateModeRenderingOn ();
   void ImmediateModeRenderingOff ();
   void ImmediateModeRenderingOn ();
   virtual void ReleaseGraphicsResources (vtkWindow *);
   virtual void Render (vtkRenderer *ren, vtkActor *a) = 0;
   void ScalarVisibilityOff ();
   void ScalarVisibilityOn ();
   void SetColorMode (int );
   void SetColorModeToDefault ();
   void SetColorModeToLuminance ();
   void SetColorModeToMapScalars ();
   void SetGlobalImmediateModeRendering (int val);
   void SetImmediateModeRendering (int );
   void SetLookupTable (vtkScalarsToColors *lut);
   void SetRenderTime (float time);
   void SetResolveCoincidentTopology (int val);
   void SetResolveCoincidentTopologyToDefault ();
   void SetResolveCoincidentTopologyToOff ();
   void SetResolveCoincidentTopologyToPolygonOffset ();
   void SetResolveCoincidentTopologyToShiftZBuffer ();
   void SetResolveCoincidentTopologyZShift (double val);
   void SetScalarMode (int );
   void SetScalarModeToDefault ();
   void SetScalarModeToUseCellData ();
   void SetScalarModeToUsePointData ();
   void SetScalarRange (float  , float );
   void SetScalarVisibility (int );
   void ShallowCopy (vtkMapper *m);
   virtual void Update ();


B<vtkMapper Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual float *GetBounds ();
      Can't Handle 'float *' return type without a hint

   virtual void GetBounds (float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetScalarRange (float  a[2]);
      Method is redundant. Same as SetScalarRange( float, float)


=cut

package Graphics::VTK::PointSetToPointSetFilter;


@Graphics::VTK::PointSetToPointSetFilter::ISA = qw( Graphics::VTK::PointSetSource );

=head1 Graphics::VTK::PointSetToPointSetFilter

=over 1

=item *

Inherits from PointSetSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkPointSet *GetInput ();
   vtkPointSet *GetOutput (int idx);
   vtkPointSet *GetOutput ();
   vtkPolyData *GetPolyDataOutput ();
   vtkStructuredGrid *GetStructuredGridOutput ();
   vtkUnstructuredGrid *GetUnstructuredGridOutput ();
   void SetInput (vtkPointSet *input);

=cut

package Graphics::VTK::PolyDataToPolyDataFilter;


@Graphics::VTK::PolyDataToPolyDataFilter::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::PolyDataToPolyDataFilter

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkPolyData *GetInput ();
   virtual void SetInput (vtkPolyData *input);

=cut

package Graphics::VTK::Prop3D;


@Graphics::VTK::Prop3D::ISA = qw( Graphics::VTK::Prop );

=head1 Graphics::VTK::Prop3D

=over 1

=item *

Inherits from Prop

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddOrientation (float , float , float );
   void AddPosition (float deltaX, float deltaY, float deltaZ);
   virtual float *GetBounds () = 0;
      (Returns a 6-element Perl list)
   float *GetCenter ();
      (Returns a 3-element Perl list)
   const char *GetClassName();
   float GetLength ();
   virtual void GetMatrix (vtkMatrix4x4 *m);
   float *GetOrientation ();
      (Returns a 3-element Perl list)
   float *GetOrientationWXYZ ();
      (Returns a 4-element Perl list)
   float  *GetOrigin ();
      (Returns a 3-element Perl list)
   float  *GetPosition ();
      (Returns a 3-element Perl list)
   float  *GetScale ();
      (Returns a 3-element Perl list)
   vtkMatrix4x4 *GetUserMatrix ();
   vtkLinearTransform *GetUserTransform ();
   float *GetXRange ();
      (Returns a 2-element Perl list)
   float *GetYRange ();
      (Returns a 2-element Perl list)
   float *GetZRange ();
      (Returns a 2-element Perl list)
   void InitPathTraversal ();
   void PokeMatrix (vtkMatrix4x4 *matrix);
   void RotateWXYZ (float , float , float , float );
   void RotateX (float );
   void RotateY (float );
   void RotateZ (float );
   void SetOrientation (float , float , float );
   void SetOrigin (float  , float , float );
   void SetPosition (float  , float , float );
   void SetScale (float  , float , float );
   void SetScale (float s);
   void SetUserMatrix (vtkMatrix4x4 *matrix);
   void SetUserTransform (vtkLinearTransform *transform);
   void ShallowCopy (vtkProp *prop);


B<vtkProp3D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void AddOrientation (float a[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void AddPosition (float deltaPosition[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetBounds (float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual vtkMatrix4x4 *GetMatrixPointer ();
      Method is marked 'Do Not Use' in its descriptions

   virtual void GetMatrix (double m[16]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   vtkMatrix4x4 *GetMatrix ();
      Method is marked 'Do Not Use' in its descriptions

   virtual void GetMatrix (vtkMatrix4x4 &m);
      Method is marked 'Do Not Use' in its descriptions

   void GetOrientation (float o[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetOrientation (float a[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetOrigin (float  a[3]);
      Method is redundant. Same as SetOrigin( float, float, float)

   void SetPosition (float  a[3]);
      Method is redundant. Same as SetPosition( float, float, float)

   void SetScale (float  a[3]);
      Method is redundant. Same as SetScale( float, float, float)


=cut

package Graphics::VTK::RectilinearGridToPolyDataFilter;


@Graphics::VTK::RectilinearGridToPolyDataFilter::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::RectilinearGridToPolyDataFilter

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkRectilinearGrid *GetInput ();
   void SetInput (vtkRectilinearGrid *input);

=cut

package Graphics::VTK::Spline;


@Graphics::VTK::Spline::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::Spline

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddPoint (float t, float x);
   void ClampValueOff ();
   void ClampValueOn ();
   void ClosedOff ();
   void ClosedOn ();
   virtual void Compute () = 0;
   int GetClampValue ();
   const char *GetClassName();
   int GetClosed ();
   int GetLeftConstraint ();
   float GetLeftValue ();
   unsigned long GetMTime ();
   int GetRightConstraint ();
   float GetRightValue ();
   void RemoveAllPoints ();
   void RemovePoint (float t);
   void SetClampValue (int );
   void SetClosed (int );
   void SetLeftConstraint (int );
   void SetLeftValue (float );
   void SetRightConstraint (int );
   void SetRightValue (float );


B<vtkSpline Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::StructuredGridToPolyDataFilter;


@Graphics::VTK::StructuredGridToPolyDataFilter::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::StructuredGridToPolyDataFilter

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkStructuredGrid *GetInput ();
   void SetInput (vtkStructuredGrid *input);

=cut

package Graphics::VTK::StructuredGridToStructuredGridFilter;


@Graphics::VTK::StructuredGridToStructuredGridFilter::ISA = qw( Graphics::VTK::StructuredGridSource );

=head1 Graphics::VTK::StructuredGridToStructuredGridFilter

=over 1

=item *

Inherits from StructuredGridSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkStructuredGrid *GetInput ();
   void SetInput (vtkStructuredGrid *input);

=cut

package Graphics::VTK::StructuredPointsToPolyDataFilter;


@Graphics::VTK::StructuredPointsToPolyDataFilter::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::StructuredPointsToPolyDataFilter

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkStructuredPoints *GetInput ();
   void SetInput (vtkStructuredPoints *input);
   void SetInput (vtkImageData *cache);

=cut

package Graphics::VTK::StructuredPointsToStructuredPointsFilter;


@Graphics::VTK::StructuredPointsToStructuredPointsFilter::ISA = qw( Graphics::VTK::StructuredPointsSource );

=head1 Graphics::VTK::StructuredPointsToStructuredPointsFilter

=over 1

=item *

Inherits from StructuredPointsSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkStructuredPoints *GetInput ();
   void SetInput (vtkStructuredPoints *input);
   void SetInput (vtkImageData *cache);

=cut

package Graphics::VTK::StructuredPointsToUnstructuredGridFilter;


@Graphics::VTK::StructuredPointsToUnstructuredGridFilter::ISA = qw( Graphics::VTK::UnstructuredGridSource );

=head1 Graphics::VTK::StructuredPointsToUnstructuredGridFilter

=over 1

=item *

Inherits from UnstructuredGridSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkStructuredPoints *GetInput ();
   void SetInput (vtkStructuredPoints *input);
   void SetInput (vtkImageData *cache);

=cut

package Graphics::VTK::UnstructuredGridToUnstructuredGridFilter;


@Graphics::VTK::UnstructuredGridToUnstructuredGridFilter::ISA = qw( Graphics::VTK::UnstructuredGridSource );

=head1 Graphics::VTK::UnstructuredGridToUnstructuredGridFilter

=over 1

=item *

Inherits from UnstructuredGridSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkUnstructuredGrid *GetInput ();
   void SetInput (vtkUnstructuredGrid *input);

=cut

package Graphics::VTK::VolumeMapper;


@Graphics::VTK::VolumeMapper::ISA = qw( Graphics::VTK::AbstractMapper3D );

=head1 Graphics::VTK::VolumeMapper

=over 1

=item *

Inherits from AbstractMapper3D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CroppingOff ();
   void CroppingOn ();
   const char *GetClassName();
   int GetCropping ();
   int GetCroppingRegionFlags ();
   float  *GetCroppingRegionPlanes ();
      (Returns a 6-element Perl list)
   vtkImageData *GetInput ();
   virtual vtkImageData *GetRGBTextureInput ();
   void SetCropping (int );
   void SetCroppingRegionFlags (int );
   void SetCroppingRegionFlagsToCross ();
   void SetCroppingRegionFlagsToFence ();
   void SetCroppingRegionFlagsToInvertedCross ();
   void SetCroppingRegionFlagsToInvertedFence ();
   void SetCroppingRegionFlagsToSubVolume ();
   void SetCroppingRegionPlanes (float  , float , float , float , float , float );
   void SetInput (vtkImageData *);
   void SetRGBTextureInput (vtkImageData *rgbTexture);
   virtual void Update ();


B<vtkVolumeMapper Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual float *GetBounds ();
      Can't Handle 'float *' return type without a hint

   virtual void GetBounds (float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent index);
      I/O Streams not Supported yet

   void SetCroppingRegionPlanes (float  a[6]);
      Method is redundant. Same as SetCroppingRegionPlanes( float, float, float, float, float, float)


=cut

package Graphics::VTK::VolumeRayCastFunction;


@Graphics::VTK::VolumeRayCastFunction::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::VolumeRayCastFunction

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   virtual float GetZeroOpacityThreshold (vtkVolume *vol) = 0;

=cut

package Graphics::VTK::VolumeReader;


@Graphics::VTK::VolumeReader::ISA = qw( Graphics::VTK::StructuredPointsSource );

=head1 Graphics::VTK::VolumeReader

=over 1

=item *

Inherits from StructuredPointsSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float  *GetDataOrigin ();
      (Returns a 3-element Perl list)
   float  *GetDataSpacing ();
      (Returns a 3-element Perl list)
   char *GetFilePattern ();
   char *GetFilePrefix ();
   virtual vtkStructuredPoints *GetImage (int ImageNumber) = 0;
   int  *GetImageRange ();
      (Returns a 2-element Perl list)
   void SetDataOrigin (float  , float , float );
   void SetDataSpacing (float  , float , float );
   void SetFilePattern (char *);
   void SetFilePrefix (char *);
   void SetImageRange (int  , int );


B<vtkVolumeReader Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetDataOrigin (float  a[3]);
      Method is redundant. Same as SetDataOrigin( float, float, float)

   void SetDataSpacing (float  a[3]);
      Method is redundant. Same as SetDataSpacing( float, float, float)

   void SetImageRange (int  a[2]);
      Method is redundant. Same as SetImageRange( int, int)


=cut

package Graphics::VTK::VolumeTextureMapper;


@Graphics::VTK::VolumeTextureMapper::ISA = qw( Graphics::VTK::VolumeMapper );

=head1 Graphics::VTK::VolumeTextureMapper

=over 1

=item *

Inherits from VolumeMapper

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkEncodedGradientEstimator *GetGradientEstimator ();
   vtkEncodedGradientShader *GetGradientShader ();
   void SetGradientEstimator (vtkEncodedGradientEstimator *gradest);
   virtual void Update ();


B<vtkVolumeTextureMapper Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent index);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Writer;


@Graphics::VTK::Writer::ISA = qw( Graphics::VTK::ProcessObject );

=head1 Graphics::VTK::Writer

=over 1

=item *

Inherits from ProcessObject

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   void Update ();
   virtual void Write ();


B<vtkWriter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::3DSImporter;


@Graphics::VTK::3DSImporter::ISA = qw( Graphics::VTK::Importer );

=head1 Graphics::VTK::3DSImporter

=over 1

=item *

Inherits from Importer

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtk3DSImporter *New ();


B<vtk3DSImporter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   vtkPolyData *GeneratePolyData (Mesh *meshPtr);
      Don't know the size of pointer arg number 1

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Actor;


@Graphics::VTK::Actor::ISA = qw( Graphics::VTK::Prop3D );

=head1 Graphics::VTK::Actor

=over 1

=item *

Inherits from Prop3D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual void ApplyProperties ();
   virtual void GetActors (vtkPropCollection *);
   vtkProperty *GetBackfaceProperty ();
   const char *GetClassName();
   unsigned long GetMTime ();
   vtkMapper *GetMapper ();
   virtual vtkActor *GetNextPart ();
   virtual int GetNumberOfParts ();
   vtkProperty *GetProperty ();
   virtual unsigned long GetRedrawMTime ();
   vtkTexture *GetTexture ();
   virtual void InitPartTraversal ();
   vtkActor *New ();
   void ReleaseGraphicsResources (vtkWindow *);
   virtual void Render (vtkRenderer *, vtkMapper *);
   virtual int RenderOpaqueGeometry (vtkViewport *viewport);
   virtual int RenderTranslucentGeometry (vtkViewport *viewport);
   void SetBackfaceProperty (vtkProperty *lut);
   void SetMapper (vtkMapper *);
   void SetProperty (vtkProperty *lut);
   void SetTexture (vtkTexture *);
   void ShallowCopy (vtkProp *prop);
   virtual void Update ();


B<vtkActor Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GetBounds (float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float *GetBounds ();
      Can't Handle 'float *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetBackfaceProperty (vtkProperty &lut);
      Method is marked 'Do Not Use' in its descriptions

   void SetProperty (vtkProperty &lut);
      Method is marked 'Do Not Use' in its descriptions


=cut

package Graphics::VTK::ActorCollection;


@Graphics::VTK::ActorCollection::ISA = qw( Graphics::VTK::PropCollection );

=head1 Graphics::VTK::ActorCollection

=over 1

=item *

Inherits from PropCollection

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddItem (vtkActor *a);
   void ApplyProperties (vtkProperty *p);
   const char *GetClassName();
   vtkActor *GetLastActor ();
   vtkActor *GetLastItem ();
   vtkActor *GetNextActor ();
   vtkActor *GetNextItem ();
   vtkActorCollection *New ();

=cut

package Graphics::VTK::AppendFilter;


@Graphics::VTK::AppendFilter::ISA = qw( Graphics::VTK::DataSetToUnstructuredGridFilter );

=head1 Graphics::VTK::AppendFilter

=over 1

=item *

Inherits from DataSetToUnstructuredGridFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddInput (vtkDataSet *in);
   const char *GetClassName();
   vtkDataSet *GetInput (int idx);
   vtkDataSet *GetInput ();
   vtkDataSetCollection *GetInputList ();
   vtkAppendFilter *New ();
   void RemoveInput (vtkDataSet &in);
   void RemoveInput (vtkDataSet *in);


B<vtkAppendFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void AddInput (vtkDataSet &in);
      Method is marked 'Do Not Use' in its descriptions

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::AppendPolyData;


@Graphics::VTK::AppendPolyData::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::AppendPolyData

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddInput (vtkPolyData *);
   const char *GetClassName();
   vtkPolyData *GetInput (int idx);
   vtkPolyData *GetInput ();
   int GetParallelStreaming ();
   int GetUserManagedInputs ();
   vtkAppendPolyData *New ();
   void ParallelStreamingOff ();
   void ParallelStreamingOn ();
   void RemoveInput (vtkPolyData *);
   void SetInputByNumber (int num, vtkPolyData *input);
   void SetNumberOfInputs (int num);
   void SetParallelStreaming (int );
   void SetUserManagedInputs (int );
   void UserManagedInputsOff ();
   void UserManagedInputsOn ();


B<vtkAppendPolyData Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int *AppendCells (int *pDest, vtkCellArray *src, int offset);
      Can't Handle 'int *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Assembly;


@Graphics::VTK::Assembly::ISA = qw( Graphics::VTK::Prop3D );

=head1 Graphics::VTK::Assembly

=over 1

=item *

Inherits from Prop3D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddPart (vtkProp3D *);
   void GetActors (vtkPropCollection *);
   const char *GetClassName();
   unsigned long GetMTime ();
   vtkAssemblyPath *GetNextPath ();
   int GetNumberOfPaths ();
   vtkProp3DCollection *GetParts ();
   void GetVolumes (vtkPropCollection *);
   void InitPathTraversal ();
   vtkAssembly *New ();
   void ReleaseGraphicsResources (vtkWindow *);
   void RemovePart (vtkProp3D *);
   int RenderOpaqueGeometry (vtkViewport *ren);
   int RenderTranslucentGeometry (vtkViewport *ren);
   void ShallowCopy (vtkProp *prop);


B<vtkAssembly Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GetBounds (float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float *GetBounds ();
      Can't Handle 'float *' return type without a hint

   vtkMapper *GetMapper ();
      Method is marked 'Do Not Use' in its descriptions

   vtkProperty *GetProperty ();
      Method is marked 'Do Not Use' in its descriptions

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetMapper (vtkMapper *mapper);
      Method is marked 'Do Not Use' in its descriptions

   void SetProperty (vtkProperty *property);
      Method is marked 'Do Not Use' in its descriptions


=cut

package Graphics::VTK::AttributeDataToFieldDataFilter;


@Graphics::VTK::AttributeDataToFieldDataFilter::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::AttributeDataToFieldDataFilter

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetPassAttributeData ();
   vtkAttributeDataToFieldDataFilter *New ();
   void PassAttributeDataOff ();
   void PassAttributeDataOn ();
   void SetPassAttributeData (int );


B<vtkAttributeDataToFieldDataFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Axes;


@Graphics::VTK::Axes::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::Axes

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float  *GetOrigin ();
      (Returns a 3-element Perl list)
   float GetScaleFactor ();
   int GetSymmetric ();
   vtkAxes *New ();
   void SetOrigin (float  , float , float );
   void SetScaleFactor (float );
   void SetSymmetric (int );
   void SymmetricOff ();
   void SymmetricOn ();


B<vtkAxes Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetOrigin (float  a[3]);
      Method is redundant. Same as SetOrigin( float, float, float)


=cut

package Graphics::VTK::BYUReader;


@Graphics::VTK::BYUReader::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::BYUReader

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   char *GetDisplacementFileName ();
   char *GetGeometryFileName ();
   int GetPartNumber ();
   int GetReadDisplacement ();
   int GetReadScalar ();
   int GetReadTexture ();
   char *GetScalarFileName ();
   char *GetTextureFileName ();
   vtkBYUReader *New ();
   void ReadDisplacementOff ();
   void ReadDisplacementOn ();
   void ReadScalarOff ();
   void ReadScalarOn ();
   void ReadTextureOff ();
   void ReadTextureOn ();
   void SetDisplacementFileName (char *);
   void SetGeometryFileName (char *);
   void SetPartNumber (int );
   void SetReadDisplacement (int );
   void SetReadScalar (int );
   void SetReadTexture (int );
   void SetScalarFileName (char *);
   void SetTextureFileName (char *);


B<vtkBYUReader Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   char *GeometryFileNamechar *DisplacementFileNamechar *ScalarFileNamechar *TextureFileNameint ReadDisplacementint ReadScalarint ReadTextureint PartNumbervoid ReadGeometryFile (FILE *fp, int &numPts);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::BYUWriter;


@Graphics::VTK::BYUWriter::ISA = qw( Graphics::VTK::PolyDataWriter );

=head1 Graphics::VTK::BYUWriter

=over 1

=item *

Inherits from PolyDataWriter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   char *GetDisplacementFileName ();
   char *GetGeometryFileName ();
   char *GetScalarFileName ();
   char *GetTextureFileName ();
   int GetWriteDisplacement ();
   int GetWriteScalar ();
   int GetWriteTexture ();
   vtkBYUWriter *New ();
   void SetDisplacementFileName (char *);
   void SetGeometryFileName (char *);
   void SetScalarFileName (char *);
   void SetTextureFileName (char *);
   void SetWriteDisplacement (int );
   void SetWriteScalar (int );
   void SetWriteTexture (int );
   void WriteDisplacementOff ();
   void WriteDisplacementOn ();
   void WriteScalarOff ();
   void WriteScalarOn ();
   void WriteTextureOff ();
   void WriteTextureOn ();


B<vtkBYUWriter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   char *GeometryFileNamechar *DisplacementFileNamechar *ScalarFileNamechar *TextureFileNameint WriteDisplacementint WriteScalarint WriteTexturevoid WriteGeometryFile (FILE *fp, int numPts);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::BooleanTexture;


@Graphics::VTK::BooleanTexture::ISA = qw( Graphics::VTK::StructuredPointsSource );

=head1 Graphics::VTK::BooleanTexture

=over 1

=item *

Inherits from StructuredPointsSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   unsigned char  *GetInIn ();
      (Returns a 2-element Perl list)
   unsigned char  *GetInOn ();
      (Returns a 2-element Perl list)
   unsigned char  *GetInOut ();
      (Returns a 2-element Perl list)
   unsigned char  *GetOnIn ();
      (Returns a 2-element Perl list)
   unsigned char  *GetOnOn ();
      (Returns a 2-element Perl list)
   unsigned char  *GetOnOut ();
      (Returns a 2-element Perl list)
   unsigned char  *GetOutIn ();
      (Returns a 2-element Perl list)
   unsigned char  *GetOutOn ();
      (Returns a 2-element Perl list)
   unsigned char  *GetOutOut ();
      (Returns a 2-element Perl list)
   int GetThickness ();
   int GetXSize ();
   int GetYSize ();
   vtkBooleanTexture *New ();
   void SetInIn (unsigned char  , unsigned char );
   void SetInOn (unsigned char  , unsigned char );
   void SetInOut (unsigned char  , unsigned char );
   void SetOnIn (unsigned char  , unsigned char );
   void SetOnOn (unsigned char  , unsigned char );
   void SetOnOut (unsigned char  , unsigned char );
   void SetOutIn (unsigned char  , unsigned char );
   void SetOutOn (unsigned char  , unsigned char );
   void SetOutOut (unsigned char  , unsigned char );
   void SetThickness (int );
   void SetXSize (int );
   void SetYSize (int );


B<vtkBooleanTexture Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetInIn (unsigned char  a[2]);
      Arg types of 'unsigned char  *' not supported yet
   void SetInOn (unsigned char  a[2]);
      Arg types of 'unsigned char  *' not supported yet
   void SetInOut (unsigned char  a[2]);
      Arg types of 'unsigned char  *' not supported yet
   void SetOnIn (unsigned char  a[2]);
      Arg types of 'unsigned char  *' not supported yet
   void SetOnOn (unsigned char  a[2]);
      Arg types of 'unsigned char  *' not supported yet
   void SetOnOut (unsigned char  a[2]);
      Arg types of 'unsigned char  *' not supported yet
   void SetOutIn (unsigned char  a[2]);
      Arg types of 'unsigned char  *' not supported yet
   void SetOutOn (unsigned char  a[2]);
      Arg types of 'unsigned char  *' not supported yet
   void SetOutOut (unsigned char  a[2]);
      Arg types of 'unsigned char  *' not supported yet

=cut

package Graphics::VTK::BrownianPoints;


@Graphics::VTK::BrownianPoints::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::BrownianPoints

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetMaximumSpeed ();
   float GetMinimumSpeed ();
   vtkBrownianPoints *New ();
   void SetMaximumSpeed (float );
   void SetMinimumSpeed (float );


B<vtkBrownianPoints Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ButterflySubdivisionFilter;


@Graphics::VTK::ButterflySubdivisionFilter::ISA = qw( Graphics::VTK::InterpolatingSubdivisionFilter );

=head1 Graphics::VTK::ButterflySubdivisionFilter

=over 1

=item *

Inherits from InterpolatingSubdivisionFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkButterflySubdivisionFilter *New ();


B<vtkButterflySubdivisionFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GenerateBoundaryStencil (int p1, int p2, vtkPolyData *polys, vtkIdList *stencilIds, float *weights);
      Don't know the size of pointer arg number 5

   void GenerateButterflyStencil (int p1, int p2, vtkPolyData *polys, vtkIdList *stencilIds, float *weights);
      Don't know the size of pointer arg number 5

   void GenerateLoopStencil (int p1, int p2, vtkPolyData *polys, vtkIdList *stencilIds, float *weights);
      Don't know the size of pointer arg number 5


=cut

package Graphics::VTK::Camera;


@Graphics::VTK::Camera::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::Camera

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Azimuth (double angle);
   void ComputeViewPlaneNormal ();
   void Dolly (double distance);
   void Elevation (double angle);
   vtkMatrix4x4 *GetCameraLightTransformMatrix ();
   const char *GetClassName();
   double  *GetClippingRange ();
      (Returns a 2-element Perl list)
   vtkMatrix4x4 &GetCompositePerspectiveTransform (double aspect, double nearz, double farz);
   vtkMatrix4x4 *GetCompositePerspectiveTransformMatrix (double aspect, double nearz, double farz);
   double  *GetDirectionOfProjection ();
      (Returns a 3-element Perl list)
   double GetDistance ();
   double GetEyeAngle ();
   double GetFocalDisk ();
   double  *GetFocalPoint ();
      (Returns a 3-element Perl list)
   double  *GetObliqueAngles ();
      (Returns a 2-element Perl list)
   float *GetOrientation ();
      (Returns a 3-element Perl list)
   float *GetOrientationWXYZ ();
      (Returns a 4-element Perl list)
   int GetParallelProjection ();
   double GetParallelScale ();
   vtkMatrix4x4 *GetPerspectiveTransformMatrix (double aspect, double nearz, double farz);
   double  *GetPosition ();
      (Returns a 3-element Perl list)
   double GetRoll ();
   double GetThickness ();
   double GetViewAngle ();
   double  *GetViewPlaneNormal ();
      (Returns a 3-element Perl list)
   vtkMatrix4x4 *GetViewTransformMatrix ();
   double  *GetViewUp ();
      (Returns a 3-element Perl list)
   unsigned long GetViewingRaysMTime ();
   double  *GetWindowCenter ();
      (Returns a 2-element Perl list)
   vtkCamera *New ();
   void OrthogonalizeViewUp ();
   void ParallelProjectionOff ();
   void ParallelProjectionOn ();
   void Pitch (double angle);
   virtual void Render (vtkRenderer *);
   void Roll (double angle);
   void SetClippingRange (double near, double far);
   void SetDistance (double );
   void SetEyeAngle (double );
   void SetFocalDisk (double );
   void SetFocalPoint (double x, double y, double z);
   void SetObliqueAngles (double alpha, double beta);
   void SetParallelProjection (int flag);
   void SetParallelScale (double scale);
   void SetPosition (double x, double y, double z);
   void SetRoll (double angle);
   void SetThickness (double );
   void SetViewAngle (double angle);
   void SetViewPlaneNormal (double x, double y, double z);
   void SetViewUp (double vx, double vy, double vz);
   void SetWindowCenter (double x, double y);
   void ViewingRaysModified ();
   void Yaw (double angle);
   void Zoom (double factor);


B<vtkCamera Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GetClippingRange (float a[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetDirectionOfProjection (float a[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetFocalPoint (float a[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetFrustumPlanes (float aspect, float planes[24]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   vtkMatrix4x4 &GetPerspectiveTransform (double aspect, double nearz, double farz);
      Method is marked 'Do Not Use' in its descriptions

   void GetPosition (float a[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetViewPlaneNormal (float a[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   vtkMatrix4x4 &GetViewTransform ();
      Method is marked 'Do Not Use' in its descriptions

   void GetViewUp (float a[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetClippingRange (double a[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetClippingRange (float a[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetFocalPoint (double a[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetFocalPoint (float a[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetPosition (double a[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetPosition (float a[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetViewPlaneNormal (double a[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetViewPlaneNormal (float a[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetViewUp (double a[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetViewUp (float a[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::CardinalSpline;


@Graphics::VTK::CardinalSpline::ISA = qw( Graphics::VTK::Spline );

=head1 Graphics::VTK::CardinalSpline

=over 1

=item *

Inherits from Spline

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Compute ();
   float Evaluate (float t);
   const char *GetClassName();
   vtkCardinalSpline *New ();


B<vtkCardinalSpline Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void Fit1D (int n, float *x, float *y, float *w, float coefficients[4][], int leftConstraint, float leftValue, int rightConstraint, float rightValue);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void FitClosed1D (int n, float *x, float *y, float *w, float coefficients[4][]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::CastToConcrete;


@Graphics::VTK::CastToConcrete::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::CastToConcrete

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkCastToConcrete *New ();

=cut

package Graphics::VTK::CellCenters;


@Graphics::VTK::CellCenters::ISA = qw( Graphics::VTK::DataSetToPolyDataFilter );

=head1 Graphics::VTK::CellCenters

=over 1

=item *

Inherits from DataSetToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetVertexCells ();
   vtkCellCenters *New ();
   void SetVertexCells (int );
   void VertexCellsOff ();
   void VertexCellsOn ();


B<vtkCellCenters Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::CellDataToPointData;


@Graphics::VTK::CellDataToPointData::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::CellDataToPointData

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetPassCellData ();
   vtkCellDataToPointData *New ();
   void PassCellDataOff ();
   void PassCellDataOn ();
   void SetPassCellData (int );


B<vtkCellDataToPointData Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::CellLocator;


@Graphics::VTK::CellLocator::ISA = qw( Graphics::VTK::Locator );

=head1 Graphics::VTK::CellLocator

=over 1

=item *

Inherits from Locator

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BuildLocator ();
   void CacheCellBoundsOff ();
   void CacheCellBoundsOn ();
   void FreeSearchStructure ();
   void GenerateRepresentation (int level, vtkPolyData *pd);
   int GetCacheCellBounds ();
   virtual vtkIdList *GetCells (int bucket);
   const char *GetClassName();
   virtual int GetNumberOfBuckets (void );
   int GetNumberOfCellsPerBucket ();
   vtkCellLocator *New ();
   void SetCacheCellBounds (int );
   void SetNumberOfCellsPerBucket (int );


B<vtkCellLocator Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float Distance2ToBounds (float x[3], float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float Distance2ToBucket (float x[3], int nei[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void FindClosestPoint (float x[3], float closestPoint[3], int &cellId, int &subId, float &dist2);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int FindClosestPointWithinRadius (float x[3], float radius, float closestPoint[3], int &cellId, int &subId, float &dist2);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int FindClosestPointWithinRadius (float x[3], float radius, float closestPoint[3], vtkGenericCell *cell, int &cellId, int &subId, float &dist2);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int FindClosestPointWithinRadius (float x[3], float radius, float closestPoint[3], vtkGenericCell *cell, int &cellId, int &subId, float &dist2, int &inside);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void FindClosestPoint (float x[3], float closestPoint[3], vtkGenericCell *cell, int &cellId, int &subId, float &dist2);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetBucketNeighbors (int ijk[3], int ndivs, int level);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetChildren (int idx, int level, int children[8]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetOverlappingBuckets (float x[3], int ijk[3], float dist, int prevMinLevel[3], int prevMaxLevel[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual int IntersectWithLine (float a0[3], float a1[3], float tol, float &t, float x[3], float pcoords[3], int &subId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual int IntersectWithLine (float a0[3], float a1[3], float tol, float &t, float x[3], float pcoords[3], int &subId, int &cellId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual int IntersectWithLine (float a0[3], float a1[3], float tol, float &t, float x[3], float pcoords[3], int &subId, int &cellId, vtkGenericCell *cell);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int NumberOfCellsPerBucketint NumberOfOctantsfloat Bounds[6]int NumberOfParentsfloat H[3]int NumberOfDivisionsvtkIdList *Treevoid MarkParents (void *, int , int , int , int , int );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::CellPicker;


@Graphics::VTK::CellPicker::ISA = qw( Graphics::VTK::Picker );

=head1 Graphics::VTK::CellPicker

=over 1

=item *

Inherits from Picker

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int GetCellId ();
   const char *GetClassName();
   float  *GetPCoords ();
      (Returns a 3-element Perl list)
   int GetSubId ();
   vtkCellPicker *New ();


B<vtkCellPicker Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual int CellIdint SubIdfloat PCoords[3]float IntersectWithLine (float p1[3], float p2[3], float tol, vtkAssemblyPath *path, vtkProp3D *p, vtkAbstractMapper3D *m);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::CleanPolyData;


@Graphics::VTK::CleanPolyData::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::CleanPolyData

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ConvertLinesToPointsOff ();
   void ConvertLinesToPointsOn ();
   void ConvertPolysToLinesOff ();
   void ConvertPolysToLinesOn ();
   void ConvertStripsToPolysOff ();
   void ConvertStripsToPolysOn ();
   void CreateDefaultLocator (void );
   float GetAbsoluteTolerance ();
   char *GetClassName ();
   int GetConvertLinesToPoints ();
   int GetConvertPolysToLines ();
   int GetConvertStripsToPolys ();
   vtkPointLocator *GetLocator ();
   unsigned long GetMTime ();
   float GetTolerance ();
   int GetToleranceIsAbsolute ();
   vtkCleanPolyData *New ();
   void ReleaseLocator (void );
   void SetAbsoluteTolerance (float );
   void SetConvertLinesToPoints (int );
   void SetConvertPolysToLines (int );
   void SetConvertStripsToPolys (int );
   void SetLocator (vtkPointLocator *locator);
   void SetTolerance (float );
   void SetToleranceIsAbsolute (int );
   void ToleranceIsAbsoluteOff ();
   void ToleranceIsAbsoluteOn ();


B<vtkCleanPolyData Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void OperateOnBounds (float in[6], float out[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void OperateOnPoint (float in[3], float out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ClipPolyData;


@Graphics::VTK::ClipPolyData::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::ClipPolyData

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CreateDefaultLocator ();
   void GenerateClipScalarsOff ();
   void GenerateClipScalarsOn ();
   void GenerateClippedOutputOff ();
   void GenerateClippedOutputOn ();
   const char *GetClassName();
   vtkImplicitFunction *GetClipFunction ();
   vtkPolyData *GetClippedOutput ();
   int GetGenerateClipScalars ();
   int GetGenerateClippedOutput ();
   int GetInsideOut ();
   vtkPointLocator *GetLocator ();
   unsigned long GetMTime ();
   float GetValue ();
   void InsideOutOff ();
   void InsideOutOn ();
   vtkClipPolyData *New ();
   void SetClipFunction (vtkImplicitFunction *);
   void SetGenerateClipScalars (int );
   void SetGenerateClippedOutput (int );
   void SetInsideOut (int );
   void SetLocator (vtkPointLocator *locator);
   void SetLocator (vtkPointLocator &locator);
   void SetValue (float );


B<vtkClipPolyData Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ClipVolume;


@Graphics::VTK::ClipVolume::ISA = qw( Graphics::VTK::StructuredPointsToUnstructuredGridFilter );

=head1 Graphics::VTK::ClipVolume

=over 1

=item *

Inherits from StructuredPointsToUnstructuredGridFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CreateDefaultLocator ();
   void GenerateClipScalarsOff ();
   void GenerateClipScalarsOn ();
   void GenerateClippedOutputOff ();
   void GenerateClippedOutputOn ();
   const char *GetClassName();
   vtkImplicitFunction *GetClipFunction ();
   vtkUnstructuredGrid *GetClippedOutput ();
   int GetGenerateClipScalars ();
   int GetGenerateClippedOutput ();
   int GetInsideOut ();
   vtkPointLocator *GetLocator ();
   unsigned long GetMTime ();
   float GetMergeTolerance ();
   float GetValue ();
   void InsideOutOff ();
   void InsideOutOn ();
   vtkClipVolume *New ();
   void SetClipFunction (vtkImplicitFunction *);
   void SetGenerateClipScalars (int );
   void SetGenerateClippedOutput (int );
   void SetInsideOut (int );
   void SetLocator (vtkPointLocator *locator);
   void SetLocator (vtkPointLocator &locator);
   void SetMergeTolerance (float );
   void SetValue (float );


B<vtkClipVolume Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ClipVoxel (float value, vtkScalars *cellScalars, int flip, float origin[3], float spacing[3], vtkIdList *cellIds, vtkPoints *cellPts, vtkPointData *inPD, vtkPointData *outPD, vtkCellData *inCD, int cellId, vtkCellData *outCD, vtkCellData *clippedCD);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ColorTransferFunction;


@Graphics::VTK::ColorTransferFunction::ISA = qw( Graphics::VTK::ScalarsToColors );

=head1 Graphics::VTK::ColorTransferFunction

=over 1

=item *

Inherits from ScalarsToColors

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddBluePoint (float x, float b);
   void AddBlueSegment (float x1, float b1, float x2, float b2);
   void AddGreenPoint (float x, float g);
   void AddGreenSegment (float x1, float g1, float x2, float g2);
   void AddHSVPoint (float x, float h, float s, float v);
   void AddHSVSegment (float x1, float h1, float s1, float v1, float x2, float h2, float s2, float v2);
   void AddRGBPoint (float x, float r, float g, float b);
   void AddRGBSegment (float x1, float r1, float g1, float b1, float x2, float r2, float g2, float b2);
   void AddRedPoint (float x, float r);
   void AddRedSegment (float x1, float r1, float x2, float r2);
   void ClampingOff ();
   void ClampingOn ();
   void DeepCopy (vtkColorTransferFunction *f);
   vtkPiecewiseFunction *GetBlueFunction ();
   int GetBlueSize ();
   float GetBlueValue (float x);
   int GetClamping ();
   const char *GetClassName();
   float *GetColor (float x);
      (Returns a 3-element Perl list)
   int GetColorSpace ();
   vtkPiecewiseFunction *GetGreenFunction ();
   int GetGreenSize ();
   float GetGreenValue (float x);
   float  *GetRange ();
      (Returns a 2-element Perl list)
   vtkPiecewiseFunction *GetRedFunction ();
   int GetRedSize ();
   float GetRedValue (float x);
   int GetSize ();
   int GetTotalSize ();
   float *GetValue (float x);
      (Returns a 3-element Perl list)
   vtkColorTransferFunction *New ();
   void RemoveAllPoints ();
   void RemoveBluePoint (float x);
   void RemoveGreenPoint (float x);
   void RemovePoint (float x);
   void RemoveRGBPoint (float x);
   void RemoveRedPoint (float x);
   void SetClamping (int );
   void SetColorSpace (int );
   void SetColorSpaceToHSV ();
   void SetColorSpaceToRGB ();
   virtual void SetRange (float , float );


B<vtkColorTransferFunction Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void BuildFunctionFromTable (float x1, float x2, int size, float *table);
      Don't know the size of pointer arg number 4

   void GetColor (float x, float rgb[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float *GetDataPointer ();
      Can't Handle 'float *' return type without a hint

   void GetTable (float x1, float x2, int n, float *table);
      Don't know the size of pointer arg number 4

   unsigned char *GetTable (float x1, float x2, int n);
      Can't Handle 'unsigned char *' return type without a hint

   virtual void MapScalarsThroughTable2 (void *input, unsigned char *output, int inputDataType, int numberOfValues, int inputIncrement, int outputIncrement);
      Don't know the size of pointer arg number 1

   virtual unsigned char *MapValue (float v);
      Can't Handle 'unsigned char *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetRange (float rng[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::Cone;


@Graphics::VTK::Cone::ISA = qw( Graphics::VTK::ImplicitFunction );

=head1 Graphics::VTK::Cone

=over 1

=item *

Inherits from ImplicitFunction

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float EvaluateFunction (float x, float y, float z);
   float GetAngle ();
   const char *GetClassName();
   vtkCone *New ();
   void SetAngle (float );


B<vtkCone Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float EvaluateFunction (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateGradient (float x[3], float g[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ConeSource;


@Graphics::VTK::ConeSource::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::ConeSource

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CappingOff ();
   void CappingOn ();
   float GetAngle ();
   int GetCapping ();
   const char *GetClassName();
   float GetHeight ();
   float GetRadius ();
   int GetResolution ();
   vtkConeSource *New ();
   void SetAngle (float angle);
   void SetCapping (int );
   void SetHeight (float );
   void SetRadius (float );
   void SetResolution (int );


B<vtkConeSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ConnectivityFilter;


@Graphics::VTK::ConnectivityFilter::ISA = qw( Graphics::VTK::DataSetToUnstructuredGridFilter );

=head1 Graphics::VTK::ConnectivityFilter

=over 1

=item *

Inherits from DataSetToUnstructuredGridFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddSeed (int id);
   void AddSpecifiedRegion (int id);
   void ColorRegionsOff ();
   void ColorRegionsOn ();
   void DeleteSeed (int id);
   void DeleteSpecifiedRegion (int id);
   const char *GetClassName();
   float  *GetClosestPoint ();
      (Returns a 3-element Perl list)
   int GetColorRegions ();
   int GetExtractionMode ();
   char *GetExtractionModeAsString ();
   int GetMaxRecursionDepth ();
   int GetNumberOfExtractedRegions ();
   int GetScalarConnectivity ();
   float  *GetScalarRange ();
      (Returns a 2-element Perl list)
   void InitializeSeedList ();
   void InitializeSpecifiedRegionList ();
   vtkConnectivityFilter *New ();
   void ScalarConnectivityOff ();
   void ScalarConnectivityOn ();
   void SetClosestPoint (float  , float , float );
   void SetColorRegions (int );
   void SetExtractionMode (int );
   void SetExtractionModeToAllRegions ();
   void SetExtractionModeToCellSeededRegions ();
   void SetExtractionModeToClosestPointRegion ();
   void SetExtractionModeToLargestRegion ();
   void SetExtractionModeToPointSeededRegions ();
   void SetExtractionModeToSpecifiedRegions ();
   void SetScalarConnectivity (int );
   void SetScalarRange (float  , float );


B<vtkConnectivityFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetClosestPoint (float  a[3]);
      Method is redundant. Same as SetClosestPoint( float, float, float)

   void SetMaxRecursionDepth (int );
      Method is marked 'Do Not Use' in its descriptions

   void SetScalarRange (float  a[2]);
      Method is redundant. Same as SetScalarRange( float, float)

   int ColorRegionsint ExtractionModevtkIdList *SeedsvtkIdList *SpecifiedRegionIdsvtkIntArray *RegionSizesfloat ClosestPoint[3]int ScalarConnectivityfloat ScalarRange[2]void TraverseAndMark ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ContourFilter;


@Graphics::VTK::ContourFilter::ISA = qw( Graphics::VTK::DataSetToPolyDataFilter );

=head1 Graphics::VTK::ContourFilter

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
   vtkContourFilter *New ();
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


B<vtkContourFilter Unsupported Funcs:>

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

package Graphics::VTK::ContourGrid;


@Graphics::VTK::ContourGrid::ISA = qw( Graphics::VTK::DataSetToPolyDataFilter );

=head1 Graphics::VTK::ContourGrid

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
   vtkContourGrid *New ();
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


B<vtkContourGrid Unsupported Funcs:>

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

package Graphics::VTK::CubeSource;


@Graphics::VTK::CubeSource::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::CubeSource

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float  *GetCenter ();
      (Returns a 3-element Perl list)
   const char *GetClassName();
   float GetXLength ();
   float GetYLength ();
   float GetZLength ();
   vtkCubeSource *New ();
   void SetBounds (float xMin, float xMax, float yMin, float yMax, float zMin, float zMax);
   void SetCenter (float  , float , float );
   void SetXLength (float );
   void SetYLength (float );
   void SetZLength (float );


B<vtkCubeSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetBounds (float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetCenter (float  a[3]);
      Method is redundant. Same as SetCenter( float, float, float)


=cut

package Graphics::VTK::Cursor3D;


@Graphics::VTK::Cursor3D::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::Cursor3D

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AllOff ();
   void AllOn ();
   void AxesOff ();
   void AxesOn ();
   int GetAxes ();
   const char *GetClassName();
   float  *GetFocalPoint ();
      (Returns a 3-element Perl list)
   vtkPolyData *GetFocus ();
   float  *GetModelBounds ();
      (Returns a 6-element Perl list)
   int GetOutline ();
   int GetWrap ();
   int GetXShadows ();
   int GetYShadows ();
   int GetZShadows ();
   vtkCursor3D *New ();
   void OutlineOff ();
   void OutlineOn ();
   void SetAxes (int );
   void SetFocalPoint (float  , float , float );
   void SetModelBounds (float xmin, float xmax, float ymin, float ymax, float zmin, float zmax);
   void SetOutline (int );
   void SetWrap (int );
   void SetXShadows (int );
   void SetYShadows (int );
   void SetZShadows (int );
   void WrapOff ();
   void WrapOn ();
   void XShadowsOff ();
   void XShadowsOn ();
   void YShadowsOff ();
   void YShadowsOn ();
   void ZShadowsOff ();
   void ZShadowsOn ();


B<vtkCursor3D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetFocalPoint (float  a[3]);
      Method is redundant. Same as SetFocalPoint( float, float, float)

   void SetModelBounds (float *bounds);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::CullerCollection;


@Graphics::VTK::CullerCollection::ISA = qw( Graphics::VTK::Collection );

=head1 Graphics::VTK::CullerCollection

=over 1

=item *

Inherits from Collection

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddItem (vtkCuller *a);
   const char *GetClassName();
   vtkCuller *GetLastItem ();
   vtkCuller *GetNextItem ();
   vtkCullerCollection *New ();

=cut

package Graphics::VTK::Cutter;


@Graphics::VTK::Cutter::ISA = qw( Graphics::VTK::DataSetToPolyDataFilter );

=head1 Graphics::VTK::Cutter

=over 1

=item *

Inherits from DataSetToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CreateDefaultLocator ();
   void GenerateCutScalarsOff ();
   void GenerateCutScalarsOn ();
   void GenerateValues (int numContours, float rangeStart, float rangeEnd);
   const char *GetClassName();
   vtkImplicitFunction *GetCutFunction ();
   int GetGenerateCutScalars ();
   vtkPointLocator *GetLocator ();
   unsigned long GetMTime ();
   int GetNumberOfContours ();
   int GetSortBy ();
   char *GetSortByAsString ();
   float GetValue (int i);
   vtkCutter *New ();
   void SetCutFunction (vtkImplicitFunction *);
   void SetGenerateCutScalars (int );
   void SetLocator (vtkPointLocator *locator);
   void SetLocator (vtkPointLocator &locator);
   void SetNumberOfContours (int number);
   void SetSortBy (int );
   void SetSortByToSortByCell ();
   void SetSortByToSortByValue ();
   void SetValue (int i, float value);


B<vtkCutter Unsupported Funcs:>

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

package Graphics::VTK::Cylinder;


@Graphics::VTK::Cylinder::ISA = qw( Graphics::VTK::ImplicitFunction );

=head1 Graphics::VTK::Cylinder

=over 1

=item *

Inherits from ImplicitFunction

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float EvaluateFunction (float x, float y, float z);
   float  *GetCenter ();
      (Returns a 3-element Perl list)
   const char *GetClassName();
   float GetRadius ();
   vtkCylinder *New ();
   void SetCenter (float  , float , float );
   void SetRadius (float );


B<vtkCylinder Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float EvaluateFunction (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateGradient (float x[3], float g[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetCenter (float  a[3]);
      Method is redundant. Same as SetCenter( float, float, float)


=cut

package Graphics::VTK::CylinderSource;


@Graphics::VTK::CylinderSource::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::CylinderSource

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CappingOff ();
   void CappingOn ();
   int GetCapping ();
   float  *GetCenter ();
      (Returns a 3-element Perl list)
   const char *GetClassName();
   float GetHeight ();
   float GetRadius ();
   int GetResolution ();
   vtkCylinderSource *New ();
   void SetCapping (int );
   void SetCenter (float  , float , float );
   void SetHeight (float );
   void SetRadius (float );
   void SetResolution (int );


B<vtkCylinderSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetCenter (float  a[3]);
      Method is redundant. Same as SetCenter( float, float, float)


=cut

package Graphics::VTK::DashedStreamLine;


@Graphics::VTK::DashedStreamLine::ISA = qw( Graphics::VTK::StreamLine );

=head1 Graphics::VTK::DashedStreamLine

=over 1

=item *

Inherits from StreamLine

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetDashFactor ();
   vtkDashedStreamLine *New ();
   void SetDashFactor (float );


B<vtkDashedStreamLine Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::DataObjectReader;


@Graphics::VTK::DataObjectReader::ISA = qw( Graphics::VTK::DataReader );

=head1 Graphics::VTK::DataObjectReader

=over 1

=item *

Inherits from DataReader

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkDataObject *GetOutput (int idx);
   vtkDataObject *GetOutput ();
   vtkDataObjectReader *New ();
   void SetOutput (vtkDataObject *);


B<vtkDataObjectReader Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::DataObjectSource;


@Graphics::VTK::DataObjectSource::ISA = qw( Graphics::VTK::Source );

=head1 Graphics::VTK::DataObjectSource

=over 1

=item *

Inherits from Source

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkDataObject *GetOutput (int idx);
   vtkDataObject *GetOutput ();
   vtkDataObjectSource *New ();
   void SetOutput (vtkDataObject *);

=cut

package Graphics::VTK::DataObjectToDataSetFilter;


@Graphics::VTK::DataObjectToDataSetFilter::ISA = qw( Graphics::VTK::Source );

=head1 Graphics::VTK::DataObjectToDataSetFilter

=over 1

=item *

Inherits from Source

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void DefaultNormalizeOff ();
   void DefaultNormalizeOn ();
   int GetCellConnectivityComponentArrayComponent ();
   char *GetCellConnectivityComponentArrayName ();
   int GetCellConnectivityComponentMaxRange ();
   int GetCellConnectivityComponentMinRange ();
   int GetCellTypeComponentArrayComponent ();
   char *GetCellTypeComponentArrayName ();
   int GetCellTypeComponentMaxRange ();
   int GetCellTypeComponentMinRange ();
   const char *GetClassName();
   int GetDataSetType ();
   int GetDefaultNormalize ();
   int  *GetDimensions ();
      (Returns a 3-element Perl list)
   vtkDataObject *GetInput ();
   int GetLinesComponentArrayComponent ();
   char *GetLinesComponentArrayName ();
   int GetLinesComponentMaxRange ();
   int GetLinesComponentMinRange ();
   float  *GetOrigin ();
      (Returns a 3-element Perl list)
   vtkDataSet *GetOutput (int idx);
   vtkDataSet *GetOutput ();
   int GetPointComponentArrayComponent (int comp);
   char *GetPointComponentArrayName (int comp);
   int GetPointComponentMaxRange (int comp);
   int GetPointComponentMinRange (int comp);
   int GetPointComponentNormailzeFlag (int comp);
   vtkPolyData *GetPolyDataOutput ();
   int GetPolysComponentArrayComponent ();
   char *GetPolysComponentArrayName ();
   int GetPolysComponentMaxRange ();
   int GetPolysComponentMinRange ();
   vtkRectilinearGrid *GetRectilinearGridOutput ();
   float  *GetSpacing ();
      (Returns a 3-element Perl list)
   int GetStripsComponentArrayComponent ();
   char *GetStripsComponentArrayName ();
   int GetStripsComponentMaxRange ();
   int GetStripsComponentMinRange ();
   vtkStructuredGrid *GetStructuredGridOutput ();
   vtkStructuredPoints *GetStructuredPointsOutput ();
   vtkUnstructuredGrid *GetUnstructuredGridOutput ();
   int GetVertsComponentArrayComponent ();
   char *GetVertsComponentArrayName ();
   int GetVertsComponentMaxRange ();
   int GetVertsComponentMinRange ();
   vtkDataObjectToDataSetFilter *New ();
   void SetCellConnectivityComponent (char *arrayName, int arrayComp, int min, int max);
   void SetCellConnectivityComponent (char *arrayName, int arrayComp);
   void SetCellTypeComponent (char *arrayName, int arrayComp, int min, int max);
   void SetCellTypeComponent (char *arrayName, int arrayComp);
   void SetDataSetType (int );
   void SetDataSetTypeToPolyData ();
   void SetDataSetTypeToRectilinearGrid ();
   void SetDataSetTypeToStructuredGrid ();
   void SetDataSetTypeToStructuredPoints ();
   void SetDataSetTypeToUnstructuredGrid ();
   void SetDefaultNormalize (int );
   void SetDimensions (int  , int , int );
   void SetDimensionsComponent (char *arrayName, int arrayComp, int min, int max);
   void SetDimensionsComponent (char *arrayName, int arrayComp);
   void SetInput (vtkDataObject *input);
   void SetLinesComponent (char *arrayName, int arrayComp, int min, int max);
   void SetLinesComponent (char *arrayName, int arrayComp);
   void SetOrigin (float  , float , float );
   void SetOriginComponent (char *arrayName, int arrayComp, int min, int max);
   void SetOriginComponent (char *arrayName, int arrayComp);
   void SetPointComponent (int comp, char *arrayName, int arrayComp, int min, int max, int normalize);
   void SetPointComponent (int comp, char *arrayName, int arrayComp);
   void SetPolysComponent (char *arrayName, int arrayComp, int min, int max);
   void SetPolysComponent (char *arrayName, int arrayComp);
   void SetSpacing (float  , float , float );
   void SetSpacingComponent (char *arrayName, int arrayComp, int min, int max);
   void SetSpacingComponent (char *arrayName, int arrayComp);
   void SetStripsComponent (char *arrayName, int arrayComp, int min, int max);
   void SetStripsComponent (char *arrayName, int arrayComp);
   void SetVertsComponent (char *arrayName, int arrayComp, int min, int max);
   void SetVertsComponent (char *arrayName, int arrayComp);


B<vtkDataObjectToDataSetFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   vtkCellArray *ConstructCellArray (vtkDataArray *da, int comp, int compRange[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int DefaultNormalizeint Dimensions[3]float Origin[3]float Spacing[3]char *DimensionsArrayint DimensionsArrayComponentint DimensionsComponentRange[2]char *OriginArrayint OriginArrayComponentint OriginComponentRange[2]char *SpacingArrayint SpacingArrayComponentint SpacingComponentRange[2]void ConstructDimensions ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   char Updatingint DataSetTypechar *PointArrays[3]int PointArrayComponents[3]int PointComponentRange[3][2]int PointNormalize[3]char *VertsArrayint VertsArrayComponentint VertsComponentRange[2]char *LinesArrayint LinesArrayComponentint LinesComponentRange[2]char *PolysArrayint PolysArrayComponentint PolysComponentRange[2]char *StripsArrayint StripsArrayComponentint StripsComponentRange[2]char *CellTypeArrayint CellTypeArrayComponentint CellTypeComponentRange[2]char *CellConnectivityArrayint CellConnectivityArrayComponentint CellConnectivityComponentRange[2]void SetArrayName (char &name, char *newName);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetDimensions (int  a[3]);
      Method is redundant. Same as SetDimensions( int, int, int)

   void SetOrigin (float  a[3]);
      Method is redundant. Same as SetOrigin( float, float, float)

   void SetSpacing (float  a[3]);
      Method is redundant. Same as SetSpacing( float, float, float)


=cut

package Graphics::VTK::DataObjectWriter;


@Graphics::VTK::DataObjectWriter::ISA = qw( Graphics::VTK::Writer );

=head1 Graphics::VTK::DataObjectWriter

=over 1

=item *

Inherits from Writer

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   char *GetFieldDataName ();
   char *GetFileName ();
   int GetFileType ();
   char *GetHeader ();
   vtkDataObject *GetInput ();
   vtkDataObjectWriter *New ();
   void SetFieldDataName (char *fieldname);
   void SetFileName (char *filename);
   void SetFileType (int type);
   void SetFileTypeToASCII ();
   void SetFileTypeToBinary ();
   void SetHeader (char *header);
   void SetInput (vtkDataObject &input);
   void SetInput (vtkDataObject *input);


B<vtkDataObjectWriter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::DataReader;


@Graphics::VTK::DataReader::ISA = qw( Graphics::VTK::Source );

=head1 Graphics::VTK::DataReader

=over 1

=item *

Inherits from Source

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CloseVTKFile ();
   const char *GetClassName();
   char *GetFieldDataName ();
   char *GetFieldDataNameInFile (int i);
   char *GetFileName ();
   int GetFileType ();
   char *GetGhostLevelsName ();
   char *GetGhostLevelsNameInFile (int i);
   char *GetHeader ();
   char *GetInputString ();
   int GetInputStringLength ();
   char *GetLookupTableName ();
   char *GetNormalsName ();
   char *GetNormalsNameInFile (int i);
   int GetNumberOfFieldDataInFile ();
   int GetNumberOfGhostLevelsInFile ();
   int GetNumberOfNormalsInFile ();
   int GetNumberOfScalarsInFile ();
   int GetNumberOfTCoordsInFile ();
   int GetNumberOfTensorsInFile ();
   int GetNumberOfVectorsInFile ();
   int GetReadFromInputString ();
   char *GetScalarsName ();
   char *GetScalarsNameInFile (int i);
   char *GetTCoordsName ();
   char *GetTCoordsNameInFile (int i);
   char *GetTensorsName ();
   char *GetTensorsNameInFile (int i);
   char *GetVectorsName ();
   char *GetVectorsNameInFile (int i);
   int IsFilePolyData ();
   int IsFileRectilinearGrid ();
   int IsFileStructuredGrid ();
   int IsFileStructuredPoints ();
   int IsFileUnstructuredGrid ();
   int IsFileValid (char *dstype);
   char *LowerCase (char *);
   vtkDataReader *New ();
   int OpenVTKFile ();
   int Read (char *);
   vtkDataArray *ReadArray (char *dataType, int numTuples, int numComp);
   int ReadCellData (vtkDataSet *ds, int numCells);
   int ReadCoordinates (vtkRectilinearGrid *rg, int axes, int numCoords);
   vtkFieldData *ReadFieldData ();
   void ReadFromInputStringOff ();
   void ReadFromInputStringOn ();
   int ReadHeader ();
   int ReadPointData (vtkDataSet *ds, int numPts);
   int ReadPoints (vtkPointSet *ps, int numPts);
   void SetBinaryInputString (char *, int len);
   void SetFieldDataName (char *);
   void SetFileName (char *);
   void SetGhostLevelsName (char *);
   void SetInputString (char *in, int len);
   void SetInputString (char *in);
   void SetLookupTableName (char *);
   void SetNormalsName (char *);
   void SetReadFromInputString (int );
   void SetScalarsName (char *);
   void SetTCoordsName (char *);
   void SetTensorsName (char *);
   void SetVectorsName (char *);


B<vtkDataReader Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   istream *GetIStream ();
      Can't Handle istream return type yet

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   int ReadCells (int size, int *data);
      Don't know the size of pointer arg number 2

   int ReadCells (int size, int *data, int skip1, int read2, int skip3);
      Don't know the size of pointer arg number 2

   int ReadLine (char result[256]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int ReadString (char result[256]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int Read (unsigned char *);
      Don't know the size of pointer arg number 1

   int Read (short *);
      Don't know the size of pointer arg number 1

   int Read (unsigned short *);
      Don't know the size of pointer arg number 1

   int Read (int *);
      Don't know the size of pointer arg number 1

   int Read (unsigned int *);
      Don't know the size of pointer arg number 1

   int Read (long *);
      Don't know the size of pointer arg number 1

   int Read (unsigned long *);
      Don't know the size of pointer arg number 1

   int Read (float *);
      Don't know the size of pointer arg number 1

   int Read (double *);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::DataSetMapper;


@Graphics::VTK::DataSetMapper::ISA = qw( Graphics::VTK::Mapper );

=head1 Graphics::VTK::DataSetMapper

=over 1

=item *

Inherits from Mapper

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkDataSet *GetInput ();
   unsigned long GetMTime ();
   vtkPolyDataMapper *GetPolyDataMapper ();
   vtkDataSetMapper *New ();
   void ReleaseGraphicsResources (vtkWindow *);
   void Render (vtkRenderer *ren, vtkActor *act);
   void SetInput (vtkImageData *cache);
   void SetInput (vtkDataSet *input);


B<vtkDataSetMapper Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::DataSetReader;


@Graphics::VTK::DataSetReader::ISA = qw( Graphics::VTK::DataReader );

=head1 Graphics::VTK::DataSetReader

=over 1

=item *

Inherits from DataReader

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkDataSet *GetOutput (int idx);
   vtkDataSet *GetOutput ();
   vtkPolyData *GetPolyDataOutput ();
   vtkRectilinearGrid *GetRectilinearGridOutput ();
   vtkStructuredGrid *GetStructuredGridOutput ();
   vtkStructuredPoints *GetStructuredPointsOutput ();
   vtkUnstructuredGrid *GetUnstructuredGridOutput ();
   vtkDataSetReader *New ();
   void Update ();


B<vtkDataSetReader Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::DataSetSource;


@Graphics::VTK::DataSetSource::ISA = qw( Graphics::VTK::Source );

=head1 Graphics::VTK::DataSetSource

=over 1

=item *

Inherits from Source

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkDataSet *GetOutput (int idx);
   vtkDataSet *GetOutput ();
   vtkDataSetSource *New ();
   void SetOutput (vtkDataSet *);

=cut

package Graphics::VTK::DataSetToDataObjectFilter;


@Graphics::VTK::DataSetToDataObjectFilter::ISA = qw( Graphics::VTK::DataObjectSource );

=head1 Graphics::VTK::DataSetToDataObjectFilter

=over 1

=item *

Inherits from DataObjectSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CellDataOff ();
   void CellDataOn ();
   void FieldDataOff ();
   void FieldDataOn ();
   void GeometryOff ();
   void GeometryOn ();
   int GetCellData ();
   const char *GetClassName();
   int GetFieldData ();
   int GetGeometry ();
   vtkDataSet *GetInput ();
   int GetPointData ();
   int GetTopology ();
   vtkDataSetToDataObjectFilter *New ();
   void PointDataOff ();
   void PointDataOn ();
   void SetCellData (int );
   void SetFieldData (int );
   void SetGeometry (int );
   virtual void SetInput (vtkDataSet *input);
   void SetPointData (int );
   void SetTopology (int );
   void TopologyOff ();
   void TopologyOn ();


B<vtkDataSetToDataObjectFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::DataSetTriangleFilter;


@Graphics::VTK::DataSetTriangleFilter::ISA = qw( Graphics::VTK::DataSetToUnstructuredGridFilter );

=head1 Graphics::VTK::DataSetTriangleFilter

=over 1

=item *

Inherits from DataSetToUnstructuredGridFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkDataSetTriangleFilter *New ();


B<vtkDataSetTriangleFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::DataSetWriter;


@Graphics::VTK::DataSetWriter::ISA = qw( Graphics::VTK::DataWriter );

=head1 Graphics::VTK::DataSetWriter

=over 1

=item *

Inherits from DataWriter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkDataSet *GetInput ();
   vtkDataSetWriter *New ();
   void SetInput (vtkImageData *cache);
   void SetInput (vtkDataSet *input);


B<vtkDataSetWriter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::DataWriter;


@Graphics::VTK::DataWriter::ISA = qw( Graphics::VTK::Writer );

=head1 Graphics::VTK::DataWriter

=over 1

=item *

Inherits from Writer

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   char *GetFieldDataName ();
   char *GetFileName ();
   int GetFileType ();
   char *GetGhostLevelsName ();
   char *GetHeader ();
   char *GetLookupTableName ();
   char *GetNormalsName ();
   char *GetOutputString ();
   int GetOutputStringLength ();
   char *GetScalarsName ();
   char *GetTCoordsName ();
   char *GetTensorsName ();
   char *GetVectorsName ();
   int GetWriteToOutputString ();
   vtkDataWriter *New ();
   char *RegisterAndGetOutputString ();
   void SetFieldDataName (char *);
   void SetFileName (char *);
   void SetFileType (int );
   void SetFileTypeToASCII ();
   void SetFileTypeToBinary ();
   void SetGhostLevelsName (char *);
   void SetHeader (char *);
   void SetLookupTableName (char *);
   void SetNormalsName (char *);
   void SetScalarsName (char *);
   void SetTCoordsName (char *);
   void SetTensorsName (char *);
   void SetVectorsName (char *);
   void SetWriteToOutputString (int );
   void WriteToOutputStringOff ();
   void WriteToOutputStringOn ();


B<vtkDataWriter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void CloseVTKFile (ostream *fp);
      I/O Streams not Supported yet

   unsigned char *GetBinaryOutputString ();
      Can't Handle 'unsigned char *' return type without a hint

   virtual ostream *OpenVTKFile ();
      I/O Streams not Supported yet

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   char *FileNamechar *Headerint FileTypechar *ScalarsNamechar *VectorsNamechar *TensorsNamechar *GhostLevelsNamechar *TCoordsNamechar *NormalsNamechar *LookupTableNamechar *FieldDataNameint WriteArray (ostream *fp, int dataType, vtkDataArray *data, char *format, int num, int numComp);
      Don't know the size of pointer arg number 1

   int WriteCellData (ostream *fp, vtkDataSet *ds);
      I/O Streams not Supported yet

   int WriteCells (ostream *fp, vtkCellArray *cells, char *label);
      I/O Streams not Supported yet

   int WriteCoordinates (ostream *fp, vtkScalars *coords, int axes);
      I/O Streams not Supported yet

   int WriteDataSetData (ostream *fp, vtkDataSet *ds);
      I/O Streams not Supported yet

   int WriteFieldData (ostream *fp, vtkFieldData *f);
      I/O Streams not Supported yet

   int WriteGhostLevelData (ostream *fp, vtkGhostLevels *g, int num);
      Don't know the size of pointer arg number 1

   int WriteHeader (ostream *fp);
      I/O Streams not Supported yet

   int WriteNormalData (ostream *fp, vtkNormals *n, int num);
      Don't know the size of pointer arg number 1

   int WritePointData (ostream *fp, vtkDataSet *ds);
      I/O Streams not Supported yet

   int WritePoints (ostream *fp, vtkPoints *p);
      I/O Streams not Supported yet

   int WriteScalarData (ostream *fp, vtkScalars *s, int num);
      Don't know the size of pointer arg number 1

   int WriteTCoordData (ostream *fp, vtkTCoords *tc, int num);
      Don't know the size of pointer arg number 1

   int WriteTensorData (ostream *fp, vtkTensors *t, int num);
      Don't know the size of pointer arg number 1

   int WriteVectorData (ostream *fp, vtkVectors *v, int num);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::DecimatePro;


@Graphics::VTK::DecimatePro::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::DecimatePro

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AccumulateErrorOff ();
   void AccumulateErrorOn ();
   void BoundaryVertexDeletionOff ();
   void BoundaryVertexDeletionOn ();
   float GetAbsoluteError ();
   int GetAccumulateError ();
   int GetBoundaryVertexDeletion ();
   const char *GetClassName();
   int GetDegree ();
   int GetErrorIsAbsolute ();
   float GetFeatureAngle ();
   float GetInflectionPointRatio ();
   float GetMaximumError ();
   int GetNumberOfInflectionPoints ();
   int GetPreSplitMesh ();
   int GetPreserveTopology ();
   float GetSplitAngle ();
   int GetSplitting ();
   float GetTargetReduction ();
   vtkDecimatePro *New ();
   void PreSplitMeshOff ();
   void PreSplitMeshOn ();
   void PreserveTopologyOff ();
   void PreserveTopologyOn ();
   void SetAbsoluteError (float );
   void SetAccumulateError (int );
   void SetBoundaryVertexDeletion (int );
   void SetDegree (int );
   void SetErrorIsAbsolute (int );
   void SetFeatureAngle (float );
   void SetInflectionPointRatio (float );
   void SetMaximumError (float );
   void SetPreSplitMesh (int );
   void SetPreserveTopology (int );
   void SetSplitAngle (float );
   void SetSplitting (int );
   void SetTargetReduction (float );
   void SplittingOff ();
   void SplittingOn ();


B<vtkDecimatePro Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int EvaluateVertex (int ptId, unsigned short numTris, int *tris, int fedges[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int FindSplit (int type, int fedges[2], int &pt1, int &pt2, vtkIdList *CollapseTris);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetInflectionPoints (float *inflectionPoints);
      Don't know the size of pointer arg number 1

   float *GetInflectionPoints ();
      Can't Handle 'float *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SplitLoop (int fedges[2], int &n1, int *l1, int &n2, int *l2);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SplitVertex (int ptId, int type, unsigned short numTris, int *tris, int insert);
      Don't know the size of pointer arg number 4


=cut

package Graphics::VTK::Delaunay2D;


@Graphics::VTK::Delaunay2D::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::Delaunay2D

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BoundingTriangulationOff ();
   void BoundingTriangulationOn ();
   double GetAlpha ();
   int GetBoundingTriangulation ();
   const char *GetClassName();
   vtkPointSet *GetInput ();
   double GetOffset ();
   vtkPolyData *GetSource ();
   double GetTolerance ();
   vtkDelaunay2D *New ();
   void SetAlpha (double );
   void SetBoundingTriangulation (int );
   virtual void SetInput (vtkPointSet *input);
   void SetOffset (double );
   void SetSource (vtkPolyData *);
   void SetTolerance (double );


B<vtkDelaunay2D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void CheckEdge (int ptId, double x[3], int p1, int p2, int tri);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void FillPolygons (vtkCellArray *polys, int *triUse);
      Don't know the size of pointer arg number 2

   int FindTriangle (double x[3], int ptIds[3], int tri, double tol, int nei[3], vtkIdList *neighbors);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetPoint (int id, double x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int InCircle (double x[3], double x1[3], double x2[3], double x3[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   double Alphadouble Toleranceint BoundingTriangulationdouble OffsetvtkPolyData *Meshdouble *Pointsvoid SetPoint (int id, double *x);
      Don't know the size of pointer arg number 2


=cut

package Graphics::VTK::Delaunay3D;


@Graphics::VTK::Delaunay3D::ISA = qw( Graphics::VTK::UnstructuredGridSource );

=head1 Graphics::VTK::Delaunay3D

=over 1

=item *

Inherits from UnstructuredGridSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BoundingTriangulationOff ();
   void BoundingTriangulationOn ();
   void CreateDefaultLocator ();
   void EndPointInsertion ();
   float GetAlpha ();
   int GetBoundingTriangulation ();
   const char *GetClassName();
   vtkPointSet *GetInput ();
   vtkPointLocator *GetLocator ();
   unsigned long GetMTime ();
   float GetOffset ();
   float GetTolerance ();
   vtkDelaunay3D *New ();
   void SetAlpha (float );
   void SetBoundingTriangulation (int );
   virtual void SetInput (vtkPointSet *input);
   void SetLocator (vtkPointLocator *locator);
   void SetOffset (float );
   void SetTolerance (float );


B<vtkDelaunay3D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int NumberOfDuplicatePointsint NumberOfDegeneraciesint *Referencesint FindEnclosingFaces (float x[3], vtkUnstructuredGrid *Mesh, vtkIdList *tetras, vtkIdList *faces, vtkPointLocator *Locator);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float Alphafloat Toleranceint BoundingTriangulationfloat OffsetvtkPointLocator *LocatorvtkTetraArray *TetraArrayint FindTetra (vtkUnstructuredGrid *Mesh, double x[3], int tetId, int depth);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int InSphere (double x[3], int tetraId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   vtkUnstructuredGrid *InitPointInsertion (float center[3], float length, int numPts, vtkPoints &pts);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   vtkUnstructuredGrid *InitPointInsertion (int numPtsToInsert, int numTetra, vtkPoints *boundingTetraPts, float bounds[6], vtkPoints &pts);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   vtkUnstructuredGrid *InitPointInsertion (int numPtsToInsert, int numTetra, vtkPoints &boundingTetraPts, float bounds[6], vtkPoints &pts);
      Method is marked 'Do Not Use' in its descriptions

   void InsertPoint (vtkUnstructuredGrid *Mesh, vtkPoints *points, int id, float x[3], vtkIdList *holeTetras);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InsertPoint (vtkUnstructuredGrid *Mesh, vtkPoints *points, int id, float x[3], vtkIdList &holeTetras);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetLocator (vtkPointLocator &locator);
      Method is marked 'Do Not Use' in its descriptions


=cut

package Graphics::VTK::DiskSource;


@Graphics::VTK::DiskSource::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::DiskSource

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int GetCircumferentialResolution ();
   const char *GetClassName();
   float GetInnerRadius ();
   float GetOuterRadius ();
   int GetRadialResolution ();
   vtkDiskSource *New ();
   void SetCircumferentialResolution (int );
   void SetInnerRadius (float );
   void SetOuterRadius (float );
   void SetRadialResolution (int );


B<vtkDiskSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::EdgePoints;


@Graphics::VTK::EdgePoints::ISA = qw( Graphics::VTK::DataSetToPolyDataFilter );

=head1 Graphics::VTK::EdgePoints

=over 1

=item *

Inherits from DataSetToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetValue ();
   vtkEdgePoints *New ();
   void SetValue (float );


B<vtkEdgePoints Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ElevationFilter;


@Graphics::VTK::ElevationFilter::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::ElevationFilter

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float  *GetHighPoint ();
      (Returns a 3-element Perl list)
   float  *GetLowPoint ();
      (Returns a 3-element Perl list)
   float  *GetScalarRange ();
      (Returns a 2-element Perl list)
   vtkElevationFilter *New ();
   void SetHighPoint (float  , float , float );
   void SetLowPoint (float  , float , float );
   void SetScalarRange (float  , float );


B<vtkElevationFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetHighPoint (float  a[3]);
      Method is redundant. Same as SetHighPoint( float, float, float)

   void SetLowPoint (float  a[3]);
      Method is redundant. Same as SetLowPoint( float, float, float)

   void SetScalarRange (float  a[2]);
      Method is redundant. Same as SetScalarRange( float, float)


=cut

package Graphics::VTK::EncodedGradientShader;


@Graphics::VTK::EncodedGradientShader::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::EncodedGradientShader

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetZeroNormalDiffuseIntensity ();
   float GetZeroNormalSpecularIntensity ();
   vtkEncodedGradientShader *New ();
   void SetZeroNormalDiffuseIntensity (float );
   void SetZeroNormalSpecularIntensity (float );
   void UpdateShadingTable (vtkRenderer *ren, vtkVolume *vol, vtkEncodedGradientEstimator *gradest);


B<vtkEncodedGradientShader Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void BuildShadingTable (int index, float lightDirection[3], float lightColor[3], float lightIntensity, float viewDirection[3], float material[4], int twoSided, vtkEncodedGradientEstimator *gradest, int updateFlag);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float *GetBlueDiffuseShadingTable (vtkVolume *vol);
      Can't Handle 'float *' return type without a hint

   float *GetBlueSpecularShadingTable (vtkVolume *vol);
      Can't Handle 'float *' return type without a hint

   float *GetGreenDiffuseShadingTable (vtkVolume *vol);
      Can't Handle 'float *' return type without a hint

   float *GetGreenSpecularShadingTable (vtkVolume *vol);
      Can't Handle 'float *' return type without a hint

   float *GetRedDiffuseShadingTable (vtkVolume *vol);
      Can't Handle 'float *' return type without a hint

   float *GetRedSpecularShadingTable (vtkVolume *vol);
      Can't Handle 'float *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent index);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ExtractEdges;


@Graphics::VTK::ExtractEdges::ISA = qw( Graphics::VTK::DataSetToPolyDataFilter );

=head1 Graphics::VTK::ExtractEdges

=over 1

=item *

Inherits from DataSetToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CreateDefaultLocator ();
   const char *GetClassName();
   vtkPointLocator *GetLocator ();
   unsigned long GetMTime ();
   vtkExtractEdges *New ();
   void SetLocator (vtkPointLocator *locator);
   void SetLocator (vtkPointLocator &locator);


B<vtkExtractEdges Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ExtractGeometry;


@Graphics::VTK::ExtractGeometry::ISA = qw( Graphics::VTK::DataSetToUnstructuredGridFilter );

=head1 Graphics::VTK::ExtractGeometry

=over 1

=item *

Inherits from DataSetToUnstructuredGridFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ExtractInsideOff ();
   void ExtractInsideOn ();
   const char *GetClassName();
   int GetExtractInside ();
   vtkImplicitFunction *GetImplicitFunction ();
   unsigned long GetMTime ();
   vtkExtractGeometry *New ();
   void SetExtractInside (int );
   void SetImplicitFunction (vtkImplicitFunction *);


B<vtkExtractGeometry Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ExtractPolyDataGeometry;


@Graphics::VTK::ExtractPolyDataGeometry::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::ExtractPolyDataGeometry

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ExtractInsideOff ();
   void ExtractInsideOn ();
   const char *GetClassName();
   int GetExtractInside ();
   vtkImplicitFunction *GetImplicitFunction ();
   unsigned long GetMTime ();
   vtkExtractPolyDataGeometry *New ();
   void SetExtractInside (int );
   void SetImplicitFunction (vtkImplicitFunction *);


B<vtkExtractPolyDataGeometry Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ExtractPolyDataPiece;


@Graphics::VTK::ExtractPolyDataPiece::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::ExtractPolyDataPiece

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CreateGhostCellsOff ();
   void CreateGhostCellsOn ();
   const char *GetClassName();
   int GetCreateGhostCells ();
   vtkExtractPolyDataPiece *New ();
   void SetCreateGhostCells (int );


B<vtkExtractPolyDataPiece Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ExtractGrid;


@Graphics::VTK::ExtractGrid::ISA = qw( Graphics::VTK::StructuredGridToStructuredGridFilter );

=head1 Graphics::VTK::ExtractGrid

=over 1

=item *

Inherits from StructuredGridToStructuredGridFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetIncludeBoundary ();
   int  *GetSampleRate ();
      (Returns a 3-element Perl list)
   int  *GetVOI ();
      (Returns a 6-element Perl list)
   void IncludeBoundaryOff ();
   void IncludeBoundaryOn ();
   vtkExtractGrid *New ();
   void SetIncludeBoundary (int );
   void SetSampleRate (int  , int , int );
   void SetVOI (int  , int , int , int , int , int );


B<vtkExtractGrid Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetSampleRate (int  a[3]);
      Method is redundant. Same as SetSampleRate( int, int, int)

   void SetVOI (int  a[6]);
      Method is redundant. Same as SetVOI( int, int, int, int, int, int)


=cut

package Graphics::VTK::ExtractTensorComponents;


@Graphics::VTK::ExtractTensorComponents::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::ExtractTensorComponents

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ExtractNormalsOff ();
   void ExtractNormalsOn ();
   void ExtractScalarsOff ();
   void ExtractScalarsOn ();
   void ExtractTCoordsOff ();
   void ExtractTCoordsOn ();
   void ExtractVectorsOff ();
   void ExtractVectorsOn ();
   const char *GetClassName();
   int GetExtractNormals ();
   int GetExtractScalars ();
   int GetExtractTCoords ();
   int GetExtractVectors ();
   int  *GetNormalComponents ();
      (Returns a 6-element Perl list)
   int GetNormalizeNormals ();
   int GetNumberOfTCoords ();
   int GetPassTensorsToOutput ();
   int  *GetScalarComponents ();
      (Returns a 2-element Perl list)
   int GetScalarMode ();
   int  *GetTCoordComponents ();
      (Returns a 6-element Perl list)
   int  *GetVectorComponents ();
      (Returns a 6-element Perl list)
   vtkExtractTensorComponents *New ();
   void NormalizeNormalsOff ();
   void NormalizeNormalsOn ();
   void PassTensorsToOutputOff ();
   void PassTensorsToOutputOn ();
   void ScalarIsComponent ();
   void ScalarIsDeterminant ();
   void ScalarIsEffectiveStress ();
   void SetExtractNormals (int );
   void SetExtractScalars (int );
   void SetExtractTCoords (int );
   void SetExtractVectors (int );
   void SetNormalComponents (int  , int , int , int , int , int );
   void SetNormalizeNormals (int );
   void SetNumberOfTCoords (int );
   void SetPassTensorsToOutput (int );
   void SetScalarComponents (int  , int );
   void SetScalarMode (int );
   void SetTCoordComponents (int  , int , int , int , int , int );
   void SetVectorComponents (int  , int , int , int , int , int );


B<vtkExtractTensorComponents Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetNormalComponents (int  a[6]);
      Method is redundant. Same as SetNormalComponents( int, int, int, int, int, int)

   void SetScalarComponents (int  a[2]);
      Method is redundant. Same as SetScalarComponents( int, int)

   void SetTCoordComponents (int  a[6]);
      Method is redundant. Same as SetTCoordComponents( int, int, int, int, int, int)

   void SetVectorComponents (int  a[6]);
      Method is redundant. Same as SetVectorComponents( int, int, int, int, int, int)


=cut

package Graphics::VTK::ExtractUnstructuredGrid;


@Graphics::VTK::ExtractUnstructuredGrid::ISA = qw( Graphics::VTK::UnstructuredGridToUnstructuredGridFilter );

=head1 Graphics::VTK::ExtractUnstructuredGrid

=over 1

=item *

Inherits from UnstructuredGridToUnstructuredGridFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CellClippingOff ();
   void CellClippingOn ();
   void ExtentClippingOff ();
   void ExtentClippingOn ();
   int GetCellClipping ();
   int GetCellMaximum ();
   int GetCellMinimum ();
   const char *GetClassName();
   int GetExtentClipping ();
   int GetPointClipping ();
   int GetPointMaximum ();
   int GetPointMinimum ();
   vtkExtractUnstructuredGrid *New ();
   void PointClippingOff ();
   void PointClippingOn ();
   void SetCellClipping (int );
   void SetCellMaximum (int );
   void SetCellMinimum (int );
   void SetExtent (float xMin, float xMax, float yMin, float yMax, float zMin, float zMax);
   void SetExtentClipping (int );
   void SetPointClipping (int );
   void SetPointMaximum (int );
   void SetPointMinimum (int );


B<vtkExtractUnstructuredGrid Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float *GetExtent ();
      Can't Handle 'float *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetExtent (float *extent);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::ExtractVOI;


@Graphics::VTK::ExtractVOI::ISA = qw( Graphics::VTK::StructuredPointsToStructuredPointsFilter );

=head1 Graphics::VTK::ExtractVOI

=over 1

=item *

Inherits from StructuredPointsToStructuredPointsFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int  *GetSampleRate ();
      (Returns a 3-element Perl list)
   int  *GetVOI ();
      (Returns a 6-element Perl list)
   vtkExtractVOI *New ();
   void SetSampleRate (int  , int , int );
   void SetVOI (int  , int , int , int , int , int );


B<vtkExtractVOI Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetSampleRate (int  a[3]);
      Method is redundant. Same as SetSampleRate( int, int, int)

   void SetVOI (int  a[6]);
      Method is redundant. Same as SetVOI( int, int, int, int, int, int)


=cut

package Graphics::VTK::ExtractVectorComponents;


@Graphics::VTK::ExtractVectorComponents::ISA = qw( Graphics::VTK::Source );

=head1 Graphics::VTK::ExtractVectorComponents

=over 1

=item *

Inherits from Source

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkDataSet *GetInput ();
   vtkDataSet *GetOutput (int i);
   vtkDataSet *GetVxComponent ();
   vtkDataSet *GetVyComponent ();
   vtkDataSet *GetVzComponent ();
   vtkExtractVectorComponents *New ();
   void SetInput (vtkDataSet &input);
   virtual void SetInput (vtkDataSet *input);

=cut

package Graphics::VTK::FeatureEdges;


@Graphics::VTK::FeatureEdges::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::FeatureEdges

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BoundaryEdgesOff ();
   void BoundaryEdgesOn ();
   void ColoringOff ();
   void ColoringOn ();
   void CreateDefaultLocator ();
   void FeatureEdgesOff ();
   void FeatureEdgesOn ();
   int GetBoundaryEdges ();
   const char *GetClassName();
   int GetColoring ();
   float GetFeatureAngle ();
   int GetFeatureEdges ();
   vtkPointLocator *GetLocator ();
   unsigned long GetMTime ();
   int GetManifoldEdges ();
   int GetNonManifoldEdges ();
   void ManifoldEdgesOff ();
   void ManifoldEdgesOn ();
   vtkFeatureEdges *New ();
   void NonManifoldEdgesOff ();
   void NonManifoldEdgesOn ();
   void SetBoundaryEdges (int );
   void SetColoring (int );
   void SetFeatureAngle (float );
   void SetFeatureEdges (int );
   void SetLocator (vtkPointLocator *locator);
   void SetManifoldEdges (int );
   void SetNonManifoldEdges (int );


B<vtkFeatureEdges Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::FieldDataToAttributeDataFilter;


@Graphics::VTK::FieldDataToAttributeDataFilter::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::FieldDataToAttributeDataFilter

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int ConstructArray (vtkDataArray *da, int comp, vtkDataArray *frray, int fieldComp, int min, int max, int normalize);
   void DefaultNormalizeOff ();
   void DefaultNormalizeOn ();
   const char *GetClassName();
   int GetDefaultNormalize ();
   vtkDataArray *GetFieldArray (vtkFieldData *fd, char *name, int comp);
   int GetGhostLevelComponentArrayComponent ();
   char *GetGhostLevelComponentArrayName ();
   int GetGhostLevelComponentMaxRange ();
   int GetGhostLevelComponentMinRange ();
   int GetGhostLevelComponentNormalizeFlag ();
   int GetInputField ();
   int GetNormalComponentArrayComponent (int comp);
   char *GetNormalComponentArrayName (int comp);
   int GetNormalComponentMaxRange (int comp);
   int GetNormalComponentMinRange (int comp);
   int GetNormalComponentNormalizeFlag (int comp);
   int GetOutputAttributeData ();
   int GetScalarComponentArrayComponent (int comp);
   char *GetScalarComponentArrayName (int comp);
   int GetScalarComponentMaxRange (int comp);
   int GetScalarComponentMinRange (int comp);
   int GetScalarComponentNormalizeFlag (int comp);
   int GetTCoordComponentArrayComponent (int comp);
   char *GetTCoordComponentArrayName (int comp);
   int GetTCoordComponentMaxRange (int comp);
   int GetTCoordComponentMinRange (int comp);
   int GetTCoordComponentNormalizeFlag (int comp);
   int GetTensorComponentArrayComponent (int comp);
   char *GetTensorComponentArrayName (int comp);
   int GetTensorComponentMaxRange (int comp);
   int GetTensorComponentMinRange (int comp);
   int GetTensorComponentNormalizeFlag (int comp);
   int GetVectorComponentArrayComponent (int comp);
   char *GetVectorComponentArrayName (int comp);
   int GetVectorComponentMaxRange (int comp);
   int GetVectorComponentMinRange (int comp);
   int GetVectorComponentNormalizeFlag (int comp);
   vtkFieldDataToAttributeDataFilter *New ();
   void SetDefaultNormalize (int );
   void SetGhostLevelComponent (char *arrayName, int arrayComp, int min, int max, int normalize);
   void SetGhostLevelComponent (char *arrayName, int arrayComp);
   void SetInputField (int );
   void SetInputFieldToCellDataField ();
   void SetInputFieldToDataObjectField ();
   void SetInputFieldToPointDataField ();
   void SetNormalComponent (int comp, char *arrayName, int arrayComp, int min, int max, int normalize);
   void SetNormalComponent (int comp, char *arrayName, int arrayComp);
   void SetOutputAttributeData (int );
   void SetOutputAttributeDataToCellData ();
   void SetOutputAttributeDataToPointData ();
   void SetScalarComponent (int comp, char *arrayName, int arrayComp, int min, int max, int normalize);
   void SetScalarComponent (int comp, char *arrayName, int arrayComp);
   void SetTCoordComponent (int comp, char *arrayName, int arrayComp, int min, int max, int normalize);
   void SetTCoordComponent (int comp, char *arrayName, int arrayComp);
   void SetTensorComponent (int comp, char *arrayName, int arrayComp, int min, int max, int normalize);
   void SetTensorComponent (int comp, char *arrayName, int arrayComp);
   void SetVectorComponent (int comp, char *arrayName, int arrayComp, int min, int max, int normalize);
   void SetVectorComponent (int comp, char *arrayName, int arrayComp);


B<vtkFieldDataToAttributeDataFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ConstructGhostLevels (int num, vtkFieldData *fd, vtkDataSetAttributes *attr, int componentRange[2], char *array, int arrayComponent, int normalize);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ConstructNormals (int num, vtkFieldData *fd, vtkDataSetAttributes *attr, int componentRange[3][2], char *arrays[3], int arrayComponents[3], int normalize[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int InputFieldint OutputAttributeDataint NumberOfScalarComponentschar *ScalarArrays[4]int ScalarArrayComponents[4]int ScalarComponentRange[4][2]int ScalarNormalize[4]char *VectorArrays[3]int VectorArrayComponents[3]int VectorComponentRange[3][2]int VectorNormalize[3]char *GhostLevelArrayint GhostLevelArrayComponentint GhostLevelComponentRange[2]int GhostLevelNormalizechar *NormalArrays[3]int NormalArrayComponents[3]int NormalComponentRange[3][2]int NormalNormalize[3]char *TensorArrays[9]int TensorArrayComponents[9]int TensorComponentRange[9][2]int TensorNormalize[9]int NumberOfTCoordComponentschar *TCoordArrays[3]int TCoordArrayComponents[3]int TCoordComponentRange[3][2]int TCoordNormalize[3]int DefaultNormalizevoid ConstructScalars (int num, vtkFieldData *fd, vtkDataSetAttributes *attr, int componentRange[4][2], char *arrays[4], int arrayComponents[4], int normalize[4], int numComp);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ConstructTCoords (int num, vtkFieldData *fd, vtkDataSetAttributes *attr, int componentRange[3][2], char *arrays[3], int arrayComponents[3], int normalize[3], int numComp);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ConstructTensors (int num, vtkFieldData *fd, vtkDataSetAttributes *attr, int componentRange[9][2], char *arrays[9], int arrayComponents[9], int normalize[9]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ConstructVectors (int num, vtkFieldData *fd, vtkDataSetAttributes *attr, int componentRange[3][2], char *arrays[3], int arrayComponents[3], int normalize[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int GetComponentsType (int numComp, vtkDataArray *arrays);
      Can't Parse Arg ' vtkDataArray ** arrays'
   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetArrayName (vtkObject *self, char &name, char *newName);
      Can't Parse Arg ' char * &name'
   int UpdateComponentRange (vtkDataArray *da, int compRange[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::FiniteDifferenceGradientEstimator;


@Graphics::VTK::FiniteDifferenceGradientEstimator::ISA = qw( Graphics::VTK::EncodedGradientEstimator );

=head1 Graphics::VTK::FiniteDifferenceGradientEstimator

=over 1

=item *

Inherits from EncodedGradientEstimator

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetSampleSpacingInVoxels ();
   vtkFiniteDifferenceGradientEstimator *New ();
   void SetSampleSpacingInVoxels (int );


B<vtkFiniteDifferenceGradientEstimator Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent index);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Follower;


@Graphics::VTK::Follower::ISA = qw( Graphics::VTK::Actor );

=head1 Graphics::VTK::Follower

=over 1

=item *

Inherits from Actor

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   vtkCamera *GetCamera ();
   const char *GetClassName();
   virtual void GetMatrix (vtkMatrix4x4 *m);
   void GetMatrix (vtkMatrix4x4 &m);
   virtual vtkMatrix4x4 *GetMatrix ();
   vtkFollower *New ();
   virtual void Render (vtkRenderer *ren);
   virtual int RenderOpaqueGeometry (vtkViewport *viewport);
   virtual int RenderTranslucentGeometry (vtkViewport *viewport);
   void SetCamera (vtkCamera *);
   void ShallowCopy (vtkProp *prop);


B<vtkFollower Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void GetMatrix (double m[16]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::FrustumCoverageCuller;


@Graphics::VTK::FrustumCoverageCuller::ISA = qw( Graphics::VTK::Culler );

=head1 Graphics::VTK::FrustumCoverageCuller

=over 1

=item *

Inherits from Culler

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetMaximumCoverage ();
   float GetMinimumCoverage ();
   int GetSortingStyle ();
   char *GetSortingStyleAsString (void );
   vtkFrustumCoverageCuller *New ();
   void SetMaximumCoverage (float );
   void SetMinimumCoverage (float );
   void SetSortingStyle (int );
   void SetSortingStyleToBackToFront ();
   void SetSortingStyleToFrontToBack ();
   void SetSortingStyleToNone ();


B<vtkFrustumCoverageCuller Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::GaussianSplatter;


@Graphics::VTK::GaussianSplatter::ISA = qw( Graphics::VTK::DataSetToStructuredPointsFilter );

=head1 Graphics::VTK::GaussianSplatter

=over 1

=item *

Inherits from DataSetToStructuredPointsFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CappingOff ();
   void CappingOn ();
   void ComputeModelBounds ();
   int GetAccumulationMode ();
   char *GetAccumulationModeAsString ();
   float GetCapValue ();
   int GetCapping ();
   const char *GetClassName();
   float GetEccentricity ();
   float GetExponentFactor ();
   float  *GetModelBounds ();
      (Returns a 6-element Perl list)
   int GetNormalWarping ();
   float GetRadius ();
   int  *GetSampleDimensions ();
      (Returns a 3-element Perl list)
   int GetScalarWarping ();
   float GetScaleFactor ();
   vtkGaussianSplatter *New ();
   void NormalWarpingOff ();
   void NormalWarpingOn ();
   void ScalarWarpingOff ();
   void ScalarWarpingOn ();
   void SetAccumulationMode (int );
   void SetAccumulationModeToMax ();
   void SetAccumulationModeToMin ();
   void SetAccumulationModeToSum ();
   void SetCapValue (float );
   void SetCapping (int );
   void SetEccentricity (float );
   void SetExponentFactor (float );
   void SetModelBounds (float  , float , float , float , float , float );
   void SetNormalWarping (int );
   void SetRadius (float );
   void SetSampleDimensions (int i, int j, int k);
   void SetScalarWarping (int );
   void SetScaleFactor (float );


B<vtkGaussianSplatter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float EccentricGaussian (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float Gaussian (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetModelBounds (float  a[6]);
      Method is redundant. Same as SetModelBounds( float, float, float, float, float, float)

   void SetSampleDimensions (int dim[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int SampleDimensions[3]float Radiusfloat ExponentFactorfloat ModelBounds[6]int NormalWarpingfloat Eccentricityint ScalarWarpingfloat ScaleFactorint Cappingfloat CapValueint AccumulationModevoid SplitIJK (int i, int idir, int j, int jdir, int k, int kdir);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::GeometryFilter;


@Graphics::VTK::GeometryFilter::ISA = qw( Graphics::VTK::DataSetToPolyDataFilter );

=head1 Graphics::VTK::GeometryFilter

=over 1

=item *

Inherits from DataSetToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CellClippingOff ();
   void CellClippingOn ();
   void CreateDefaultLocator ();
   void ExtentClippingOff ();
   void ExtentClippingOn ();
   int GetCellClipping ();
   int GetCellMaximum ();
   int GetCellMinimum ();
   const char *GetClassName();
   float *GetExtent ();
      (Returns a 6-element Perl list)
   int GetExtentClipping ();
   vtkPointLocator *GetLocator ();
   unsigned long GetMTime ();
   int GetMerging ();
   int GetPointClipping ();
   int GetPointMaximum ();
   int GetPointMinimum ();
   void MergingOff ();
   void MergingOn ();
   vtkGeometryFilter *New ();
   void PointClippingOff ();
   void PointClippingOn ();
   void SetCellClipping (int );
   void SetCellMaximum (int );
   void SetCellMinimum (int );
   void SetExtent (float xMin, float xMax, float yMin, float yMax, float zMin, float zMax);
   void SetExtentClipping (int );
   void SetLocator (vtkPointLocator *locator);
   void SetLocator (vtkPointLocator &locator);
   void SetMerging (int );
   void SetPointClipping (int );
   void SetPointMaximum (int );
   void SetPointMinimum (int );


B<vtkGeometryFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetExtent (float *extent);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::Glyph2D;


@Graphics::VTK::Glyph2D::ISA = qw( Graphics::VTK::Glyph3D );

=head1 Graphics::VTK::Glyph2D

=over 1

=item *

Inherits from Glyph3D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkGlyph2D *New ();


B<vtkGlyph2D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Glyph3D;


@Graphics::VTK::Glyph3D::ISA = qw( Graphics::VTK::DataSetToPolyDataFilter );

=head1 Graphics::VTK::Glyph3D

=over 1

=item *

Inherits from DataSetToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ClampingOff ();
   void ClampingOn ();
   int GetClamping ();
   const char *GetClassName();
   int GetColorMode ();
   char *GetColorModeAsString ();
   int GetIndexMode ();
   char *GetIndexModeAsString ();
   int GetNumberOfSources ();
   int GetOrient ();
   float  *GetRange ();
      (Returns a 2-element Perl list)
   float GetScaleFactor ();
   int GetScaleMode ();
   char *GetScaleModeAsString ();
   int GetScaling ();
   vtkPolyData *GetSource (int id);
   int GetVectorMode ();
   char *GetVectorModeAsString ();
   vtkGlyph3D *New ();
   void OrientOff ();
   void OrientOn ();
   void ScalingOff ();
   void ScalingOn ();
   void SetClamping (int );
   void SetColorMode (int );
   void SetColorModeToColorByScalar ();
   void SetColorModeToColorByScale ();
   void SetColorModeToColorByVector ();
   void SetIndexMode (int );
   void SetIndexModeToOff ();
   void SetIndexModeToScalar ();
   void SetIndexModeToVector ();
   void SetNumberOfSources (int num);
   void SetOrient (int );
   void SetRange (float  , float );
   void SetScaleFactor (float );
   void SetScaleMode (int );
   void SetScaleModeToDataScalingOff ();
   void SetScaleModeToScaleByScalar ();
   void SetScaleModeToScaleByVector ();
   void SetScaleModeToScaleByVectorComponents ();
   void SetScaling (int );
   void SetSource (int id, vtkPolyData *pd);
   void SetSource (vtkPolyData *pd);
   void SetVectorMode (int );
   void SetVectorModeToUseNormal ();
   void SetVectorModeToUseVector ();
   void SetVectorModeToVectorRotationOff ();


B<vtkGlyph3D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetRange (float  a[2]);
      Method is redundant. Same as SetRange( float, float)


=cut

package Graphics::VTK::GhostLevelToScalarFilter;


@Graphics::VTK::GhostLevelToScalarFilter::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::GhostLevelToScalarFilter

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkGhostLevelToScalarFilter *New ();

=cut

package Graphics::VTK::HedgeHog;


@Graphics::VTK::HedgeHog::ISA = qw( Graphics::VTK::DataSetToPolyDataFilter );

=head1 Graphics::VTK::HedgeHog

=over 1

=item *

Inherits from DataSetToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetScaleFactor ();
   int GetVectorMode ();
   char *GetVectorModeAsString ();
   vtkHedgeHog *New ();
   void SetScaleFactor (float );
   void SetVectorMode (int );
   void SetVectorModeToUseNormal ();
   void SetVectorModeToUseVector ();


B<vtkHedgeHog Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Hull;


@Graphics::VTK::Hull::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::Hull

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddCubeEdgePlanes ();
   void AddCubeFacePlanes ();
   void AddCubeVertexPlanes ();
   int AddPlane (float A, float B, float C, float D);
   int AddPlane (float A, float B, float C);
   void AddRecursiveSpherePlanes (int level);
   void GenerateHull (vtkPolyData *pd, float xmin, float xmax, float ymin, float ymax, float zmin, float zmax);
   const char *GetClassName();
   int GetNumberOfPlanes ();
   vtkHull *New ();
   void RemoveAllPlanes (void );
   void SetPlane (int i, float A, float B, float C, float D);
   void SetPlane (int i, float A, float B, float C);
   void SetPlanes (vtkPlanes *planes);


B<vtkHull Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int AddPlane (float plane[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int AddPlane (float plane[3], float D);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ClipPolygonsFromPlanes (vtkPoints *points, vtkCellArray *polys, float *bounds);
      Don't know the size of pointer arg number 3

   void CreateInitialPolygon (double *, int , float *);
      Don't know the size of pointer arg number 1

   void GenerateHull (vtkPolyData *pd, float *bounds);
      Don't know the size of pointer arg number 2

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetPlane (int i, float plane[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetPlane (int i, float plane[3], float D);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::HyperStreamline;


@Graphics::VTK::HyperStreamline::ISA = qw( Graphics::VTK::DataSetToPolyDataFilter );

=head1 Graphics::VTK::HyperStreamline

=over 1

=item *

Inherits from DataSetToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetIntegrationDirection ();
   float GetIntegrationStepLength ();
   int GetLogScaling ();
   float GetMaximumPropagationDistance ();
   int GetNumberOfSides ();
   float GetRadius ();
   float GetStepLength ();
   float GetTerminalEigenvalue ();
   void IntegrateMajorEigenvector ();
   void IntegrateMediumEigenvector ();
   void IntegrateMinorEigenvector ();
   void LogScalingOff ();
   void LogScalingOn ();
   vtkHyperStreamline *New ();
   void SetIntegrationDirection (int );
   void SetIntegrationDirectionToBackward ();
   void SetIntegrationDirectionToForward ();
   void SetIntegrationDirectionToIntegrateBothDirections ();
   void SetIntegrationStepLength (float );
   void SetLogScaling (int );
   void SetMaximumPropagationDistance (float );
   void SetNumberOfSides (int );
   void SetRadius (float );
   void SetStartLocation (int cellId, int subId, float r, float s, float t);
   void SetStartPosition (float x, float y, float z);
   void SetStepLength (float );
   void SetTerminalEigenvalue (float );


B<vtkHyperStreamline Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int GetStartLocation (int &subId, float pcoords[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float *GetStartPosition ();
      Can't Handle 'float *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetStartLocation (int cellId, int subId, float pcoords[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetStartPosition (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::IdFilter;


@Graphics::VTK::IdFilter::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::IdFilter

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CellIdsOff ();
   void CellIdsOn ();
   void FieldDataOff ();
   void FieldDataOn ();
   int GetCellIds ();
   const char *GetClassName();
   int GetFieldData ();
   int GetPointIds ();
   vtkIdFilter *New ();
   void PointIdsOff ();
   void PointIdsOn ();
   void SetCellIds (int );
   void SetFieldData (int );
   void SetPointIds (int );


B<vtkIdFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ImageActor;


@Graphics::VTK::ImageActor::ISA = qw( Graphics::VTK::Prop );

=head1 Graphics::VTK::ImageActor

=over 1

=item *

Inherits from Prop

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageData *GetInput ();
   int GetInterpolate ();
   int GetSliceNumber ();
   void InterpolateOff ();
   void InterpolateOn ();
   vtkImageActor *New ();
   void SetDisplayExtent (int minX, int maxX, int minY, int maxY, int minZ, int maxZ);
   void SetInput (vtkImageData *);
   void SetInterpolate (int );


B<vtkImageActor Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float *GetBounds ();
      Can't Handle 'float *' return type without a hint

   void GetBounds (float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetDisplayExtent (int extent[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int *GetDisplayExtent ();
      Can't Handle 'int *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetDisplayExtent (int extent[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImplicitBoolean;


@Graphics::VTK::ImplicitBoolean::ISA = qw( Graphics::VTK::ImplicitFunction );

=head1 Graphics::VTK::ImplicitBoolean

=over 1

=item *

Inherits from ImplicitFunction

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddFunction (vtkImplicitFunction *in);
   float EvaluateFunction (float x, float y, float z);
   const char *GetClassName();
   vtkImplicitFunctionCollection *GetFunction ();
   unsigned long GetMTime ();
   int GetOperationType ();
   char *GetOperationTypeAsString ();
   vtkImplicitBoolean *New ();
   void RemoveFunction (vtkImplicitFunction *in);
   void RemoveFunction (vtkImplicitFunction &in);
   void SetOperationType (int );
   void SetOperationTypeToDifference ();
   void SetOperationTypeToIntersection ();
   void SetOperationTypeToUnion ();
   void SetOperationTypeToUnionOfMagnitudes ();


B<vtkImplicitBoolean Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void AddFunction (vtkImplicitFunction &in);
      Method is marked 'Do Not Use' in its descriptions

   float EvaluateFunction (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateGradient (float x[3], float g[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ImplicitDataSet;


@Graphics::VTK::ImplicitDataSet::ISA = qw( Graphics::VTK::ImplicitFunction );

=head1 Graphics::VTK::ImplicitDataSet

=over 1

=item *

Inherits from ImplicitFunction

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float EvaluateFunction (float x, float y, float z);
   const char *GetClassName();
   vtkDataSet *GetDataSet ();
   unsigned long GetMTime ();
   float  *GetOutGradient ();
      (Returns a 3-element Perl list)
   float GetOutValue ();
   vtkImplicitDataSet *New ();
   void SetDataSet (vtkDataSet *);
   void SetOutGradient (float  , float , float );
   void SetOutValue (float );


B<vtkImplicitDataSet Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float EvaluateFunction (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateGradient (float x[3], float n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetOutGradient (float  a[3]);
      Method is redundant. Same as SetOutGradient( float, float, float)


=cut

package Graphics::VTK::ImplicitModeller;


@Graphics::VTK::ImplicitModeller::ISA = qw( Graphics::VTK::DataSetToStructuredPointsFilter );

=head1 Graphics::VTK::ImplicitModeller

=over 1

=item *

Inherits from DataSetToStructuredPointsFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AdjustBoundsOff ();
   void AdjustBoundsOn ();
   void Append (vtkDataSet *input);
   void CappingOff ();
   void CappingOn ();
   float ComputeModelBounds (vtkDataSet *inputNULL);
   void EndAppend ();
   int GetAdjustBounds ();
   float GetAdjustDistance ();
   float GetCapValue ();
   int GetCapping ();
   const char *GetClassName();
   int GetLocatorMaxLevel ();
   float GetMaximumDistance ();
   float  *GetModelBounds ();
      (Returns a 6-element Perl list)
   int GetNumberOfThreads ();
   int GetProcessMode ();
   char *GetProcessModeAsString (void );
   int  *GetSampleDimensions ();
      (Returns a 3-element Perl list)
   vtkImplicitModeller *New ();
   void SetAdjustBounds (int );
   void SetAdjustDistance (float );
   void SetCapValue (float );
   void SetCapping (int );
   void SetLocatorMaxLevel (int );
   void SetMaximumDistance (float );
   void SetModelBounds (float  , float , float , float , float , float );
   void SetNumberOfThreads (int );
   void SetProcessMode (int );
   void SetProcessModeToPerCell ();
   void SetProcessModeToPerVoxel ();
   void SetSampleDimensions (int i, int j, int k);
   void StartAppend ();
   virtual void UpdateData (vtkDataObject *output);


B<vtkImplicitModeller Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetModelBounds (float  a[6]);
      Method is redundant. Same as SetModelBounds( float, float, float, float, float, float)

   void SetSampleDimensions (int dim[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImplicitSelectionLoop;


@Graphics::VTK::ImplicitSelectionLoop::ISA = qw( Graphics::VTK::ImplicitFunction );

=head1 Graphics::VTK::ImplicitSelectionLoop

=over 1

=item *

Inherits from ImplicitFunction

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AutomaticNormalGenerationOff ();
   void AutomaticNormalGenerationOn ();
   float EvaluateFunction (float x, float y, float z);
   int GetAutomaticNormalGeneration ();
   const char *GetClassName();
   vtkPoints *GetLoop ();
   unsigned long GetMTime ();
   float  *GetNormal ();
      (Returns a 3-element Perl list)
   vtkImplicitSelectionLoop *New ();
   void SetAutomaticNormalGeneration (int );
   void SetLoop (vtkPoints *);
   void SetNormal (float  , float , float );


B<vtkImplicitSelectionLoop Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float EvaluateFunction (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateGradient (float x[3], float n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   vtkPoints *Loopfloat Normal[3]int AutomaticNormalGenerationvoid Initialize ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetNormal (float  a[3]);
      Method is redundant. Same as SetNormal( float, float, float)


=cut

package Graphics::VTK::ImplicitTextureCoords;


@Graphics::VTK::ImplicitTextureCoords::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::ImplicitTextureCoords

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void FlipTextureOff ();
   void FlipTextureOn ();
   const char *GetClassName();
   int GetFlipTexture ();
   vtkImplicitFunction *GetRFunction ();
   vtkImplicitFunction *GetSFunction ();
   vtkImplicitFunction *GetTFunction ();
   vtkImplicitTextureCoords *New ();
   void SetFlipTexture (int );
   void SetRFunction (vtkImplicitFunction *);
   void SetSFunction (vtkImplicitFunction *);
   void SetTFunction (vtkImplicitFunction *);


B<vtkImplicitTextureCoords Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ImplicitVolume;


@Graphics::VTK::ImplicitVolume::ISA = qw( Graphics::VTK::ImplicitFunction );

=head1 Graphics::VTK::ImplicitVolume

=over 1

=item *

Inherits from ImplicitFunction

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float EvaluateFunction (float x, float y, float z);
   const char *GetClassName();
   unsigned long GetMTime ();
   float  *GetOutGradient ();
      (Returns a 3-element Perl list)
   float GetOutValue ();
   vtkStructuredPoints *GetVolume ();
   vtkImplicitVolume *New ();
   void SetOutGradient (float  , float , float );
   void SetOutValue (float );
   void SetVolume (vtkStructuredPoints *);
   void SetVolume (vtkImageData *cache);


B<vtkImplicitVolume Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float EvaluateFunction (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateGradient (float x[3], float n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetOutGradient (float  a[3]);
      Method is redundant. Same as SetOutGradient( float, float, float)


=cut

package Graphics::VTK::ImplicitWindowFunction;


@Graphics::VTK::ImplicitWindowFunction::ISA = qw( Graphics::VTK::ImplicitFunction );

=head1 Graphics::VTK::ImplicitWindowFunction

=over 1

=item *

Inherits from ImplicitFunction

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float EvaluateFunction (float x, float y, float z);
   const char *GetClassName();
   vtkImplicitFunction *GetImplicitFunction ();
   unsigned long GetMTime ();
   float  *GetWindowRange ();
      (Returns a 2-element Perl list)
   float  *GetWindowValues ();
      (Returns a 2-element Perl list)
   vtkImplicitWindowFunction *New ();
   void SetImplicitFunction (vtkImplicitFunction *);
   void SetWindowRange (float  , float );
   void SetWindowValues (float  , float );


B<vtkImplicitWindowFunction Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float EvaluateFunction (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateGradient (float x[3], float n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetWindowRange (float  a[2]);
      Method is redundant. Same as SetWindowRange( float, float)

   void SetWindowValues (float  a[2]);
      Method is redundant. Same as SetWindowValues( float, float)


=cut

package Graphics::VTK::InteractorStyle;


@Graphics::VTK::InteractorStyle::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::InteractorStyle

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void FindPokedCamera (int , int );
   void FindPokedRenderer (int , int );
   const char *GetClassName();
   vtkRenderWindowInteractor *GetInteractor ();
   float  *GetPickColor ();
      (Returns a 3-element Perl list)
   virtual void HighlightActor2D (vtkActor2D *actor2D);
   virtual void HighlightProp (vtkProp *prop);
   virtual void HighlightProp3D (vtkProp3D *prop3D);
   vtkInteractorStyle *New ();
   virtual void OnChar (int ctrl, int shift, char keycode, int repeatcount);
   virtual void OnConfigure (int width, int height);
   virtual void OnEnter (int ctrl, int shift, int x, int y);
   virtual void OnKeyDown (int ctrl, int shift, char keycode, int repeatcount);
   virtual void OnKeyPress (int ctrl, int shift, char keycode, char *keysym, int repeatcount);
   virtual void OnKeyRelease (int ctrl, int shift, char keycode, char *keysym, int repeatcount);
   virtual void OnKeyUp (int ctrl, int shift, char keycode, int repeatcount);
   virtual void OnLeave (int ctrl, int shift, int x, int y);
   virtual void OnLeftButtonDown (int ctrl, int shift, int X, int Y);
   virtual void OnLeftButtonUp (int ctrl, int shift, int X, int Y);
   virtual void OnMiddleButtonDown (int ctrl, int shift, int X, int Y);
   virtual void OnMiddleButtonUp (int ctrl, int shift, int X, int Y);
   virtual void OnMouseMove (int ctrl, int shift, int X, int Y);
   virtual void OnRightButtonDown (int ctrl, int shift, int X, int Y);
   virtual void OnRightButtonUp (int ctrl, int shift, int X, int Y);
   virtual void OnTimer ();
   virtual void SetInteractor (vtkRenderWindowInteractor *interactor);
   void SetLeftButtonPressMethod (void (*func)(void *) , void *arg);
   void SetLeftButtonReleaseMethod (void (*func)(void *) , void *arg);
   void SetMiddleButtonPressMethod (void (*func)(void *) , void *arg);
   void SetMiddleButtonReleaseMethod (void (*func)(void *) , void *arg);
   void SetPickColor (float  , float , float );
   void SetRightButtonPressMethod (void (*func)(void *) , void *arg);
   void SetRightButtonReleaseMethod (void (*func)(void *) , void *arg);


B<vtkInteractorStyle Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void ComputeDisplayToWorld (double x, double y, double z, double *worldPt);
      Don't know the size of pointer arg number 4

   virtual void ComputeDisplayToWorld (double x, double y, double z, float *worldPt);
      Don't know the size of pointer arg number 4

   virtual void ComputeWorldToDisplay (double x, double y, double z, double *displayPt);
      Don't know the size of pointer arg number 4

   virtual void ComputeWorldToDisplay (double x, double y, double z, float *displayPt);
      Don't know the size of pointer arg number 4

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetLeftButtonPressMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetLeftButtonReleaseMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetMiddleButtonPressMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetMiddleButtonReleaseMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetPickColor (float  a[3]);
      Method is redundant. Same as SetPickColor( float, float, float)

   void SetRightButtonPressMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetRightButtonReleaseMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::InteractorStyleFlight;


@Graphics::VTK::InteractorStyleFlight::ISA = qw( Graphics::VTK::InteractorStyle );

=head1 Graphics::VTK::InteractorStyleFlight

=over 1

=item *

Inherits from InteractorStyle

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void DisableMotionOff ();
   void DisableMotionOn ();
   void FixUpVectorOff ();
   void FixUpVectorOn ();
   double GetAngleAccelerationFactor ();
   double GetAngleStepSize ();
   const char *GetClassName();
   int GetDisableMotion ();
   int GetFixUpVector ();
   double  *GetFixedUpVector ();
      (Returns a 3-element Perl list)
   double GetMotionAccelerationFactor ();
   double GetMotionStepSize ();
   vtkInteractorStyleFlight *New ();
   virtual void OnChar (int ctrl, int shift, char keycode, int repeatcount);
   virtual void OnKeyDown (int ctrl, int shift, char keycode, int repeatcount);
   virtual void OnKeyUp (int ctrl, int shift, char keycode, int repeatcount);
   virtual void OnLeftButtonDown (int ctrl, int shift, int X, int Y);
   virtual void OnLeftButtonUp (int ctrl, int shift, int X, int Y);
   virtual void OnMiddleButtonDown (int ctrl, int shift, int X, int Y);
   virtual void OnMiddleButtonUp (int ctrl, int shift, int X, int Y);
   virtual void OnMouseMove (int ctrl, int shift, int X, int Y);
   virtual void OnRightButtonDown (int ctrl, int shift, int X, int Y);
   virtual void OnRightButtonUp (int ctrl, int shift, int X, int Y);
   virtual void OnTimer (void );
   void PerformAzimuthalScan (int numsteps);
   void SetAngleAccelerationFactor (double );
   void SetAngleStepSize (double );
   void SetDisableMotion (int );
   void SetFixUpVector (int );
   void SetFixedUpVector (double  [3]);
   void SetMotionAccelerationFactor (double );
   void SetMotionStepSize (double );


B<vtkInteractorStyleFlight Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeLRVector (double vector[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void JumpTo (double campos[3], double focpos[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void MotionAlongVector (double vector[3], double amount);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::InteractorStyleJoystickActor;


@Graphics::VTK::InteractorStyleJoystickActor::ISA = qw( Graphics::VTK::InteractorStyle );

=head1 Graphics::VTK::InteractorStyleJoystickActor

=over 1

=item *

Inherits from InteractorStyle

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkInteractorStyleJoystickActor *New ();
   void OnLeftButtonDown (int ctrl, int shift, int x, int y);
   void OnLeftButtonUp (int ctrl, int shift, int x, int y);
   void OnMiddleButtonDown (int ctrl, int shift, int x, int y);
   void OnMiddleButtonUp (int ctrl, int shift, int x, int y);
   void OnMouseMove (int ctrl, int shift, int x, int y);
   void OnRightButtonDown (int ctrl, int shift, int x, int y);
   void OnRightButtonUp (int ctrl, int shift, int x, int y);
   void OnTimer (void );


B<vtkInteractorStyleJoystickActor Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void Prop3DTransform (vtkProp3D *prop3D, double *boxCenter, int numRotation, double *rotate, double *scale);
      Don't know the size of pointer arg number 2

   void Prop3DTransform (vtkProp3D *prop3D, float *boxCenter, int NumRotation, double *rotate, double *scale);
      Don't know the size of pointer arg number 2


=cut

package Graphics::VTK::InteractorStyleJoystickCamera;


@Graphics::VTK::InteractorStyleJoystickCamera::ISA = qw( Graphics::VTK::InteractorStyle );

=head1 Graphics::VTK::InteractorStyleJoystickCamera

=over 1

=item *

Inherits from InteractorStyle

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkInteractorStyleJoystickCamera *New ();
   void OnLeftButtonDown (int ctrl, int shift, int x, int y);
   void OnLeftButtonUp (int ctrl, int shift, int x, int y);
   void OnMiddleButtonDown (int ctrl, int shift, int x, int y);
   void OnMiddleButtonUp (int ctrl, int shift, int x, int y);
   void OnMouseMove (int ctrl, int shift, int x, int y);
   void OnRightButtonDown (int ctrl, int shift, int x, int y);
   void OnRightButtonUp (int ctrl, int shift, int x, int y);
   void OnTimer (void );


B<vtkInteractorStyleJoystickCamera Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::InteractorStyleSwitch;


@Graphics::VTK::InteractorStyleSwitch::ISA = qw( Graphics::VTK::InteractorStyle );

=head1 Graphics::VTK::InteractorStyleSwitch

=over 1

=item *

Inherits from InteractorStyle

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkInteractorStyleSwitch *New ();
   void OnChar (int ctrl, int shift, char keycode, int repeatcount);
   void OnLeftButtonDown (int ctrl, int shift, int x, int y);
   void OnLeftButtonUp (int ctrl, int shift, int x, int y);
   void OnMiddleButtonDown (int ctrl, int shift, int x, int y);
   void OnMiddleButtonUp (int ctrl, int shift, int x, int y);
   void OnMouseMove (int ctrl, int shift, int x, int y);
   void OnRightButtonDown (int ctrl, int shift, int x, int y);
   void OnRightButtonUp (int ctrl, int shift, int x, int y);
   void OnTimer ();
   void SetActorModeToActor ();
   void SetActorModeToCamera ();
   void SetInteractor (vtkRenderWindowInteractor *iren);
   void SetTrackballModeToJoystick ();
   void SetTrackballModeToTrackball ();

=cut

package Graphics::VTK::InteractorStyleTrackball;


@Graphics::VTK::InteractorStyleTrackball::ISA = qw( Graphics::VTK::InteractorStyle );

=head1 Graphics::VTK::InteractorStyleTrackball

=over 1

=item *

Inherits from InteractorStyle

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int GetActorMode ();
   const char *GetClassName();
   int GetTrackballMode ();
   vtkInteractorStyleTrackball *New ();
   virtual void OnChar (int ctrl, int shift, char keycode, int repeatcount);
   virtual void OnLeftButtonDown (int ctrl, int shift, int X, int Y);
   virtual void OnLeftButtonUp (int ctrl, int shift, int X, int Y);
   virtual void OnMiddleButtonDown (int ctrl, int shift, int X, int Y);
   virtual void OnMiddleButtonUp (int ctrl, int shift, int X, int Y);
   virtual void OnRightButtonDown (int ctrl, int shift, int X, int Y);
   virtual void OnRightButtonUp (int ctrl, int shift, int X, int Y);
   virtual void OnTimer (void );
   virtual void SetActorModeToActor ();
   virtual void SetActorModeToCamera ();
   virtual void SetTrackballModeToJoystick ();
   virtual void SetTrackballModeToTrackball ();


B<vtkInteractorStyleTrackball Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void Prop3DTransform (vtkProp3D *prop3D, double *boxCenter, int numRotation, double *rotate, double *scale);
      Don't know the size of pointer arg number 2

   void Prop3DTransform (vtkProp3D *prop3D, float *boxCenter, int NumRotation, double *rotate, double *scale);
      Don't know the size of pointer arg number 2

   virtual vtkAbstractPropPicker *InteractionPickerint PropPickedvtkProp3D *InteractionPropint ActorModeint TrackballModeint ControlModefloat MotionFactorint Preprocessfloat RadianToDegreefloat NewPickPoint[4]float OldPickPoint[4]float MotionVector[3]float OldXfloat OldYdouble ViewLook[3]double ViewPoint[3]double ViewFocus[3]double ViewUp[3]double ViewRight[3]float Origin[3]float Position[3]float ObjCenter[3]float DispObjCenter[3]float Radiusvoid TrackballRotateCamera (int x, int y);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::IVExporter;


@Graphics::VTK::IVExporter::ISA = qw( Graphics::VTK::Exporter );

=head1 Graphics::VTK::IVExporter

=over 1

=item *

Inherits from Exporter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   char *GetFileName ();
   vtkIVExporter *New ();
   void SetFileName (char *);


B<vtkIVExporter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void WriteALight (vtkLight *aLight, FILE *fp);
      Don't know the size of pointer arg number 2

   void WriteAnActor (vtkActor *anActor, FILE *fp);
      Don't know the size of pointer arg number 2

   void WritePointData (vtkPoints *points, vtkNormals *normals, vtkTCoords *tcoords, vtkScalars *colors, FILE *fp);
      Don't know the size of pointer arg number 5


=cut

package Graphics::VTK::InteractorStyleTrackballActor;


@Graphics::VTK::InteractorStyleTrackballActor::ISA = qw( Graphics::VTK::InteractorStyle );

=head1 Graphics::VTK::InteractorStyleTrackballActor

=over 1

=item *

Inherits from InteractorStyle

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkInteractorStyleTrackballActor *New ();
   void OnLeftButtonDown (int ctrl, int shift, int x, int y);
   void OnLeftButtonUp (int ctrl, int shift, int x, int y);
   void OnMiddleButtonDown (int ctrl, int shift, int x, int y);
   void OnMiddleButtonUp (int ctrl, int shift, int x, int y);
   void OnMouseMove (int ctrl, int shift, int x, int y);
   void OnRightButtonDown (int ctrl, int shift, int x, int y);
   void OnRightButtonUp (int ctrl, int shift, int x, int y);


B<vtkInteractorStyleTrackballActor Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void Prop3DTransform (vtkProp3D *prop3D, double *boxCenter, int numRotation, double *rotate, double *scale);
      Don't know the size of pointer arg number 2

   void Prop3DTransform (vtkProp3D *prop3D, float *boxCenter, int NumRotation, double *rotate, double *scale);
      Don't know the size of pointer arg number 2


=cut

package Graphics::VTK::InteractorStyleTrackballCamera;


@Graphics::VTK::InteractorStyleTrackballCamera::ISA = qw( Graphics::VTK::InteractorStyle );

=head1 Graphics::VTK::InteractorStyleTrackballCamera

=over 1

=item *

Inherits from InteractorStyle

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkInteractorStyleTrackballCamera *New ();
   void OnLeftButtonDown (int ctrl, int shift, int x, int y);
   void OnLeftButtonUp (int ctrl, int shift, int x, int y);
   void OnMiddleButtonDown (int ctrl, int shift, int x, int y);
   void OnMiddleButtonUp (int ctrl, int shift, int x, int y);
   void OnMouseMove (int ctrl, int shift, int x, int y);
   void OnRightButtonDown (int ctrl, int shift, int x, int y);
   void OnRightButtonUp (int ctrl, int shift, int x, int y);


B<vtkInteractorStyleTrackballCamera Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::InteractorStyleUser;


@Graphics::VTK::InteractorStyleUser::ISA = qw( Graphics::VTK::InteractorStyleSwitch );

=head1 Graphics::VTK::InteractorStyleUser

=over 1

=item *

Inherits from InteractorStyleSwitch

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int GetButton ();
   int GetChar ();
   const char *GetClassName();
   int GetCtrlKey ();
   char *GetKeySym ();
   int  *GetOldPos ();
      (Returns a 2-element Perl list)
   int GetShiftKey ();
   vtkInteractorStyleUser *New ();
   void SetButtonPressMethod (void (*func)(void *) , void *arg);
   void SetButtonReleaseMethod (void (*func)(void *) , void *arg);
   void SetCharMethod (void (*func)(void *) , void *arg);
   void SetConfigureMethod (void (*func)(void *) , void *arg);
   void SetEnterMethod (void (*func)(void *) , void *arg);
   void SetKeyPressMethod (void (*func)(void *) , void *arg);
   void SetKeyReleaseMethod (void (*func)(void *) , void *arg);
   void SetLeaveMethod (void (*func)(void *) , void *arg);
   void SetMouseMoveMethod (void (*func)(void *) , void *arg);
   void SetTimerMethod (void (*func)(void *) , void *arg);


B<vtkInteractorStyleUser Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void EndUserInteraction ();
      Method is marked 'Do Not Use' in its descriptions

   int  *GetLastPos ();
      Method is marked 'Do Not Use' in its descriptions

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetButtonPressMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetButtonReleaseMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetCharMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetConfigureMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetEnterMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetKeyPressMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetKeyReleaseMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetLeaveMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetMouseMoveMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetTimerMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetUserInteractionMethod (void (*func)(void *) , void *arg);
      Method is marked 'Do Not Use' in its descriptions

   void SetUserInteractionMethodArgDelete (void (*func)(void *) );
      Method is marked 'Do Not Use' in its descriptions

   void StartUserInteraction ();
      Method is marked 'Do Not Use' in its descriptions

   int OldPos[2]int Charchar *KeySymint Buttonunsigned long MouseMoveTagunsigned long KeyPressTagunsigned long KeyReleaseTagunsigned long CharTagunsigned long EnterTagunsigned long LeaveTagunsigned long ConfigureTagunsigned long TimerTagunsigned long UserTagvoid vtkSetOldCallback (unsigned long &tag, unsigned long event, void (*func)(void *) , void *arg);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::InterpolateDataSetAttributes;


@Graphics::VTK::InterpolateDataSetAttributes::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::InterpolateDataSetAttributes

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddInput (vtkDataSet *in);
   const char *GetClassName();
   vtkDataSetCollection *GetInputList ();
   float GetT ();
   vtkInterpolateDataSetAttributes *New ();
   void SetT (float );


B<vtkInterpolateDataSetAttributes Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::KochanekSpline;


@Graphics::VTK::KochanekSpline::ISA = qw( Graphics::VTK::Spline );

=head1 Graphics::VTK::KochanekSpline

=over 1

=item *

Inherits from Spline

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Compute ();
   float Evaluate (float t);
   const char *GetClassName();
   float GetDefaultBias ();
   float GetDefaultContinuity ();
   float GetDefaultTension ();
   vtkKochanekSpline *New ();
   void SetDefaultBias (float );
   void SetDefaultContinuity (float );
   void SetDefaultTension (float );


B<vtkKochanekSpline Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void Fit1D (int n, float *x, float *y, float tension, float bias, float continuity, float coefficients[4][], int leftConstraint, float leftValue, int rightConstraint, float rightValue);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::LODActor;


@Graphics::VTK::LODActor::ISA = qw( Graphics::VTK::Actor );

=head1 Graphics::VTK::LODActor

=over 1

=item *

Inherits from Actor

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddLODMapper (vtkMapper *mapper);
   const char *GetClassName();
   vtkMapperCollection *GetLODMappers ();
   int GetNumberOfCloudPoints ();
   void Modified ();
   vtkLODActor *New ();
   void ReleaseGraphicsResources (vtkWindow *);
   virtual void Render (vtkRenderer *, vtkMapper *);
   int RenderOpaqueGeometry (vtkViewport *viewport);
   void SetNumberOfCloudPoints (int );
   void ShallowCopy (vtkProp *prop);


B<vtkLODActor Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::LODProp3D;


@Graphics::VTK::LODProp3D::ISA = qw( Graphics::VTK::Prop3D );

=head1 Graphics::VTK::LODProp3D

=over 1

=item *

Inherits from Prop3D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int AddLOD (vtkMapper *m, vtkProperty *p, vtkTexture *t, float time);
   int AddLOD (vtkVolumeMapper *m, vtkVolumeProperty *p, float time);
   int AddLOD (vtkMapper *m, vtkTexture *t, float time);
   int AddLOD (vtkMapper *m, vtkProperty *p, float time);
   int AddLOD (vtkVolumeMapper *m, float time);
   int AddLOD (vtkMapper *m, float time);
   void AutomaticLODSelectionOff ();
   void AutomaticLODSelectionOn ();
   void AutomaticPickLODSelectionOff ();
   void AutomaticPickLODSelectionOn ();
   void DisableLOD (int id);
   void EnableLOD (int id);
   virtual void GetActors (vtkPropCollection *);
   int GetAutomaticLODSelection ();
   int GetAutomaticPickLODSelection ();
   float *GetBounds ();
      (Returns a 6-element Perl list)
   const char *GetClassName();
   float GetLODEstimatedRenderTime (int id);
   float GetLODIndexEstimatedRenderTime (int index);
   float GetLODIndexLevel (int index);
   float GetLODLevel (int id);
   int GetLastRenderedLODID ();
   int GetSelectedLODID ();
   int GetSelectedPickLODID ();
   vtkLODProp3DEntry vtkLODProp3D *New ();
   void RemoveLOD (int id);
   int RequiresRayCasting ();
   int RequiresRenderingIntoImage ();
   void SetAutomaticLODSelection (int );
   void SetAutomaticPickLODSelection (int );
   void SetLODLevel (int id, float level);
   void SetLODMapper (int id, vtkVolumeMapper *m);
   void SetLODMapper (int id, vtkMapper *m);
   void SetLODProperty (int id, vtkVolumeProperty *p);
   void SetLODProperty (int id, vtkProperty *p);
   void SetLODTexture (int id, vtkTexture *t);
   void SetPickMethod (void (*func)(void *) , void *arg);
   void SetSelectedLODID (int );
   void SetSelectedPickLODID (int id);
   void ShallowCopy (vtkProp *prop);


B<vtkLODProp3D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GetBounds (float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetLODMapper (int id, vtkMapper *m);
      Don't know the size of pointer arg number 2

   void GetLODMapper (int id, vtkVolumeMapper *m);
      Don't know the size of pointer arg number 2

   void GetLODProperty (int id, vtkProperty *p);
      Don't know the size of pointer arg number 2

   void GetLODProperty (int id, vtkVolumeProperty *p);
      Don't know the size of pointer arg number 2

   void GetLODTexture (int id, vtkTexture *t);
      Don't know the size of pointer arg number 2

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetPickMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::Light;


@Graphics::VTK::Light::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::Light

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void DeepCopy (vtkLight *light);
   float  *GetAttenuationValues ();
      (Returns a 3-element Perl list)
   const char *GetClassName();
   float  *GetColor ();
      (Returns a 3-element Perl list)
   float GetConeAngle ();
   float GetExponent ();
   float  *GetFocalPoint ();
      (Returns a 3-element Perl list)
   float GetIntensity ();
   int GetLightType ();
   float  *GetPosition ();
      (Returns a 3-element Perl list)
   int GetPositional ();
   int GetSwitch ();
   vtkMatrix4x4 *GetTransformMatrix ();
   void GetTransformedFocalPoint (float &a0, float &a1, float &a2);
   float *GetTransformedFocalPoint ();
      (Returns a 3-element Perl list)
   void GetTransformedPosition (float &a0, float &a1, float &a2);
   float *GetTransformedPosition ();
      (Returns a 3-element Perl list)
   int LightTypeIsCameraLight ();
   int LightTypeIsHeadlight ();
   int LightTypeIsSceneLight ();
   vtkLight *New ();
   void PositionalOff ();
   void PositionalOn ();
   virtual void Render (vtkRenderer *, int );
   void SetAttenuationValues (float  , float , float );
   void SetColor (float  , float , float );
   void SetConeAngle (float );
   void SetDirectionAngle (float elevation, float azimuth);
   void SetExponent (float );
   void SetFocalPoint (float  , float , float );
   void SetIntensity (float );
   void SetLightType (int );
   void SetLightTypeToCameraLight ();
   void SetLightTypeToHeadlight ();
   void SetLightTypeToSceneLight ();
   void SetPosition (float  , float , float );
   void SetPositional (int );
   void SetSwitch (int );
   void SetTransformMatrix (vtkMatrix4x4 *);
   void SwitchOff ();
   void SwitchOn ();


B<vtkLight Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GetTransformedFocalPoint (float a[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetTransformedPosition (float a[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ReadSelf (istream &is);
      Arg types of 'istream' not supported yet
   void SetAttenuationValues (float  a[3]);
      Method is redundant. Same as SetAttenuationValues( float, float, float)

   void SetColor (float  a[3]);
      Method is redundant. Same as SetColor( float, float, float)

   void SetDirectionAngle (float ang[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetFocalPoint (float  a[3]);
      Method is redundant. Same as SetFocalPoint( float, float, float)

   void SetFocalPoint (double *a);
      Don't know the size of pointer arg number 1

   void SetPosition (float  a[3]);
      Method is redundant. Same as SetPosition( float, float, float)

   void SetPosition (double *a);
      Don't know the size of pointer arg number 1

   void WriteSelf (ostream &os);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::LightCollection;


@Graphics::VTK::LightCollection::ISA = qw( Graphics::VTK::Collection );

=head1 Graphics::VTK::LightCollection

=over 1

=item *

Inherits from Collection

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddItem (vtkLight *a);
   const char *GetClassName();
   vtkLight *GetNextItem ();
   vtkLightCollection *New ();

=cut

package Graphics::VTK::LineSource;


@Graphics::VTK::LineSource::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::LineSource

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float  *GetPoint1 ();
      (Returns a 3-element Perl list)
   float  *GetPoint2 ();
      (Returns a 3-element Perl list)
   int GetResolution ();
   vtkLineSource *New ();
   void SetPoint1 (float  , float , float );
   void SetPoint2 (float  , float , float );
   void SetResolution (int );


B<vtkLineSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetPoint1 (float  a[3]);
      Method is redundant. Same as SetPoint1( float, float, float)

   void SetPoint2 (float  a[3]);
      Method is redundant. Same as SetPoint2( float, float, float)


=cut

package Graphics::VTK::LinearExtrusionFilter;


@Graphics::VTK::LinearExtrusionFilter::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::LinearExtrusionFilter

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CappingOff ();
   void CappingOn ();
   int GetCapping ();
   const char *GetClassName();
   float  *GetExtrusionPoint ();
      (Returns a 3-element Perl list)
   int GetExtrusionType ();
   int GetLowerCap ();
   float GetScaleFactor ();
   int GetUpperCap ();
   float  *GetVector ();
      (Returns a 3-element Perl list)
   void LowerCapOff ();
   void LowerCapOn ();
   vtkLinearExtrusionFilter *New ();
   void SetCapping (int );
   void SetExtrusionPoint (float  , float , float );
   void SetExtrusionType (int );
   void SetExtrusionTypeToNormalExtrusion ();
   void SetExtrusionTypeToPointExtrusion ();
   void SetExtrusionTypeToVectorExtrusion ();
   void SetLowerCap (int );
   void SetScaleFactor (float );
   void SetUpperCap (int );
   void SetVector (float  , float , float );
   void UpperCapOff ();
   void UpperCapOn ();


B<vtkLinearExtrusionFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetExtrusionPoint (float  a[3]);
      Method is redundant. Same as SetExtrusionPoint( float, float, float)

   void SetVector (float  a[3]);
      Method is redundant. Same as SetVector( float, float, float)


=cut

package Graphics::VTK::LinearSubdivisionFilter;


@Graphics::VTK::LinearSubdivisionFilter::ISA = qw( Graphics::VTK::InterpolatingSubdivisionFilter );

=head1 Graphics::VTK::LinearSubdivisionFilter

=over 1

=item *

Inherits from InterpolatingSubdivisionFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkLinearSubdivisionFilter *New ();

=cut

package Graphics::VTK::LinkEdgels;


@Graphics::VTK::LinkEdgels::ISA = qw( Graphics::VTK::StructuredPointsToPolyDataFilter );

=head1 Graphics::VTK::LinkEdgels

=over 1

=item *

Inherits from StructuredPointsToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetGradientThreshold ();
   float GetLinkThreshold ();
   float GetPhiThreshold ();
   vtkLinkEdgels *New ();
   void SetGradientThreshold (float );
   void SetLinkThreshold (float );
   void SetPhiThreshold (float );


B<vtkLinkEdgels Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void LinkEdgels (int xdim, int ydim, float *image, vtkVectors *inVectors, vtkCellArray *newLines, vtkPoints *newPts, vtkScalars *outScalars, vtkVectors *outVectors, int z);
      Don't know the size of pointer arg number 3

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::LoopSubdivisionFilter;


@Graphics::VTK::LoopSubdivisionFilter::ISA = qw( Graphics::VTK::ApproximatingSubdivisionFilter );

=head1 Graphics::VTK::LoopSubdivisionFilter

=over 1

=item *

Inherits from ApproximatingSubdivisionFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkLoopSubdivisionFilter *New ();


B<vtkLoopSubdivisionFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GenerateEvenStencil (int p1, vtkPolyData *polys, vtkIdList *stencilIds, float *weights);
      Don't know the size of pointer arg number 4

   void GenerateOddStencil (int p1, int p2, vtkPolyData *polys, vtkIdList *stencilIds, float *weights);
      Don't know the size of pointer arg number 5


=cut

package Graphics::VTK::MCubesReader;


@Graphics::VTK::MCubesReader::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::MCubesReader

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CreateDefaultLocator ();
   void FlipNormalsOff ();
   void FlipNormalsOn ();
   const char *GetClassName();
   char *GetFileName ();
   int GetFlipNormals ();
   char *GetLimitsFileName ();
   vtkPointLocator *GetLocator ();
   unsigned long GetMTime ();
   int GetNormals ();
   vtkMCubesReader *New ();
   void NormalsOff ();
   void NormalsOn ();
   void SetFileName (char *);
   void SetFlipNormals (int );
   void SetLimitsFileName (char *);
   void SetLocator (vtkPointLocator *locator);
   void SetLocator (vtkPointLocator &locator);
   void SetNormals (int );


B<vtkMCubesReader Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::MCubesWriter;


@Graphics::VTK::MCubesWriter::ISA = qw( Graphics::VTK::PolyDataWriter );

=head1 Graphics::VTK::MCubesWriter

=over 1

=item *

Inherits from PolyDataWriter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   char *GetLimitsFileName ();
   vtkMCubesWriter *New ();
   void SetLimitsFileName (char *);


B<vtkMCubesWriter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::MapperCollection;


@Graphics::VTK::MapperCollection::ISA = qw( Graphics::VTK::Collection );

=head1 Graphics::VTK::MapperCollection

=over 1

=item *

Inherits from Collection

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddItem (vtkMapper *a);
   const char *GetClassName();
   vtkMapper *GetLastItem ();
   vtkMapper *GetNextItem ();
   vtkMapperCollection *New ();

=cut

package Graphics::VTK::MaskPoints;


@Graphics::VTK::MaskPoints::ISA = qw( Graphics::VTK::DataSetToPolyDataFilter );

=head1 Graphics::VTK::MaskPoints

=over 1

=item *

Inherits from DataSetToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void GenerateVerticesOff ();
   void GenerateVerticesOn ();
   const char *GetClassName();
   int GetGenerateVertices ();
   int GetMaximumNumberOfPoints ();
   int GetOffset ();
   int GetOnRatio ();
   int GetRandomMode ();
   vtkMaskPoints *New ();
   void RandomModeOff ();
   void RandomModeOn ();
   void SetGenerateVertices (int );
   void SetMaximumNumberOfPoints (int );
   void SetOffset (int );
   void SetOnRatio (int );
   void SetRandomMode (int );


B<vtkMaskPoints Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::MaskPolyData;


@Graphics::VTK::MaskPolyData::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::MaskPolyData

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetOffset ();
   int GetOnRatio ();
   vtkMaskPolyData *New ();
   void SetOffset (int );
   void SetOnRatio (int );


B<vtkMaskPolyData Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::MergeFilter;


@Graphics::VTK::MergeFilter::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::MergeFilter

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkDataSet *GetFieldData ();
   vtkDataSet *GetGeometry ();
   vtkDataSet *GetNormals ();
   vtkDataSet *GetScalars ();
   vtkDataSet *GetTCoords ();
   vtkDataSet *GetTensors ();
   vtkDataSet *GetVectors ();
   vtkMergeFilter *New ();
   void SetFieldData (vtkDataSet *);
   void SetGeometry (vtkDataSet *input);
   void SetNormals (vtkDataSet *);
   void SetScalars (vtkImageData *cache);
   void SetScalars (vtkDataSet *);
   void SetTCoords (vtkDataSet *);
   void SetTensors (vtkDataSet *);
   void SetVectors (vtkDataSet *);


B<vtkMergeFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::MergeDataObjectFilter;


@Graphics::VTK::MergeDataObjectFilter::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::MergeDataObjectFilter

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkDataObject *GetDataObject ();
   int GetOutputField ();
   vtkMergeDataObjectFilter *New ();
   void SetDataObject (vtkDataObject *object);
   void SetOutputField (int );
   void SetOutputFieldToCellDataField ();
   void SetOutputFieldToDataObjectField ();
   void SetOutputFieldToPointDataField ();


B<vtkMergeDataObjectFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::MergePoints;


@Graphics::VTK::MergePoints::ISA = qw( Graphics::VTK::PointLocator );

=head1 Graphics::VTK::MergePoints

=over 1

=item *

Inherits from PointLocator

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int IsInsertedPoint (float x, float y, float z);
   vtkMergePoints *New ();


B<vtkMergePoints Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int InsertUniquePoint (float x[3], int &ptId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int IsInsertedPoint (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::OBBDicer;


@Graphics::VTK::OBBDicer::ISA = qw( Graphics::VTK::Dicer );

=head1 Graphics::VTK::OBBDicer

=over 1

=item *

Inherits from Dicer

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkOBBDicer *New ();


B<vtkOBBDicer Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::OBBTree;


@Graphics::VTK::OBBTree::ISA = qw( Graphics::VTK::CellLocator );

=head1 Graphics::VTK::OBBTree

=over 1

=item *

Inherits from CellLocator

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BuildLocator ();
   void FreeSearchStructure ();
   void GenerateRepresentation (int level, vtkPolyData *pd);
   const char *GetClassName();
   vtkOBBTree *New ();


B<vtkOBBTree Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeOBB (vtkPoints *pts, float corner[3], float max[3], float mid[3], float min[3], float size[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeOBB (vtkDataSet *input, float corner[3], float max[3], float mid[3], float min[3], float size[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int IntersectWithLine (float a0[3], float a1[3], float tol, float &t, float x[3], float pcoords[3], int &subId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int IntersectWithLine (float a0[3], float a1[3], float tol, float &t, float x[3], float pcoords[3], int &subId, int &cellId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int IntersectWithLine (float a0[3], float a1[3], float tol, float &t, float x[3], float pcoords[3], int &subId, int &cellId, vtkGenericCell *cell);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::OBJExporter;


@Graphics::VTK::OBJExporter::ISA = qw( Graphics::VTK::Exporter );

=head1 Graphics::VTK::OBJExporter

=over 1

=item *

Inherits from Exporter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   char *GetFilePrefix ();
   vtkOBJExporter *New ();
   void SetFilePrefix (char *);


B<vtkOBJExporter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void WriteAnActor (vtkActor *anActor, FILE *fpObj, FILE *fpMat, int &id);
      Don't know the size of pointer arg number 2


=cut

package Graphics::VTK::OutlineFilter;


@Graphics::VTK::OutlineFilter::ISA = qw( Graphics::VTK::DataSetToPolyDataFilter );

=head1 Graphics::VTK::OutlineFilter

=over 1

=item *

Inherits from DataSetToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkOutlineFilter *New ();

=cut

package Graphics::VTK::OutlineSource;


@Graphics::VTK::OutlineSource::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::OutlineSource

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float  *GetBounds ();
      (Returns a 6-element Perl list)
   const char *GetClassName();
   vtkOutlineSource *New ();
   void SetBounds (float  , float , float , float , float , float );


B<vtkOutlineSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetBounds (float  a[6]);
      Method is redundant. Same as SetBounds( float, float, float, float, float, float)


=cut

package Graphics::VTK::PLOT3DReader;


@Graphics::VTK::PLOT3DReader::ISA = qw( Graphics::VTK::StructuredGridSource );

=head1 Graphics::VTK::PLOT3DReader

=over 1

=item *

Inherits from StructuredGridSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float GetAlpha ();
   const char *GetClassName();
   int GetFileFormat ();
   float GetFsmach ();
   char *GetFunctionFileName ();
   float GetGamma ();
   int GetGridNumber ();
   int GetNumberOfGrids ();
   char *GetQFileName ();
   float GetR ();
   float GetRe ();
   int GetScalarFunctionNumber ();
   float GetTime ();
   float GetUvinf ();
   char *GetVectorFunctionFileName ();
   int GetVectorFunctionNumber ();
   float GetVvinf ();
   float GetWvinf ();
   char *GetXYZFileName ();
   vtkPLOT3DReader *New ();
   void SetFileFormat (int );
   void SetFunctionFileName (char *);
   void SetGamma (float );
   void SetGridNumber (int );
   void SetQFileName (char *);
   void SetR (float );
   void SetScalarFunctionNumber (int );
   void SetUvinf (float );
   void SetVectorFunctionFileName (char *);
   void SetVectorFunctionNumber (int );
   void SetVvinf (float );
   void SetWvinf (float );
   void SetXYZFileName (char *);


B<vtkPLOT3DReader Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int GetFileType (FILE *fp);
      Don't know the size of pointer arg number 1

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   int ReadBinaryFunctionFile (FILE *fp, vtkStructuredGrid *output);
      Don't know the size of pointer arg number 1

   float *TempStorageint NumberOfPointsint NumberOfGridsfloat Fsmachfloat Alphafloat Refloat Timefloat Rfloat Gammafloat Uvinffloat Vvinffloat Wvinfint ReadBinaryGrid (FILE *fp, vtkStructuredGrid *output);
      Don't know the size of pointer arg number 1

   int ReadBinaryGridDimensions (FILE *fp, vtkStructuredGrid *output);
      Don't know the size of pointer arg number 1

   int ReadBinarySolution (FILE *fp, vtkStructuredGrid *output);
      Don't know the size of pointer arg number 1

   int ReadBinaryVectorFunctionFile (FILE *fp, vtkStructuredGrid *output);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::Picker;


@Graphics::VTK::Picker::ISA = qw( Graphics::VTK::AbstractPropPicker );

=head1 Graphics::VTK::Picker

=over 1

=item *

Inherits from AbstractPropPicker

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   vtkActorCollection *GetActors ();
   const char *GetClassName();
   vtkDataSet *GetDataSet ();
   vtkAbstractMapper3D *GetMapper ();
   float  *GetMapperPosition ();
      (Returns a 3-element Perl list)
   vtkPoints *GetPickedPositions ();
   vtkProp3DCollection *GetProp3Ds ();
   float GetTolerance ();
   vtkPicker *New ();
   virtual int Pick (float selectionX, float selectionY, float selectionZ, vtkRenderer *renderer);
   void SetTolerance (float );


B<vtkPicker Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual float IntersectWithLine (float p1[3], float p2[3], float tol, vtkAssemblyPath *path, vtkProp3D *p, vtkAbstractMapper3D *m);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void MarkPicked (vtkAssemblyPath *path, vtkProp3D *p, vtkAbstractMapper3D *m, float tMin, float mapperPos[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int Pick (float selectionPt[3], vtkRenderer *ren);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::PiecewiseFunction;


@Graphics::VTK::PiecewiseFunction::ISA = qw( Graphics::VTK::DataObject );

=head1 Graphics::VTK::PiecewiseFunction

=over 1

=item *

Inherits from DataObject

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddPoint (float x, float val);
   void AddSegment (float x1, float val1, float x2, float val2);
   void ClampingOff ();
   void ClampingOn ();
   void DeepCopy (vtkDataObject *f);
   int GetClamping ();
   const char *GetClassName();
   int GetDataObjectType ();
   float GetFirstNonZeroValue ();
   unsigned long GetMTime ();
   int GetSize ();
   char *GetType ();
   float GetValue (float x);
   void Initialize ();
   vtkPiecewiseFunction *New ();
   void RemoveAllPoints ();
   void RemovePoint (float x);
   void SetClamping (int );
   void ShallowCopy (vtkDataObject *f);


B<vtkPiecewiseFunction Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void BuildFunctionFromTable (float x1, float x2, int size, float *table, int stride);
      Don't know the size of pointer arg number 4

   float *GetDataPointer ();
      Can't Handle 'float *' return type without a hint

   float *GetRange ();
      Can't Handle 'float *' return type without a hint

   void GetTable (float x1, float x2, int size, float *table, int stride);
      Don't know the size of pointer arg number 4

   int ArraySizeint Clampingfloat *Functionint FunctionSizefloat FunctionRange[2]void IncreaseArraySize ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::PlaneSource;


@Graphics::VTK::PlaneSource::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::PlaneSource

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float  *GetCenter ();
      (Returns a 3-element Perl list)
   const char *GetClassName();
   float  *GetNormal ();
      (Returns a 3-element Perl list)
   float  *GetOrigin ();
      (Returns a 3-element Perl list)
   float  *GetPoint1 ();
      (Returns a 3-element Perl list)
   float  *GetPoint2 ();
      (Returns a 3-element Perl list)
   void GetResolution (int &xR, int &yR);
   int GetXResolution ();
   int GetYResolution ();
   vtkPlaneSource *New ();
   void Push (float distance);
   void SetCenter (float x, float y, float z);
   void SetNormal (float nx, float ny, float nz);
   void SetOrigin (float  , float , float );
   void SetPoint1 (float x, float y, float z);
   void SetPoint2 (float x, float y, float z);
   void SetResolution (int xR, int yR);
   void SetXResolution (int );
   void SetYResolution (int );


B<vtkPlaneSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetCenter (float center[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetNormal (float n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetOrigin (float  a[3]);
      Method is redundant. Same as SetOrigin( float, float, float)

   void SetPoint1 (float pnt[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetPoint2 (float pnt[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int XResolutionint YResolutionfloat Origin[3]float Point1[3]float Point2[3]float Normal[3]float Center[3]int UpdatePlane (float v1[3], float v2[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::Planes;


@Graphics::VTK::Planes::ISA = qw( Graphics::VTK::ImplicitFunction );

=head1 Graphics::VTK::Planes

=over 1

=item *

Inherits from ImplicitFunction

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float EvaluateFunction (float x, float y, float z);
   const char *GetClassName();
   vtkNormals *GetNormals ();
   int GetNumberOfPlanes ();
   vtkPlane *GetPlane (int i);
   vtkPoints *GetPoints ();
   vtkPlanes *New ();
   void SetFrustumPlanes (float aspect, vtkCamera *camera);
   void SetNormals (vtkNormals *);
   void SetPoints (vtkPoints *);


B<vtkPlanes Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float EvaluateFunction (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateGradient (float x[3], float n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::PointDataToCellData;


@Graphics::VTK::PointDataToCellData::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::PointDataToCellData

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetPassPointData ();
   vtkPointDataToCellData *New ();
   void PassPointDataOff ();
   void PassPointDataOn ();
   void SetPassPointData (int );


B<vtkPointDataToCellData Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::PointLoad;


@Graphics::VTK::PointLoad::ISA = qw( Graphics::VTK::StructuredPointsSource );

=head1 Graphics::VTK::PointLoad

=over 1

=item *

Inherits from StructuredPointsSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ComputeEffectiveStressOff ();
   void ComputeEffectiveStressOn ();
   const char *GetClassName();
   int GetComputeEffectiveStress ();
   float GetLoadValue ();
   float  *GetModelBounds ();
      (Returns a 6-element Perl list)
   float GetPoissonsRatio ();
   int  *GetSampleDimensions ();
      (Returns a 3-element Perl list)
   vtkPointLoad *New ();
   void SetComputeEffectiveStress (int );
   void SetLoadValue (float );
   void SetModelBounds (float  , float , float , float , float , float );
   void SetPoissonsRatio (float );
   void SetSampleDimensions (int i, int j, int k);


B<vtkPointLoad Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetModelBounds (float  a[6]);
      Method is redundant. Same as SetModelBounds( float, float, float, float, float, float)

   void SetSampleDimensions (int dim[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::PointPicker;


@Graphics::VTK::PointPicker::ISA = qw( Graphics::VTK::Picker );

=head1 Graphics::VTK::PointPicker

=over 1

=item *

Inherits from Picker

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetPointId ();
   vtkPointPicker *New ();


B<vtkPointPicker Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int PointIdfloat IntersectWithLine (float p1[3], float p2[3], float tol, vtkAssemblyPath *path, vtkProp3D *p, vtkAbstractMapper3D *m);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::PointSetSource;


@Graphics::VTK::PointSetSource::ISA = qw( Graphics::VTK::Source );

=head1 Graphics::VTK::PointSetSource

=over 1

=item *

Inherits from Source

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkPointSet *GetOutput (int idx);
   vtkPointSet *GetOutput ();
   vtkPointSetSource *New ();
   void SetOutput (vtkPointSet *output);

=cut

package Graphics::VTK::PointSource;


@Graphics::VTK::PointSource::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::PointSource

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float  *GetCenter ();
      (Returns a 3-element Perl list)
   const char *GetClassName();
   int GetDistribution ();
   int GetNumberOfPoints ();
   float GetRadius ();
   vtkPointSource *New ();
   void SetCenter (float  , float , float );
   void SetDistribution (int );
   void SetDistributionToShell ();
   void SetDistributionToUniform ();
   void SetNumberOfPoints (int );
   void SetRadius (float );


B<vtkPointSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetCenter (float  a[3]);
      Method is redundant. Same as SetCenter( float, float, float)


=cut

package Graphics::VTK::PolyDataCollection;


@Graphics::VTK::PolyDataCollection::ISA = qw( Graphics::VTK::Collection );

=head1 Graphics::VTK::PolyDataCollection

=over 1

=item *

Inherits from Collection

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddItem (vtkPolyData *pd);
   const char *GetClassName();
   vtkPolyData *GetNextItem ();
   vtkPolyDataCollection *New ();

=cut

package Graphics::VTK::PolyDataConnectivityFilter;


@Graphics::VTK::PolyDataConnectivityFilter::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::PolyDataConnectivityFilter

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddSeed (int id);
   void AddSpecifiedRegion (int id);
   void ColorRegionsOff ();
   void ColorRegionsOn ();
   void DeleteSeed (int id);
   void DeleteSpecifiedRegion (int id);
   const char *GetClassName();
   float  *GetClosestPoint ();
      (Returns a 3-element Perl list)
   int GetColorRegions ();
   int GetExtractionMode ();
   char *GetExtractionModeAsString ();
   int GetMaxRecursionDepth ();
   int GetNumberOfExtractedRegions ();
   int GetScalarConnectivity ();
   float  *GetScalarRange ();
      (Returns a 2-element Perl list)
   void InitializeSeedList ();
   void InitializeSpecifiedRegionList ();
   vtkPolyDataConnectivityFilter *New ();
   void ScalarConnectivityOff ();
   void ScalarConnectivityOn ();
   void SetClosestPoint (float  , float , float );
   void SetColorRegions (int );
   void SetExtractionMode (int );
   void SetExtractionModeToAllRegions ();
   void SetExtractionModeToCellSeededRegions ();
   void SetExtractionModeToClosestPointRegion ();
   void SetExtractionModeToLargestRegion ();
   void SetExtractionModeToPointSeededRegions ();
   void SetExtractionModeToSpecifiedRegions ();
   void SetScalarConnectivity (int );
   void SetScalarRange (float  [2]);


B<vtkPolyDataConnectivityFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetClosestPoint (float  a[3]);
      Method is redundant. Same as SetClosestPoint( float, float, float)

   void SetMaxRecursionDepth (int );
      Method is marked 'Do Not Use' in its descriptions

   int ColorRegionsint ExtractionModevtkIdList *SeedsvtkIdList *SpecifiedRegionIdsvtkIntArray *RegionSizesfloat ClosestPoint[3]int ScalarConnectivityfloat ScalarRange[2]void TraverseAndMark ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::PolyDataMapper;


@Graphics::VTK::PolyDataMapper::ISA = qw( Graphics::VTK::Mapper );

=head1 Graphics::VTK::PolyDataMapper

=over 1

=item *

Inherits from Mapper

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetGhostLevel ();
   vtkPolyData *GetInput ();
   int GetNumberOfPieces ();
   int GetPiece ();
   vtkPolyDataMapper *New ();
   virtual void Render (vtkRenderer *, vtkActor *);
   void SetGhostLevel (int );
   void SetInput (vtkPolyData *in);
   void SetNumberOfPieces (int );
   void SetPiece (int );
   void Update ();


B<vtkPolyDataMapper Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::PolyDataNormals;


@Graphics::VTK::PolyDataNormals::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::PolyDataNormals

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ComputeCellNormalsOff ();
   void ComputeCellNormalsOn ();
   void ComputePointNormalsOff ();
   void ComputePointNormalsOn ();
   void ConsistencyOff ();
   void ConsistencyOn ();
   void FlipNormalsOff ();
   void FlipNormalsOn ();
   const char *GetClassName();
   int GetComputeCellNormals ();
   int GetComputePointNormals ();
   int GetConsistency ();
   float GetFeatureAngle ();
   int GetFlipNormals ();
   int GetMaxRecursionDepth ();
   int GetNonManifoldTraversal ();
   int GetSplitting ();
   vtkPolyDataNormals *New ();
   void NonManifoldTraversalOff ();
   void NonManifoldTraversalOn ();
   void SetComputeCellNormals (int );
   void SetComputePointNormals (int );
   void SetConsistency (int );
   void SetFeatureAngle (float );
   void SetFlipNormals (int );
   void SetMaxRecursionDepth (int );
   void SetNonManifoldTraversal (int );
   void SetSplitting (int );
   void SplittingOff ();
   void SplittingOn ();


B<vtkPolyDataNormals Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void MarkAndReplace (int cellId, int n, int replacement, vtkNormals *PolyNormals, vtkIdList *edgeNeighbors, int *Visited, vtkIdList *Map, vtkPolyData *OldMesh, vtkPolyData *NewMesh, float CosAngle);
      Don't know the size of pointer arg number 6

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   float FeatureAngleint Splittingint Consistencyint FlipNormalsint MaxRecursionDepthint NonManifoldTraversalint ComputePointNormalsint ComputeCellNormalsint Markint NumFlipsint TraverseAndOrder (int cellId, vtkIdList *edgeNeighbors, int *Visited, vtkPolyData *OldMesh, vtkPolyData *NewMesh);
      Don't know the size of pointer arg number 3


=cut

package Graphics::VTK::PolyDataReader;


@Graphics::VTK::PolyDataReader::ISA = qw( Graphics::VTK::DataReader );

=head1 Graphics::VTK::PolyDataReader

=over 1

=item *

Inherits from DataReader

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkPolyData *GetOutput (int idx);
   vtkPolyData *GetOutput ();
   vtkPolyDataReader *New ();
   void SetOutput (vtkPolyData *output);


B<vtkPolyDataReader Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::PolyDataStreamer;


@Graphics::VTK::PolyDataStreamer::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::PolyDataStreamer

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ColorByPieceOff ();
   void ColorByPieceOn ();
   const char *GetClassName();
   int GetColorByPiece ();
   int GetNumberOfStreamDivisions ();
   vtkPolyDataStreamer *New ();
   void SetColorByPiece (int );
   void SetNumberOfStreamDivisions (int num);


B<vtkPolyDataStreamer Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::PolyDataWriter;


@Graphics::VTK::PolyDataWriter::ISA = qw( Graphics::VTK::DataWriter );

=head1 Graphics::VTK::PolyDataWriter

=over 1

=item *

Inherits from DataWriter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkPolyData *GetInput ();
   vtkPolyDataWriter *New ();
   void SetInput (vtkPolyData *input);


B<vtkPolyDataWriter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ProbeFilter;


@Graphics::VTK::ProbeFilter::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::ProbeFilter

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkDataSet *GetSource ();
   int GetSpatialMatch ();
   vtkProbeFilter *New ();
   virtual void SetSource (vtkStructuredPoints *sp);
   void SetSource (vtkImageData *cache);
   void SetSource (vtkDataSet *source);
   void SetSpatialMatch (int );
   void SpatialMatchOff ();
   void SpatialMatchOn ();


B<vtkProbeFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ProgrammableAttributeDataFilter;


@Graphics::VTK::ProgrammableAttributeDataFilter::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::ProgrammableAttributeDataFilter

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddInput (vtkDataSet *in);
   const char *GetClassName();
   vtkDataSetCollection *GetInputList ();
   vtkProgrammableAttributeDataFilter *New ();
   void RemoveInput (vtkDataSet &in);
   void RemoveInput (vtkDataSet *in);
   void SetExecuteMethod (void (*func)(void *) , void *arg);


B<vtkProgrammableAttributeDataFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void AddInput (vtkDataSet &in);
      Method is marked 'Do Not Use' in its descriptions

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetExecuteMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ProgrammableDataObjectSource;


@Graphics::VTK::ProgrammableDataObjectSource::ISA = qw( Graphics::VTK::Source );

=head1 Graphics::VTK::ProgrammableDataObjectSource

=over 1

=item *

Inherits from Source

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkDataObject *GetOutput (int idx);
   vtkDataObject *GetOutput ();
   vtkProgrammableDataObjectSource *New ();
   void SetExecuteMethod (void (*func)(void *) , void *arg);


B<vtkProgrammableDataObjectSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetExecuteMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ProgrammableFilter;


@Graphics::VTK::ProgrammableFilter::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::ProgrammableFilter

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkPolyData *GetPolyDataInput ();
   vtkRectilinearGrid *GetRectilinearGridInput ();
   vtkStructuredGrid *GetStructuredGridInput ();
   vtkStructuredPoints *GetStructuredPointsInput ();
   vtkUnstructuredGrid *GetUnstructuredGridInput ();
   vtkProgrammableFilter *New ();
   void SetExecuteMethod (void (*func)(void *) , void *arg);


B<vtkProgrammableFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void SetExecuteMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ProgrammableGlyphFilter;


@Graphics::VTK::ProgrammableGlyphFilter::ISA = qw( Graphics::VTK::DataSetToPolyDataFilter );

=head1 Graphics::VTK::ProgrammableGlyphFilter

=over 1

=item *

Inherits from DataSetToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetColorMode ();
   char *GetColorModeAsString ();
   float  *GetPoint ();
      (Returns a 3-element Perl list)
   vtkPointData *GetPointData ();
   int GetPointId ();
   vtkPolyData *GetSource ();
   vtkProgrammableGlyphFilter *New ();
   void SetColorMode (int );
   void SetColorModeToColorByInput ();
   void SetColorModeToColorBySource ();
   void SetGlyphMethod (void (*func)(void *) , void *arg);
   void SetSource (vtkPolyData *source);


B<vtkProgrammableGlyphFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetGlyphMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ProgrammableSource;


@Graphics::VTK::ProgrammableSource::ISA = qw( Graphics::VTK::Source );

=head1 Graphics::VTK::ProgrammableSource

=over 1

=item *

Inherits from Source

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkPolyData *GetPolyDataOutput ();
   vtkRectilinearGrid *GetRectilinearGridOutput ();
   vtkStructuredGrid *GetStructuredGridOutput ();
   vtkStructuredPoints *GetStructuredPointsOutput ();
   vtkUnstructuredGrid *GetUnstructuredGridOutput ();
   vtkProgrammableSource *New ();
   void SetExecuteMethod (void (*func)(void *) , void *arg);
   void UpdateData (vtkDataObject *output);
   void UpdateInformation ();


B<vtkProgrammableSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void SetExecuteMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ProjectedPolyDataRayBounder;


@Graphics::VTK::ProjectedPolyDataRayBounder::ISA = qw( Graphics::VTK::RayBounder );

=head1 Graphics::VTK::ProjectedPolyDataRayBounder

=over 1

=item *

Inherits from RayBounder

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   unsigned long GetMTime ();
   vtkPolyData *GetPolyData ();
   vtkProjectedPolyDataRayBounder *New ();
   void SetMatrixSource (vtkVolume *volume);
   void SetMatrixSource (vtkActor *actor);
   void SetPolyData (vtkPolyData *);


B<vtkProjectedPolyDataRayBounder Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual float *Draw (vtkRenderer *ren, vtkMatrix4x4 *matrix);
      Can't Handle 'float *' return type without a hint

   float *GetRayBounds (vtkRenderer *ren);
      Can't Handle 'float *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Property;


@Graphics::VTK::Property::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::Property

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BackfaceCullingOff ();
   void BackfaceCullingOn ();
   virtual void BackfaceRender (vtkActor *, vtkRenderer *);
   void DeepCopy (vtkProperty *p);
   void EdgeVisibilityOff ();
   void EdgeVisibilityOn ();
   void FrontfaceCullingOff ();
   void FrontfaceCullingOn ();
   float GetAmbient ();
   float  *GetAmbientColor ();
      (Returns a 3-element Perl list)
   int GetBackfaceCulling ();
   const char *GetClassName();
   float *GetColor ();
      (Returns a 3-element Perl list)
   float GetDiffuse ();
   float  *GetDiffuseColor ();
      (Returns a 3-element Perl list)
   float  *GetEdgeColor ();
      (Returns a 3-element Perl list)
   int GetEdgeVisibility ();
   int GetFrontfaceCulling ();
   int GetInterpolation ();
   char *GetInterpolationAsString ();
   float GetLineWidth ();
   float GetOpacity ();
   float GetPointSize ();
   int GetRepresentation ();
   char *GetRepresentationAsString ();
   float GetSpecular ();
   float  *GetSpecularColor ();
      (Returns a 3-element Perl list)
   float GetSpecularPower ();
   vtkProperty *New ();
   virtual void Render (vtkActor *, vtkRenderer *);
   void SetAmbient (float );
   void SetAmbientColor (float  , float , float );
   void SetBackfaceCulling (int );
   void SetColor (float r, float g, float b);
   void SetDiffuse (float );
   void SetDiffuseColor (float  , float , float );
   void SetEdgeColor (float  , float , float );
   void SetEdgeVisibility (int );
   void SetFrontfaceCulling (int );
   void SetInterpolation (int );
   void SetInterpolationToFlat ();
   void SetInterpolationToGouraud ();
   void SetInterpolationToPhong ();
   void SetLineWidth (float );
   void SetOpacity (float );
   void SetPointSize (float );
   void SetRepresentation (int );
   void SetRepresentationToPoints ();
   void SetRepresentationToSurface ();
   void SetRepresentationToWireframe ();
   void SetSpecular (float );
   void SetSpecularColor (float  , float , float );
   void SetSpecularPower (float );


B<vtkProperty Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GetColor (float rgb[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetAmbientColor (float  a[3]);
      Method is redundant. Same as SetAmbientColor( float, float, float)

   void SetColor (float a[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetDiffuseColor (float  a[3]);
      Method is redundant. Same as SetDiffuseColor( float, float, float)

   void SetEdgeColor (float  a[3]);
      Method is redundant. Same as SetEdgeColor( float, float, float)

   void SetSpecularColor (float  a[3]);
      Method is redundant. Same as SetSpecularColor( float, float, float)


=cut

package Graphics::VTK::PropPicker;


@Graphics::VTK::PropPicker::ISA = qw( Graphics::VTK::AbstractPropPicker );

=head1 Graphics::VTK::PropPicker

=over 1

=item *

Inherits from AbstractPropPicker

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkPropPicker *New ();
   int Pick (float selectionX, float selectionY, float selectionZ, vtkRenderer *renderer);
   int PickProp (float selectionX, float selectionY, vtkRenderer *renderer, vtkPropCollection *pickfrom);
   int PickProp (float selectionX, float selectionY, vtkRenderer *renderer);


B<vtkPropPicker Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int Pick (float selectionPt[3], vtkRenderer *renderer);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Prop3DCollection;


@Graphics::VTK::Prop3DCollection::ISA = qw( Graphics::VTK::PropCollection );

=head1 Graphics::VTK::Prop3DCollection

=over 1

=item *

Inherits from PropCollection

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddItem (vtkProp3D *p);
   char *GetClassName ();
   vtkProp3D *GetLastProp3D ();
   vtkProp3D *GetNextProp3D ();
   vtkProp3DCollection *New ();

=cut

package Graphics::VTK::QuadricClustering;


@Graphics::VTK::QuadricClustering::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::QuadricClustering

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Append (vtkPolyData *piece);
   void EndAppend ();
   const char *GetClassName();
   float  *GetDivisionOrigin ();
      (Returns a 3-element Perl list)
   float  *GetDivisionSpacing ();
      (Returns a 3-element Perl list)
   vtkFeatureEdges *GetFeatureEdges ();
   int GetNumberOfXDivisions ();
   int GetNumberOfYDivisions ();
   int GetNumberOfZDivisions ();
   int GetUseFeatureEdges ();
   int GetUseInputPoints ();
   vtkQuadricClustering *New ();
   void SetDivisionOrigin (float x, float y, float z);
   void SetDivisionSpacing (float x, float y, float z);
   void SetNumberOfXDivisions (int num);
   void SetNumberOfYDivisions (int num);
   void SetNumberOfZDivisions (int num);
   void SetUseFeatureEdges (int );
   void SetUseInputPoints (int );
   void StartAppend (float x0, float x1, float y0, float y1, float z0, float z1);
   void UseFeatureEdgesOff ();
   void UseFeatureEdgesOn ();
   void UseInputPointsOff ();
   void UseInputPointsOn ();


B<vtkQuadricClustering Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void AddEdge (int *binIds, float *pt0, float *pt1, int geometeryFlag);
      Don't know the size of pointer arg number 1

   void AddQuadric (int binId, float quadric[9]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void AddTriangle (int *binIds, float *pt0, float *pt1, float *pt2, int geometeryFlag);
      Don't know the size of pointer arg number 1

   void AddVertex (int binId, float *pt, int geometeryFlag);
      Don't know the size of pointer arg number 2

   void ComputeRepresentativePoint (float quadric[9], int binId, float point[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int *GetNumberOfDivisions ();
      Can't Handle 'int *' return type without a hint

   void GetNumberOfDivisions (int div[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int HashPoint (float point[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InitializeQuadric (float quadric[9]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetDivisionOrigin (float o[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetDivisionSpacing (float s[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetNumberOfDivisions (int div[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void StartAppend (float *bounds);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::QuadricDecimation;


@Graphics::VTK::QuadricDecimation::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::QuadricDecimation

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetMaximumCollapsedEdges ();
   float GetMaximumCost ();
   vtkPolyData *GetTestOutput ();
   vtkQuadricDecimation *New ();
   void SetMaximumCollapsedEdges (int );
   void SetMaximumCost (float );


B<vtkQuadricDecimation Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float ComputeCost (int edgeId, float x[3], vtkPointData *pd);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::QuantizePolyDataPoints;


@Graphics::VTK::QuantizePolyDataPoints::ISA = qw( Graphics::VTK::CleanPolyData );

=head1 Graphics::VTK::QuantizePolyDataPoints

=over 1

=item *

Inherits from CleanPolyData

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   char *GetClassName ();
   float GetQFactor ();
   vtkQuantizePolyDataPoints *New ();
   void SetQFactor (float );


B<vtkQuantizePolyDataPoints Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void OperateOnBounds (float in[6], float out[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void OperateOnPoint (float in[3], float out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::RayCaster;


@Graphics::VTK::RayCaster::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::RayCaster

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AutomaticScaleAdjustmentOff (void );
   void AutomaticScaleAdjustmentOn (void );
   void BilinearImageZoomOff ();
   void BilinearImageZoomOn ();
   int GetAutomaticScaleAdjustment ();
   float GetAutomaticScaleLowerLimit ();
   int GetBilinearImageZoom ();
   const char *GetClassName();
   float GetImageScale (int level);
   int GetImageScaleCount (void );
   int GetNumberOfSamplesTaken ();
   int GetNumberOfThreads ();
   int GetSelectedImageScaleIndex ();
   float GetTotalRenderTime ();
   float GetViewRaysStepSize (int level);
   vtkRayCaster *New ();
   void SetAutomaticScaleLowerLimit (float );
   void SetBilinearImageZoom (int );
   void SetImageScale (int level, float scale);
   void SetNumberOfThreads (int );
   void SetSelectedImageScaleIndex (int );
   void SetViewRaysStepSize (int level, float scale);


B<vtkRayCaster Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void BilinearZoom (float *smallImage, float *largeImage, int smallDims[2], int largeDims[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float *GetParallelIncrements (void );
      Can't Handle 'float *' return type without a hint

   float *GetParallelStartPosition (void );
      Can't Handle 'float *' return type without a hint

   float *GetPerspectiveViewRays ();
      Can't Handle 'float *' return type without a hint

   void GetViewRaysSize (int size[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void NearestNeighborZoom (float *smallImage, float *largeImage, int smallDims[2], int largeDims[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   VTK_THREAD_RETURN_TYPE RayCast_RenderImage (void *arg);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::RectilinearGridGeometryFilter;


@Graphics::VTK::RectilinearGridGeometryFilter::ISA = qw( Graphics::VTK::RectilinearGridToPolyDataFilter );

=head1 Graphics::VTK::RectilinearGridGeometryFilter

=over 1

=item *

Inherits from RectilinearGridToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int  *GetExtent ();
      (Returns a 6-element Perl list)
   vtkRectilinearGridGeometryFilter *New ();
   void SetExtent (int iMin, int iMax, int jMin, int jMax, int kMin, int kMax);


B<vtkRectilinearGridGeometryFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetExtent (int *extent);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::RectilinearGridReader;


@Graphics::VTK::RectilinearGridReader::ISA = qw( Graphics::VTK::DataReader );

=head1 Graphics::VTK::RectilinearGridReader

=over 1

=item *

Inherits from DataReader

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkRectilinearGrid *GetOutput (int idx);
   vtkRectilinearGrid *GetOutput ();
   vtkRectilinearGridReader *New ();
   void SetOutput (vtkRectilinearGrid *output);


B<vtkRectilinearGridReader Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::RectilinearGridSource;


@Graphics::VTK::RectilinearGridSource::ISA = qw( Graphics::VTK::Source );

=head1 Graphics::VTK::RectilinearGridSource

=over 1

=item *

Inherits from Source

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkRectilinearGrid *GetOutput (int idx);
   vtkRectilinearGrid *GetOutput ();
   vtkRectilinearGridSource *New ();
   void SetOutput (vtkRectilinearGrid *output);

=cut

package Graphics::VTK::RectilinearGridWriter;


@Graphics::VTK::RectilinearGridWriter::ISA = qw( Graphics::VTK::DataWriter );

=head1 Graphics::VTK::RectilinearGridWriter

=over 1

=item *

Inherits from DataWriter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkRectilinearGrid *GetInput ();
   vtkRectilinearGridWriter *New ();
   void SetInput (vtkRectilinearGrid *input);


B<vtkRectilinearGridWriter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::RecursiveDividingCubes;


@Graphics::VTK::RecursiveDividingCubes::ISA = qw( Graphics::VTK::StructuredPointsToPolyDataFilter );

=head1 Graphics::VTK::RecursiveDividingCubes

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
   vtkRecursiveDividingCubes *New ();
   void SetDistance (float );
   void SetIncrement (int );
   void SetValue (float );


B<vtkRecursiveDividingCubes Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SubDivide (float origin[3], float h[3], float values[8]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::RecursiveSphereDirectionEncoder;


@Graphics::VTK::RecursiveSphereDirectionEncoder::ISA = qw( Graphics::VTK::DirectionEncoder );

=head1 Graphics::VTK::RecursiveSphereDirectionEncoder

=over 1

=item *

Inherits from DirectionEncoder

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetNumberOfEncodedDirections (void );
   int GetRecursionDepth ();
   vtkRecursiveSphereDirectionEncoder *New ();
   void SetRecursionDepth (int );


B<vtkRecursiveSphereDirectionEncoder Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float *GetDecodedGradient (int value);
      Can't Handle 'float *' return type without a hint

   float *GetDecodedGradientTable (void );
      Can't Handle 'float *' return type without a hint

   int GetEncodedDirection (float n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent index);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::RemoveGhostCells;


@Graphics::VTK::RemoveGhostCells::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::RemoveGhostCells

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetGhostLevel ();
   vtkRemoveGhostCells *New ();
   void SetGhostLevel (int );


B<vtkRemoveGhostCells Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::RenderWindow;


@Graphics::VTK::RenderWindow::ISA = qw( Graphics::VTK::Window );

=head1 Graphics::VTK::RenderWindow

=over 1

=item *

Inherits from Window

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddRenderer (vtkRenderer *);
   void BordersOff ();
   void BordersOn ();
   virtual int CheckAbortStatus ();
   virtual void ClosePPMImageFile ();
   virtual void CopyResultFrame ();
   virtual void Frame ();
   void FullScreenOff ();
   void FullScreenOn ();
   int GetAAFrames ();
   int GetAbortRender ();
   int GetBorders ();
   const char *GetClassName();
   virtual int GetDepthBufferSize ();
   float GetDesiredUpdateRate ();
   virtual int GetEventPending ();
   int GetFDFrames ();
   char *GetFileName ();
   int GetFullScreen ();
   virtual void *GetGenericContext ();
   virtual void *GetGenericDisplayId ();
   virtual void *GetGenericDrawable ();
   virtual void *GetGenericParentId ();
   virtual void *GetGenericWindowId ();
   int GetInAbortCheck ();
   vtkRenderWindowInteractor *GetInteractor ();
   int GetLineSmoothing ();
   int GetNeverRendered ();
   int GetNumLayers ();
   int GetPointSmoothing ();
   int GetPolygonSmoothing ();
   char *GetRenderLibrary ();
   vtkRendererCollection *GetRenderers ();
   int GetStereoCapableWindow ();
   int GetStereoRender ();
   int GetStereoType ();
   char *GetStereoTypeAsString ();
   int GetSubFrames ();
   int GetSwapBuffers ();
   virtual void HideCursor ();
   void LineSmoothingOff ();
   void LineSmoothingOn ();
   virtual void MakeCurrent ();
   virtual vtkRenderWindowInteractor *MakeRenderWindowInteractor ();
   vtkRenderWindow *New ();
   virtual int OpenPPMImageFile ();
   void PointSmoothingOff ();
   void PointSmoothingOn ();
   void PolygonSmoothingOff ();
   void PolygonSmoothingOn ();
   void RemoveRenderer (vtkRenderer *);
   virtual void Render ();
   virtual void SaveImageAsPPM ();
   void SetAAFrames (int );
   void SetAbortCheckMethod (void (*func)(void *) , void *arg);
   void SetAbortRender (int );
   void SetBorders (int );
   void SetDesiredUpdateRate (float );
   void SetFDFrames (int );
   void SetFileName (char *);
   virtual void SetFullScreen (int );
   void SetInAbortCheck (int );
   void SetInteractor (vtkRenderWindowInteractor *);
   void SetLineSmoothing (int );
   void SetNumLayers (int );
   void SetPointSmoothing (int );
   void SetPolygonSmoothing (int );
   virtual void SetStereoCapableWindow (int capable);
   void SetStereoRender (int stereo);
   void SetStereoType (int );
   void SetStereoTypeToCrystalEyes ();
   void SetStereoTypeToDresden ();
   void SetStereoTypeToInterlaced ();
   void SetStereoTypeToLeft ();
   void SetStereoTypeToRedBlue ();
   void SetStereoTypeToRight ();
   void SetSubFrames (int );
   void SetSwapBuffers (int );
   virtual void SetWindowInfo (char *);
   virtual void ShowCursor ();
   virtual void Start ();
   void StereoCapableWindowOff ();
   void StereoCapableWindowOn ();
   virtual void StereoMidpoint ();
   virtual void StereoRenderComplete ();
   void StereoRenderOff ();
   void StereoRenderOn ();
   virtual void StereoUpdate ();
   void SwapBuffersOff ();
   void SwapBuffersOn ();
   void UnRegister (vtkObject *o);
   virtual void WindowRemap ();
   virtual void WritePPMImageFile ();


B<vtkRenderWindow Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual unsigned char *GetRGBACharPixelData (int , int , int , int , int );
      Can't Handle 'unsigned char *' return type without a hint

   virtual float *GetRGBAPixelData (int , int , int , int , int );
      Can't Handle 'float *' return type without a hint

   virtual float *GetZbufferData (int , int , int , int );
      Can't Handle 'float *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetAbortCheckMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void SetDisplayId (void *);
      Don't know the size of pointer arg number 1

   virtual void SetParentId (void *);
      Don't know the size of pointer arg number 1

   virtual void SetPixelData (int , int , int , int , unsigned char *, int );
      Don't know the size of pointer arg number 5

   virtual void SetRGBACharPixelData (int , int , int , int , unsigned char *, int , int blend);
      Don't know the size of pointer arg number 5

   virtual void SetRGBAPixelData (int , int , int , int , float *, int , int blend);
      Don't know the size of pointer arg number 5

   virtual void SetWindowId (void *);
      Don't know the size of pointer arg number 1

   virtual void SetZbufferData (int , int , int , int , float *);
      Don't know the size of pointer arg number 5


=cut

package Graphics::VTK::RenderWindowCollection;


@Graphics::VTK::RenderWindowCollection::ISA = qw( Graphics::VTK::Collection );

=head1 Graphics::VTK::RenderWindowCollection

=over 1

=item *

Inherits from Collection

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddItem (vtkRenderWindow *a);
   const char *GetClassName();
   vtkRenderWindow *GetNextItem ();
   vtkRenderWindowCollection *New ();

=cut

package Graphics::VTK::RenderWindowInteractor;


@Graphics::VTK::RenderWindowInteractor::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::RenderWindowInteractor

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual vtkAbstractPropPicker *CreateDefaultPicker ();
   virtual int CreateTimer (int );
   virtual int DestroyTimer ();
   virtual void Disable ();
   virtual void Enable ();
   virtual void EndPickCallback ();
   virtual void ExitCallback ();
   const char *GetClassName();
   float GetDesiredUpdateRate ();
   int GetEnabled ();
   int  *GetEventPosition ();
      (Returns a 2-element Perl list)
   int GetInitialized ();
   vtkInteractorStyle *GetInteractorStyle ();
   int GetLightFollowCamera ();
   vtkAbstractPicker *GetPicker ();
   vtkRenderWindow *GetRenderWindow ();
   int  *GetSize ();
      (Returns a 2-element Perl list)
   float GetStillUpdateRate ();
   void HideCursor ();
   virtual void Initialize ();
   void LightFollowCameraOff ();
   void LightFollowCameraOn ();
   vtkRenderWindowInteractor *New ();
   void Render ();
   void SetDesiredUpdateRate (float );
   void SetEndPickMethod (void (*func)(void *) , void *arg);
   void SetEventPosition (int  , int );
   void SetExitMethod (void (*func)(void *) , void *arg);
   virtual void SetInteractorStyle (vtkInteractorStyle *);
   void SetLightFollowCamera (int );
   void SetPicker (vtkAbstractPicker *);
   void SetRenderWindow (vtkRenderWindow *aren);
   void SetSize (int  , int );
   void SetStartPickMethod (void (*func)(void *) , void *arg);
   void SetStillUpdateRate (float );
   void SetUserMethod (void (*func)(void *) , void *arg);
   void ShowCursor ();
   virtual void Start ();
   virtual void StartPickCallback ();
   virtual void TerminateApp (void );
   void UnRegister (vtkObject *o);
   virtual void UpdateSize (int x, int y);
   virtual void UserCallback ();


B<vtkRenderWindowInteractor Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void GetMousePosition (int *x, int *y);
      Don't know the size of pointer arg number 1

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetEndPickMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetEventPosition (int  a[2]);
      Method is redundant. Same as SetEventPosition( int, int)

   void SetExitMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetSize (int  a[2]);
      Method is redundant. Same as SetSize( int, int)

   void SetStartPickMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetUserMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::Renderer;


@Graphics::VTK::Renderer::ISA = qw( Graphics::VTK::Viewport );

=head1 Graphics::VTK::Renderer

=over 1

=item *

Inherits from Viewport

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddActor (vtkProp *p);
   void AddCuller (vtkCuller *);
   void AddLight (vtkLight *);
   void AddVolume (vtkProp *p);
   void BackingStoreOff ();
   void BackingStoreOn ();
   virtual void Clear ();
   void CreateLight (void );
   virtual void DeviceRender () = 0;
   vtkCamera *GetActiveCamera ();
   vtkActorCollection *GetActors ();
   virtual float GetAllocatedRenderTime ();
   float  *GetAmbient ();
      (Returns a 3-element Perl list)
   int GetBackingStore ();
   const char *GetClassName();
   vtkCullerCollection *GetCullers ();
   int GetInteractive ();
   float GetLastRenderTimeInSeconds ();
   int GetLayer ();
   int GetLightFollowCamera ();
   vtkLightCollection *GetLights ();
   unsigned long GetMTime ();
   int GetNumberOfPropsRenderedAsGeometry ();
   vtkRayCaster *GetRayCaster ();
   vtkRenderWindow *GetRenderWindow ();
   virtual float GetTimeFactor ();
   int GetTwoSidedLighting ();
   virtual vtkWindow *GetVTKWindow ();
   vtkVolumeCollection *GetVolumes ();
   float GetZ (int x, int y);
   void InteractiveOff ();
   void InteractiveOn ();
   void LightFollowCameraOff ();
   void LightFollowCameraOn ();
   vtkRenderer *New ();
   vtkAssemblyPath *PickProp (float selectionX, float selectionY);
   void RemoveActor (vtkProp *p);
   void RemoveCuller (vtkCuller *);
   void RemoveLight (vtkLight *);
   void RemoveVolume (vtkProp *p);
   virtual void Render ();
   void RenderOverlay ();
   void ResetCamera (float xmin, float xmax, float ymin, float ymax, float zmin, float zmax);
   void ResetCamera ();
   void ResetCameraClippingRange (float xmin, float xmax, float ymin, float ymax, float zmin, float zmax);
   void ResetCameraClippingRange ();
   void SetActiveCamera (vtkCamera *);
   void SetAllocatedRenderTime (float );
   void SetAmbient (float  , float , float );
   void SetBackingStore (int );
   void SetInteractive (int );
   void SetLayer (int );
   void SetLightFollowCamera (int );
   void SetRenderWindow (vtkRenderWindow *);
   void SetTwoSidedLighting (int );
   int Transparent ();
   void TwoSidedLightingOff ();
   void TwoSidedLightingOn ();
   void UnRegister (vtkObject *o);
   virtual void ViewToWorld (float &wx, float &wy, float &wz);
   void ViewToWorld ();
   int VisibleActorCount ();
   int VisibleVolumeCount ();
   virtual void WorldToView (float &wx, float &wy, float &wz);
   void WorldToView ();


B<vtkRenderer Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   vtkRayCaster *RayCastervtkCamera *ActiveCameravtkLight *CreatedLightvtkLightCollection *LightsvtkCullerCollection *CullersvtkActorCollection *ActorsvtkVolumeCollection *Volumesfloat Ambient[3]vtkRenderWindow *RenderWindowfloat AllocatedRenderTimefloat TimeFactorint TwoSidedLightingint BackingStoreunsigned char *BackingImagevtkTimeStamp RenderTimefloat LastRenderTimeInSecondsint LightFollowCameravoid AllocateTime ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeVisiblePropBounds (float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ResetCameraClippingRange (float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ResetCamera (float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetAmbient (float  a[3]);
      Method is redundant. Same as SetAmbient( float, float, float)


=cut

package Graphics::VTK::RendererCollection;


@Graphics::VTK::RendererCollection::ISA = qw( Graphics::VTK::Collection );

=head1 Graphics::VTK::RendererCollection

=over 1

=item *

Inherits from Collection

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddItem (vtkRenderer *a);
   const char *GetClassName();
   vtkRenderer *GetNextItem ();
   vtkRendererCollection *New ();
   void Render ();
   void RenderOverlay ();

=cut

package Graphics::VTK::RendererSource;


@Graphics::VTK::RendererSource::ISA = qw( Graphics::VTK::StructuredPointsSource );

=head1 Graphics::VTK::RendererSource

=over 1

=item *

Inherits from StructuredPointsSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void DepthValuesOff ();
   void DepthValuesOn ();
   const char *GetClassName();
   int GetDepthValues ();
   vtkRenderer *GetInput ();
   unsigned long GetMTime ();
   int GetRenderFlag ();
   int GetWholeWindow ();
   vtkRendererSource *New ();
   void RenderFlagOff ();
   void RenderFlagOn ();
   void SetDepthValues (int );
   void SetInput (vtkRenderer *);
   void SetRenderFlag (int );
   void SetWholeWindow (int );
   void WholeWindowOff ();
   void WholeWindowOn ();


B<vtkRendererSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ReverseSense;


@Graphics::VTK::ReverseSense::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::ReverseSense

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetReverseCells ();
   int GetReverseNormals ();
   vtkReverseSense *New ();
   void ReverseCellsOff ();
   void ReverseCellsOn ();
   void ReverseNormalsOff ();
   void ReverseNormalsOn ();
   void SetReverseCells (int );
   void SetReverseNormals (int );


B<vtkReverseSense Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::RibbonFilter;


@Graphics::VTK::RibbonFilter::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::RibbonFilter

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float GetAngle ();
   const char *GetClassName();
   float  *GetDefaultNormal ();
      (Returns a 3-element Perl list)
   int GetUseDefaultNormal ();
   int GetVaryWidth ();
   float GetWidth ();
   float GetWidthFactor ();
   vtkRibbonFilter *New ();
   void SetAngle (float );
   void SetDefaultNormal (float  , float , float );
   void SetUseDefaultNormal (int );
   void SetVaryWidth (int );
   void SetWidth (float );
   void SetWidthFactor (float );
   void UseDefaultNormalOff ();
   void UseDefaultNormalOn ();
   void VaryWidthOff ();
   void VaryWidthOn ();


B<vtkRibbonFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetDefaultNormal (float  a[3]);
      Method is redundant. Same as SetDefaultNormal( float, float, float)


=cut

package Graphics::VTK::RotationalExtrusionFilter;


@Graphics::VTK::RotationalExtrusionFilter::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::RotationalExtrusionFilter

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CappingOff ();
   void CappingOn ();
   float GetAngle ();
   int GetCapping ();
   const char *GetClassName();
   float GetDeltaRadius ();
   int GetResolution ();
   float GetTranslation ();
   vtkRotationalExtrusionFilter *New ();
   void SetAngle (float );
   void SetCapping (int );
   void SetDeltaRadius (float );
   void SetResolution (int );
   void SetTranslation (float );


B<vtkRotationalExtrusionFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::RuledSurfaceFilter;


@Graphics::VTK::RuledSurfaceFilter::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::RuledSurfaceFilter

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CloseSurfaceOff ();
   void CloseSurfaceOn ();
   const char *GetClassName();
   int GetCloseSurface ();
   float GetDistanceFactor ();
   int GetOffset ();
   int GetOnRatio ();
   int GetPassLines ();
   int  *GetResolution ();
      (Returns a 2-element Perl list)
   int GetRuledMode ();
   char *GetRuledModeAsString ();
   vtkRuledSurfaceFilter *New ();
   void PassLinesOff ();
   void PassLinesOn ();
   void SetCloseSurface (int );
   void SetDistanceFactor (float );
   void SetOffset (int );
   void SetOnRatio (int );
   void SetPassLines (int );
   void SetResolution (int  , int );
   void SetRuledMode (int );
   void SetRuledModeToPointWalk ();
   void SetRuledModeToResample ();


B<vtkRuledSurfaceFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PointWalk (vtkPolyData *output, vtkPoints *inPts, int npts, int *pts, int npts2, int *pts2);
      Don't know the size of pointer arg number 4

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   float DistanceFactorint OnRatioint Offsetint CloseSurfaceint RuledModeint Resolution[2]int PassLinesvtkIdList *Idsfloat Weights[4]void Resample (vtkPolyData *output, vtkPoints *inPts, vtkPoints *newPts, int npts, int *pts, int npts2, int *pts2);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetResolution (int  a[2]);
      Method is redundant. Same as SetResolution( int, int)


=cut

package Graphics::VTK::SLCReader;


@Graphics::VTK::SLCReader::ISA = qw( Graphics::VTK::StructuredPointsSource );

=head1 Graphics::VTK::SLCReader

=over 1

=item *

Inherits from StructuredPointsSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetError ();
   char *GetFileName ();
   vtkSLCReader *New ();
   void SetFileName (char *);


B<vtkSLCReader Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   unsigned char *Decode8BitData (unsigned char *in_ptr, int size);
      Can't Handle 'unsigned char *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::STLReader;


@Graphics::VTK::STLReader::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::STLReader

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CreateDefaultLocator ();
   const char *GetClassName();
   char *GetFileName ();
   vtkPointLocator *GetLocator ();
   unsigned long GetMTime ();
   int GetMerging ();
   void MergingOff ();
   void MergingOn ();
   vtkSTLReader *New ();
   void SetFileName (char *);
   void SetLocator (vtkPointLocator *locator);
   void SetLocator (vtkPointLocator &locator);
   void SetMerging (int );


B<vtkSTLReader Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int GetSTLFileType (FILE *fp);
      Don't know the size of pointer arg number 1

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   int ReadASCIISTL (FILE *fp, vtkPoints *, vtkCellArray *);
      Don't know the size of pointer arg number 1

   int ReadBinarySTL (FILE *fp, vtkPoints *, vtkCellArray *);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::STLWriter;


@Graphics::VTK::STLWriter::ISA = qw( Graphics::VTK::PolyDataWriter );

=head1 Graphics::VTK::STLWriter

=over 1

=item *

Inherits from PolyDataWriter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkSTLWriter *New ();

=cut

package Graphics::VTK::SampleFunction;


@Graphics::VTK::SampleFunction::ISA = qw( Graphics::VTK::StructuredPointsSource );

=head1 Graphics::VTK::SampleFunction

=over 1

=item *

Inherits from StructuredPointsSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CappingOff ();
   void CappingOn ();
   void ComputeNormalsOff ();
   void ComputeNormalsOn ();
   float GetCapValue ();
   int GetCapping ();
   const char *GetClassName();
   int GetComputeNormals ();
   vtkImplicitFunction *GetImplicitFunction ();
   unsigned long GetMTime ();
   float  *GetModelBounds ();
      (Returns a 6-element Perl list)
   int  *GetSampleDimensions ();
      (Returns a 3-element Perl list)
   vtkSampleFunction *New ();
   void SetCapValue (float );
   void SetCapping (int );
   void SetComputeNormals (int );
   void SetImplicitFunction (vtkImplicitFunction *);
   void SetModelBounds (float  , float , float , float , float , float );
   void SetSampleDimensions (int i, int j, int k);
   void SetScalars (vtkScalars *);


B<vtkSampleFunction Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetModelBounds (float  a[6]);
      Method is redundant. Same as SetModelBounds( float, float, float, float, float, float)

   void SetSampleDimensions (int dim[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ScalarTree;


@Graphics::VTK::ScalarTree::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::ScalarTree

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BuildTree ();
   int GetBranchingFactor ();
   const char *GetClassName();
   vtkDataSet *GetDataSet ();
   int GetLevel ();
   int GetMaxLevel ();
   void InitTraversal (float scalarValue);
   void Initialize ();
   vtkScalarTree *New ();
   void SetBranchingFactor (int );
   void SetDataSet (vtkDataSet *);
   void SetMaxLevel (int );


B<vtkScalarTree Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   vtkCell *GetNextCell (int &cellId, vtkIdList &ptIds, vtkScalars *cellScalars);
      Arg types of 'vtkIdList* &' not supported yet
   vtkCell *GetNextCell (int &cellId, vtkIdList &ptIds, vtkScalars &cellScalars);
      Method is marked 'Do Not Use' in its descriptions

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::SelectPolyData;


@Graphics::VTK::SelectPolyData::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::SelectPolyData

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void GenerateSelectionScalarsOff ();
   void GenerateSelectionScalarsOn ();
   void GenerateUnselectedOutputOff ();
   void GenerateUnselectedOutputOn ();
   const char *GetClassName();
   int GetGenerateSelectionScalars ();
   int GetGenerateUnselectedOutput ();
   int GetInsideOut ();
   vtkPoints *GetLoop ();
   unsigned long GetMTime ();
   vtkPolyData *GetSelectionEdges ();
   int GetSelectionMode ();
   char *GetSelectionModeAsString ();
   vtkPolyData *GetUnselectedOutput ();
   virtual int InRegisterLoop (vtkObject *);
   void InsideOutOff ();
   void InsideOutOn ();
   vtkSelectPolyData *New ();
   void SetGenerateSelectionScalars (int );
   void SetGenerateUnselectedOutput (int );
   void SetInsideOut (int );
   void SetLoop (vtkPoints *);
   void SetSelectionMode (int );
   void SetSelectionModeToClosestPointRegion ();
   void SetSelectionModeToLargestRegion ();
   void SetSelectionModeToSmallestRegion ();
   void UnRegister (vtkObject *o);


B<vtkSelectPolyData Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int GenerateSelectionScalarsint InsideOutvtkPoints *Loopint SelectionModefloat ClosestPoint[3]int GenerateUnselectedOutputvtkPolyData *UnselectedOutputvtkPolyData *SelectionEdgesvtkPolyData *Meshvoid GetPointNeighbors (int ptId, vtkIdList *nei);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::SelectVisiblePoints;


@Graphics::VTK::SelectVisiblePoints::ISA = qw( Graphics::VTK::DataSetToPolyDataFilter );

=head1 Graphics::VTK::SelectVisiblePoints

=over 1

=item *

Inherits from DataSetToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   unsigned long GetMTime ();
   vtkRenderer *GetRenderer ();
   int GetSelectInvisible ();
   int  *GetSelection ();
      (Returns a 4-element Perl list)
   int GetSelectionWindow ();
   float GetTolerance ();
   vtkSelectVisiblePoints *New ();
   void SelectInvisibleOff ();
   void SelectInvisibleOn ();
   void SelectionWindowOff ();
   void SelectionWindowOn ();
   void SetRenderer (vtkRenderer *ren);
   void SetSelectInvisible (int );
   void SetSelection (int  , int , int , int );
   void SetSelectionWindow (int );
   void SetTolerance (float );


B<vtkSelectVisiblePoints Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetSelection (int  a[4]);
      Method is redundant. Same as SetSelection( int, int, int, int)


=cut

package Graphics::VTK::ShepardMethod;


@Graphics::VTK::ShepardMethod::ISA = qw( Graphics::VTK::DataSetToStructuredPointsFilter );

=head1 Graphics::VTK::ShepardMethod

=over 1

=item *

Inherits from DataSetToStructuredPointsFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetMaximumDistance ();
   float  *GetModelBounds ();
      (Returns a 6-element Perl list)
   float GetNullValue ();
   int  *GetSampleDimensions ();
      (Returns a 3-element Perl list)
   vtkShepardMethod *New ();
   void SetMaximumDistance (float );
   void SetModelBounds (float  , float , float , float , float , float );
   void SetNullValue (float );
   void SetSampleDimensions (int i, int j, int k);


B<vtkShepardMethod Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float ComputeModelBounds (float origin[3], float ar[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetModelBounds (float  a[6]);
      Method is redundant. Same as SetModelBounds( float, float, float, float, float, float)

   void SetSampleDimensions (int dim[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ShrinkFilter;


@Graphics::VTK::ShrinkFilter::ISA = qw( Graphics::VTK::DataSetToUnstructuredGridFilter );

=head1 Graphics::VTK::ShrinkFilter

=over 1

=item *

Inherits from DataSetToUnstructuredGridFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetShrinkFactor ();
   vtkShrinkFilter *New ();
   void SetShrinkFactor (float );


B<vtkShrinkFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ShrinkPolyData;


@Graphics::VTK::ShrinkPolyData::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::ShrinkPolyData

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetShrinkFactor ();
   vtkShrinkPolyData *New ();
   void SetShrinkFactor (float );


B<vtkShrinkPolyData Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::SimpleElevationFilter;


@Graphics::VTK::SimpleElevationFilter::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::SimpleElevationFilter

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float  *GetVector ();
      (Returns a 3-element Perl list)
   vtkSimpleElevationFilter *New ();
   void SetVector (float  , float , float );


B<vtkSimpleElevationFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetVector (float  a[3]);
      Method is redundant. Same as SetVector( float, float, float)


=cut

package Graphics::VTK::SmoothPolyDataFilter;


@Graphics::VTK::SmoothPolyDataFilter::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::SmoothPolyDataFilter

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BoundarySmoothingOff ();
   void BoundarySmoothingOn ();
   void FeatureEdgeSmoothingOff ();
   void FeatureEdgeSmoothingOn ();
   void GenerateErrorScalarsOff ();
   void GenerateErrorScalarsOn ();
   void GenerateErrorVectorsOff ();
   void GenerateErrorVectorsOn ();
   int GetBoundarySmoothing ();
   const char *GetClassName();
   float GetConvergence ();
   float GetEdgeAngle ();
   float GetFeatureAngle ();
   int GetFeatureEdgeSmoothing ();
   int GetGenerateErrorScalars ();
   int GetGenerateErrorVectors ();
   int GetNumberOfIterations ();
   float GetRelaxationFactor ();
   vtkPolyData *GetSource ();
   vtkSmoothPolyDataFilter *New ();
   void SetBoundarySmoothing (int );
   void SetConvergence (float );
   void SetEdgeAngle (float );
   void SetFeatureAngle (float );
   void SetFeatureEdgeSmoothing (int );
   void SetGenerateErrorScalars (int );
   void SetGenerateErrorVectors (int );
   void SetNumberOfIterations (int );
   void SetRelaxationFactor (float );
   void SetSource (vtkPolyData *source);


B<vtkSmoothPolyDataFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::SpatialRepresentationFilter;


@Graphics::VTK::SpatialRepresentationFilter::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::SpatialRepresentationFilter

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkDataSet *GetInput ();
   int GetLevel ();
   vtkPolyData *GetOutput (int level);
   vtkPolyData *GetOutput ();
   vtkLocator *GetSpatialRepresentation ();
   vtkSpatialRepresentationFilter *New ();
   void ResetOutput ();
   virtual void SetInput (vtkImageData *cache);
   virtual void SetInput (vtkDataSet *input);
   void SetSpatialRepresentation (vtkLocator *);


B<vtkSpatialRepresentationFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Sphere;


@Graphics::VTK::Sphere::ISA = qw( Graphics::VTK::ImplicitFunction );

=head1 Graphics::VTK::Sphere

=over 1

=item *

Inherits from ImplicitFunction

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float EvaluateFunction (float x, float y, float z);
   float  *GetCenter ();
      (Returns a 3-element Perl list)
   const char *GetClassName();
   float GetRadius ();
   vtkSphere *New ();
   void SetCenter (float  , float , float );
   void SetRadius (float );


B<vtkSphere Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float EvaluateFunction (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateGradient (float x[3], float n[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetCenter (float  a[3]);
      Method is redundant. Same as SetCenter( float, float, float)


=cut

package Graphics::VTK::SphereSource;


@Graphics::VTK::SphereSource::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::SphereSource

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float  *GetCenter ();
      (Returns a 3-element Perl list)
   const char *GetClassName();
   float GetEndPhi ();
   float GetEndTheta ();
   int GetPhiResolution ();
   float GetRadius ();
   float GetStartPhi ();
   float GetStartTheta ();
   int GetThetaResolution ();
   vtkSphereSource *New ();
   void SetCenter (float  , float , float );
   void SetEndPhi (float );
   void SetEndTheta (float );
   void SetPhiResolution (int );
   void SetRadius (float );
   void SetStartPhi (float );
   void SetStartTheta (float );
   void SetThetaResolution (int );


B<vtkSphereSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetCenter (float  a[3]);
      Method is redundant. Same as SetCenter( float, float, float)


=cut

package Graphics::VTK::StreamLine;


@Graphics::VTK::StreamLine::ISA = qw( Graphics::VTK::Streamer );

=head1 Graphics::VTK::StreamLine

=over 1

=item *

Inherits from Streamer

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetStepLength ();
   vtkStreamLine *New ();
   void SetStepLength (float );


B<vtkStreamLine Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::StreamPoints;


@Graphics::VTK::StreamPoints::ISA = qw( Graphics::VTK::Streamer );

=head1 Graphics::VTK::StreamPoints

=over 1

=item *

Inherits from Streamer

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetTimeIncrement ();
   vtkStreamPoints *New ();
   void SetTimeIncrement (float );


B<vtkStreamPoints Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Streamer;


@Graphics::VTK::Streamer::ISA = qw( Graphics::VTK::DataSetToPolyDataFilter );

=head1 Graphics::VTK::Streamer

=over 1

=item *

Inherits from DataSetToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetIntegrationDirection ();
   char *GetIntegrationDirectionAsString ();
   float GetIntegrationStepLength ();
   vtkInitialValueProblemSolver *GetIntegrator ();
   float GetMaximumPropagationTime ();
   int GetNumberOfThreads ();
   float GetSavePointInterval ();
   vtkDataSet *GetSource ();
   int GetSpeedScalars ();
   float *GetStartPosition ();
      (Returns a 3-element Perl list)
   float GetTerminalSpeed ();
   int GetVorticity ();
   vtkStreamer *New ();
   void SetIntegrationDirection (int );
   void SetIntegrationDirectionToBackward ();
   void SetIntegrationDirectionToForward ();
   void SetIntegrationDirectionToIntegrateBothDirections ();
   void SetIntegrationStepLength (float );
   void SetIntegrator (vtkInitialValueProblemSolver *);
   void SetMaximumPropagationTime (float );
   void SetNumberOfThreads (int );
   void SetSavePointInterval (float );
   void SetSource (vtkDataSet *source);
   void SetSpeedScalars (int );
   void SetStartLocation (int cellId, int subId, float r, float s, float t);
   void SetStartPosition (float x, float y, float z);
   void SetTerminalSpeed (float );
   void SetVorticity (int );
   void SpeedScalarsOff ();
   void SpeedScalarsOn ();
   void VorticityOff ();
   void VorticityOn ();


B<vtkStreamer Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int GetStartLocation (int &subId, float pcoords[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int StartFromint StartCellint StartSubIdfloat StartPCoords[3]float StartPosition[3]vtkStreamArray *Streamersint NumberOfStreamersfloat MaximumPropagationTimeint IntegrationDirectionfloat IntegrationStepLengthint Vorticityfloat TerminalSpeedint SpeedScalarsvtkInitialValueProblemSolver *Integratorfloat SavePointIntervalvoid InitializeThreadedIntegrate ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetStartLocation (int cellId, int subId, float pcoords[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetStartPosition (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::Stripper;


@Graphics::VTK::Stripper::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::Stripper

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetMaximumLength ();
   vtkStripper *New ();
   void SetMaximumLength (int );


B<vtkStripper Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::StructuredGridGeometryFilter;


@Graphics::VTK::StructuredGridGeometryFilter::ISA = qw( Graphics::VTK::StructuredGridToPolyDataFilter );

=head1 Graphics::VTK::StructuredGridGeometryFilter

=over 1

=item *

Inherits from StructuredGridToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int  *GetExtent ();
      (Returns a 6-element Perl list)
   vtkStructuredGridGeometryFilter *New ();
   void SetExtent (int iMin, int iMax, int jMin, int jMax, int kMin, int kMax);


B<vtkStructuredGridGeometryFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetExtent (int *extent);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::StructuredGridOutlineFilter;


@Graphics::VTK::StructuredGridOutlineFilter::ISA = qw( Graphics::VTK::StructuredGridToPolyDataFilter );

=head1 Graphics::VTK::StructuredGridOutlineFilter

=over 1

=item *

Inherits from StructuredGridToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkStructuredGridOutlineFilter *New ();

=cut

package Graphics::VTK::StructuredGridReader;


@Graphics::VTK::StructuredGridReader::ISA = qw( Graphics::VTK::DataReader );

=head1 Graphics::VTK::StructuredGridReader

=over 1

=item *

Inherits from DataReader

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkStructuredGrid *GetOutput (int idx);
   vtkStructuredGrid *GetOutput ();
   vtkStructuredGridReader *New ();
   void SetOutput (vtkStructuredGrid *output);


B<vtkStructuredGridReader Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::StructuredGridSource;


@Graphics::VTK::StructuredGridSource::ISA = qw( Graphics::VTK::Source );

=head1 Graphics::VTK::StructuredGridSource

=over 1

=item *

Inherits from Source

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkStructuredGrid *GetOutput (int idx);
   vtkStructuredGrid *GetOutput ();
   vtkStructuredGridSource *New ();
   void SetOutput (vtkStructuredGrid *output);

=cut

package Graphics::VTK::StructuredGridWriter;


@Graphics::VTK::StructuredGridWriter::ISA = qw( Graphics::VTK::DataWriter );

=head1 Graphics::VTK::StructuredGridWriter

=over 1

=item *

Inherits from DataWriter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkStructuredGrid *GetInput ();
   vtkStructuredGridWriter *New ();
   void SetInput (vtkStructuredGrid *input);


B<vtkStructuredGridWriter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::StructuredPointsGeometryFilter;


@Graphics::VTK::StructuredPointsGeometryFilter::ISA = qw( Graphics::VTK::StructuredPointsToPolyDataFilter );

=head1 Graphics::VTK::StructuredPointsGeometryFilter

=over 1

=item *

Inherits from StructuredPointsToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkStructuredPointsGeometryFilter *New ();
   void SetExtent (int iMin, int iMax, int jMin, int jMax, int kMin, int kMax);


B<vtkStructuredPointsGeometryFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int *GetExtent ();
      Can't Handle 'int *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetExtent (int *extent);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::StructuredPointsCollection;


@Graphics::VTK::StructuredPointsCollection::ISA = qw( Graphics::VTK::Collection );

=head1 Graphics::VTK::StructuredPointsCollection

=over 1

=item *

Inherits from Collection

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddItem (vtkStructuredPoints *ds);
   const char *GetClassName();
   vtkStructuredPoints *GetNextItem ();
   vtkStructuredPointsCollection *New ();

=cut

package Graphics::VTK::StructuredPointsReader;


@Graphics::VTK::StructuredPointsReader::ISA = qw( Graphics::VTK::DataReader );

=head1 Graphics::VTK::StructuredPointsReader

=over 1

=item *

Inherits from DataReader

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkStructuredPoints *GetOutput (int idx);
   vtkStructuredPoints *GetOutput ();
   vtkStructuredPointsReader *New ();
   void SetOutput (vtkStructuredPoints *output);


B<vtkStructuredPointsReader Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int ExecuteExtent[6]void ExecuteInformation ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::StructuredPointsSource;


@Graphics::VTK::StructuredPointsSource::ISA = qw( Graphics::VTK::Source );

=head1 Graphics::VTK::StructuredPointsSource

=over 1

=item *

Inherits from Source

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkStructuredPoints *GetOutput (int idx);
   vtkStructuredPoints *GetOutput ();
   vtkStructuredPointsSource *New ();
   void SetOutput (vtkStructuredPoints *output);


B<vtkStructuredPointsSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int ExecuteExtent[6]void ExecuteInformation ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::StructuredPointsWriter;


@Graphics::VTK::StructuredPointsWriter::ISA = qw( Graphics::VTK::DataWriter );

=head1 Graphics::VTK::StructuredPointsWriter

=over 1

=item *

Inherits from DataWriter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkStructuredPoints *GetInput ();
   vtkStructuredPointsWriter *New ();
   void SetInput (vtkStructuredPoints *input);
   void SetInput (vtkImageData *cache);


B<vtkStructuredPointsWriter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::SubPixelPositionEdgels;


@Graphics::VTK::SubPixelPositionEdgels::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::SubPixelPositionEdgels

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkStructuredPoints *GetGradMaps ();
   int GetTargetFlag ();
   float GetTargetValue ();
   vtkSubPixelPositionEdgels *New ();
   void SetGradMaps (vtkStructuredPoints *gm);
   void SetTargetFlag (int );
   void SetTargetValue (float );
   void TargetFlagOff ();
   void TargetFlagOn ();


B<vtkSubPixelPositionEdgels Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void Move (int xdim, int ydim, int zdim, int x, int y, float *img, vtkVectors *inVecs, float *result, int z, float *aspect, float *resultNormal);
      Don't know the size of pointer arg number 6

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::TensorGlyph;


@Graphics::VTK::TensorGlyph::ISA = qw( Graphics::VTK::DataSetToPolyDataFilter );

=head1 Graphics::VTK::TensorGlyph

=over 1

=item *

Inherits from DataSetToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ClampScalingOff ();
   void ClampScalingOn ();
   void ColorGlyphsOff ();
   void ColorGlyphsOn ();
   void ExtractEigenvaluesOff ();
   void ExtractEigenvaluesOn ();
   int GetClampScaling ();
   const char *GetClassName();
   int GetColorGlyphs ();
   int GetExtractEigenvalues ();
   float GetMaxScaleFactor ();
   float GetScaleFactor ();
   int GetScaling ();
   vtkPolyData *GetSource ();
   vtkTensorGlyph *New ();
   void ScalingOff ();
   void ScalingOn ();
   void SetClampScaling (int );
   void SetColorGlyphs (int );
   void SetExtractEigenvalues (int );
   void SetMaxScaleFactor (float );
   void SetScaleFactor (float );
   void SetScaling (int );
   void SetSource (vtkPolyData *source);


B<vtkTensorGlyph Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::TextSource;


@Graphics::VTK::TextSource::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::TextSource

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BackingOff ();
   void BackingOn ();
   float  *GetBackgroundColor ();
      (Returns a 3-element Perl list)
   int GetBacking ();
   const char *GetClassName();
   float  *GetForegroundColor ();
      (Returns a 3-element Perl list)
   char *GetText ();
   vtkTextSource *New ();
   void SetBackgroundColor (float  , float , float );
   void SetBacking (int );
   void SetForegroundColor (float  , float , float );
   void SetText (char *);


B<vtkTextSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetBackgroundColor (float  a[3]);
      Method is redundant. Same as SetBackgroundColor( float, float, float)

   void SetForegroundColor (float  a[3]);
      Method is redundant. Same as SetForegroundColor( float, float, float)


=cut

package Graphics::VTK::Texture;


@Graphics::VTK::Texture::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::Texture

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkStructuredPoints *GetInput ();
   int GetInterpolate ();
   vtkLookupTable *GetLookupTable ();
   int GetMapColorScalarsThroughLookupTable ();
   vtkScalars *GetMappedScalars ();
   int GetQuality ();
   int GetRepeat ();
   void InterpolateOff ();
   void InterpolateOn ();
   virtual void Load (vtkRenderer *);
   void MapColorScalarsThroughLookupTableOff ();
   void MapColorScalarsThroughLookupTableOn ();
   vtkTexture *New ();
   virtual void ReleaseGraphicsResources (vtkWindow *);
   virtual void Render (vtkRenderer *ren);
   void RepeatOff ();
   void RepeatOn ();
   void SetInput (vtkStructuredPoints *);
   void SetInput (vtkImageData *cache);
   void SetInterpolate (int );
   void SetLookupTable (vtkLookupTable *);
   void SetMapColorScalarsThroughLookupTable (int );
   void SetQuality (int );
   void SetQualityTo16Bit ();
   void SetQualityTo32Bit ();
   void SetQualityToDefault ();
   void SetRepeat (int );


B<vtkTexture Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   unsigned char *MapScalarsToColors (vtkScalars *scalars);
      Can't Handle 'unsigned char *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::TextureMapToCylinder;


@Graphics::VTK::TextureMapToCylinder::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::TextureMapToCylinder

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AutomaticCylinderGenerationOff ();
   void AutomaticCylinderGenerationOn ();
   int GetAutomaticCylinderGeneration ();
   const char *GetClassName();
   float  *GetPoint1 ();
      (Returns a 3-element Perl list)
   float  *GetPoint2 ();
      (Returns a 3-element Perl list)
   int GetPreventSeam ();
   vtkTextureMapToCylinder *New ();
   void PreventSeamOff ();
   void PreventSeamOn ();
   void SetAutomaticCylinderGeneration (int );
   void SetPoint1 (float  , float , float );
   void SetPoint2 (float  , float , float );
   void SetPreventSeam (int );


B<vtkTextureMapToCylinder Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetPoint1 (float  a[3]);
      Method is redundant. Same as SetPoint1( float, float, float)

   void SetPoint2 (float  a[3]);
      Method is redundant. Same as SetPoint2( float, float, float)


=cut

package Graphics::VTK::TextureMapToPlane;


@Graphics::VTK::TextureMapToPlane::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::TextureMapToPlane

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AutomaticPlaneGenerationOff ();
   void AutomaticPlaneGenerationOn ();
   int GetAutomaticPlaneGeneration ();
   const char *GetClassName();
   float  *GetNormal ();
      (Returns a 3-element Perl list)
   float  *GetOrigin ();
      (Returns a 3-element Perl list)
   float  *GetPoint1 ();
      (Returns a 3-element Perl list)
   float  *GetPoint2 ();
      (Returns a 3-element Perl list)
   float  *GetSRange ();
      (Returns a 2-element Perl list)
   float  *GetTRange ();
      (Returns a 2-element Perl list)
   vtkTextureMapToPlane *New ();
   void SetAutomaticPlaneGeneration (int );
   void SetNormal (float  , float , float );
   void SetOrigin (float  , float , float );
   void SetPoint1 (float  , float , float );
   void SetPoint2 (float  , float , float );
   void SetSRange (float  , float );
   void SetTRange (float  , float );


B<vtkTextureMapToPlane Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetNormal (float  a[3]);
      Method is redundant. Same as SetNormal( float, float, float)

   void SetOrigin (float  a[3]);
      Method is redundant. Same as SetOrigin( float, float, float)

   void SetPoint1 (float  a[3]);
      Method is redundant. Same as SetPoint1( float, float, float)

   void SetPoint2 (float  a[3]);
      Method is redundant. Same as SetPoint2( float, float, float)

   void SetSRange (float  a[2]);
      Method is redundant. Same as SetSRange( float, float)

   void SetTRange (float  a[2]);
      Method is redundant. Same as SetTRange( float, float)


=cut

package Graphics::VTK::TextureMapToSphere;


@Graphics::VTK::TextureMapToSphere::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::TextureMapToSphere

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AutomaticSphereGenerationOff ();
   void AutomaticSphereGenerationOn ();
   int GetAutomaticSphereGeneration ();
   float  *GetCenter ();
      (Returns a 3-element Perl list)
   const char *GetClassName();
   int GetPreventSeam ();
   vtkTextureMapToSphere *New ();
   void PreventSeamOff ();
   void PreventSeamOn ();
   void SetAutomaticSphereGeneration (int );
   void SetCenter (float  , float , float );
   void SetPreventSeam (int );


B<vtkTextureMapToSphere Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetCenter (float  a[3]);
      Method is redundant. Same as SetCenter( float, float, float)


=cut

package Graphics::VTK::TexturedSphereSource;


@Graphics::VTK::TexturedSphereSource::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::TexturedSphereSource

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetPhi ();
   int GetPhiResolution ();
   float GetRadius ();
   float GetTheta ();
   int GetThetaResolution ();
   vtkTexturedSphereSource *New ();
   void SetPhi (float );
   void SetPhiResolution (int );
   void SetRadius (float );
   void SetTheta (float );
   void SetThetaResolution (int );


B<vtkTexturedSphereSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Threshold;


@Graphics::VTK::Threshold::ISA = qw( Graphics::VTK::DataSetToUnstructuredGridFilter );

=head1 Graphics::VTK::Threshold

=over 1

=item *

Inherits from DataSetToUnstructuredGridFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AllScalarsOff ();
   void AllScalarsOn ();
   int GetAllScalars ();
   int GetAttributeMode ();
   char *GetAttributeModeAsString ();
   const char *GetClassName();
   float GetLowerThreshold ();
   float GetUpperThreshold ();
   vtkThreshold *New ();
   void SetAllScalars (int );
   void SetAttributeMode (int );
   void SetAttributeModeToDefault ();
   void SetAttributeModeToUseCellData ();
   void SetAttributeModeToUsePointData ();
   void ThresholdBetween (float lower, float upper);
   void ThresholdByLower (float lower);
   void ThresholdByUpper (float upper);


B<vtkThreshold Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ThresholdPoints;


@Graphics::VTK::ThresholdPoints::ISA = qw( Graphics::VTK::DataSetToPolyDataFilter );

=head1 Graphics::VTK::ThresholdPoints

=over 1

=item *

Inherits from DataSetToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetLowerThreshold ();
   float GetUpperThreshold ();
   vtkThresholdPoints *New ();
   void ThresholdBetween (float lower, float upper);
   void ThresholdByLower (float lower);
   void ThresholdByUpper (float upper);


B<vtkThresholdPoints Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ThresholdTextureCoords;


@Graphics::VTK::ThresholdTextureCoords::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::ThresholdTextureCoords

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float  *GetInTextureCoord ();
      (Returns a 3-element Perl list)
   float GetLowerThreshold ();
   float  *GetOutTextureCoord ();
      (Returns a 3-element Perl list)
   int GetTextureDimension ();
   float GetUpperThreshold ();
   vtkThresholdTextureCoords *New ();
   void SetInTextureCoord (float  , float , float );
   void SetOutTextureCoord (float  , float , float );
   void SetTextureDimension (int );
   void ThresholdBetween (float lower, float upper);
   void ThresholdByLower (float lower);
   void ThresholdByUpper (float upper);


B<vtkThresholdTextureCoords Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float LowerThresholdfloat UpperThresholdint TextureDimensionfloat InTextureCoord[3]float OutTextureCoord[3]int Lower (float s);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetInTextureCoord (float  a[3]);
      Method is redundant. Same as SetInTextureCoord( float, float, float)

   void SetOutTextureCoord (float  a[3]);
      Method is redundant. Same as SetOutTextureCoord( float, float, float)


=cut

package Graphics::VTK::TransformFilter;


@Graphics::VTK::TransformFilter::ISA = qw( Graphics::VTK::PointSetToPointSetFilter );

=head1 Graphics::VTK::TransformFilter

=over 1

=item *

Inherits from PointSetToPointSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   unsigned long GetMTime ();
   vtkAbstractTransform *GetTransform ();
   vtkTransformFilter *New ();
   void SetTransform (vtkAbstractTransform *);


B<vtkTransformFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::TransformPolyDataFilter;


@Graphics::VTK::TransformPolyDataFilter::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::TransformPolyDataFilter

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   unsigned long GetMTime ();
   vtkAbstractTransform *GetTransform ();
   vtkTransformPolyDataFilter *New ();
   void SetTransform (vtkAbstractTransform *);


B<vtkTransformPolyDataFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::TransformTextureCoords;


@Graphics::VTK::TransformTextureCoords::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::TransformTextureCoords

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddPosition (float deltaR, float deltaS, float deltaT);
   void FlipROff ();
   void FlipROn ();
   void FlipSOff ();
   void FlipSOn ();
   void FlipTOff ();
   void FlipTOn ();
   const char *GetClassName();
   int GetFlipR ();
   int GetFlipS ();
   int GetFlipT ();
   float  *GetOrigin ();
      (Returns a 3-element Perl list)
   float  *GetPosition ();
      (Returns a 3-element Perl list)
   float  *GetScale ();
      (Returns a 3-element Perl list)
   vtkTransformTextureCoords *New ();
   void SetFlipR (int );
   void SetFlipS (int );
   void SetFlipT (int );
   void SetOrigin (float  , float , float );
   void SetPosition (float  , float , float );
   void SetScale (float  , float , float );


B<vtkTransformTextureCoords Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void AddPosition (float deltaPosition[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetOrigin (float  a[3]);
      Method is redundant. Same as SetOrigin( float, float, float)

   void SetPosition (float  a[3]);
      Method is redundant. Same as SetPosition( float, float, float)

   void SetScale (float  a[3]);
      Method is redundant. Same as SetScale( float, float, float)


=cut

package Graphics::VTK::TriangleFilter;


@Graphics::VTK::TriangleFilter::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::TriangleFilter

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetPassLines ();
   int GetPassVerts ();
   vtkTriangleFilter *New ();
   void PassLinesOff ();
   void PassLinesOn ();
   void PassVertsOff ();
   void PassVertsOn ();
   void SetPassLines (int );
   void SetPassVerts (int );


B<vtkTriangleFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::TriangularTexture;


@Graphics::VTK::TriangularTexture::ISA = qw( Graphics::VTK::StructuredPointsSource );

=head1 Graphics::VTK::TriangularTexture

=over 1

=item *

Inherits from StructuredPointsSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetScaleFactor ();
   int GetTexturePattern ();
   int GetXSize ();
   int GetYSize ();
   vtkTriangularTexture *New ();
   void SetScaleFactor (float );
   void SetTexturePattern (int );
   void SetXSize (int );
   void SetYSize (int );


B<vtkTriangularTexture Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::TriangularTCoords;


@Graphics::VTK::TriangularTCoords::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::TriangularTCoords

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkTriangularTCoords *New ();


B<vtkTriangularTCoords Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::TubeFilter;


@Graphics::VTK::TubeFilter::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::TubeFilter

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CappingOff ();
   void CappingOn ();
   int GetCapping ();
   const char *GetClassName();
   float  *GetDefaultNormal ();
      (Returns a 3-element Perl list)
   int GetNumberOfSides ();
   int GetOffset ();
   int GetOnRatio ();
   float GetRadius ();
   float GetRadiusFactor ();
   int GetUseDefaultNormal ();
   int GetVaryRadius ();
   char *GetVaryRadiusAsString ();
   vtkTubeFilter *New ();
   void SetCapping (int );
   void SetDefaultNormal (float  , float , float );
   void SetNumberOfSides (int );
   void SetOffset (int );
   void SetOnRatio (int );
   void SetRadius (float );
   void SetRadiusFactor (float );
   void SetUseDefaultNormal (int );
   void SetVaryRadius (int );
   void SetVaryRadiusToVaryRadiusByScalar ();
   void SetVaryRadiusToVaryRadiusByVector ();
   void SetVaryRadiusToVaryRadiusOff ();
   void UseDefaultNormalOff ();
   void UseDefaultNormalOn ();


B<vtkTubeFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetDefaultNormal (float  a[3]);
      Method is redundant. Same as SetDefaultNormal( float, float, float)


=cut

package Graphics::VTK::UGFacetReader;


@Graphics::VTK::UGFacetReader::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::UGFacetReader

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CreateDefaultLocator ();
   const char *GetClassName();
   char *GetFileName ();
   vtkPointLocator *GetLocator ();
   unsigned long GetMTime ();
   int GetMerging ();
   int GetNumberOfParts ();
   short GetPartColorIndex (int partId);
   int GetPartNumber ();
   void MergingOff ();
   void MergingOn ();
   vtkUGFacetReader *New ();
   void SetFileName (char *);
   void SetLocator (vtkPointLocator *locator);
   void SetLocator (vtkPointLocator &locator);
   void SetMerging (int );
   void SetPartNumber (int );


B<vtkUGFacetReader Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::UnstructuredGridReader;


@Graphics::VTK::UnstructuredGridReader::ISA = qw( Graphics::VTK::DataReader );

=head1 Graphics::VTK::UnstructuredGridReader

=over 1

=item *

Inherits from DataReader

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkUnstructuredGrid *GetOutput (int idx);
   vtkUnstructuredGrid *GetOutput ();
   vtkUnstructuredGridReader *New ();
   void SetOutput (vtkUnstructuredGrid *output);


B<vtkUnstructuredGridReader Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::UnstructuredGridSource;


@Graphics::VTK::UnstructuredGridSource::ISA = qw( Graphics::VTK::Source );

=head1 Graphics::VTK::UnstructuredGridSource

=over 1

=item *

Inherits from Source

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkUnstructuredGrid *GetOutput (int idx);
   vtkUnstructuredGrid *GetOutput ();
   vtkUnstructuredGridSource *New ();
   void SetOutput (vtkUnstructuredGrid *output);

=cut

package Graphics::VTK::UnstructuredGridWriter;


@Graphics::VTK::UnstructuredGridWriter::ISA = qw( Graphics::VTK::DataWriter );

=head1 Graphics::VTK::UnstructuredGridWriter

=over 1

=item *

Inherits from DataWriter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkUnstructuredGrid *GetInput ();
   vtkUnstructuredGridWriter *New ();
   void SetInput (vtkUnstructuredGrid *input);


B<vtkUnstructuredGridWriter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::VRMLExporter;


@Graphics::VTK::VRMLExporter::ISA = qw( Graphics::VTK::Exporter );

=head1 Graphics::VTK::VRMLExporter

=over 1

=item *

Inherits from Exporter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   char *GetFileName ();
   float GetSpeed ();
   vtkVRMLExporter *New ();
   void SetFileName (char *);
   void SetSpeed (float );


B<vtkVRMLExporter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   FILE *GetFilePointer ();
      Definition in Header File, but not implemented in source code

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetFilePointer (FILE *);
      Don't know the size of pointer arg number 1

   void WriteALight (vtkLight *aLight, FILE *fp);
      Don't know the size of pointer arg number 2

   void WriteAnActor (vtkActor *anActor, FILE *fp);
      Don't know the size of pointer arg number 2

   void WritePointData (vtkPoints *points, vtkNormals *normals, vtkTCoords *tcoords, vtkScalars *colors, FILE *fp);
      Don't know the size of pointer arg number 5


=cut

package Graphics::VTK::VectorDot;


@Graphics::VTK::VectorDot::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::VectorDot

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float  *GetScalarRange ();
      (Returns a 2-element Perl list)
   vtkVectorDot *New ();
   void SetScalarRange (float  , float );


B<vtkVectorDot Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetScalarRange (float  a[2]);
      Method is redundant. Same as SetScalarRange( float, float)


=cut

package Graphics::VTK::VectorNorm;


@Graphics::VTK::VectorNorm::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::VectorNorm

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int GetAttributeMode ();
   char *GetAttributeModeAsString ();
   const char *GetClassName();
   int GetNormalize ();
   vtkVectorNorm *New ();
   void NormalizeOff ();
   void NormalizeOn ();
   void SetAttributeMode (int );
   void SetAttributeModeToDefault ();
   void SetAttributeModeToUseCellData ();
   void SetAttributeModeToUsePointData ();
   void SetNormalize (int );


B<vtkVectorNorm Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::VectorText;


@Graphics::VTK::VectorText::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::VectorText

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   char *GetText ();
   vtkVectorText *New ();
   void SetText (char *);


B<vtkVectorText Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ViewRays;


@Graphics::VTK::ViewRays::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::ViewRays

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkRenderer *GetRenderer ();
   int  *GetSize ();
      (Returns a 2-element Perl list)
   vtkViewRays *New ();
   void SetRenderer (vtkRenderer *ren);
   void SetSize (int  , int );


B<vtkViewRays Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   vtkRenderer *Rendererint Size[2]unsigned long ViewRaysCamMtimeunsigned long ViewRaysMTimevoid ComputeParallelInfo (int size[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float StartPosition[3]float Increments[2]void ComputePerspectiveInfo (float *vr_ptr, int size[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float *GetParallelIncrements (void );
      Can't Handle 'float *' return type without a hint

   float *GetParallelStartPosition (void );
      Can't Handle 'float *' return type without a hint

   float *GetPerspectiveViewRays (void );
      Can't Handle 'float *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetSize (int  a[2]);
      Method is redundant. Same as SetSize( int, int)


=cut

package Graphics::VTK::Volume;


@Graphics::VTK::Volume::ISA = qw( Graphics::VTK::Prop3D );

=head1 Graphics::VTK::Volume

=over 1

=item *

Inherits from Prop3D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float *GetBounds ();
      (Returns a 6-element Perl list)
   const char *GetClassName();
   unsigned long GetMTime ();
   vtkVolumeMapper *GetMapper ();
   float GetMaxXBound ();
   float GetMaxYBound ();
   float GetMaxZBound ();
   float GetMinXBound ();
   float GetMinYBound ();
   float GetMinZBound ();
   vtkVolumeProperty *GetProperty ();
   unsigned long GetRedrawMTime ();
   void GetVolumes (vtkPropCollection *vc);
   vtkVolume *New ();
   void SetMapper (vtkVolumeMapper *mapper);
   void SetProperty (vtkVolumeProperty *property);
   void ShallowCopy (vtkProp *prop);
   void Update ();


B<vtkVolume Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   vtkVolumeMapper *MappervtkVolumeProperty *Propertyfloat *RGBArrayvtkTimeStamp RGBArrayMTimefloat *GrayArrayvtkTimeStamp GrayArrayMTimefloat *ScalarOpacityArrayvtkTimeStamp ScalarOpacityArrayMTimefloat *CorrectedScalarOpacityArrayfloat CorrectedStepSizevtkTimeStamp CorrectedScalarOpacityArrayMTimeint ArraySizefloat GradientOpacityArray[256]float GradientOpacityConstantvtkTimeStamp GradientOpacityArrayMTimefloat ComputeScreenCoverage (vtkViewport *vp);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetBounds (float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::VolumeCollection;


@Graphics::VTK::VolumeCollection::ISA = qw( Graphics::VTK::PropCollection );

=head1 Graphics::VTK::VolumeCollection

=over 1

=item *

Inherits from PropCollection

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddItem (vtkVolume *a);
   const char *GetClassName();
   vtkVolume *GetNextItem ();
   vtkVolume *GetNextVolume ();
   vtkVolumeCollection *New ();

=cut

package Graphics::VTK::VolumeProperty;


@Graphics::VTK::VolumeProperty::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::VolumeProperty

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float GetAmbient ();
   const char *GetClassName();
   int GetColorChannels ();
   float GetDiffuse ();
   vtkPiecewiseFunction *GetGradientOpacity ();
   vtkPiecewiseFunction *GetGrayTransferFunction ();
   int GetInterpolationType ();
   char *GetInterpolationTypeAsString (void );
   unsigned long GetMTime ();
   float GetRGBTextureCoefficient ();
   vtkColorTransferFunction *GetRGBTransferFunction ();
   vtkPiecewiseFunction *GetScalarOpacity ();
   int GetShade ();
   float GetSpecular ();
   float GetSpecularPower ();
   vtkVolumeProperty *New ();
   void SetAmbient (float );
   void SetColor (vtkPiecewiseFunction *function);
   void SetColor (vtkColorTransferFunction *function);
   void SetDiffuse (float );
   void SetGradientOpacity (vtkPiecewiseFunction *function);
   void SetInterpolationType (int );
   void SetInterpolationTypeToLinear ();
   void SetInterpolationTypeToNearest ();
   void SetRGBTextureCoefficient (float );
   void SetScalarOpacity (vtkPiecewiseFunction *function);
   void SetShade (int );
   void SetSpecular (float );
   void SetSpecularPower (float );
   void ShadeOff ();
   void ShadeOn ();


B<vtkVolumeProperty Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::VolumeRayCastCompositeFunction;


@Graphics::VTK::VolumeRayCastCompositeFunction::ISA = qw( Graphics::VTK::VolumeRayCastFunction );

=head1 Graphics::VTK::VolumeRayCastCompositeFunction

=over 1

=item *

Inherits from VolumeRayCastFunction

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetCompositeMethod ();
   char *GetCompositeMethodAsString (void );
   vtkVolumeRayCastCompositeFunction *New ();
   void SetCompositeMethod (int );
   void SetCompositeMethodToClassifyFirst ();
   void SetCompositeMethodToInterpolateFirst ();


B<vtkVolumeRayCastCompositeFunction Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent index);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::VolumeRayCastIsosurfaceFunction;


@Graphics::VTK::VolumeRayCastIsosurfaceFunction::ISA = qw( Graphics::VTK::VolumeRayCastFunction );

=head1 Graphics::VTK::VolumeRayCastIsosurfaceFunction

=over 1

=item *

Inherits from VolumeRayCastFunction

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetIsoValue ();
   float GetZeroOpacityThreshold (vtkVolume *vol);
   vtkVolumeRayCastIsosurfaceFunction *New ();
   void SetIsoValue (float );


B<vtkVolumeRayCastIsosurfaceFunction Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent index);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::VolumeRayCastMapper;


@Graphics::VTK::VolumeRayCastMapper::ISA = qw( Graphics::VTK::VolumeMapper );

=head1 Graphics::VTK::VolumeRayCastMapper

=over 1

=item *

Inherits from VolumeMapper

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkEncodedGradientEstimator *GetGradientEstimator ();
   vtkEncodedGradientShader *GetGradientShader ();
   vtkRayBounder *GetRayBounder ();
   float GetSampleDistance ();
   vtkVolumeRayCastFunction *GetVolumeRayCastFunction ();
   vtkVolumeRayCastMapper *New ();
   void SetGradientEstimator (vtkEncodedGradientEstimator *gradest);
   void SetRayBounder (vtkRayBounder *);
   void SetSampleDistance (float );
   void SetVolumeRayCastFunction (vtkVolumeRayCastFunction *);


B<vtkVolumeRayCastMapper Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int ClipRayAgainstClippingPlanes (VTKRayCastRayInfo *rayInfo, VTKRayCastVolumeInfo *volumeInfo, vtkPlaneCollection *planes);
      Don't know the size of pointer arg number 1

   vtkVolumeRayCastFunction *VolumeRayCastFunctionvtkEncodedGradientEstimator *GradientEstimatorvtkEncodedGradientShader *GradientShaderfloat SampleDistancefloat WorldSampleDistanceint ScalarDataTypevoid *ScalarDataPointerfloat *DepthRangeBufferPointerint ClipRayAgainstVolume (VTKRayCastRayInfo *rayInfo, VTKRayCastVolumeInfo *volumeInfo, float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent index);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::VolumeRayCastMIPFunction;


@Graphics::VTK::VolumeRayCastMIPFunction::ISA = qw( Graphics::VTK::VolumeRayCastFunction );

=head1 Graphics::VTK::VolumeRayCastMIPFunction

=over 1

=item *

Inherits from VolumeRayCastFunction

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetMaximizeMethod ();
   char *GetMaximizeMethodAsString (void );
   float GetZeroOpacityThreshold (vtkVolume *vol);
   vtkVolumeRayCastMIPFunction *New ();
   void SetMaximizeMethod (int );
   void SetMaximizeMethodToOpacity ();
   void SetMaximizeMethodToScalarValue ();


B<vtkVolumeRayCastMIPFunction Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent index);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::VolumeTextureMapper2D;


@Graphics::VTK::VolumeTextureMapper2D::ISA = qw( Graphics::VTK::VolumeTextureMapper );

=head1 Graphics::VTK::VolumeTextureMapper2D

=over 1

=item *

Inherits from VolumeTextureMapper

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetMaximumNumberOfPlanes ();
   int  *GetTargetTextureSize ();
      (Returns a 2-element Perl list)
   vtkVolumeTextureMapper2D *New ();
   void SetMaximumNumberOfPlanes (int );
   void SetTargetTextureSize (int  , int );


B<vtkVolumeTextureMapper2D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent index);
      I/O Streams not Supported yet

   void SetTargetTextureSize (int  a[2]);
      Method is redundant. Same as SetTargetTextureSize( int, int)


=cut

package Graphics::VTK::Volume16Reader;


@Graphics::VTK::Volume16Reader::ISA = qw( Graphics::VTK::VolumeReader );

=head1 Graphics::VTK::Volume16Reader

=over 1

=item *

Inherits from VolumeReader

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetDataByteOrder ();
   char *GetDataByteOrderAsString ();
   int  *GetDataDimensions ();
      (Returns a 2-element Perl list)
   short unsigned GetDataMask ();
   int GetHeaderSize ();
   vtkStructuredPoints *GetImage (int ImageNumber);
   int GetSwapBytes ();
   vtkTransform *GetTransform ();
   vtkVolume16Reader *New ();
   void SetDataByteOrder (int );
   void SetDataByteOrderToBigEndian ();
   void SetDataByteOrderToLittleEndian ();
   void SetDataDimensions (int  , int );
   void SetDataMask (unsigned short );
   void SetHeaderSize (int );
   void SetSwapBytes (int );
   void SetTransform (vtkTransform *);
   void SwapBytesOff ();
   void SwapBytesOn ();


B<vtkVolume16Reader Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void AdjustSpacingAndOrigin (int dimensions[3], float Spacing[3], float origin[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeTransformedBounds (int bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeTransformedDimensions (int dimensions[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeTransformedOrigin (float origin[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeTransformedSpacing (float Spacing[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   int Read16BitImage (FILE *fp, unsigned short *pixels, int xsize, int ysize, int skip, int swapBytes);
      Don't know the size of pointer arg number 1

   void SetDataDimensions (int  a[2]);
      Method is redundant. Same as SetDataDimensions( int, int)

   int DataDimensions[2]unsigned short DataMaskint SwapBytesint HeaderSizevtkTransform *Transformvoid TransformSlice (unsigned short *slice, unsigned short *pixels, int k, int dimensions[3], int bounds[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::VoxelContoursToSurfaceFilter;


@Graphics::VTK::VoxelContoursToSurfaceFilter::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::VoxelContoursToSurfaceFilter

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetMemoryLimitInBytes ();
   float  *GetSpacing ();
      (Returns a 3-element Perl list)
   vtkVoxelContoursToSurfaceFilter *New ();
   void SetMemoryLimitInBytes (int );
   void SetSpacing (float  , float , float );


B<vtkVoxelContoursToSurfaceFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int MemoryLimitInBytesfloat Spacing[3]float *LineListint LineListLengthint LineListSizefloat *SortedXListfloat *SortedYListint SortedListSizeint *WorkingListint WorkingListLengthfloat *IntersectionListint IntersectionListLengthvoid AddLineToLineList (float x1, float y1, float x2, float y2);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void CastLines (float *slice, float gridOrigin[3], int gridSize[3], int type);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void PushDistances (float *ptr, int gridSize[3], int chunkSize);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetSpacing (float  a[3]);
      Method is redundant. Same as SetSpacing( float, float, float)


=cut

package Graphics::VTK::VoxelModeller;


@Graphics::VTK::VoxelModeller::ISA = qw( Graphics::VTK::DataSetToStructuredPointsFilter );

=head1 Graphics::VTK::VoxelModeller

=over 1

=item *

Inherits from DataSetToStructuredPointsFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetMaximumDistance ();
   float  *GetModelBounds ();
      (Returns a 6-element Perl list)
   int  *GetSampleDimensions ();
      (Returns a 3-element Perl list)
   vtkVoxelModeller *New ();
   void SetMaximumDistance (float );
   void SetModelBounds (float xmin, float xmax, float ymin, float ymax, float zmin, float zmax);
   void SetSampleDimensions (int i, int j, int k);
   void Write (char *);


B<vtkVoxelModeller Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float ComputeModelBounds (float origin[3], float ar[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetModelBounds (float *bounds);
      Don't know the size of pointer arg number 1

   void SetSampleDimensions (int dim[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::WarpLens;


@Graphics::VTK::WarpLens::ISA = qw( Graphics::VTK::PointSetToPointSetFilter );

=head1 Graphics::VTK::WarpLens

=over 1

=item *

Inherits from PointSetToPointSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float  *GetCenter ();
      (Returns a 2-element Perl list)
   const char *GetClassName();
   float GetKappa ();
   vtkWarpLens *New ();
   void SetCenter (float  , float );
   void SetKappa (float );


B<vtkWarpLens Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetCenter (float  a[2]);
      Method is redundant. Same as SetCenter( float, float)


=cut

package Graphics::VTK::WarpScalar;


@Graphics::VTK::WarpScalar::ISA = qw( Graphics::VTK::PointSetToPointSetFilter );

=head1 Graphics::VTK::WarpScalar

=over 1

=item *

Inherits from PointSetToPointSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float  *GetNormal ();
      (Returns a 3-element Perl list)
   float GetScaleFactor ();
   int GetUseNormal ();
   int GetXYPlane ();
   vtkWarpScalar *New ();
   void SetNormal (float  , float , float );
   void SetScaleFactor (float );
   void SetUseNormal (int );
   void SetXYPlane (int );
   void UseNormalOff ();
   void UseNormalOn ();
   void XYPlaneOff ();
   void XYPlaneOn ();


B<vtkWarpScalar Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetNormal (float  a[3]);
      Method is redundant. Same as SetNormal( float, float, float)


=cut

package Graphics::VTK::WarpTo;


@Graphics::VTK::WarpTo::ISA = qw( Graphics::VTK::PointSetToPointSetFilter );

=head1 Graphics::VTK::WarpTo

=over 1

=item *

Inherits from PointSetToPointSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AbsoluteOff ();
   void AbsoluteOn ();
   int GetAbsolute ();
   const char *GetClassName();
   float  *GetPosition ();
      (Returns a 3-element Perl list)
   float GetScaleFactor ();
   vtkWarpTo *New ();
   void SetAbsolute (int );
   void SetPosition (float  , float , float );
   void SetScaleFactor (float );


B<vtkWarpTo Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetPosition (float  a[3]);
      Method is redundant. Same as SetPosition( float, float, float)


=cut

package Graphics::VTK::WindowedSincPolyDataFilter;


@Graphics::VTK::WindowedSincPolyDataFilter::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::WindowedSincPolyDataFilter

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BoundarySmoothingOff ();
   void BoundarySmoothingOn ();
   void FeatureEdgeSmoothingOff ();
   void FeatureEdgeSmoothingOn ();
   void GenerateErrorScalarsOff ();
   void GenerateErrorScalarsOn ();
   void GenerateErrorVectorsOff ();
   void GenerateErrorVectorsOn ();
   int GetBoundarySmoothing ();
   const char *GetClassName();
   float GetEdgeAngle ();
   float GetFeatureAngle ();
   int GetFeatureEdgeSmoothing ();
   int GetGenerateErrorScalars ();
   int GetGenerateErrorVectors ();
   int GetNumberOfIterations ();
   float GetPassBand ();
   vtkWindowedSincPolyDataFilter *New ();
   void SetBoundarySmoothing (int );
   void SetEdgeAngle (float );
   void SetFeatureAngle (float );
   void SetFeatureEdgeSmoothing (int );
   void SetGenerateErrorScalars (int );
   void SetGenerateErrorVectors (int );
   void SetNumberOfIterations (int );
   void SetPassBand (float );


B<vtkWindowedSincPolyDataFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::WorldPointPicker;


@Graphics::VTK::WorldPointPicker::ISA = qw( Graphics::VTK::AbstractPicker );

=head1 Graphics::VTK::WorldPointPicker

=over 1

=item *

Inherits from AbstractPicker

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkWorldPointPicker *New ();
   int Pick (float selectionX, float selectionY, float selectionZ, vtkRenderer *renderer);


B<vtkWorldPointPicker Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int Pick (float selectionPt[3], vtkRenderer *renderer);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::WarpVector;


@Graphics::VTK::WarpVector::ISA = qw( Graphics::VTK::PointSetToPointSetFilter );

=head1 Graphics::VTK::WarpVector

=over 1

=item *

Inherits from PointSetToPointSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetScaleFactor ();
   vtkWarpVector *New ();
   void SetScaleFactor (float );


B<vtkWarpVector Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::MesaActor;


@Graphics::VTK::MesaActor::ISA = qw( Graphics::VTK::Actor );

=head1 Graphics::VTK::MesaActor

=over 1

=item *

Inherits from Actor

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkMesaActor *New ();
   void Render (vtkRenderer *ren, vtkMapper *mapper);

=cut

package Graphics::VTK::MesaCamera;


@Graphics::VTK::MesaCamera::ISA = qw( Graphics::VTK::Camera );

=head1 Graphics::VTK::MesaCamera

=over 1

=item *

Inherits from Camera

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkMesaCamera *New ();
   void Render (vtkRenderer *ren);

=cut

package Graphics::VTK::MesaImageActor;


@Graphics::VTK::MesaImageActor::ISA = qw( Graphics::VTK::ImageActor );

=head1 Graphics::VTK::MesaImageActor

=over 1

=item *

Inherits from ImageActor

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   void Load (vtkRenderer *ren);
   vtkMesaImageActor *New ();
   void ReleaseGraphicsResources (vtkWindow *);


B<vtkMesaImageActor Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   unsigned char *MakeDataSuitable (int &xsize, int &ysize, int &release);
      Can't Handle 'unsigned char *' return type without a hint


=cut

package Graphics::VTK::MesaLight;


@Graphics::VTK::MesaLight::ISA = qw( Graphics::VTK::Light );

=head1 Graphics::VTK::MesaLight

=over 1

=item *

Inherits from Light

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkMesaLight *New ();
   void Render (vtkRenderer *ren, int light_index);

=cut

package Graphics::VTK::MesaPolyDataMapper;


@Graphics::VTK::MesaPolyDataMapper::ISA = qw( Graphics::VTK::PolyDataMapper );

=head1 Graphics::VTK::MesaPolyDataMapper

=over 1

=item *

Inherits from PolyDataMapper

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual void Draw (vtkRenderer *ren, vtkActor *a);
   const char *GetClassName();
   vtkMesaPolyDataMapper *New ();
   void ReleaseGraphicsResources (vtkWindow *);
   void Render (vtkRenderer *ren, vtkActor *a);

=cut

package Graphics::VTK::MesaProperty;


@Graphics::VTK::MesaProperty::ISA = qw( Graphics::VTK::Property );

=head1 Graphics::VTK::MesaProperty

=over 1

=item *

Inherits from Property

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BackfaceRender (vtkActor *a, vtkRenderer *ren);
   const char *GetClassName();
   vtkMesaProperty *New ();
   void Render (vtkActor *a, vtkRenderer *ren);

=cut

package Graphics::VTK::MesaProjectedPolyDataRayBounder;


@Graphics::VTK::MesaProjectedPolyDataRayBounder::ISA = qw( Graphics::VTK::ProjectedPolyDataRayBounder );

=head1 Graphics::VTK::MesaProjectedPolyDataRayBounder

=over 1

=item *

Inherits from ProjectedPolyDataRayBounder

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkMesaProjectedPolyDataRayBounder *New ();
   void ReleaseGraphicsResources (vtkWindow *);


B<vtkMesaProjectedPolyDataRayBounder Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float *Draw (vtkRenderer *ren, vtkMatrix4x4 *matrix);
      Can't Handle 'float *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::MesaRenderWindow;


@Graphics::VTK::MesaRenderWindow::ISA = qw( Graphics::VTK::XRenderWindow );

=head1 Graphics::VTK::MesaRenderWindow

=over 1

=item *

Inherits from XRenderWindow

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual void Frame (void );
   const char *GetClassName();
   int GetDepthBufferSize ();
   virtual int GetDesiredDepth ();
   virtual void *GetGenericContext ();
   virtual void *GetGenericWindowId ();
   virtual void Initialize (void );
   void MakeCurrent ();
   vtkMesaRenderWindow *New ();
   virtual void PrefFullScreen (void );
   void RegisterTextureResource (GLuint id);
   virtual void SetFullScreen (int );
   virtual void SetOffScreenRendering (int i);
   virtual void SetSize (int , int );
   virtual void SetStereoCapableWindow (int capable);
   virtual void Start (void );
   virtual void StereoUpdate ();
   virtual void WindowConfigure (void );
   virtual void WindowInitialize (void );
   virtual void WindowRemap (void );


B<vtkMesaRenderWindow Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual Colormap GetDesiredColormap ();
      Can't Handle ColorMap return type yet

   virtual Visual *GetDesiredVisual ();
      Can't Handle Visual return type yet

   virtual XVisualInfo *GetDesiredVisualInfo ();
      Can't Handle 'XVisualInfo *' return type yet

   virtual unsigned char *GetPixelData (int x, int y, int x2, int y2, int front);
      Can't Handle 'unsigned char *' return type without a hint

   virtual unsigned char *GetRGBACharPixelData (int x, int y, int x2, int y2, int front);
      Can't Handle 'unsigned char *' return type without a hint

   virtual float *GetRGBAPixelData (int x, int y, int x2, int y2, int front);
      Can't Handle 'float *' return type without a hint

   virtual float *GetZbufferData (int x1, int y1, int x2, int y2);
      Can't Handle 'float *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   virtual void SetPixelData (int x, int y, int x2, int y2, unsigned char *, int front);
      Don't know the size of pointer arg number 5

   virtual void SetRGBACharPixelData (int x, int y, int x2, int y2, unsigned char *, int front, int blend);
      Don't know the size of pointer arg number 5

   virtual void SetRGBAPixelData (int x, int y, int x2, int y2, float *, int front, int blend);
      Don't know the size of pointer arg number 5

   virtual void SetSize (int a[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void SetZbufferData (int x1, int y1, int x2, int y2, float *buffer);
      Don't know the size of pointer arg number 5


=cut

package Graphics::VTK::MesaRenderer;


@Graphics::VTK::MesaRenderer::ISA = qw( Graphics::VTK::Renderer );

=head1 Graphics::VTK::MesaRenderer

=over 1

=item *

Inherits from Renderer

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Clear (void );
   void ClearLights (void );
   void DeviceRender (void );
   const char *GetClassName();
   vtkMesaRenderer *New ();
   int UpdateLights (void );


B<vtkMesaRenderer Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::MesaTexture;


@Graphics::VTK::MesaTexture::ISA = qw( Graphics::VTK::Texture );

=head1 Graphics::VTK::MesaTexture

=over 1

=item *

Inherits from Texture

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   void Load (vtkRenderer *ren);
   vtkMesaTexture *New ();
   void ReleaseGraphicsResources (vtkWindow *);


B<vtkMesaTexture Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   unsigned char *ResampleToPowerOfTwo (int &xsize, int &ysize, unsigned char *dptr, int bpp);
      Can't Handle 'unsigned char *' return type without a hint


=cut

package Graphics::VTK::MesaVolumeTextureMapper2D;


@Graphics::VTK::MesaVolumeTextureMapper2D::ISA = qw( Graphics::VTK::VolumeTextureMapper2D );

=head1 Graphics::VTK::MesaVolumeTextureMapper2D

=over 1

=item *

Inherits from VolumeTextureMapper2D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkMesaVolumeTextureMapper2D *New ();


B<vtkMesaVolumeTextureMapper2D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent index);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::OpenGLActor;


@Graphics::VTK::OpenGLActor::ISA = qw( Graphics::VTK::Actor );

=head1 Graphics::VTK::OpenGLActor

=over 1

=item *

Inherits from Actor

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkOpenGLActor *New ();
   void Render (vtkRenderer *ren, vtkMapper *mapper);

=cut

package Graphics::VTK::OpenGLCamera;


@Graphics::VTK::OpenGLCamera::ISA = qw( Graphics::VTK::Camera );

=head1 Graphics::VTK::OpenGLCamera

=over 1

=item *

Inherits from Camera

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkOpenGLCamera *New ();
   void Render (vtkRenderer *ren);

=cut

package Graphics::VTK::OpenGLImageActor;


@Graphics::VTK::OpenGLImageActor::ISA = qw( Graphics::VTK::ImageActor );

=head1 Graphics::VTK::OpenGLImageActor

=over 1

=item *

Inherits from ImageActor

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   void Load (vtkRenderer *ren);
   vtkOpenGLImageActor *New ();
   void ReleaseGraphicsResources (vtkWindow *);


B<vtkOpenGLImageActor Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   unsigned char *MakeDataSuitable (int &xsize, int &ysize, int &release);
      Can't Handle 'unsigned char *' return type without a hint


=cut

package Graphics::VTK::OpenGLLight;


@Graphics::VTK::OpenGLLight::ISA = qw( Graphics::VTK::Light );

=head1 Graphics::VTK::OpenGLLight

=over 1

=item *

Inherits from Light

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkOpenGLLight *New ();
   void Render (vtkRenderer *ren, int light_index);

=cut

package Graphics::VTK::OpenGLPolyDataMapper;


@Graphics::VTK::OpenGLPolyDataMapper::ISA = qw( Graphics::VTK::PolyDataMapper );

=head1 Graphics::VTK::OpenGLPolyDataMapper

=over 1

=item *

Inherits from PolyDataMapper

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual void Draw (vtkRenderer *ren, vtkActor *a);
   const char *GetClassName();
   vtkOpenGLPolyDataMapper *New ();
   void ReleaseGraphicsResources (vtkWindow *);
   void Render (vtkRenderer *ren, vtkActor *a);

=cut

package Graphics::VTK::OpenGLProjectedPolyDataRayBounder;


@Graphics::VTK::OpenGLProjectedPolyDataRayBounder::ISA = qw( Graphics::VTK::ProjectedPolyDataRayBounder );

=head1 Graphics::VTK::OpenGLProjectedPolyDataRayBounder

=over 1

=item *

Inherits from ProjectedPolyDataRayBounder

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkOpenGLProjectedPolyDataRayBounder *New ();
   void ReleaseGraphicsResources (vtkWindow *);


B<vtkOpenGLProjectedPolyDataRayBounder Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float *Draw (vtkRenderer *ren, vtkMatrix4x4 *matrix);
      Can't Handle 'float *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::OpenGLProperty;


@Graphics::VTK::OpenGLProperty::ISA = qw( Graphics::VTK::Property );

=head1 Graphics::VTK::OpenGLProperty

=over 1

=item *

Inherits from Property

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BackfaceRender (vtkActor *a, vtkRenderer *ren);
   const char *GetClassName();
   vtkOpenGLProperty *New ();
   void Render (vtkActor *a, vtkRenderer *ren);

=cut

package Graphics::VTK::OpenGLRenderer;


@Graphics::VTK::OpenGLRenderer::ISA = qw( Graphics::VTK::Renderer );

=head1 Graphics::VTK::OpenGLRenderer

=over 1

=item *

Inherits from Renderer

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Clear (void );
   void ClearLights (void );
   void DeviceRender (void );
   const char *GetClassName();
   vtkOpenGLRenderer *New ();
   int UpdateLights (void );


B<vtkOpenGLRenderer Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::OpenGLTexture;


@Graphics::VTK::OpenGLTexture::ISA = qw( Graphics::VTK::Texture );

=head1 Graphics::VTK::OpenGLTexture

=over 1

=item *

Inherits from Texture

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   void Load (vtkRenderer *ren);
   vtkOpenGLTexture *New ();
   void ReleaseGraphicsResources (vtkWindow *);


B<vtkOpenGLTexture Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   unsigned char *ResampleToPowerOfTwo (int &xsize, int &ysize, unsigned char *dptr, int bpp);
      Can't Handle 'unsigned char *' return type without a hint


=cut

package Graphics::VTK::OpenGLVolumeTextureMapper2D;


@Graphics::VTK::OpenGLVolumeTextureMapper2D::ISA = qw( Graphics::VTK::VolumeTextureMapper2D );

=head1 Graphics::VTK::OpenGLVolumeTextureMapper2D

=over 1

=item *

Inherits from VolumeTextureMapper2D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkOpenGLVolumeTextureMapper2D *New ();


B<vtkOpenGLVolumeTextureMapper2D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent index);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::XRenderWindowInteractor;


@Graphics::VTK::XRenderWindowInteractor::ISA = qw( Graphics::VTK::RenderWindowInteractor );

=head1 Graphics::VTK::XRenderWindowInteractor

=over 1

=item *

Inherits from RenderWindowInteractor

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BreakLoopFlagOff ();
   void BreakLoopFlagOn ();
   int CreateTimer (int timertype);
   int DestroyTimer (void );
   virtual void Disable ();
   virtual void Enable ();
   int GetBreakLoopFlag ();
   const char *GetClassName();
   virtual void Initialize ();
   vtkXRenderWindowInteractor *New ();
   void SetBreakLoopFlag (int );
   virtual void Start ();
   void TerminateApp (void );


B<vtkXRenderWindowInteractor Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   Display *DisplayIdWindow WindowIdWidget topWidget oldTopXtAppContext Appint PositionBeforeStereo[2]Widget TopLevelShellint BreakLoopFlagXtIntervalId AddTimeOut (XtAppContext app_context, unsigned long erval, XtTimerCallbackProc proc, XtPointer client_data);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void Callback (Widget w, XtPointer client_data, XEvent *event, Boolean *ctd);
      Arg types of 'Widget' not supported yet
   XtAppContext GetApp ();
      Can't Handle XtAppContext return type yet

   virtual void GetMousePosition (int *x, int *y);
      Don't know the size of pointer arg number 1

   Widget GetTopLevelShell ();
      Can't Handle Widget return type yet

   Widget GetWidget ();
      Can't Handle Widget return type yet

   virtual void Initialize (XtAppContext app);
      Arg types of 'XtAppContext' not supported yet
   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   virtual void SetTopLevelShell (Widget );
      Arg types of 'Widget' not supported yet
   virtual void SetWidget (Widget );
      Arg types of 'Widget' not supported yet
   void Timer (XtPointer client_data, XtIntervalId *id);
      Don't know the size of pointer arg number 2

   void vtkXRenderWindowInteractorCallback (Widget , XtPointer , XEvent *, Boolean *);
      Arg types of 'Widget' not supported yet
   void vtkXRenderWindowInteractorTimer (XtPointer , XtIntervalId *);
      Don't know the size of pointer arg number 2


=cut

package Graphics::VTK::Win32OpenGLRenderWindow;


@Graphics::VTK::Win32OpenGLRenderWindow::ISA = qw( Graphics::VTK::RenderWindow );

=head1 Graphics::VTK::Win32OpenGLRenderWindow

=over 1

=item *

Inherits from RenderWindow

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Clean ();
   void Frame (void );
   const char *GetClassName();
   int GetDepthBufferSize ();
   virtual int GetEventPending ();
   int GetMultiSamples ();
   void HideCursor ();
   virtual void Initialize (void );
   void MakeCurrent ();
   vtkWin32OpenGLRenderWindow *New ();
   virtual void OpenGLInit ();
   virtual void PrefFullScreen (void );
   void RegisterTextureResource (GLuint id);
   void ResumeScreenRendering ();
   virtual void SetFullScreen (int );
   void SetMultiSamples (int );
   virtual void SetPosition (int , int );
   virtual void SetSize (int , int );
   virtual void SetStereoCapableWindow (int capable);
   void SetWindowInfo (char *);
   virtual void SetWindowName (char *);
   void SetupMemoryRendering (int x, int y, HDC prn);
   virtual void SetupPalette (HDC hDC);
   virtual void SetupPixelFormat (HDC hDC, DWORD dwFlags, int debug, int bpp, int zbpp);
   void ShowCursor ();
   void Start (void );
   virtual void StereoUpdate ();
   virtual void WindowConfigure (void );
   virtual void WindowInitialize (void );
   virtual void WindowRemap (void );


B<vtkWin32OpenGLRenderWindow Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   HDC GetMemoryDC ();
      Can't Handle HDC return type yet

   unsigned char *GetMemoryData ();
      Can't Handle 'unsigned char *' return type without a hint

   virtual unsigned char *GetPixelData (int x, int y, int x2, int y2, int front);
      Can't Handle 'unsigned char *' return type without a hint

   virtual int *GetPosition ();
      Can't Handle 'int *' return type without a hint

   virtual unsigned char *GetRGBACharPixelData (int x, int y, int x2, int y2, int front);
      Can't Handle 'unsigned char *' return type without a hint

   virtual float *GetRGBAPixelData (int x, int y, int x2, int y2, int front);
      Can't Handle 'float *' return type without a hint

   virtual int *GetScreenSize ();
      Can't Handle 'int *' return type without a hint

   virtual int *GetSize ();
      Can't Handle 'int *' return type without a hint

   virtual float *GetZbufferData (int x1, int y1, int x2, int y2);
      Can't Handle 'float *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   virtual void ReleaseRGBAPixelData (float *data);
      Don't know the size of pointer arg number 1

   virtual void SetPixelData (int x, int y, int x2, int y2, unsigned char *, int front);
      Don't know the size of pointer arg number 5

   virtual void SetRGBACharPixelData (int x, int y, int x2, int y2, unsigned char *, int front, int blend);
      Don't know the size of pointer arg number 5

   virtual void SetRGBAPixelData (int x, int y, int x2, int y2, float *, int front, int blend);
      Don't know the size of pointer arg number 5

   virtual void SetZbufferData (int x1, int y1, int x2, int y2, float *buffer);
      Don't know the size of pointer arg number 5


=cut

package Graphics::VTK::Win32RenderWindowInteractor;


@Graphics::VTK::Win32RenderWindowInteractor::ISA = qw( Graphics::VTK::RenderWindowInteractor );

=head1 Graphics::VTK::Win32RenderWindowInteractor

=over 1

=item *

Inherits from RenderWindowInteractor

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int CreateTimer (int timertype);
   int DestroyTimer (void );
   virtual void Disable ();
   virtual void Enable ();
   virtual void ExitCallback ();
   const char *GetClassName();
   int GetInstallMessageProc ();
   virtual void Initialize ();
   void InstallMessageProcOff ();
   void InstallMessageProcOn ();
   vtkWin32RenderWindowInteractor *New ();
   void SetClassExitMethod (void (*func)(void *) , void *arg);
   void SetInstallMessageProc (int );
   virtual void Start ();
   void TerminateApp (void );


B<vtkWin32RenderWindowInteractor Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetClassExitMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

1;
