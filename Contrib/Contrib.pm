
package Graphics::VTK::Contrib;
use 5.004;
use strict;
use Carp;

use vars qw/ $VERSION @ISA/;

require DynaLoader;

$VERSION = '3.2.001';

@ISA = qw/ DynaLoader /;

bootstrap Graphics::VTK::Contrib $VERSION;


=head1 NAME

VTKContrib  - A Perl interface to VTKContrib library

=head1 SYNOPSIS

C<use Graphics::VTK;>
C<use Graphics::VTK::Contrib;>

=head1 DESCRIPTION

Graphics::VTK::Contrib is an interface to the Contrib libaray of the C++ visualization toolkit VTK..

=head1 AUTHOR

Original PerlVTK Package: Roberto De Leo <rdl@math.umd.edu>

Additional Refinements: John Cerney <j-cerney1@raytheon.com>

=cut

package Graphics::VTK::ArcPlotter;


@Graphics::VTK::ArcPlotter::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::ArcPlotter

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   vtkCamera *GetCamera ();
   const char *GetClassName();
   float  *GetDefaultNormal ();
      (Returns a 3-element Perl list)
   int GetFieldDataArray ();
   float GetHeight ();
   unsigned long GetMTime ();
   float GetOffset ();
   int GetPlotComponent ();
   int GetPlotMode ();
   float GetRadius ();
   int GetUseDefaultNormal ();
   vtkArcPlotter *New ();
   void SetCamera (vtkCamera *);
   void SetDefaultNormal (float  , float , float );
   void SetFieldDataArray (int );
   void SetHeight (float );
   void SetOffset (float );
   void SetPlotComponent (int );
   void SetPlotMode (int );
   void SetPlotModeToPlotFieldData ();
   void SetPlotModeToPlotNormals ();
   void SetPlotModeToPlotScalars ();
   void SetPlotModeToPlotTCoords ();
   void SetPlotModeToPlotTensors ();
   void SetPlotModeToPlotVectors ();
   void SetRadius (float );
   void SetUseDefaultNormal (int );
   void UseDefaultNormalOff ();
   void UseDefaultNormalOn ();


B<vtkArcPlotter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int OffsetPoint (int ptId, vtkPoints *inPts, float n[3], vtkPoints *newPts, float offset, float *range, float val);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetDefaultNormal (float  a[3]);
      Method is redundant. Same as SetDefaultNormal( float, float, float)


=cut

package Graphics::VTK::BranchExtentTranslator;


@Graphics::VTK::BranchExtentTranslator::ISA = qw( Graphics::VTK::ExtentTranslator );

=head1 Graphics::VTK::BranchExtentTranslator

=over 1

=item *

Inherits from ExtentTranslator

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int GetAssignedNumberOfPieces ();
   int GetAssignedPiece ();
   const char *GetClassName();
   vtkImageData *GetOriginalSource ();
   vtkBranchExtentTranslator *New ();
   int PieceToExtent ();
   void SetAssignedNumberOfPieces (int );
   void SetAssignedPiece (int );
   void SetOriginalSource (vtkImageData *);


B<vtkBranchExtentTranslator Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::CellDerivatives;


@Graphics::VTK::CellDerivatives::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::CellDerivatives

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetTensorMode ();
   char *GetTensorModeAsString ();
   int GetVectorMode ();
   char *GetVectorModeAsString ();
   vtkCellDerivatives *New ();
   void SetTensorMode (int );
   void SetTensorModeToComputeGradient ();
   void SetTensorModeToComputeStrain ();
   void SetTensorModeToPassTensors ();
   void SetVectorMode (int );
   void SetVectorModeToComputeGradient ();
   void SetVectorModeToComputeVorticity ();
   void SetVectorModeToPassVectors ();


B<vtkCellDerivatives Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::CubeAxesActor2D;


@Graphics::VTK::CubeAxesActor2D::ISA = qw( Graphics::VTK::Actor2D );

=head1 Graphics::VTK::CubeAxesActor2D

=over 1

=item *

Inherits from Actor2D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BoldOff ();
   void BoldOn ();
   int GetBold ();
   void GetBounds (float &xmin, float &xmax, float &ymin, float &ymax, float &zmin, float &zmax);
   float *GetBounds ();
      (Returns a 6-element Perl list)
   vtkCamera *GetCamera ();
   const char *GetClassName();
   float GetCornerOffset ();
   int GetFlyMode ();
   float GetFontFactor ();
   int GetFontFamily ();
   float GetInertia ();
   vtkDataSet *GetInput ();
   int GetItalic ();
   char *GetLabelFormat ();
   int GetNumberOfLabels ();
   vtkProp *GetProp ();
   int GetScaling ();
   int GetShadow ();
   int GetXAxisVisibility ();
   char *GetXLabel ();
   int GetYAxisVisibility ();
   char *GetYLabel ();
   int GetZAxisVisibility ();
   char *GetZLabel ();
   void ItalicOff ();
   void ItalicOn ();
   vtkCubeAxesActor2D *New ();
   void ReleaseGraphicsResources (vtkWindow *);
   int RenderOpaqueGeometry (vtkViewport *);
   int RenderOverlay (vtkViewport *);
   int RenderTranslucentGeometry (vtkViewport *);
   void ScalingOff ();
   void ScalingOn ();
   void SetBold (int );
   void SetBounds (float  , float , float , float , float , float );
   void SetCamera (vtkCamera *);
   void SetCornerOffset (float );
   void SetFlyMode (int );
   void SetFlyModeToClosestTriad ();
   void SetFlyModeToOuterEdges ();
   void SetFontFactor (float );
   void SetFontFamily (int );
   void SetFontFamilyToArial ();
   void SetFontFamilyToCourier ();
   void SetFontFamilyToTimes ();
   void SetInertia (int );
   void SetInput (vtkDataSet *);
   void SetItalic (int );
   void SetLabelFormat (char *);
   void SetNumberOfLabels (int );
   void SetProp (vtkProp *);
   void SetScaling (int );
   void SetShadow (int );
   void SetXAxisVisibility (int );
   void SetXLabel (char *);
   void SetYAxisVisibility (int );
   void SetYLabel (char *);
   void SetZAxisVisibility (int );
   void SetZLabel (char *);
   void ShadowOff ();
   void ShadowOn ();
   void ShallowCopy (vtkCubeAxesActor2D *actor);
   void XAxisVisibilityOff ();
   void XAxisVisibilityOn ();
   void YAxisVisibilityOff ();
   void YAxisVisibilityOn ();
   void ZAxisVisibilityOff ();
   void ZAxisVisibilityOn ();


B<vtkCubeAxesActor2D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void AdjustAxes (float pts[8][3], float bounds[6], int idx, int xIdx, int yIdx, int zIdx, int zIdx2, int xAxes, int yAxes, int zAxes, float xCoords[4], float yCoords[4], float zCoords[4], float xRange[2], float yRange[2], float zRange[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int ClipBounds (vtkViewport *viewport, float pts[8][3], float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float EvaluateBounds (float planes[24], float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float EvaluatePoint (float planes[24], float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetBounds (float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetBounds (float  a[6]);
      Method is redundant. Same as SetBounds( float, float, float, float, float, float)

   vtkDataSet *InputvtkProp *Propfloat Bounds[6]vtkCamera *Cameraint FlyModeint ScalingvtkAxisActor2D *XAxisvtkAxisActor2D *YAxisvtkAxisActor2D *ZAxisint NumberOfLabelschar *XLabelchar *YLabelchar *ZLabelchar *Labels[3]int XAxisVisibilityint YAxisVisibilityint ZAxisVisibilityint Boldint Italicint Shadowint FontFamilychar *LabelFormatfloat FontFactorfloat CornerOffsetint Inertiaint RenderCountint InertiaAxes[8]int RenderSomethingvoid TransformBounds (vtkViewport *viewport, float bounds[6], float pts[8][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::DEMReader;


@Graphics::VTK::DEMReader::ISA = qw( Graphics::VTK::ImageSource );

=head1 Graphics::VTK::DEMReader

=over 1

=item *

Inherits from ImageSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ExecuteInformation ();
   int GetAccuracyCode ();
   const char *GetClassName();
   int GetDEMLevel ();
   float  *GetElevationBounds ();
      (Returns a 2-element Perl list)
   int GetElevationPattern ();
   int GetElevationUnitOfMeasure ();
   char *GetFileName ();
   int GetGroundSystem ();
   int GetGroundZone ();
   float GetLocalRotation ();
   char *GetMapLabel ();
   int GetPlaneUnitOfMeasure ();
   int GetPolygonSize ();
   int  *GetProfileDimension ();
      (Returns a 2-element Perl list)
   float  *GetProjectionParameters ();
      (Returns a 15-element Perl list)
   float  *GetSpatialResolution ();
      (Returns a 3-element Perl list)
   vtkDEMReader *New ();
   void SetFileName (char *);


B<vtkDEMReader Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   vtkTimeStamp ReadHeaderTimeint NumberOfColumnsint NumberOfRowsint WholeExtent[6]char *FileNamechar MapLabel[145]int DEMLevelint ElevationPatternint GroundSystemint GroundZonefloat ProjectionParameters[15]int PlaneUnitOfMeasureint ElevationUnitOfMeasureint PolygonSizefloat GroundCoords[4][2]float ElevationBounds[2]float LocalRotationint AccuracyCodefloat SpatialResolution[3]int ProfileDimension[2]int ProfileSeekOffsetvoid ComputeExtentOriginAndSpacing (int extent[6], float origin[6], float spacing[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::DepthSortPolyData;


@Graphics::VTK::DepthSortPolyData::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::DepthSortPolyData

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   vtkCamera *GetCamera ();
   const char *GetClassName();
   int GetDirection ();
   unsigned long GetMTime ();
   double  *GetOrigin ();
      (Returns a 3-element Perl list)
   vtkProp3D *GetProp3D ();
   int GetSortScalars ();
   double  *GetVector ();
      (Returns a 3-element Perl list)
   vtkDepthSortPolyData *New ();
   void SetCamera (vtkCamera *);
   void SetDirection (int );
   void SetDirectionToBackToFront ();
   void SetDirectionToFrontToBack ();
   void SetDirectionToSpecifiedVector ();
   void SetOrigin (double  , double , double );
   void SetProp3D (vtkProp3D *);
   void SetSortScalars (int );
   void SetVector (double  , double , double );
   void SortScalarsOff ();
   void SortScalarsOn ();


B<vtkDepthSortPolyData Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeProjectionVector (double vector[3], double origin[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetOrigin (double  a[3]);
      Method is redundant. Same as SetOrigin( double, double, double)

   void SetVector (double  a[3]);
      Method is redundant. Same as SetVector( double, double, double)


=cut

package Graphics::VTK::EarthSource;


@Graphics::VTK::EarthSource::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::EarthSource

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetOnRatio ();
   int GetOutline ();
   float GetRadius ();
   vtkEarthSource *New ();
   void OutlineOff ();
   void OutlineOn ();
   void SetOnRatio (int );
   void SetOutline (int );
   void SetRadius (float );


B<vtkEarthSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::GetRemoteGhostCells;


@Graphics::VTK::GetRemoteGhostCells::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::GetRemoteGhostCells

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkMultiProcessController *GetController ();
   vtkGetRemoteGhostCells *New ();
   void SetController (vtkMultiProcessController *);


B<vtkGetRemoteGhostCells Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::GridTransform;


@Graphics::VTK::GridTransform::ISA = qw( Graphics::VTK::WarpTransform );

=head1 Graphics::VTK::GridTransform

=over 1

=item *

Inherits from WarpTransform

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageData *GetDisplacementGrid ();
   float GetDisplacementScale ();
   float GetDisplacementShift ();
   int GetInterpolationMode ();
   char *GetInterpolationModeAsString ();
   unsigned long GetMTime ();
   vtkAbstractTransform *MakeTransform ();
   vtkGridTransform *New ();
   void SetDisplacementGrid (vtkImageData *);
   void SetDisplacementScale (float );
   void SetDisplacementShift (float );
   void SetInterpolationMode (int mode);
   void SetInterpolationModeToCubic ();
   void SetInterpolationModeToLinear ();
   void SetInterpolationModeToNearestNeighbor ();


B<vtkGridTransform Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ForwardTransformDerivative (float in[3], float out[3], float derivative[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ForwardTransformDerivative (double in[3], double out[3], double derivative[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ForwardTransformPoint (float in[3], float out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ForwardTransformPoint (double in[3], double out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InverseTransformDerivative (float in[3], float out[3], float derivative[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InverseTransformDerivative (double in[3], double out[3], double derivative[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InverseTransformPoint (float in[3], float out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InverseTransformPoint (double in[3], double out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ImageToPolyDataFilter;


@Graphics::VTK::ImageToPolyDataFilter::ISA = qw( Graphics::VTK::StructuredPointsToPolyDataFilter );

=head1 Graphics::VTK::ImageToPolyDataFilter

=over 1

=item *

Inherits from StructuredPointsToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void DecimationOff ();
   void DecimationOn ();
   const char *GetClassName();
   int GetColorMode ();
   int GetDecimation ();
   float GetDecimationError ();
   int GetError ();
   vtkScalarsToColors *GetLookupTable ();
   int GetNumberOfSmoothingIterations ();
   int GetOutputStyle ();
   int GetSmoothing ();
   int GetSubImageSize ();
   vtkImageToPolyDataFilter *New ();
   void SetColorMode (int );
   void SetColorModeToLUT ();
   void SetColorModeToLinear256 ();
   void SetDecimation (int );
   void SetDecimationError (float );
   void SetError (int );
   void SetLookupTable (vtkScalarsToColors *);
   void SetNumberOfSmoothingIterations (int );
   void SetOutputStyle (int );
   void SetOutputStyleToPixelize ();
   void SetOutputStyleToPolygonalize ();
   void SetOutputStyleToRunLength ();
   void SetSmoothing (int );
   void SetSubImageSize (int );
   void SmoothingOff ();
   void SmoothingOn ();


B<vtkImageToPolyDataFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int BuildEdges (vtkUnsignedCharArray *pixels, int dims[3], float origin[3], float spacing[3], vtkUnsignedCharArray *pointDescr, vtkPolyData *edges);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   vtkUnsignedCharArray *TablevtkTimeStamp TableMTimeint *VisitedvtkUnsignedCharArray *PolyColorsvtkEdgeTable *EdgeTablevtkEdgeTable *EdgeUseTablevtkIntArray *EdgeUsesvtkAppendPolyData *Appendvoid BuildTable (unsigned char *inPixels);
      Don't know the size of pointer arg number 1

   unsigned char *GetColor (unsigned char *rgb);
      Can't Handle 'unsigned char *' return type without a hint

   void GetIJ (int id, int &i, int &j, int dims[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int GetNeighbors (unsigned char *ptr, int &i, int &j, int dims[3], unsigned char *neighbors[4], int mode);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int IsSameColor (unsigned char *p1, unsigned char *p2);
      Don't know the size of pointer arg number 1

   virtual int OutputStyleint ColorModeint Smoothingint NumberOfSmoothingIterationsint Decimationfloat DecimationErrorint Errorint SubImageSizevtkScalarsToColors *LookupTablevoid PixelizeImage (vtkUnsignedCharArray *pixels, int dims[3], float origin[3], float spacing[3], vtkPolyData *output);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void PolygonalizeImage (vtkUnsignedCharArray *pixels, int dims[3], float origin[3], float spacing[3], vtkPolyData *output);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   int ProcessImage (vtkUnsignedCharArray *pixels, int dims[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   vtkUnsignedCharArray *QuantizeImage (vtkScalars *inScalars, int numComp, int type, int dims[3], int ext[4]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void RunLengthImage (vtkUnsignedCharArray *pixels, int dims[3], float origin[3], float spacing[3], vtkPolyData *output);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageReslice;


@Graphics::VTK::ImageReslice::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageReslice

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float  *GetBackgroundColor ();
      (Returns a 4-element Perl list)
   float GetBackgroundLevel ();
   const char *GetClassName();
   int GetInterpolate ();
   int GetInterpolationMode ();
   char *GetInterpolationModeAsString ();
   unsigned long GetMTime ();
   int GetMirror ();
   int GetOptimization ();
   int GetOutputAlwaysCenteredOnInput ();
   int  *GetOutputExtent ();
      (Returns a 6-element Perl list)
   float  *GetOutputOrigin ();
      (Returns a 3-element Perl list)
   float  *GetOutputSpacing ();
      (Returns a 3-element Perl list)
   vtkMatrix4x4 *GetResliceAxes ();
   vtkAbstractTransform *GetResliceTransform ();
   int GetWrap ();
   void InterpolateOff ();
   void InterpolateOn ();
   void MirrorOff ();
   void MirrorOn ();
   vtkImageReslice *New ();
   void OptimizationOff ();
   void OptimizationOn ();
   void OutputAlwaysCenteredOnInputOff ();
   void OutputAlwaysCenteredOnInputOn ();
   void SetBackgroundColor (float  , float , float , float );
   void SetBackgroundLevel (float v);
   void SetInterpolate (int t);
   void SetInterpolationMode (int );
   void SetInterpolationModeToCubic ();
   void SetInterpolationModeToLinear ();
   void SetInterpolationModeToNearestNeighbor ();
   void SetMirror (int );
   void SetOptimization (int );
   void SetOutputAlwaysCenteredOnInput (int );
   void SetOutputExtent (int  , int , int , int , int , int );
   void SetOutputOrigin (float  , float , float );
   void SetOutputSpacing (float  , float , float );
   void SetResliceAxes (vtkMatrix4x4 *);
   void SetResliceTransform (vtkAbstractTransform *);
   void SetWrap (int );
   void WrapOff ();
   void WrapOn ();


B<vtkImageReslice Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeInputUpdateExtent (int inExt[6], int outExt[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   vtkMatrix4x4 *ResliceAxesvtkAbstractTransform *ResliceTransformvtkMatrix4x4 *IndexMatrixint Wrapint Mirrorint InterpolationModeint Optimizationfloat BackgroundColor[4]float OutputOrigin[3]float OutputSpacing[3]int OutputExtent[6]int OutputAlwaysCenteredOnInputvoid ExecuteInformation (vtkImageData *input, vtkImageData *output);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void OptimizedComputeInputUpdateExtent (int inExt[6], int outExt[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void OptimizedThreadedExecute (vtkImageData *inData, vtkImageData *outData, int ext[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetBackgroundColor (float  a[4]);
      Method is redundant. Same as SetBackgroundColor( float, float, float, float)

   void SetOutputExtent (int  a[6]);
      Method is redundant. Same as SetOutputExtent( int, int, int, int, int, int)

   void SetOutputOrigin (float  a[3]);
      Method is redundant. Same as SetOutputOrigin( float, float, float)

   void SetOutputSpacing (float  a[3]);
      Method is redundant. Same as SetOutputSpacing( float, float, float)

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int ext[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::IVWriter;


@Graphics::VTK::IVWriter::ISA = qw( Graphics::VTK::PolyDataWriter );

=head1 Graphics::VTK::IVWriter

=over 1

=item *

Inherits from PolyDataWriter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkIVWriter *New ();


B<vtkIVWriter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void WritePolyData (vtkPolyData *polyData, FILE *fp);
      Don't know the size of pointer arg number 2


=cut

package Graphics::VTK::LandmarkTransform;


@Graphics::VTK::LandmarkTransform::ISA = qw( Graphics::VTK::LinearTransform );

=head1 Graphics::VTK::LandmarkTransform

=over 1

=item *

Inherits from LinearTransform

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   unsigned long GetMTime ();
   int GetMode ();
   char *GetModeAsString ();
   vtkPoints *GetSourceLandmarks ();
   vtkPoints *GetTargetLandmarks ();
   void Inverse ();
   vtkAbstractTransform *MakeTransform ();
   vtkLandmarkTransform *New ();
   void SetMode (int );
   void SetModeToRigidBody ();
   void SetModeToSimilarity ();
   void SetSourceLandmarks (vtkPoints *points);
   void SetTargetLandmarks (vtkPoints *points);


B<vtkLandmarkTransform Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::LegendBoxActor;


@Graphics::VTK::LegendBoxActor::ISA = qw( Graphics::VTK::Actor2D );

=head1 Graphics::VTK::LegendBoxActor

=over 1

=item *

Inherits from Actor2D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BoldOff ();
   void BoldOn ();
   void BorderOff ();
   void BorderOn ();
   int GetBold ();
   int GetBorder ();
   const char *GetClassName();
   char *GetEntryString (int i);
   vtkPolyData *GetEntrySymbol (int i);
   int GetFontFamily ();
   int GetItalic ();
   int GetLockBorder ();
   int GetNumberOfEntries ();
   int GetPadding ();
   int GetScalarVisibility ();
   int GetShadow ();
   void ItalicOff ();
   void ItalicOn ();
   void LockBorderOff ();
   void LockBorderOn ();
   vtkLegendBoxActor *New ();
   void ScalarVisibilityOff ();
   void ScalarVisibilityOn ();
   void SetBold (int );
   void SetBorder (int );
   void SetEntryColor (int i, float r, float g, float b);
   void SetEntryString (int i, char *string);
   void SetEntrySymbol (int i, vtkPolyData *symbol);
   void SetFontFamily (int );
   void SetFontFamilyToArial ();
   void SetFontFamilyToCourier ();
   void SetFontFamilyToTimes ();
   void SetItalic (int );
   void SetLockBorder (int );
   void SetNumberOfEntries (int num);
   void SetPadding (int );
   void SetScalarVisibility (int );
   void SetShadow (int );
   void ShadowOff ();
   void ShadowOn ();
   void ShallowCopy (vtkProp *prop);


B<vtkLegendBoxActor Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float *GetEntryColor (int i);
      Can't Handle 'float *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetEntry (int i, vtkPolyData *symbol, char *string, float color[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetEntryColor (int i, float color[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::LightKit;


@Graphics::VTK::LightKit::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::LightKit

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddLightsToRenderer (vtkRenderer *renderer);
   void DeepCopy (vtkLightKit *kit);
   const char *GetClassName();
   float  *GetFillLightAngle ();
      (Returns a 2-element Perl list)
   float GetFillLightAzimuth ();
   float  *GetFillLightColor ();
      (Returns a 3-element Perl list)
   float GetFillLightElevation ();
   float GetFillLightWarmth ();
   float  *GetHeadlightColor ();
      (Returns a 3-element Perl list)
   float GetHeadlightWarmth ();
   float  *GetKeyLightAngle ();
      (Returns a 2-element Perl list)
   float GetKeyLightAzimuth ();
   float  *GetKeyLightColor ();
      (Returns a 3-element Perl list)
   float GetKeyLightElevation ();
   float GetKeyLightIntensity ();
   float GetKeyLightWarmth ();
   float GetKeyToFillRatio ();
   float GetKeyToHeadRatio ();
   int GetMaintainLuminance ();
   void MaintainLuminanceOff ();
   void MaintainLuminanceOn ();
   void Modified ();
   vtkLightKit *New ();
   void RemoveLightsFromRenderer (vtkRenderer *renderer);
   void SetFillLightAngle (float elevation, float azimuth);
   void SetFillLightAzimuth (float x);
   void SetFillLightElevation (float x);
   void SetFillLightWarmth (float );
   void SetHeadlightWarmth (float );
   void SetKeyLightAngle (float elevation, float azimuth);
   void SetKeyLightAzimuth (float x);
   void SetKeyLightElevation (float x);
   void SetKeyLightIntensity (float );
   void SetKeyLightWarmth (float );
   void SetKeyToFillRatio (float );
   void SetKeyToHeadRatio (float );
   void SetMaintainLuminance (int );
   void Update ();


B<vtkLightKit Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetFillLightAngle (float angle[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetKeyLightAngle (float angle[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void WarmthToRGB (float w, float rgb[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void WarmthToRGBI (float w, float rgb[3], float &i);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::MassProperties;


@Graphics::VTK::MassProperties::ISA = qw( Graphics::VTK::ProcessObject );

=head1 Graphics::VTK::MassProperties

=over 1

=item *

Inherits from ProcessObject

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Execute ();
   const char *GetClassName();
   vtkPolyData *GetInput ();
   double GetKx ();
   double GetKy ();
   double GetKz ();
   double GetNormalizedShapeIndex ();
   double GetSurfaceArea ();
   double GetVolume ();
   double GetVolumeX ();
   double GetVolumeY ();
   double GetVolumeZ ();
   vtkMassProperties *New ();
   void SetInput (vtkPolyData *input);
   void Update ();


B<vtkMassProperties Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::MultiProcessController;


@Graphics::VTK::MultiProcessController::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::MultiProcessController

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ForceDeepCopyOff ();
   void ForceDeepCopyOn ();
   int GetBreakFlag ();
   const char *GetClassName();
   int GetForceDeepCopy ();
   vtkMultiProcessController *GetGlobalController ();
   virtual int GetLocalProcessId ();
   int GetNumberOfProcesses ();
   float GetReadTime ();
   float GetReceiveTime ();
   float GetReceiveWaitTime ();
   float GetSendTime ();
   float GetSendWaitTime ();
   float GetWriteTime ();
   virtual void MultipleMethodExecute () = 0;
   vtkMultiProcessController *New ();
   void ProcessRMIs ();
   virtual int Receive (char *data, int length, int remoteProcessId, int tag) = 0;
   virtual int Receive (vtkDataObject *data, int remoteProcessId, int tag);
   virtual int Send (char *data, int length, int remoteProcessId, int tag) = 0;
   virtual int Send (vtkDataObject *data, int remoteProcessId, int tag);
   void SetBreakFlag (int );
   void SetForceDeepCopy (int );
   virtual void SetNumberOfProcesses (int num);
   virtual void SingleMethodExecute () = 0;
   void TriggerRMI (int remoteProcessId, char *arg, int tag);
   void TriggerRMI (int remoteProcessId, int tag);


B<vtkMultiProcessController Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int MaximumNumberOfProcessesint NumberOfProcessesint LocalProcessIdvtkProcessFunctionType SingleMethodvoid *SingleDatavtkProcessFunctionType MultipleMethodVTK_MP_CONTROLLER_MAX_PROCESSES []void *MultipleDataVTK_MP_CONTROLLER_MAX_PROCESSES []vtkCollection *RMIschar *MarshalStringint MarshalStringLengthint MarshalDataLengthint BreakFlagvoid DeleteAndSetMarshalString (char *str, int strLength);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void Initialize (int , char *arcv[]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ProcessRMI (int remoteProcessId, void *arg, int argLength, int rmiTag);
      Don't know the size of pointer arg number 2

   virtual int Receive (int *data, int length, int remoteProcessId, int tag) = 0;
      Don't know the size of pointer arg number 1

   virtual int Receive (unsigned long *data, int length, int remoteProcessId, int tag) = 0;
      Don't know the size of pointer arg number 1

   virtual int Receive (float *data, int length, int remoteProcessId, int tag) = 0;
      Don't know the size of pointer arg number 1

   virtual int Send (int *data, int length, int remoteProcessId, int tag) = 0;
      Don't know the size of pointer arg number 1

   virtual int Send (unsigned long *data, int length, int remoteProcessId, int tag) = 0;
      Don't know the size of pointer arg number 1

   virtual int Send (float *data, int length, int remoteProcessId, int tag) = 0;
      Don't know the size of pointer arg number 1

   void TriggerRMI (int remoteProcessId, void *arg, int argLength, int tag);
      Don't know the size of pointer arg number 2


=cut

package Graphics::VTK::OBJReader;


@Graphics::VTK::OBJReader::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::OBJReader

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   char *GetFileName ();
   vtkOBJReader *New ();
   void SetFileName (char *);


B<vtkOBJReader Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::OutlineCornerFilter;


@Graphics::VTK::OutlineCornerFilter::ISA = qw( Graphics::VTK::DataSetToPolyDataFilter );

=head1 Graphics::VTK::OutlineCornerFilter

=over 1

=item *

Inherits from DataSetToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetCornerFactor ();
   vtkOutlineCornerFilter *New ();
   void SetCornerFactor (float );


B<vtkOutlineCornerFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::OutlineCornerSource;


@Graphics::VTK::OutlineCornerSource::ISA = qw( Graphics::VTK::OutlineSource );

=head1 Graphics::VTK::OutlineCornerSource

=over 1

=item *

Inherits from OutlineSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetCornerFactor ();
   vtkOutlineCornerSource *New ();
   void SetCornerFactor (float );


B<vtkOutlineCornerSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::PieceScalars;


@Graphics::VTK::PieceScalars::ISA = qw( Graphics::VTK::PolyDataToPolyDataFilter );

=head1 Graphics::VTK::PieceScalars

=over 1

=item *

Inherits from PolyDataToPolyDataFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkPieceScalars *New ();


B<vtkPieceScalars Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ProjectedTexture;


@Graphics::VTK::ProjectedTexture::ISA = qw( Graphics::VTK::DataSetToDataSetFilter );

=head1 Graphics::VTK::ProjectedTexture

=over 1

=item *

Inherits from DataSetToDataSetFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float  *GetAspectRatio ();
      (Returns a 3-element Perl list)
   const char *GetClassName();
   float  *GetFocalPoint ();
      (Returns a 3-element Perl list)
   float  *GetOrientation ();
      (Returns a 3-element Perl list)
   float  *GetPosition ();
      (Returns a 3-element Perl list)
   float  *GetSRange ();
      (Returns a 2-element Perl list)
   float  *GetTRange ();
      (Returns a 2-element Perl list)
   float  *GetUp ();
      (Returns a 3-element Perl list)
   vtkProjectedTexture *New ();
   void SetAspectRatio (float  , float , float );
   void SetFocalPoint (float x, float y, float z);
   void SetPosition (float  , float , float );
   void SetSRange (float  , float );
   void SetTRange (float  , float );
   void SetUp (float  , float , float );


B<vtkProjectedTexture Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetAspectRatio (float  a[3]);
      Method is redundant. Same as SetAspectRatio( float, float, float)

   void SetFocalPoint (float focalPoint[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetPosition (float  a[3]);
      Method is redundant. Same as SetPosition( float, float, float)

   void SetSRange (float  a[2]);
      Method is redundant. Same as SetSRange( float, float)

   void SetTRange (float  a[2]);
      Method is redundant. Same as SetTRange( float, float)

   void SetUp (float  a[3]);
      Method is redundant. Same as SetUp( float, float, float)


=cut

package Graphics::VTK::RenderLargeImage;


@Graphics::VTK::RenderLargeImage::ISA = qw( Graphics::VTK::ImageSource );

=head1 Graphics::VTK::RenderLargeImage

=over 1

=item *

Inherits from ImageSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkRenderer *GetInput ();
   int GetMagnification ();
   vtkRenderLargeImage *New ();
   void SetInput (vtkRenderer *);
   void SetMagnification (int );


B<vtkRenderLargeImage Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::RIBExporter;


@Graphics::VTK::RIBExporter::ISA = qw( Graphics::VTK::Exporter );

=head1 Graphics::VTK::RIBExporter

=over 1

=item *

Inherits from Exporter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BackgroundOff ();
   void BackgroundOn ();
   int GetBackground ();
   const char *GetClassName();
   char *GetFilePrefix ();
   int  *GetPixelSamples ();
      (Returns a 2-element Perl list)
   int  *GetSize ();
      (Returns a 2-element Perl list)
   char *GetTexturePrefix ();
   vtkRIBExporter *New ();
   void SetBackground (int );
   void SetFilePrefix (char *);
   void SetPixelSamples (int  , int );
   void SetSize (int  , int );
   void SetTexturePrefix (char *);


B<vtkRIBExporter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetPixelSamples (int  a[2]);
      Method is redundant. Same as SetPixelSamples( int, int)

   void SetSize (int  a[2]);
      Method is redundant. Same as SetSize( int, int)

   int Backgroundint Size[2]int PixelSamples[2]void WriteHeader (vtkRenderer *aRen);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void WriteViewport (vtkRenderer *aRenderer, int size[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::RIBLight;


@Graphics::VTK::RIBLight::ISA = qw( Graphics::VTK::Light );

=head1 Graphics::VTK::RIBLight

=over 1

=item *

Inherits from Light

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetShadows ();
   vtkRIBLight *New ();
   void Render (vtkRenderer *ren, int index);
   void SetShadows (int );
   void ShadowsOff ();
   void ShadowsOn ();


B<vtkRIBLight Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::RIBProperty;


@Graphics::VTK::RIBProperty::ISA = qw( Graphics::VTK::Property );

=head1 Graphics::VTK::RIBProperty

=over 1

=item *

Inherits from Property

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddParameter (char *parameter, char *value);
   void AddVariable (char *variable, char *declaration);
   const char *GetClassName();
   char *GetDeclarations ();
   char *GetDisplacementShader ();
   char *GetParameters ();
   char *GetSurfaceShader ();
   vtkRIBProperty *New ();
   void SetDisplacementShader (char *);
   void SetParameter (char *parameter, char *value);
   void SetSurfaceShader (char *);
   void SetVariable (char *variable, char *declaration);


B<vtkRIBProperty Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Superquadric;


@Graphics::VTK::Superquadric::ISA = qw( Graphics::VTK::ImplicitFunction );

=head1 Graphics::VTK::Superquadric

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
   float GetPhiRoundness ();
   float  *GetScale ();
      (Returns a 3-element Perl list)
   float GetSize ();
   float GetThetaRoundness ();
   float GetThickness ();
   int GetToroidal ();
   vtkSuperquadric *New ();
   void SetCenter (float  , float , float );
   void SetPhiRoundness (float e);
   void SetScale (float  , float , float );
   void SetSize (float );
   void SetThetaRoundness (float e);
   void SetThickness (float );
   void SetToroidal (int );
   void ToroidalOff ();
   void ToroidalOn ();


B<vtkSuperquadric Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float EvaluateFunction (float x[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void EvaluateGradient (float x[3], float g[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetCenter (float  a[3]);
      Method is redundant. Same as SetCenter( float, float, float)

   void SetScale (float  a[3]);
      Method is redundant. Same as SetScale( float, float, float)


=cut

package Graphics::VTK::SurfaceReconstructionFilter;


@Graphics::VTK::SurfaceReconstructionFilter::ISA = qw( Graphics::VTK::DataSetToStructuredPointsFilter );

=head1 Graphics::VTK::SurfaceReconstructionFilter

=over 1

=item *

Inherits from DataSetToStructuredPointsFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetNeighborhoodSize ();
   float GetSampleSpacing ();
   vtkSurfaceReconstructionFilter *New ();
   void SetNeighborhoodSize (int );
   void SetSampleSpacing (float );


B<vtkSurfaceReconstructionFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::SuperquadricSource;


@Graphics::VTK::SuperquadricSource::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::SuperquadricSource

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float  *GetCenter ();
      (Returns a 3-element Perl list)
   const char *GetClassName();
   int GetPhiResolution ();
   float GetPhiRoundness ();
   float  *GetScale ();
      (Returns a 3-element Perl list)
   float GetSize ();
   int GetThetaResolution ();
   float GetThetaRoundness ();
   float GetThickness ();
   int GetToroidal ();
   vtkSuperquadricSource *New ();
   void SetCenter (float  , float , float );
   void SetPhiResolution (int i);
   void SetPhiRoundness (float e);
   void SetScale (float  , float , float );
   void SetSize (float );
   void SetThetaResolution (int i);
   void SetThetaRoundness (float e);
   void SetThickness (float );
   void SetToroidal (int );
   void ToroidalOff ();
   void ToroidalOn ();


B<vtkSuperquadricSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetCenter (float  a[3]);
      Method is redundant. Same as SetCenter( float, float, float)

   void SetScale (float  a[3]);
      Method is redundant. Same as SetScale( float, float, float)


=cut

package Graphics::VTK::SubdivideTetra;


@Graphics::VTK::SubdivideTetra::ISA = qw( Graphics::VTK::UnstructuredGridToUnstructuredGridFilter );

=head1 Graphics::VTK::SubdivideTetra

=over 1

=item *

Inherits from UnstructuredGridToUnstructuredGridFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkSubdivideTetra *New ();


B<vtkSubdivideTetra Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ThreadedController;


@Graphics::VTK::ThreadedController::ISA = qw( Graphics::VTK::MultiProcessController );

=head1 Graphics::VTK::ThreadedController

=over 1

=item *

Inherits from MultiProcessController

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetLocalProcessId ();
   void MultipleMethodExecute ();
   vtkThreadedController *New ();
   int Receive (char *data, int length, int remoteProcessId, int tag);
   int Receive (vtkDataObject *data, int remoteProcessId, int tag);
   int Send (char *data, int length, int remoteProcessId, int tag);
   int Send (vtkDataObject *data, int remoteProcessId, int tag);
   void SingleMethodExecute ();
   void Start (int threadIdx);


B<vtkThreadedController Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void Initialize (int argc, char *arcv[]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   vtkThreadedControllerMessage *NewMessage (vtkDataObject *object, void *data, int dataLength);
      Don't know the size of pointer arg number 2

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   int Receive (int *data, int length, int remoteProcessId, int tag);
      Don't know the size of pointer arg number 1

   int Receive (unsigned long *data, int length, int remoteProcessId, int tag);
      Don't know the size of pointer arg number 1

   int Receive (float *data, int length, int remoteProcessId, int tag);
      Don't know the size of pointer arg number 1

   int Receive (vtkDataObject *object, void *data, int dataLength, int remoteProcessId, int tag);
      Don't know the size of pointer arg number 2

   int Send (int *data, int length, int remoteProcessId, int tag);
      Don't know the size of pointer arg number 1

   int Send (unsigned long *data, int length, int remoteProcessId, int tag);
      Don't know the size of pointer arg number 1

   int Send (float *data, int length, int remoteProcessId, int tag);
      Don't know the size of pointer arg number 1

   vtkThreadedController *ControllersVTK_MP_CONTROLLER_MAX_PROCESSES []pthread_t ThreadIdsVTK_MP_CONTROLLER_MAX_PROCESSES []pid_t ThreadIdsVTK_MP_CONTROLLER_MAX_PROCESSES []int LocalProcessIdint WaitingForIdvtkMultiThreader *MultiThreaderint MultipleMethodFlagvtkMutexLock *MessageListLockvtkMutexLock *GatevtkThreadedControllerMessage *MessageListStartvtkThreadedControllerMessage *MessageListEndFILE *LogFileint Send (vtkDataObject *object, void *data, int dataLength, int remoteProcessId, int tag);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ThinPlateSplineTransform;


@Graphics::VTK::ThinPlateSplineTransform::ISA = qw( Graphics::VTK::WarpTransform );

=head1 Graphics::VTK::ThinPlateSplineTransform

=over 1

=item *

Inherits from WarpTransform

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int GetBasis ();
   char *GetBasisAsString ();
   const char *GetClassName();
   unsigned long GetMTime ();
   double GetSigma ();
   vtkPoints *GetSourceLandmarks ();
   vtkPoints *GetTargetLandmarks ();
   vtkAbstractTransform *MakeTransform ();
   vtkThinPlateSplineTransform *New ();
   void SetBasis (int basis);
   void SetBasisToR ();
   void SetBasisToR2LogR ();
   void SetSigma (double );
   void SetSourceLandmarks (vtkPoints *source);
   void SetTargetLandmarks (vtkPoints *target);


B<vtkThinPlateSplineTransform Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ForwardTransformDerivative (float in[3], float out[3], float derivative[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ForwardTransformDerivative (double in[3], double out[3], double derivative[3][3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ForwardTransformPoint (float in[3], float out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ForwardTransformPoint (double in[3], double out[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::TransformToGrid;


@Graphics::VTK::TransformToGrid::ISA = qw( Graphics::VTK::ImageSource );

=head1 Graphics::VTK::TransformToGrid

=over 1

=item *

Inherits from ImageSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetDisplacementScale ();
   float GetDisplacementShift ();
   int  *GetGridExtent ();
      (Returns a 6-element Perl list)
   float  *GetGridOrigin ();
      (Returns a 3-element Perl list)
   int GetGridScalarType ();
   float  *GetGridSpacing ();
      (Returns a 3-element Perl list)
   vtkAbstractTransform *GetInput ();
   vtkTransformToGrid *New ();
   void SetGridExtent (int  , int , int , int , int , int );
   void SetGridOrigin (float  , float , float );
   void SetGridScalarType (int );
   void SetGridScalarTypeToChar ();
   void SetGridScalarTypeToFloat ();
   void SetGridScalarTypeToShort ();
   void SetGridScalarTypeToUnsignedChar ();
   void SetGridScalarTypeToUnsignedShort ();
   void SetGridSpacing (float  , float , float );
   void SetInput (vtkAbstractTransform *);


B<vtkTransformToGrid Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetGridExtent (int  a[6]);
      Method is redundant. Same as SetGridExtent( int, int, int, int, int, int)

   void SetGridOrigin (float  a[3]);
      Method is redundant. Same as SetGridOrigin( float, float, float)

   void SetGridSpacing (float  a[3]);
      Method is redundant. Same as SetGridSpacing( float, float, float)


=cut

package Graphics::VTK::TreeComposite;


@Graphics::VTK::TreeComposite::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::TreeComposite

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ComputeVisiblePropBoundsRMI ();
   void EndRender ();
   void ExitInteractor ();
   const char *GetClassName();
   vtkRenderWindow *GetRenderWindow ();
   void InitializeOffScreen ();
   void InitializePieces ();
   vtkTreeComposite *New ();
   void RenderRMI ();
   void ResetCamera (vtkRenderer *ren);
   void ResetCameraClippingRange (vtkRenderer *ren);
   void SetRenderWindow (vtkRenderWindow *renWin);
   void StartInteractor ();
   void StartRender ();


B<vtkTreeComposite Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeVisiblePropBounds (vtkRenderer *ren, float bounds[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   float *PDatafloat *ZDataint WindowSize[2]int Lockvoid SetWindowSize (int x, int y);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::VideoSource;


@Graphics::VTK::VideoSource::ISA = qw( Graphics::VTK::ImageSource );

=head1 Graphics::VTK::VideoSource

=over 1

=item *

Inherits from ImageSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual void Advance (int n);
   virtual void Advance ();
   void AutoAdvanceOff ();
   void AutoAdvanceOn ();
   int GetAutoAdvance ();
   const char *GetClassName();
   int  *GetClipRegion ();
      (Returns a 6-element Perl list)
   float  *GetDataOrigin ();
      (Returns a 3-element Perl list)
   float  *GetDataSpacing ();
      (Returns a 3-element Perl list)
   int GetFrameBufferSize ();
   float GetFrameRate ();
   int  *GetFrameSize ();
      (Returns a 3-element Perl list)
   virtual double GetFrameTimeStamp (int frame);
   virtual double GetFrameTimeStamp ();
   int GetGrabOnUpdate ();
   int GetNumberOfOutputFrames ();
   float GetOpacity ();
   int GetOutputFormat ();
   int  *GetOutputWholeExtent ();
      (Returns a 6-element Perl list)
   int GetPlaying ();
   int GetPreview ();
   virtual void Grab (int n);
   void Grab ();
   void GrabOnUpdateOff ();
   void GrabOnUpdateOn ();
   virtual void Initialize ();
   virtual void InternalGrab ();
   vtkVideoSource *New ();
   virtual void Play ();
   void PreviewOff ();
   void PreviewOn ();
   virtual void ReleaseSystemResources ();
   virtual void Rewind (int n);
   virtual void Rewind ();
   void SetAutoAdvance (int );
   virtual void SetClipRegion (int x0, int x1, int y0, int y1, int z0, int z1);
   void SetDataOrigin (float  , float , float );
   void SetDataSpacing (float  , float , float );
   virtual void SetFrameBufferSize (int FrameBufferSize);
   void SetFrameRate (float );
   virtual void SetFrameSize (int x, int y, int z);
   virtual void SetGrabOnUpdate (int yesno);
   void SetNumberOfOutputFrames (int );
   void SetOpacity (float );
   virtual void SetOutputFormat (int format);
   void SetOutputFormatToLuminance ();
   void SetOutputFormatToRGB ();
   void SetOutputFormatToRGBA ();
   void SetOutputWholeExtent (int  , int , int , int , int , int );
   void SetPreview (int );
   virtual void Stop ();
   void UpdateInformation ();


B<vtkVideoSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   virtual void SetClipRegion (int r[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetDataOrigin (float  a[3]);
      Method is redundant. Same as SetDataOrigin( float, float, float)

   void SetDataSpacing (float  a[3]);
      Method is redundant. Same as SetDataSpacing( float, float, float)

   virtual void SetFrameSize (int dim[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetOutputWholeExtent (int  a[6]);
      Method is redundant. Same as SetOutputWholeExtent( int, int, int, int, int, int)

   virtual int Initializedint FrameSize[3]int ClipRegion[6]int OutputWholeExtent[6]float DataSpacing[3]float DataOrigin[3]int OutputFormatint NumberOfScalarComponentsint FrameOutputExtent[6]int LastNumberOfScalarComponentsint LastOutputExtent[6]int Playingfloat FrameRateint AutoAdvanceint NumberOfOutputFramesfloat Opacityint Previewint GrabOnUpdateint FlipFramesint OutputNeedsInitializationint FrameGrabbedvtkMultiThreader *PlayerThreaderint PlayerThreadIdvtkMutexLock *FrameBufferMutexint FrameBufferBitsPerPixelint FrameBufferRowAlignmentint FrameBufferExtent[6]int FrameBufferSizeint FrameBufferIndexvoid *FrameBufferdouble *FrameBufferTimeStampsvoid UpdateFrameBuffer ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::VolumeProMapper;


@Graphics::VTK::VolumeProMapper::ISA = qw( Graphics::VTK::VolumeMapper );

=head1 Graphics::VTK::VolumeProMapper

=over 1

=item *

Inherits from VolumeMapper

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CursorOff ();
   void CursorOn ();
   void CutPlaneOff ();
   void CutPlaneOn ();
   virtual int GetAvailableBoardMemory ();
   int GetBlendMode ();
   char *GetBlendModeAsString (void );
   const char *GetClassName();
   int GetCursor ();
   double  *GetCursorPosition ();
      (Returns a 3-element Perl list)
   int GetCursorType ();
   char *GetCursorTypeAsString (void );
   double  *GetCursorXAxisColor ();
      (Returns a 3-element Perl list)
   double  *GetCursorYAxisColor ();
      (Returns a 3-element Perl list)
   double  *GetCursorZAxisColor ();
      (Returns a 3-element Perl list)
   int GetCutPlane ();
   double  *GetCutPlaneEquation ();
      (Returns a 4-element Perl list)
   int GetCutPlaneFallOffDistance ();
   double GetCutPlaneThickness ();
   int GetGradientDiffuseModulation ();
   int GetGradientOpacityModulation ();
   int GetGradientSpecularModulation ();
   int GetMajorBoardVersion ();
   int GetMapperType ();
   int GetMinorBoardVersion ();
   int GetNoHardware ();
   int GetNumberOfBoards ();
   int  *GetSubVolume ();
      (Returns a 6-element Perl list)
   int GetSuperSampling ();
   double  *GetSuperSamplingFactor ();
      (Returns a 3-element Perl list)
   int GetWrongVLIVersion ();
   void GradientDiffuseModulationOff ();
   void GradientDiffuseModulationOn ();
   void GradientOpacityModulationOff ();
   void GradientOpacityModulationOn ();
   void GradientSpecularModulationOff ();
   void GradientSpecularModulationOn ();
   vtkVolumeProMapper *New ();
   virtual void Render (vtkRenderer *, vtkVolume *);
   void SetBlendMode (int );
   void SetBlendModeToComposite ();
   void SetBlendModeToMaximumIntensity ();
   void SetBlendModeToMinimumIntensity ();
   void SetCursor (int );
   void SetCursorPosition (double  , double , double );
   void SetCursorType (int );
   void SetCursorTypeToCrossHair ();
   void SetCursorTypeToPlane ();
   void SetCursorXAxisColor (double  , double , double );
   void SetCursorYAxisColor (double  , double , double );
   void SetCursorZAxisColor (double  , double , double );
   void SetCutPlane (int );
   void SetCutPlaneEquation (double  , double , double , double );
   void SetCutPlaneFallOffDistance (int );
   void SetCutPlaneThickness (double );
   void SetGradientDiffuseModulation (int );
   void SetGradientOpacityModulation (int );
   void SetGradientSpecularModulation (int );
   void SetSubVolume (int  , int , int , int , int , int );
   void SetSuperSampling (int );
   void SetSuperSamplingFactor (double x, double y, double z);
   void SuperSamplingOff ();
   void SuperSamplingOn ();


B<vtkVolumeProMapper Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void GetLockSizesForBoardMemory (unsigned int , unsigned int *, unsigned int *, unsigned int *);
      Don't know the size of pointer arg number 2

   void PrintSelf (ostream &os, vtkIndent index);
      I/O Streams not Supported yet

   void SetCursorPosition (double  a[3]);
      Method is redundant. Same as SetCursorPosition( double, double, double)

   void SetCursorXAxisColor (double  a[3]);
      Method is redundant. Same as SetCursorXAxisColor( double, double, double)

   void SetCursorYAxisColor (double  a[3]);
      Method is redundant. Same as SetCursorYAxisColor( double, double, double)

   void SetCursorZAxisColor (double  a[3]);
      Method is redundant. Same as SetCursorZAxisColor( double, double, double)

   void SetCutPlaneEquation (double  a[4]);
      Method is redundant. Same as SetCutPlaneEquation( double, double, double, double)

   void SetSubVolume (int  a[6]);
      Method is redundant. Same as SetSubVolume( int, int, int, int, int, int)

   void SetSuperSamplingFactor (double f[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::InputPort;


@Graphics::VTK::InputPort::ISA = qw( Graphics::VTK::Source );

=head1 Graphics::VTK::InputPort

=over 1

=item *

Inherits from Source

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkMultiProcessController *GetController ();
   vtkImageData *GetImageDataOutput ();
   vtkPolyData *GetPolyDataOutput ();
   vtkRectilinearGrid *GetRectilinearGridOutput ();
   int GetRemoteProcessId ();
   vtkStructuredGrid *GetStructuredGridOutput ();
   vtkStructuredPoints *GetStructuredPointsOutput ();
   int GetTag ();
   vtkUnstructuredGrid *GetUnstructuredGridOutput ();
   vtkInputPort *New ();
   void PropagateUpdateExtent (vtkDataObject *);
   void SetController (vtkMultiProcessController *);
   void SetRemoteProcessId (int );
   void SetTag (int );
   void TriggerAsynchronousUpdate ();
   void UpdateData (vtkDataObject *out);
   void UpdateInformation ();


B<vtkInputPort Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::OutputPort;


@Graphics::VTK::OutputPort::ISA = qw( Graphics::VTK::ProcessObject );

=head1 Graphics::VTK::OutputPort

=over 1

=item *

Inherits from ProcessObject

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkMultiProcessController *GetController ();
   vtkDataObject *GetInput ();
   int GetPipelineFlag ();
   int GetTag ();
   vtkOutputPort *New ();
   void PipelineFlagOff ();
   void PipelineFlagOn ();
   void SetController (vtkMultiProcessController *);
   void SetInput (vtkDataObject *input);
   void SetParameterMethod (void (*func)(void *) , void *arg);
   void SetPipelineFlag (int );
   void SetTag (int tag);
   void TriggerUpdate (int remoteProcessId);
   void TriggerUpdateInformation (int remoteProcessId);
   void WaitForUpdate ();


B<vtkOutputPort Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetParameterMethodArgDelete (void (*func)(void *) );
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::VRMLImporter;


@Graphics::VTK::VRMLImporter::ISA = qw( Graphics::VTK::Importer );

=head1 Graphics::VTK::VRMLImporter

=over 1

=item *

Inherits from Importer

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkObject *GetVRMLDEFObject (char *name);
   vtkVRMLImporter *New ();
   void enterField (char *);
   void enterNode (char *);
   void exitField ();
   void exitNode ();
   void useNode (char *);


B<vtkVRMLImporter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::XYPlotActor;


@Graphics::VTK::XYPlotActor::ISA = qw( Graphics::VTK::Actor2D );

=head1 Graphics::VTK::XYPlotActor

=over 1

=item *

Inherits from Actor2D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddDataObjectInput (vtkDataObject *in);
   void AddInput (vtkDataSet *in);
   void BoldOff ();
   void BoldOn ();
   int GetBold ();
   int GetBorder ();
   const char *GetClassName();
   vtkDataObjectCollection *GetDataObjectInputList ();
   int GetDataObjectPlotMode ();
   char *GetDataObjectPlotModeAsString ();
   int GetDataObjectXComponent (int i);
   int GetDataObjectYComponent (int i);
   int GetFontFamily ();
   float GetGlyphSize ();
   vtkGlyphSource2D *GetGlyphSource ();
   vtkDataSetCollection *GetInputList ();
   int GetItalic ();
   char *GetLabelFormat ();
   int GetLegend ();
   vtkLegendBoxActor *GetLegendBoxActor ();
   float  *GetLegendPosition ();
      (Returns a 2-element Perl list)
   float  *GetLegendPosition2 ();
      (Returns a 2-element Perl list)
   unsigned long GetMTime ();
   int GetNumberOfXLabels ();
   int GetNumberOfYLabels ();
   float  *GetPlotCoordinate ();
      (Returns a 2-element Perl list)
   char *GetPlotLabel (int i);
   int GetPlotLines ();
   int GetPlotPoints ();
   vtkPolyData *GetPlotSymbol (int i);
   int GetPointComponent (int i);
   int GetShadow ();
   char *GetTitle ();
   float  *GetViewportCoordinate ();
      (Returns a 2-element Perl list)
   float  *GetXRange ();
      (Returns a 2-element Perl list)
   char *GetXTitle ();
   int GetXValues ();
   char *GetXValuesAsString ();
   float  *GetYRange ();
      (Returns a 2-element Perl list)
   char *GetYTitle ();
   int IsInPlot (vtkViewport *viewport, float u, float v);
   void ItalicOff ();
   void ItalicOn ();
   void LegendOff ();
   void LegendOn ();
   vtkXYPlotActor *New ();
   void PlotLinesOff ();
   void PlotLinesOn ();
   void PlotPointsOff ();
   void PlotPointsOn ();
   void PlotToViewportCoordinate (vtkViewport *viewport, float &u, float &v);
   void PlotToViewportCoordinate (vtkViewport *viewport);
   void RemoveDataObjectInput (vtkDataObject *in);
   void RemoveInput (vtkDataSet *in);
   void SetBold (int );
   void SetBorder (int );
   void SetDataObjectPlotMode (int );
   void SetDataObjectPlotModeToColumns ();
   void SetDataObjectPlotModeToRows ();
   void SetDataObjectXComponent (int i, int comp);
   void SetDataObjectYComponent (int i, int comp);
   void SetFontFamily (int );
   void SetFontFamilyToArial ();
   void SetFontFamilyToCourier ();
   void SetFontFamilyToTimes ();
   void SetGlyphSize (float );
   void SetItalic (int );
   void SetLabelFormat (char *);
   void SetLegend (int );
   void SetLegendPosition (float  , float );
   void SetLegendPosition2 (float  , float );
   void SetNumberOfLabels (int num);
   void SetNumberOfXLabels (int );
   void SetNumberOfYLabels (int );
   void SetPlotColor (int i, float r, float g, float b);
   void SetPlotCoordinate (float  , float );
   void SetPlotLabel (int i, char *label);
   void SetPlotLines (int );
   void SetPlotPoints (int );
   void SetPlotRange (float xmin, float ymin, float xmax, float ymax);
   void SetPlotSymbol (int i, vtkPolyData *input);
   void SetPointComponent (int i, int comp);
   void SetShadow (int );
   void SetTitle (char *);
   void SetViewportCoordinate (float  , float );
   void SetXRange (float  , float );
   void SetXTitle (char *);
   void SetXValues (int );
   void SetXValuesToArcLength ();
   void SetXValuesToIndex ();
   void SetXValuesToNormalizedArcLength ();
   void SetXValuesToValue ();
   void SetYRange (float  , float );
   void SetYTitle (char *);
   void ShadowOff ();
   void ShadowOn ();
   void ViewportToPlotCoordinate (vtkViewport *viewport, float &u, float &v);
   void ViewportToPlotCoordinate (vtkViewport *viewport);


B<vtkXYPlotActor Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ClipPlotData (int *pos, int *pos2, vtkPolyData *pd);
      Don't know the size of pointer arg number 1

   void ComputeDORange (float xrange[2], float yrange[2], float *lengths);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float ComputeGlyphScale (int i, int *pos, int *pos2);
      Don't know the size of pointer arg number 2

   int Legendfloat LegendPosition[2]float LegendPosition2[2]vtkLegendBoxActor *LegendActorvtkGlyphSource2D *GlyphSourcevtkPlanes *ClipPlanesfloat GlyphSizeint CachedSize[2]vtkTimeStamp BuildTimevoid ComputeXRange (float range[2], float *lengths);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeYRange (float range[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void CreatePlotData (int *pos, int *pos2, float xRange[2], float yRange[2], float *norms, int numDS, int numDO);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GenerateClipPlanes (int *pos, int *pos2);
      Don't know the size of pointer arg number 1

   float *GetPlotColor (int i);
      Can't Handle 'float *' return type without a hint

   vtkDataSetCollection *InputListvtkDataObjectCollection *DataObjectInputListchar *Titlechar *XTitlechar *YTitleint XValuesint NumberOfXLabelsint NumberOfYLabelsint Boldint Italicint Shadowint FontFamilychar *LabelFormatfloat XRange[2]float YRange[2]float XComputedRange[2]float YComputedRange[2]int Borderint PlotLinesint PlotPointsvtkTextMapper *TitleMappervtkActor2D *TitleActorvtkAxisActor2D *XAxisvtkAxisActor2D *YAxisfloat ViewportCoordinate[2]float PlotCoordinate[2]int DataObjectPlotModevtkIntArray *XComponentvtkIntArray *YComponentint NumberOfInputsvtkPolyData *PlotDatavtkGlyph2D *PlotGlyphvtkAppendPolyData *PlotAppendvtkPolyDataMapper2D *PlotMappervtkActor2D *PlotActorvoid InitializeEntries ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PlaceAxes (vtkViewport *viewport, int *size, int pos[2], int pos2[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetLegendPosition2 (float  a[2]);
      Method is redundant. Same as SetLegendPosition2( float, float)

   void SetLegendPosition (float  a[2]);
      Method is redundant. Same as SetLegendPosition( float, float)

   void SetPlotColor (int i, float color[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetPlotCoordinate (float  a[2]);
      Method is redundant. Same as SetPlotCoordinate( float, float)

   void SetViewportCoordinate (float  a[2]);
      Method is redundant. Same as SetViewportCoordinate( float, float)

   void SetXRange (float  a[2]);
      Method is redundant. Same as SetXRange( float, float)

   void SetYRange (float  a[2]);
      Method is redundant. Same as SetYRange( float, float)


=cut

package Graphics::VTK::Win32OffscreenRenderWindow;


@Graphics::VTK::Win32OffscreenRenderWindow::ISA = qw( Graphics::VTK::Win32OpenGLRenderWindow );

=head1 Graphics::VTK::Win32OffscreenRenderWindow

=over 1

=item *

Inherits from Win32OpenGLRenderWindow

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual void Frame ();
   const char *GetClassName();
   virtual int GetEventPending ();
   virtual void *GetGenericDisplayId ();
   virtual void *GetGenericParentId ();
   virtual void *GetGenericWindowId ();
   virtual HWND GetWindowId ();
   vtkWin32OffscreenRenderWindow *New ();
   virtual void SetFullScreen (int );
   virtual void SetNextWindowId (HWND );
   virtual void SetParentId (HWND );
   virtual void SetPosition (int , int );
   void SetSize (int , int );
   virtual void SetWindowId (HWND );
   virtual void WindowInitialize ();


B<vtkWin32OffscreenRenderWindow Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual int *GetPosition ();
      Can't Handle 'int *' return type without a hint

   virtual int *GetScreenSize ();
      Can't Handle 'int *' return type without a hint

   int *GetSize ();
      Can't Handle 'int *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   virtual void SetDisplayId (void *);
      Don't know the size of pointer arg number 1


=cut

1;
