
package Graphics::VTK::Imaging;
use 5.004;
use strict;
use Carp;

use vars qw/ $VERSION @ISA/;

require DynaLoader;

$VERSION = '3.2.001';

@ISA = qw/ DynaLoader /;

bootstrap Graphics::VTK::Imaging $VERSION;


=head1 NAME

VTKImaging  - A Perl interface to VTKImaging library

=head1 SYNOPSIS

C<use Graphics::VTK;>
C<use Graphics::VTK::Imaging;>

=head1 DESCRIPTION

Graphics::VTK::Imaging is an interface to the Imaging libaray of the C++ visualization toolkit VTK..

=head1 AUTHOR

Original PerlVTK Package: Roberto De Leo <rdl@math.umd.edu>

Additional Refinements: John Cerney <j-cerney1@raytheon.com>

=cut

package Graphics::VTK::ImageDecomposeFilter;


@Graphics::VTK::ImageDecomposeFilter::ISA = qw( Graphics::VTK::ImageIterateFilter );

=head1 Graphics::VTK::ImageDecomposeFilter

=over 1

=item *

Inherits from ImageIterateFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetDimensionality ();
   vtkImageDecomposeFilter *New ();
   void SetDimensionality (int dim);
   void SetFilteredAxes (int axis0, int axis2, int axis3);
   void SetFilteredAxes (int axis0, int axis2);
   void SetFilteredAxes (int axis0);


B<vtkImageDecomposeFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PermuteExtent (int *extent, int &min0, int &max0, int &min1, int &max1, int &min2, int &max2);
      Don't know the size of pointer arg number 1

   void PermuteIncrements (int *increments, int &inc0, int &inc1, int &inc2);
      Don't know the size of pointer arg number 1

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ImageFilter;


@Graphics::VTK::ImageFilter::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageFilter

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageFilter *New ();

=cut

package Graphics::VTK::ImageInPlaceFilter;


@Graphics::VTK::ImageInPlaceFilter::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageInPlaceFilter

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageInPlaceFilter *New ();

=cut

package Graphics::VTK::ImageIterateFilter;


@Graphics::VTK::ImageIterateFilter::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageIterateFilter

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ComputeInputUpdateExtents (vtkDataObject *output);
   const char *GetClassName();
   int GetIteration ();
   int GetNumberOfIterations ();
   vtkImageIterateFilter *New ();


B<vtkImageIterateFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ImageMultipleInputFilter;


@Graphics::VTK::ImageMultipleInputFilter::ISA = qw( Graphics::VTK::ImageSource );

=head1 Graphics::VTK::ImageMultipleInputFilter

=over 1

=item *

Inherits from ImageSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual void AddInput (vtkImageData *input);
   void BypassOff ();
   void BypassOn ();
   int GetBypass ();
   const char *GetClassName();
   vtkImageData *GetInput (int num);
   vtkImageData *GetInput ();
   int GetNumberOfThreads ();
   vtkImageMultipleInputFilter *New ();
   virtual void RemoveInput (vtkImageData *input);
   void SetBypass (int );
   virtual void SetInput (int num, vtkImageData *input);
   void SetNumberOfThreads (int );


B<vtkImageMultipleInputFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void ComputeInputUpdateExtent (int inExt[6], int outExt[6], int whichInput);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   virtual int SplitExtent (int splitExt[6], int startExt[6], int num, int total);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void ThreadedExecute (vtkImageData *inDatas, vtkImageData *outData, int extent[6], int threadId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImagePadFilter;


@Graphics::VTK::ImagePadFilter::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImagePadFilter

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetOutputNumberOfScalarComponents ();
   vtkImagePadFilter *New ();
   void SetOutputNumberOfScalarComponents (int );
   void SetOutputWholeExtent (int minX, int maxX, int minY, int maxY, int minZ, int maxZ);


B<vtkImagePadFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeInputUpdateExtent (int inExt[6], int outExt[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int OutputWholeExtent[6]int OutputNumberOfScalarComponentsvoid ExecuteInformation (vtkImageData *inData, vtkImageData *outData);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetOutputWholeExtent (int extent[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int *GetOutputWholeExtent ();
      Can't Handle 'int *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetOutputWholeExtent (int extent[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageSpatialFilter;


@Graphics::VTK::ImageSpatialFilter::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageSpatialFilter

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int *GetKernelSize ();
      (Returns a 3-element Perl list)
   vtkImageSpatialFilter *New ();


B<vtkImageSpatialFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeInputUpdateExtent (int extent[6], int wholeExtent[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeOutputWholeExtent (int extent[6], int handleBoundaries);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int KernelSize[3]int KernelMiddle[3]int Strides[3]int HandleBoundariesvoid ExecuteInformation ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int *GetKernelMiddle ();
      Can't Handle 'int *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ImageToImageFilter;


@Graphics::VTK::ImageToImageFilter::ISA = qw( Graphics::VTK::ImageSource );

=head1 Graphics::VTK::ImageToImageFilter

=over 1

=item *

Inherits from ImageSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual void ExecuteImageInformation ();
   const char *GetClassName();
   vtkImageData *GetInput ();
   long GetInputMemoryLimit ();
   int GetNumberOfThreads ();
   vtkImageToImageFilter *New ();
   virtual void SetInput (vtkImageData *input);
   void SetInputMemoryLimit (int );
   void SetNumberOfThreads (int );
   virtual void UpdateImageInformation ();


B<vtkImageToImageFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void BypassOff ();
      Method is marked 'Do Not Use' in its descriptions

   void BypassOn ();
      Method is marked 'Do Not Use' in its descriptions

   virtual void ComputeInputUpdateExtent (int inExt[6], int outExt[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int GetBypass ();
      Method is marked 'Do Not Use' in its descriptions

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetBypass (int );
      Method is marked 'Do Not Use' in its descriptions

   virtual int SplitExtent (int splitExt[6], int startExt[6], int num, int total);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int extent[6], int threadId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageTwoInputFilter;


@Graphics::VTK::ImageTwoInputFilter::ISA = qw( Graphics::VTK::ImageMultipleInputFilter );

=head1 Graphics::VTK::ImageTwoInputFilter

=over 1

=item *

Inherits from ImageMultipleInputFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageData *GetInput1 ();
   vtkImageData *GetInput2 ();
   vtkImageTwoInputFilter *New ();
   virtual void SetInput1 (vtkImageData *input);
   virtual void SetInput2 (vtkImageData *input);

=cut

package Graphics::VTK::ImageFourierFilter;


@Graphics::VTK::ImageFourierFilter::ISA = qw( Graphics::VTK::ImageDecomposeFilter );

=head1 Graphics::VTK::ImageFourierFilter

=over 1

=item *

Inherits from ImageDecomposeFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageFourierFilter *New ();

=cut

package Graphics::VTK::ImagingFactory;


@Graphics::VTK::ImagingFactory::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::ImagingFactory

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   vtkObject *CreateInstance (char *vtkclassname);
   const char *GetClassName();
   vtkImagingFactory *New ();

=cut

package Graphics::VTK::AxisActor2D;


@Graphics::VTK::AxisActor2D::ISA = qw( Graphics::VTK::Actor2D );

=head1 Graphics::VTK::AxisActor2D

=over 1

=item *

Inherits from Actor2D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AdjustLabelsOff ();
   void AdjustLabelsOn ();
   void AxisVisibilityOff ();
   void AxisVisibilityOn ();
   void BoldOff ();
   void BoldOn ();
   int GetAdjustLabels ();
   int GetAxisVisibility ();
   int GetBold ();
   const char *GetClassName();
   float GetFontFactor ();
   int GetFontFamily ();
   int GetItalic ();
   float GetLabelFactor ();
   char *GetLabelFormat ();
   int GetLabelVisibility ();
   int GetNumberOfLabels ();
   float *GetPoint1 ();
      (Returns a 2-element Perl list)
   vtkCoordinate *GetPoint1Coordinate ();
   float *GetPoint2 ();
      (Returns a 2-element Perl list)
   vtkCoordinate *GetPoint2Coordinate ();
   float  *GetRange ();
      (Returns a 2-element Perl list)
   int GetShadow ();
   int GetTickLength ();
   int GetTickOffset ();
   int GetTickVisibility ();
   char *GetTitle ();
   int GetTitleVisibility ();
   void ItalicOff ();
   void ItalicOn ();
   void LabelVisibilityOff ();
   void LabelVisibilityOn ();
   vtkAxisActor2D *New ();
   void ReleaseGraphicsResources (vtkWindow *);
   int RenderOpaqueGeometry (vtkViewport *viewport);
   int RenderOverlay (vtkViewport *viewport);
   int RenderTranslucentGeometry (vtkViewport *);
   void SetAdjustLabels (int );
   void SetAxisVisibility (int );
   void SetBold (int );
   void SetFontFactor (float );
   void SetFontFamily (int );
   void SetFontFamilyToArial ();
   void SetFontFamilyToCourier ();
   void SetFontFamilyToTimes ();
   void SetItalic (int );
   void SetLabelFactor (float );
   void SetLabelFormat (char *);
   void SetLabelVisibility (int );
   void SetNumberOfLabels (int );
   void SetPoint1 (float , float);
   void SetPoint2 (float , float);
   void SetRange (float  , float );
   void SetShadow (int );
   void SetTickLength (int );
   void SetTickOffset (int );
   void SetTickVisibility (int );
   void SetTitle (char *);
   void SetTitleVisibility (int );
   void ShadowOff ();
   void ShadowOn ();
   void ShallowCopy (vtkProp *prop);
   void TickVisibilityOff ();
   void TickVisibilityOn ();
   void TitleVisibilityOff ();
   void TitleVisibilityOn ();


B<vtkAxisActor2D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   vtkCoordinate *Point1CoordinatevtkCoordinate *Point2Coordinatechar *Titlefloat Range[2]int NumberOfLabelschar *LabelFormatint NumberOfLabelsBuiltint AdjustLabelsfloat FontFactorfloat LabelFactorint TickLengthint TickOffsetint Boldint Italicint Shadowint FontFamilyint AxisVisibilityint TickVisibilityint LabelVisibilityint TitleVisibilityint LastPoint1[2]int LastPoint2[2]int LastSize[2]int LastTitleFontSizeint LastLabelFontSizevoid BuildAxis (vtkViewport *viewport);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeRange (float inRange[2], float outRange[2], int inNumTicks, int &outNumTicks, float &interval);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   int SetFontSize (vtkViewport *viewport, vtkTextMapper *textMapper, int *size, float factor, int &stringWidth, int &stringHeight);
      Don't know the size of pointer arg number 3

   void SetOffsetPosition (float xTick[3], float theta, int stringHeight, int stringWidth, int offset, vtkActor2D *actor);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetPoint1 (float a[2]);
      Method is redundant. Same as SetPoint1( float, float)

   void SetPoint2 (float a[2]);
      Method is redundant. Same as SetPoint2( float, float)

   void SetRange (float  a[2]);
      Method is redundant. Same as SetRange( float, float)


=cut

package Graphics::VTK::BMPReader;


@Graphics::VTK::BMPReader::ISA = qw( Graphics::VTK::ImageReader );

=head1 Graphics::VTK::BMPReader

=over 1

=item *

Inherits from ImageReader

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetDepth ();
   vtkBMPReader *New ();


B<vtkBMPReader Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::BMPWriter;


@Graphics::VTK::BMPWriter::ISA = qw( Graphics::VTK::ImageWriter );

=head1 Graphics::VTK::BMPWriter

=over 1

=item *

Inherits from ImageWriter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkBMPWriter *New ();


B<vtkBMPWriter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void WriteFile (ofstream *file, vtkImageData *data, int ext[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void WriteFileHeader (ofstream *, vtkImageData *);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::GlyphSource2D;


@Graphics::VTK::GlyphSource2D::ISA = qw( Graphics::VTK::PolyDataSource );

=head1 Graphics::VTK::GlyphSource2D

=over 1

=item *

Inherits from PolyDataSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CrossOff ();
   void CrossOn ();
   void DashOff ();
   void DashOn ();
   void FilledOff ();
   void FilledOn ();
   float  *GetCenter ();
      (Returns a 3-element Perl list)
   const char *GetClassName();
   float  *GetColor ();
      (Returns a 3-element Perl list)
   int GetCross ();
   int GetDash ();
   int GetFilled ();
   int GetGlyphType ();
   float GetRotationAngle ();
   float GetScale ();
   float GetScale2 ();
   vtkGlyphSource2D *New ();
   void RotationAngleOff ();
   void RotationAngleOn ();
   void SetCenter (float  , float , float );
   void SetColor (float  , float , float );
   void SetCross (int );
   void SetDash (int );
   void SetFilled (int );
   void SetGlyphType (int );
   void SetGlyphTypeToArrow ();
   void SetGlyphTypeToCircle ();
   void SetGlyphTypeToCross ();
   void SetGlyphTypeToDash ();
   void SetGlyphTypeToDiamond ();
   void SetGlyphTypeToHookedArrow ();
   void SetGlyphTypeToNone ();
   void SetGlyphTypeToSquare ();
   void SetGlyphTypeToThickArrow ();
   void SetGlyphTypeToThickCross ();
   void SetGlyphTypeToTriangle ();
   void SetGlyphTypeToVertex ();
   void SetRotationAngle (float );
   void SetScale (float );
   void SetScale2 (float );


B<vtkGlyphSource2D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   unsigned char RGB[3]void CreateVertex (vtkPoints *pts, vtkCellArray *verts, vtkUnsignedCharArray *colors);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetCenter (float  a[3]);
      Method is redundant. Same as SetCenter( float, float, float)

   void SetColor (float  a[3]);
      Method is redundant. Same as SetColor( float, float, float)

   float Center[3]float Scalefloat Scale2float Color[3]int Filledint Dashint Crossint GlyphTypefloat RotationAnglevoid TransformGlyph (vtkPoints *pts);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageAccumulate;


@Graphics::VTK::ImageAccumulate::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageAccumulate

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float  *GetComponentOrigin ();
      (Returns a 3-element Perl list)
   float  *GetComponentSpacing ();
      (Returns a 3-element Perl list)
   vtkImageAccumulate *New ();
   void SetComponentExtent (int minX, int maxX, int minY, int maxY, int minZ, int maxZ);
   void SetComponentOrigin (float  , float , float );
   void SetComponentSpacing (float  , float , float );


B<vtkImageAccumulate Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeInputUpdateExtent (int inExt[6], int outExt[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float ComponentSpacing[3]float ComponentOrigin[3]int ComponentExtent[6]void ExecuteInformation (vtkImageData *input, vtkImageData *output);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetComponentExtent (int extent[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int *GetComponentExtent ();
      Can't Handle 'int *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetComponentExtent (int extent[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetComponentOrigin (float  a[3]);
      Method is redundant. Same as SetComponentOrigin( float, float, float)

   void SetComponentSpacing (float  a[3]);
      Method is redundant. Same as SetComponentSpacing( float, float, float)


=cut

package Graphics::VTK::ImageAnisotropicDiffusion2D;


@Graphics::VTK::ImageAnisotropicDiffusion2D::ISA = qw( Graphics::VTK::ImageSpatialFilter );

=head1 Graphics::VTK::ImageAnisotropicDiffusion2D

=over 1

=item *

Inherits from ImageSpatialFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CornersOff ();
   void CornersOn ();
   void EdgesOff ();
   void EdgesOn ();
   void FacesOff ();
   void FacesOn ();
   const char *GetClassName();
   int GetCorners ();
   float GetDiffusionFactor ();
   float GetDiffusionThreshold ();
   int GetEdges ();
   int GetFaces ();
   int GetGradientMagnitudeThreshold ();
   int GetNumberOfIterations ();
   void GradientMagnitudeThresholdOff ();
   void GradientMagnitudeThresholdOn ();
   vtkImageAnisotropicDiffusion2D *New ();
   void SetCorners (int );
   void SetDiffusionFactor (float );
   void SetDiffusionThreshold (float );
   void SetEdges (int );
   void SetFaces (int );
   void SetGradientMagnitudeThreshold (int );
   void SetNumberOfIterations (int num);


B<vtkImageAnisotropicDiffusion2D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void Iterate (vtkImageData *in, vtkImageData *out, float ar0, float ar1, int *coreExtent, int count);
      Don't know the size of pointer arg number 5

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   int NumberOfIterationsfloat DiffusionThresholdfloat DiffusionFactorint Facesint Edgesint Cornersint GradientMagnitudeThresholdvoid ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageAnisotropicDiffusion3D;


@Graphics::VTK::ImageAnisotropicDiffusion3D::ISA = qw( Graphics::VTK::ImageSpatialFilter );

=head1 Graphics::VTK::ImageAnisotropicDiffusion3D

=over 1

=item *

Inherits from ImageSpatialFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CornersOff ();
   void CornersOn ();
   void EdgesOff ();
   void EdgesOn ();
   void FacesOff ();
   void FacesOn ();
   const char *GetClassName();
   int GetCorners ();
   float GetDiffusionFactor ();
   float GetDiffusionThreshold ();
   int GetEdges ();
   int GetFaces ();
   int GetGradientMagnitudeThreshold ();
   int GetNumberOfIterations ();
   void GradientMagnitudeThresholdOff ();
   void GradientMagnitudeThresholdOn ();
   vtkImageAnisotropicDiffusion3D *New ();
   void SetCorners (int );
   void SetDiffusionFactor (float );
   void SetDiffusionThreshold (float );
   void SetEdges (int );
   void SetFaces (int );
   void SetGradientMagnitudeThreshold (int );
   void SetNumberOfIterations (int num);


B<vtkImageAnisotropicDiffusion3D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void Iterate (vtkImageData *in, vtkImageData *out, float ar0, float ar1, float ar3, int *coreExtent, int count);
      Don't know the size of pointer arg number 6

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   int NumberOfIterationsfloat DiffusionThresholdfloat DiffusionFactorint Facesint Edgesint Cornersint GradientMagnitudeThresholdvoid ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageAppend;


@Graphics::VTK::ImageAppend::ISA = qw( Graphics::VTK::ImageMultipleInputFilter );

=head1 Graphics::VTK::ImageAppend

=over 1

=item *

Inherits from ImageMultipleInputFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int GetAppendAxis ();
   const char *GetClassName();
   int GetPreserveExtents ();
   vtkImageAppend *New ();
   void PreserveExtentsOff ();
   void PreserveExtentsOn ();
   void SetAppendAxis (int );
   void SetPreserveExtents (int );


B<vtkImageAppend Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeInputUpdateExtent (int inExt[6], int outExt[6], int whichInput);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void InitOutput (int outExt[6], vtkImageData *outData);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ThreadedExecute (vtkImageData *inDatas, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageAppendComponents;


@Graphics::VTK::ImageAppendComponents::ISA = qw( Graphics::VTK::ImageMultipleInputFilter );

=head1 Graphics::VTK::ImageAppendComponents

=over 1

=item *

Inherits from ImageMultipleInputFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageAppendComponents *New ();
   virtual void SetInput2 (vtkImageData *input);


B<vtkImageAppendComponents Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void SetInput1 (vtkImageData *input);
      Method is marked 'Do Not Use' in its descriptions

   void ThreadedExecute (vtkImageData *inDatas, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageBlend;


@Graphics::VTK::ImageBlend::ISA = qw( Graphics::VTK::ImageMultipleInputFilter );

=head1 Graphics::VTK::ImageBlend

=over 1

=item *

Inherits from ImageMultipleInputFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int GetBlendMode ();
   char *GetBlendModeAsString (void );
   const char *GetClassName();
   float GetCompoundThreshold ();
   double GetOpacity (int idx);
   vtkImageBlend *New ();
   void SetBlendMode (int );
   void SetBlendModeToCompound ();
   void SetBlendModeToNormal ();
   void SetCompoundThreshold (float );
   void SetOpacity (int idx, double opacity);
   virtual void UpdateData (vtkDataObject *output);


B<vtkImageBlend Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeInputUpdateExtent (int inExt[6], int outExt[6], int whichInput);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ThreadedExecute (vtkImageData *inDatas, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageButterworthHighPass;


@Graphics::VTK::ImageButterworthHighPass::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageButterworthHighPass

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float  *GetCutOff ();
      (Returns a 3-element Perl list)
   int GetOrder ();
   float GetXCutOff ();
   float GetYCutOff ();
   float GetZCutOff ();
   vtkImageButterworthHighPass *New ();
   void SetCutOff (float  , float , float );
   void SetCutOff (float v);
   void SetOrder (int );
   void SetXCutOff (float v);
   void SetYCutOff (float v);
   void SetZCutOff (float v);


B<vtkImageButterworthHighPass Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetCutOff (float  a[3]);
      Method is redundant. Same as SetCutOff( float, float, float)

   int Orderfloat CutOff[3]void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int outExt[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageButterworthLowPass;


@Graphics::VTK::ImageButterworthLowPass::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageButterworthLowPass

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float  *GetCutOff ();
      (Returns a 3-element Perl list)
   int GetOrder ();
   float GetXCutOff ();
   float GetYCutOff ();
   float GetZCutOff ();
   vtkImageButterworthLowPass *New ();
   void SetCutOff (float  , float , float );
   void SetCutOff (float v);
   void SetOrder (int );
   void SetXCutOff (float v);
   void SetYCutOff (float v);
   void SetZCutOff (float v);


B<vtkImageButterworthLowPass Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetCutOff (float  a[3]);
      Method is redundant. Same as SetCutOff( float, float, float)

   int Orderfloat CutOff[3]void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int outExt[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageCacheFilter;


@Graphics::VTK::ImageCacheFilter::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageCacheFilter

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int GetCacheSize ();
   const char *GetClassName();
   vtkImageCacheFilter *New ();
   void SetCacheSize (int size);
   void UpdateData (vtkDataObject *outData);


B<vtkImageCacheFilter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ImageCanvasSource2D;


@Graphics::VTK::ImageCanvasSource2D::ISA = qw( Graphics::VTK::StructuredPoints );

=head1 Graphics::VTK::ImageCanvasSource2D

=over 1

=item *

Inherits from StructuredPoints

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void DrawCircle (int c0, int c1, float radius);
   void DrawPoint (int p0, int p1);
   void DrawSegment (int x0, int y0, int x1, int y1);
   void DrawSegment3D (float x1, float y1, float z1, float x2, float y2, float z2);
   void FillBox (int min0, int max0, int min1, int max1);
   void FillPixel (int x, int y);
   void FillTriangle (int x0, int y0, int x1, int y1, int x2, int y2);
   void FillTube (int x0, int y0, int x1, int y1, float radius);
   const char *GetClassName();
   int GetDefaultZ ();
   float  *GetDrawColor ();
      (Returns a 4-element Perl list)
   vtkImageData *GetImageData ();
   vtkImageData *GetOutput ();
   vtkImageCanvasSource2D *New ();
   void SetDefaultZ (int );
   void SetDrawColor (float  , float , float , float );
   void SetDrawColor (float a, float b, float c);
   void SetDrawColor (float a, float b);
   void SetDrawColor (float a);
   void SetExtent (int x1, int x2, int y1, int y2, int z1, int z2);
   void SetImageData (vtkImageData *image);


B<vtkImageCanvasSource2D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   vtkImageData *ImageDatafloat DrawColor[4]int DefaultZint ClipSegment (int &a0, int &a1, int &b0, int &b1);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void DrawSegment3D (float *p0, float *p1);
      Don't know the size of pointer arg number 1

   void GetDrawColor (int dim, float *color);
      Don't know the size of pointer arg number 2

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetDrawColor (int dim, float *color);
      Don't know the size of pointer arg number 2

   void SetDrawColor (float  a[4]);
      Method is redundant. Same as SetDrawColor_( float, float, float, float)

   void SetExtent (int *extent);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::ImageCast;


@Graphics::VTK::ImageCast::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageCast

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ClampOverflowOff ();
   void ClampOverflowOn ();
   int GetClampOverflow ();
   const char *GetClassName();
   int GetOutputScalarType ();
   vtkImageCast *New ();
   void SetClampOverflow (int );
   void SetOutputScalarType (int );
   void SetOutputScalarTypeToChar ();
   void SetOutputScalarTypeToDouble ();
   void SetOutputScalarTypeToFloat ();
   void SetOutputScalarTypeToInt ();
   void SetOutputScalarTypeToLong ();
   void SetOutputScalarTypeToShort ();
   void SetOutputScalarTypeToUnsignedChar ();
   void SetOutputScalarTypeToUnsignedInt ();
   void SetOutputScalarTypeToUnsignedLong ();
   void SetOutputScalarTypeToUnsignedShort ();


B<vtkImageCast Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int ext[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageCityBlockDistance;


@Graphics::VTK::ImageCityBlockDistance::ISA = qw( Graphics::VTK::ImageDecomposeFilter );

=head1 Graphics::VTK::ImageCityBlockDistance

=over 1

=item *

Inherits from ImageDecomposeFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageCityBlockDistance *New ();


B<vtkImageCityBlockDistance Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeInputUpdateExtent (int inExt[6], int outExt[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageClip;


@Graphics::VTK::ImageClip::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageClip

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ClipDataOff ();
   void ClipDataOn ();
   const char *GetClassName();
   int GetClipData ();
   vtkImageClip *New ();
   void ResetOutputWholeExtent ();
   void SetClipData (int );
   void SetOutputWholeExtent (int minX, int maxX, int minY, int maxY, int minZ, int maxZ);
   void SetOutputWholeExtent (int piece, int numPieces);


B<vtkImageClip Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void CopyData (vtkImageData *inData, vtkImageData *outData, int *ext);
      Don't know the size of pointer arg number 3

   vtkTimeStamp CTimeint Initializedint OutputWholeExtent[6]int ClipDatavoid ExecuteInformation (vtkImageData *inData, vtkImageData *outData);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetOutputWholeExtent (int extent[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int *GetOutputWholeExtent ();
      Can't Handle 'int *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetOutputWholeExtent (int extent[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int SplitExtentTmp (int piece, int numPieces, int *ext);
      Don't know the size of pointer arg number 3


=cut

package Graphics::VTK::ImageComposite;


@Graphics::VTK::ImageComposite::ISA = qw( Graphics::VTK::Source );

=head1 Graphics::VTK::ImageComposite

=over 1

=item *

Inherits from Source

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddInput (vtkImageData *);
   const char *GetClassName();
   vtkImageData *GetInput (int idx);
   vtkStructuredPoints *GetOutput (int idx);
   vtkStructuredPoints *GetOutput ();
   vtkImageComposite *New ();
   void RemoveInput (vtkImageData *);
   void SetOutput (vtkStructuredPoints *output);


B<vtkImageComposite Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ImageConnector;


@Graphics::VTK::ImageConnector::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::ImageConnector

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   char unsigned GetConnectedValue ();
   char unsigned GetUnconnectedValue ();
   vtkImageConnector *New ();
   void RemoveAllSeeds ();
   void SetConnectedValue (unsigned char );
   void SetUnconnectedValue (unsigned char );


B<vtkImageConnector Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void MarkData (vtkImageData *data, int dimensionality, int ext[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ImageConstantPad;


@Graphics::VTK::ImageConstantPad::ISA = qw( Graphics::VTK::ImagePadFilter );

=head1 Graphics::VTK::ImageConstantPad

=over 1

=item *

Inherits from ImagePadFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetConstant ();
   vtkImageConstantPad *New ();
   void SetConstant (float );


B<vtkImageConstantPad Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   float Constantvoid ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int outExt[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageContinuousDilate3D;


@Graphics::VTK::ImageContinuousDilate3D::ISA = qw( Graphics::VTK::ImageSpatialFilter );

=head1 Graphics::VTK::ImageContinuousDilate3D

=over 1

=item *

Inherits from ImageSpatialFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageContinuousDilate3D *New ();
   void SetKernelSize (int size0, int size1, int size2);


B<vtkImageContinuousDilate3D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   vtkImageEllipsoidSource *Ellipsevoid ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageContinuousErode3D;


@Graphics::VTK::ImageContinuousErode3D::ISA = qw( Graphics::VTK::ImageSpatialFilter );

=head1 Graphics::VTK::ImageContinuousErode3D

=over 1

=item *

Inherits from ImageSpatialFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageContinuousErode3D *New ();
   void SetKernelSize (int size0, int size1, int size2);


B<vtkImageContinuousErode3D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   vtkImageEllipsoidSource *Ellipsevoid ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageCorrelation;


@Graphics::VTK::ImageCorrelation::ISA = qw( Graphics::VTK::ImageTwoInputFilter );

=head1 Graphics::VTK::ImageCorrelation

=over 1

=item *

Inherits from ImageTwoInputFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetDimensionality ();
   vtkImageCorrelation *New ();
   void SetDimensionality (int );


B<vtkImageCorrelation Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void ComputeInputUpdateExtent (int inExt[6], int outExt[6], int whichInput);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ThreadedExecute (vtkImageData *inDatas, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageCursor3D;


@Graphics::VTK::ImageCursor3D::ISA = qw( Graphics::VTK::ImageInPlaceFilter );

=head1 Graphics::VTK::ImageCursor3D

=over 1

=item *

Inherits from ImageInPlaceFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float  *GetCursorPosition ();
      (Returns a 3-element Perl list)
   int GetCursorRadius ();
   float GetCursorValue ();
   vtkImageCursor3D *New ();
   void SetCursorPosition (float  , float , float );
   void SetCursorRadius (int );
   void SetCursorValue (float );


B<vtkImageCursor3D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float CursorPosition[3]float CursorValueint CursorRadiusvoid Execute (vtkImageData *inData, vtkImageData *outData);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetCursorPosition (float  a[3]);
      Method is redundant. Same as SetCursorPosition( float, float, float)


=cut

package Graphics::VTK::ImageDataStreamer;


@Graphics::VTK::ImageDataStreamer::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageDataStreamer

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetIncrementalUpdate ();
   long unsigned GetMemoryLimit ();
   void IncrementalUpdateOff ();
   void IncrementalUpdateOn ();
   vtkImageDataStreamer *New ();
   void SetIncrementalUpdate (int );
   void SetMemoryLimit (unsigned long );
   void SetSplitModeToBlock ();
   void SetSplitModeToXSlab ();
   void SetSplitModeToYSlab ();
   void SetSplitModeToZSlab ();
   void TriggerAsynchronousUpdate ();
   void UpdateData (vtkDataObject *out);
   void UpdateInformation ();


B<vtkImageDataStreamer Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ImageDifference;


@Graphics::VTK::ImageDifference::ISA = qw( Graphics::VTK::ImageTwoInputFilter );

=head1 Graphics::VTK::ImageDifference

=over 1

=item *

Inherits from ImageTwoInputFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AllowShiftOff ();
   void AllowShiftOn ();
   void AveragingOff ();
   void AveragingOn ();
   int GetAllowShift ();
   int GetAveraging ();
   const char *GetClassName();
   float GetError (void );
   vtkImageData *GetImage ();
   int GetThreshold ();
   float GetThresholdedError (void );
   vtkImageDifference *New ();
   void SetAllowShift (int );
   void SetAveraging (int );
   void SetImage (vtkImageData *image);
   void SetInput (int num, vtkImageData *input);
   void SetInput (vtkImageData *input);
   void SetThreshold (int );


B<vtkImageDifference Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeInputUpdateExtent (int inExt[6], int outExt[6], int whichInput);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   float ErrorPerThreadVTK_MAX_THREADS []float ThresholdedErrorPerThreadVTK_MAX_THREADS []int AllowShiftint Thresholdint Averagingvoid ExecuteInformation (vtkImageData *inputs, vtkImageData *output);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetError (float *e);
      Don't know the size of pointer arg number 1

   void GetThresholdedError (float *e);
      Don't know the size of pointer arg number 1

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ThreadedExecute (vtkImageData *inDatas, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageDilateErode3D;


@Graphics::VTK::ImageDilateErode3D::ISA = qw( Graphics::VTK::ImageSpatialFilter );

=head1 Graphics::VTK::ImageDilateErode3D

=over 1

=item *

Inherits from ImageSpatialFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetDilateValue ();
   float GetErodeValue ();
   vtkImageDilateErode3D *New ();
   void SetDilateValue (float );
   void SetErodeValue (float );
   void SetKernelSize (int size0, int size1, int size2);


B<vtkImageDilateErode3D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   vtkImageEllipsoidSource *Ellipsefloat DilateValuefloat ErodeValuevoid ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageDivergence;


@Graphics::VTK::ImageDivergence::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageDivergence

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageDivergence *New ();


B<vtkImageDivergence Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeInputUpdateExtent (int inExt[6], int outExt[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int ext[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageDotProduct;


@Graphics::VTK::ImageDotProduct::ISA = qw( Graphics::VTK::ImageTwoInputFilter );

=head1 Graphics::VTK::ImageDotProduct

=over 1

=item *

Inherits from ImageTwoInputFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageDotProduct *New ();


B<vtkImageDotProduct Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ThreadedExecute (vtkImageData *inDatas, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageEllipsoidSource;


@Graphics::VTK::ImageEllipsoidSource::ISA = qw( Graphics::VTK::ImageSource );

=head1 Graphics::VTK::ImageEllipsoidSource

=over 1

=item *

Inherits from ImageSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float  *GetCenter ();
      (Returns a 3-element Perl list)
   const char *GetClassName();
   float GetInValue ();
   float GetOutValue ();
   int GetOutputScalarType ();
   float  *GetRadius ();
      (Returns a 3-element Perl list)
   vtkImageEllipsoidSource *New ();
   void SetCenter (float  , float , float );
   void SetInValue (float );
   void SetOutValue (float );
   void SetOutputScalarType (int );
   void SetOutputScalarTypeToChar ();
   void SetOutputScalarTypeToDouble ();
   void SetOutputScalarTypeToFloat ();
   void SetOutputScalarTypeToInt ();
   void SetOutputScalarTypeToLong ();
   void SetOutputScalarTypeToShort ();
   void SetOutputScalarTypeToUnsignedChar ();
   void SetOutputScalarTypeToUnsignedInt ();
   void SetOutputScalarTypeToUnsignedLong ();
   void SetOutputScalarTypeToUnsignedShort ();
   void SetRadius (float  , float , float );
   void SetWholeExtent (int minX, int maxX, int minY, int maxY, int minZ, int maxZ);


B<vtkImageEllipsoidSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int WholeExtent[6]float Center[3]float Radius[3]float InValuefloat OutValueint OutputScalarTypevoid ExecuteInformation ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetWholeExtent (int extent[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int *GetWholeExtent ();
      Can't Handle 'int *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetCenter (float  a[3]);
      Method is redundant. Same as SetCenter( float, float, float)

   void SetRadius (float  a[3]);
      Method is redundant. Same as SetRadius( float, float, float)

   void SetWholeExtent (int extent[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageEuclideanToPolar;


@Graphics::VTK::ImageEuclideanToPolar::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageEuclideanToPolar

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetThetaMaximum ();
   vtkImageEuclideanToPolar *New ();
   void SetThetaMaximum (float );


B<vtkImageEuclideanToPolar Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   float ThetaMaximumvoid ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int ext[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageExport;


@Graphics::VTK::ImageExport::ISA = qw( Graphics::VTK::ProcessObject );

=head1 Graphics::VTK::ImageExport

=over 1

=item *

Inherits from ProcessObject

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int *GetDataDimensions ();
      (Returns a 3-element Perl list)
   int *GetDataExtent ();
      (Returns a 6-element Perl list)
   int GetDataMemorySize ();
   int GetDataNumberOfScalarComponents ();
   float *GetDataOrigin ();
      (Returns a 3-element Perl list)
   int GetDataScalarType ();
   float *GetDataSpacing ();
      (Returns a 3-element Perl list)
   int GetImageLowerLeft ();
   vtkImageData *GetInput ();
   void *GetPointerToData ();
   void ImageLowerLeftOff ();
   void ImageLowerLeftOn ();
   vtkImageExport *New ();
   void SetImageLowerLeft (int );
   void SetInput (vtkImageData *input);


B<vtkImageExport Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void Export (void *);
      Don't know the size of pointer arg number 1

   void GetDataDimensions (int *ptr);
      Don't know the size of pointer arg number 1

   void GetDataExtent (int *ptr);
      Don't know the size of pointer arg number 1

   void GetDataOrigin (float *ptr);
      Don't know the size of pointer arg number 1

   void GetDataSpacing (float *ptr);
      Don't know the size of pointer arg number 1

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ImageExtractComponents;


@Graphics::VTK::ImageExtractComponents::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageExtractComponents

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int  *GetComponents ();
      (Returns a 3-element Perl list)
   int GetNumberOfComponents ();
   vtkImageExtractComponents *New ();
   void SetComponents (int c1, int c2, int c3);
   void SetComponents (int c1, int c2);
   void SetComponents (int c1);


B<vtkImageExtractComponents Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int NumberOfComponentsint Components[3]void ExecuteInformation (vtkImageData *inData, vtkImageData *outData);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int ext[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageFFT;


@Graphics::VTK::ImageFFT::ISA = qw( Graphics::VTK::ImageFourierFilter );

=head1 Graphics::VTK::ImageFFT

=over 1

=item *

Inherits from ImageFourierFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageFFT *New ();


B<vtkImageFFT Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeInputUpdateExtent (int inExt[6], int outExt[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int SplitExtent (int splitExt[6], int startExt[6], int num, int total);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int outExt[6], int threadId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageFlip;


@Graphics::VTK::ImageFlip::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageFlip

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetFilteredAxis ();
   int GetPreserveImageExtent ();
   vtkImageFlip *New ();
   void PreserveImageExtentOff ();
   void PreserveImageExtentOn ();
   void SetFilteredAxes (int axis);
   void SetFilteredAxis (int );
   void SetPreserveImageExtent (int );


B<vtkImageFlip Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeInputUpdateExtent (int inExt[6], int outExt[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int outExt[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageFourierCenter;


@Graphics::VTK::ImageFourierCenter::ISA = qw( Graphics::VTK::ImageDecomposeFilter );

=head1 Graphics::VTK::ImageFourierCenter

=over 1

=item *

Inherits from ImageDecomposeFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageFourierCenter *New ();


B<vtkImageFourierCenter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeInputUpdateExtent (int inExt[6], int outExt[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int outExt[6], int threadId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageGaussianSmooth;


@Graphics::VTK::ImageGaussianSmooth::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageGaussianSmooth

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetDimensionality ();
   float  *GetRadiusFactors ();
      (Returns a 3-element Perl list)
   float  *GetStandardDeviations ();
      (Returns a 3-element Perl list)
   vtkImageGaussianSmooth *New ();
   void SetDimensionality (int );
   void SetRadiusFactor (float f);
   void SetRadiusFactors (float  , float , float );
   void SetRadiusFactors (float f, float f2);
   void SetStandardDeviation (float a, float b, float c);
   void SetStandardDeviation (float a, float b);
   void SetStandardDeviation (float std);
   void SetStandardDeviations (float  , float , float );
   void SetStandardDeviations (float a, float b);


B<vtkImageGaussianSmooth Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeInputUpdateExtent (int inExt[6], int outExt[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int Dimensionalityfloat StandardDeviations[3]float RadiusFactors[3]void ComputeKernel (double *kernel, int min, int max, double std);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ExecuteAxis (int axis, vtkImageData *inData, int inExt[6], vtkImageData *outData, int outExt[6], int *pcycle, int target, int *pcount, int total);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetRadiusFactors (float  a[3]);
      Method is redundant. Same as SetRadiusFactors( float, float, float)

   void SetStandardDeviations (float  a[3]);
      Method is redundant. Same as SetStandardDeviations( float, float, float)

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int outExt[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageGaussianSource;


@Graphics::VTK::ImageGaussianSource::ISA = qw( Graphics::VTK::ImageSource );

=head1 Graphics::VTK::ImageGaussianSource

=over 1

=item *

Inherits from ImageSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float  *GetCenter ();
      (Returns a 3-element Perl list)
   const char *GetClassName();
   float GetMaximum ();
   float GetStandardDeviation ();
   vtkImageGaussianSource *New ();
   void SetCenter (float  , float , float );
   void SetMaximum (float );
   void SetStandardDeviation (float );
   void SetWholeExtent (int xMinx, int xMax, int yMin, int yMax, int zMin, int zMax);


B<vtkImageGaussianSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float StandardDeviationint WholeExtent[6]float Center[3]float Maximumvoid ExecuteInformation ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetCenter (float  a[3]);
      Method is redundant. Same as SetCenter( float, float, float)


=cut

package Graphics::VTK::ImageGridSource;


@Graphics::VTK::ImageGridSource::ISA = qw( Graphics::VTK::ImageSource );

=head1 Graphics::VTK::ImageGridSource

=over 1

=item *

Inherits from ImageSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int  *GetDataExtent ();
      (Returns a 6-element Perl list)
   float  *GetDataOrigin ();
      (Returns a 3-element Perl list)
   int GetDataScalarType ();
   char *GetDataScalarTypeAsString ();
   float  *GetDataSpacing ();
      (Returns a 3-element Perl list)
   float GetFillValue ();
   int  *GetGridOrigin ();
      (Returns a 3-element Perl list)
   int  *GetGridSpacing ();
      (Returns a 3-element Perl list)
   float GetLineValue ();
   vtkImageGridSource *New ();
   void SetDataExtent (int  , int , int , int , int , int );
   void SetDataOrigin (float  , float , float );
   void SetDataScalarType (int );
   void SetDataScalarTypeToFloat ();
   void SetDataScalarTypeToInt ();
   void SetDataScalarTypeToShort ();
   void SetDataScalarTypeToUnsignedChar ();
   void SetDataScalarTypeToUnsignedShort ();
   void SetDataSpacing (float  , float , float );
   void SetFillValue (float );
   void SetGridOrigin (int  , int , int );
   void SetGridSpacing (int  , int , int );
   void SetLineValue (float );


B<vtkImageGridSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int GridSpacing[3]int GridOrigin[3]float LineValuefloat FillValueint DataScalarTypeint DataExtent[6]float DataSpacing[3]float DataOrigin[3]void ExecuteInformation ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetDataExtent (int  a[6]);
      Method is redundant. Same as SetDataExtent( int, int, int, int, int, int)

   void SetDataOrigin (float  a[3]);
      Method is redundant. Same as SetDataOrigin( float, float, float)

   void SetDataSpacing (float  a[3]);
      Method is redundant. Same as SetDataSpacing( float, float, float)

   void SetGridOrigin (int  a[3]);
      Method is redundant. Same as SetGridOrigin( int, int, int)

   void SetGridSpacing (int  a[3]);
      Method is redundant. Same as SetGridSpacing( int, int, int)


=cut

package Graphics::VTK::ImageGradient;


@Graphics::VTK::ImageGradient::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageGradient

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetDimensionality ();
   int GetHandleBoundaries ();
   void HandleBoundariesOff ();
   void HandleBoundariesOn ();
   vtkImageGradient *New ();
   void SetDimensionality (int );
   void SetHandleBoundaries (int );


B<vtkImageGradient Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeInputUpdateExtent (int inExt[6], int outExt[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageGradientMagnitude;


@Graphics::VTK::ImageGradientMagnitude::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageGradientMagnitude

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetDimensionality ();
   int GetHandleBoundaries ();
   void HandleBoundariesOff ();
   void HandleBoundariesOn ();
   vtkImageGradientMagnitude *New ();
   void SetDimensionality (int );
   void SetHandleBoundaries (int );


B<vtkImageGradientMagnitude Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeInputUpdateExtent (int inExt[6], int outExt[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageHSVToRGB;


@Graphics::VTK::ImageHSVToRGB::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageHSVToRGB

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetMaximum ();
   vtkImageHSVToRGB *New ();
   void SetMaximum (float );


B<vtkImageHSVToRGB Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   float Maximumvoid ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int ext[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageHybridMedian2D;


@Graphics::VTK::ImageHybridMedian2D::ISA = qw( Graphics::VTK::ImageSpatialFilter );

=head1 Graphics::VTK::ImageHybridMedian2D

=over 1

=item *

Inherits from ImageSpatialFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageHybridMedian2D *New ();


B<vtkImageHybridMedian2D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float ComputeMedian (float *array, int size);
      Don't know the size of pointer arg number 1

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int outExt[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageIdealHighPass;


@Graphics::VTK::ImageIdealHighPass::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageIdealHighPass

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float  *GetCutOff ();
      (Returns a 3-element Perl list)
   float GetXCutOff ();
   float GetYCutOff ();
   float GetZCutOff ();
   vtkImageIdealHighPass *New ();
   void SetCutOff (float  , float , float );
   void SetCutOff (float v);
   void SetXCutOff (float v);
   void SetYCutOff (float v);
   void SetZCutOff (float v);


B<vtkImageIdealHighPass Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetCutOff (float  a[3]);
      Method is redundant. Same as SetCutOff( float, float, float)

   float CutOff[3]void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int outExt[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageIdealLowPass;


@Graphics::VTK::ImageIdealLowPass::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageIdealLowPass

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float  *GetCutOff ();
      (Returns a 3-element Perl list)
   float GetXCutOff ();
   float GetYCutOff ();
   float GetZCutOff ();
   vtkImageIdealLowPass *New ();
   void SetCutOff (float  , float , float );
   void SetCutOff (float v);
   void SetXCutOff (float v);
   void SetYCutOff (float v);
   void SetZCutOff (float v);


B<vtkImageIdealLowPass Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetCutOff (float  a[3]);
      Method is redundant. Same as SetCutOff( float, float, float)

   float CutOff[3]void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int outExt[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageImport;


@Graphics::VTK::ImageImport::ISA = qw( Graphics::VTK::ImageSource );

=head1 Graphics::VTK::ImageImport

=over 1

=item *

Inherits from ImageSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int  *GetDataExtent ();
      (Returns a 6-element Perl list)
   float  *GetDataOrigin ();
      (Returns a 3-element Perl list)
   int GetDataScalarType ();
   char *GetDataScalarTypeAsString ();
   float  *GetDataSpacing ();
      (Returns a 3-element Perl list)
   void *GetImportVoidPointer ();
   int GetNumberOfScalarComponents ();
   vtkImageImport *New ();
   void SetDataExtent (int  , int , int , int , int , int );
   void SetDataOrigin (float  , float , float );
   void SetDataScalarType (int );
   void SetDataScalarTypeToDouble ();
   void SetDataScalarTypeToFloat ();
   void SetDataScalarTypeToInt ();
   void SetDataScalarTypeToShort ();
   void SetDataScalarTypeToUnsignedChar ();
   void SetDataScalarTypeToUnsignedShort ();
   void SetDataSpacing (float  , float , float );
   void SetNumberOfScalarComponents (int );


B<vtkImageImport Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void CopyImportVoidPointer (void *ptr, int size);
      Don't know the size of pointer arg number 1

   void *ImportVoidPointerint SaveUserArrayint NumberOfScalarComponentsint DataScalarTypeint DataExtent[6]float DataSpacing[3]float DataOrigin[3]void Execute (vtkImageData *data);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetDataExtent (int  a[6]);
      Method is redundant. Same as SetDataExtent( int, int, int, int, int, int)

   void SetDataOrigin (float  a[3]);
      Method is redundant. Same as SetDataOrigin( float, float, float)

   void SetDataSpacing (float  a[3]);
      Method is redundant. Same as SetDataSpacing( float, float, float)

   void SetImportVoidPointer (void *ptr);
      Don't know the size of pointer arg number 1

   void SetImportVoidPointer (void *ptr, int save);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::ImageIslandRemoval2D;


@Graphics::VTK::ImageIslandRemoval2D::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageIslandRemoval2D

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   int GetAreaThreshold ();
   const char *GetClassName();
   float GetIslandValue ();
   float GetReplaceValue ();
   int GetSquareNeighborhood ();
   vtkImageIslandRemoval2D *New ();
   void SetAreaThreshold (int );
   void SetIslandValue (float );
   void SetReplaceValue (float );
   void SetSquareNeighborhood (int );
   void SquareNeighborhoodOff ();
   void SquareNeighborhoodOn ();


B<vtkImageIslandRemoval2D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ImageLaplacian;


@Graphics::VTK::ImageLaplacian::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageLaplacian

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetDimensionality ();
   vtkImageLaplacian *New ();
   void SetDimensionality (int );


B<vtkImageLaplacian Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int Dimensionalityvoid ComputeInputUpdateExtent (int inExt[6], int outExt[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int ext[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageLogarithmicScale;


@Graphics::VTK::ImageLogarithmicScale::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageLogarithmicScale

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetConstant ();
   vtkImageLogarithmicScale *New ();
   void SetConstant (float );


B<vtkImageLogarithmicScale Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   float Constantvoid ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int outExt[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageLogic;


@Graphics::VTK::ImageLogic::ISA = qw( Graphics::VTK::ImageTwoInputFilter );

=head1 Graphics::VTK::ImageLogic

=over 1

=item *

Inherits from ImageTwoInputFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetOperation ();
   float GetOutputTrueValue ();
   vtkImageLogic *New ();
   void SetOperation (int );
   void SetOperationToAnd ();
   void SetOperationToNand ();
   void SetOperationToNor ();
   void SetOperationToNot ();
   void SetOperationToOr ();
   void SetOperationToXor ();
   void SetOutputTrueValue (float );


B<vtkImageLogic Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   int Operationfloat OutputTrueValuevoid ThreadedExecute (vtkImageData *inDatas, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageLuminance;


@Graphics::VTK::ImageLuminance::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageLuminance

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageLuminance *New ();


B<vtkImageLuminance Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int ext[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageMagnify;


@Graphics::VTK::ImageMagnify::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageMagnify

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetInterpolate ();
   int  *GetMagnificationFactors ();
      (Returns a 3-element Perl list)
   void InterpolateOff ();
   void InterpolateOn ();
   vtkImageMagnify *New ();
   void SetInterpolate (int );
   void SetMagnificationFactors (int  , int , int );


B<vtkImageMagnify Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int MagnificationFactors[3]int Interpolatevoid ComputeInputUpdateExtent (int inExt[6], int outExt[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetMagnificationFactors (int  a[3]);
      Method is redundant. Same as SetMagnificationFactors( int, int, int)

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageMagnitude;


@Graphics::VTK::ImageMagnitude::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageMagnitude

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageMagnitude *New ();


B<vtkImageMagnitude Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageMandelbrotSource;


@Graphics::VTK::ImageMandelbrotSource::ISA = qw( Graphics::VTK::ImageSource );

=head1 Graphics::VTK::ImageMandelbrotSource

=over 1

=item *

Inherits from ImageSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void CopyOriginAndSample (vtkImageMandelbrotSource *source);
   const char *GetClassName();
   short unsigned GetMaximumNumberOfIterations ();
   double  *GetOriginCX ();
      (Returns a 4-element Perl list)
   int  *GetProjectionAxes ();
      (Returns a 3-element Perl list)
   double  *GetSampleCX ();
      (Returns a 4-element Perl list)
   int  *GetWholeExtent ();
      (Returns a 6-element Perl list)
   vtkImageMandelbrotSource *New ();
   void Pan (double x, double y, double z);
   void SetMaximumNumberOfIterations (unsigned short );
   void SetOriginCX (double  , double , double , double );
   void SetProjectionAxes (int  , int , int );
   void SetSample (double v);
   void SetSampleCX (double  , double , double , double );
   void SetWholeExtent (int minX, int maxX, int minY, int maxY, int minZ, int maxZ);
   void Zoom (double factor);


B<vtkImageMandelbrotSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float EvaluateSet (double p[4]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int ProjectionAxes[3]int WholeExtent[6]double OriginCX[4]double SampleCX[4]unsigned short MaximumNumberOfIterationsvoid Execute (vtkImageData *outData);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetOriginCX (double  a[4]);
      Method is redundant. Same as SetOriginCX( double, double, double, double)

   void SetProjectionAxes (int  a[3]);
      Method is redundant. Same as SetProjectionAxes( int, int, int)

   void SetSampleCX (double  a[4]);
      Method is redundant. Same as SetSampleCX( double, double, double, double)

   void SetWholeExtent (int extent[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageMapper;


@Graphics::VTK::ImageMapper::ISA = qw( Graphics::VTK::Mapper2D );

=head1 Graphics::VTK::ImageMapper

=over 1

=item *

Inherits from Mapper2D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetColorLevel ();
   float GetColorScale ();
   float GetColorShift ();
   float GetColorWindow ();
   int  *GetCustomDisplayExtents ();
      (Returns a 4-element Perl list)
   vtkImageData *GetInput ();
   unsigned long GetMTime ();
   int GetRenderToRectangle ();
   int GetUseCustomExtents ();
   int GetWholeZMax ();
   int GetWholeZMin ();
   int GetZSlice ();
   vtkImageMapper *New ();
   virtual void RenderData (vtkViewport *, vtkImageData *, vtkActor2D *) = 0;
   void RenderStart (vtkViewport *viewport, vtkActor2D *actor);
   void RenderToRectangleOff ();
   void RenderToRectangleOn ();
   void SetColorLevel (float );
   void SetColorWindow (float );
   void SetCustomDisplayExtents (int  [4]);
   void SetInput (vtkImageData *);
   void SetUseCustomExtents (int );
   void SetZSlice (int );
   void UseCustomExtentsOff ();
   void UseCustomExtentsOn ();


B<vtkImageMapper Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void Setint DisplayExtent[6]RenderToRectangle (int );
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageMapToColors;


@Graphics::VTK::ImageMapToColors::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageMapToColors

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkScalarsToColors *GetLookupTable ();
   unsigned long GetMTime ();
   int GetOutputFormat ();
   vtkImageMapToColors *New ();
   void SetLookupTable (vtkScalarsToColors *);
   void SetOutputFormat (int );
   void SetOutputFormatToLuminance ();
   void SetOutputFormatToLuminanceAlpha ();
   void SetOutputFormatToRGB ();
   void SetOutputFormatToRGBA ();
   void UpdateData (vtkDataObject *output);


B<vtkImageMapToColors Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageMapToRGBA;


@Graphics::VTK::ImageMapToRGBA::ISA = qw( Graphics::VTK::ImageMapToColors );

=head1 Graphics::VTK::ImageMapToRGBA

=over 1

=item *

Inherits from ImageMapToColors

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageMapToRGBA *New ();

=cut

package Graphics::VTK::ImageMapToWindowLevelColors;


@Graphics::VTK::ImageMapToWindowLevelColors::ISA = qw( Graphics::VTK::ImageMapToColors );

=head1 Graphics::VTK::ImageMapToWindowLevelColors

=over 1

=item *

Inherits from ImageMapToColors

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetLevel ();
   float GetWindow ();
   vtkImageMapToWindowLevelColors *New ();
   void SetLevel (float );
   void SetWindow (float );
   void UpdateData (vtkDataObject *output);


B<vtkImageMapToWindowLevelColors Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageMask;


@Graphics::VTK::ImageMask::ISA = qw( Graphics::VTK::ImageTwoInputFilter );

=head1 Graphics::VTK::ImageMask

=over 1

=item *

Inherits from ImageTwoInputFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetMaskedOutputValueLength ();
   int GetNotMask ();
   vtkImageMask *New ();
   void NotMaskOff ();
   void NotMaskOn ();
   void SetImageInput (vtkImageData *in);
   void SetMaskInput (vtkImageData *in);
   void SetMaskedOutputValue (float v1, float v2, float v3);
   void SetMaskedOutputValue (float v1, float v2);
   void SetMaskedOutputValue (float v);
   void SetNotMask (int );


B<vtkImageMask Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float *GetMaskedOutputValue ();
      Can't Handle 'float *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetMaskedOutputValue (int num, float *v);
      Don't know the size of pointer arg number 2

   void ThreadedExecute (vtkImageData *inDatas, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageMaskBits;


@Graphics::VTK::ImageMaskBits::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageMaskBits

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   unsigned int  *GetMasks ();
      (Returns a 4-element Perl list)
   int GetOperation ();
   vtkImageMaskBits *New ();
   void SetMask (unsigned int mask);
   void SetMasks (unsigned int  , unsigned int , unsigned int , unsigned int );
   void SetMasks (unsigned int mask1, unsigned int mask2, unsigned int mask3);
   void SetMasks (unsigned int mask1, unsigned int mask2);
   void SetOperation (int );
   void SetOperationToAnd ();
   void SetOperationToNand ();
   void SetOperationToNor ();
   void SetOperationToOr ();
   void SetOperationToXor ();


B<vtkImageMaskBits Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &, vtkIndent );
      I/O Streams not Supported yet

   void SetMasks (unsigned int  a[4]);
      Arg types of 'unsigned int  *' not supported yet
   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int ext[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageMathematics;


@Graphics::VTK::ImageMathematics::ISA = qw( Graphics::VTK::ImageTwoInputFilter );

=head1 Graphics::VTK::ImageMathematics

=over 1

=item *

Inherits from ImageTwoInputFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   double GetConstantC ();
   double GetConstantK ();
   int GetOperation ();
   vtkImageMathematics *New ();
   void SetConstantC (double );
   void SetConstantK (double );
   void SetOperation (int );
   void SetOperationToATAN ();
   void SetOperationToATAN2 ();
   void SetOperationToAbsoluteValue ();
   void SetOperationToAdd ();
   void SetOperationToAddConstant ();
   void SetOperationToComplexMultiply ();
   void SetOperationToConjugate ();
   void SetOperationToCos ();
   void SetOperationToDivide ();
   void SetOperationToExp ();
   void SetOperationToInvert ();
   void SetOperationToLog ();
   void SetOperationToMax ();
   void SetOperationToMin ();
   void SetOperationToMultiply ();
   void SetOperationToMultiplyByK ();
   void SetOperationToReplaceCByK ();
   void SetOperationToSin ();
   void SetOperationToSquare ();
   void SetOperationToSquareRoot ();
   void SetOperationToSubtract ();


B<vtkImageMathematics Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ThreadedExecute (vtkImageData *inDatas, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageMedian3D;


@Graphics::VTK::ImageMedian3D::ISA = qw( Graphics::VTK::ImageSpatialFilter );

=head1 Graphics::VTK::ImageMedian3D

=over 1

=item *

Inherits from ImageSpatialFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetNumberOfElements ();
   vtkImageMedian3D *New ();
   void SetKernelSize (int size0, int size1, int size2);


B<vtkImageMedian3D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   int NumberOfElementsvoid ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageMirrorPad;


@Graphics::VTK::ImageMirrorPad::ISA = qw( Graphics::VTK::ImagePadFilter );

=head1 Graphics::VTK::ImageMirrorPad

=over 1

=item *

Inherits from ImagePadFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageMirrorPad *New ();


B<vtkImageMirrorPad Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeInputUpdateExtent (int inExt[6], int outExt[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outRegion, int ext[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageNoiseSource;


@Graphics::VTK::ImageNoiseSource::ISA = qw( Graphics::VTK::ImageSource );

=head1 Graphics::VTK::ImageNoiseSource

=over 1

=item *

Inherits from ImageSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetMaximum ();
   float GetMinimum ();
   vtkImageNoiseSource *New ();
   void SetMaximum (float );
   void SetMinimum (float );
   void SetWholeExtent (int xMinx, int xMax, int yMin, int yMax, int zMin, int zMax);


B<vtkImageNoiseSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float Minimumfloat Maximumint WholeExtent[6]void ExecuteInformation ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ImageNonMaximumSuppression;


@Graphics::VTK::ImageNonMaximumSuppression::ISA = qw( Graphics::VTK::ImageTwoInputFilter );

=head1 Graphics::VTK::ImageNonMaximumSuppression

=over 1

=item *

Inherits from ImageTwoInputFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetDimensionality ();
   int GetHandleBoundaries ();
   void HandleBoundariesOff ();
   void HandleBoundariesOn ();
   vtkImageNonMaximumSuppression *New ();
   void SetDimensionality (int );
   void SetHandleBoundaries (int );
   void SetMagnitudeInput (vtkImageData *input);
   void SetVectorInput (vtkImageData *input);


B<vtkImageNonMaximumSuppression Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void ComputeInputUpdateExtent (int inExt[6], int outExt[6], int whichInput);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ThreadedExecute (vtkImageData *inDatas, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageNormalize;


@Graphics::VTK::ImageNormalize::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageNormalize

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageNormalize *New ();


B<vtkImageNormalize Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageOpenClose3D;


@Graphics::VTK::ImageOpenClose3D::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageOpenClose3D

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void DebugOff ();
   void DebugOn ();
   const char *GetClassName();
   float GetCloseValue ();
   vtkImageDilateErode3D *GetFilter0 ();
   vtkImageDilateErode3D *GetFilter1 ();
   unsigned long GetMTime ();
   float GetOpenValue ();
   vtkImageData *GetOutput (int idx);
   vtkImageData *GetOutput ();
   void Modified ();
   vtkImageOpenClose3D *New ();
   void SetCloseValue (float value);
   void SetInput (vtkImageData *Input);
   void SetKernelSize (int size0, int size1, int size2);
   void SetOpenValue (float value);


B<vtkImageOpenClose3D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ImagePermute;


@Graphics::VTK::ImagePermute::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImagePermute

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int  *GetFilteredAxes ();
      (Returns a 3-element Perl list)
   vtkImagePermute *New ();
   void SetFilteredAxes (int  , int , int );


B<vtkImagePermute Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeInputUpdateExtent (int inExt[6], int outExt[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int FilteredAxes[3]void ExecuteInformation (vtkImageData *inData, vtkImageData *outData);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetFilteredAxes (int  a[3]);
      Method is redundant. Same as SetFilteredAxes( int, int, int)

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int ext[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageQuantizeRGBToIndex;


@Graphics::VTK::ImageQuantizeRGBToIndex::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageQuantizeRGBToIndex

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float GetBuildTreeExecuteTime ();
   const char *GetClassName();
   float GetInitializeExecuteTime ();
   float GetLookupIndexExecuteTime ();
   vtkLookupTable *GetLookupTable ();
   int GetNumberOfColors ();
   vtkImageQuantizeRGBToIndex *New ();
   void SetNumberOfColors (int );


B<vtkImageQuantizeRGBToIndex Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeInputUpdateExtent (int inExt[6], int outExt[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Imager;


@Graphics::VTK::Imager::ISA = qw( Graphics::VTK::Viewport );

=head1 Graphics::VTK::Imager

=over 1

=item *

Inherits from Viewport

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual void Erase ();
   const char *GetClassName();
   vtkImageWindow *GetImageWindow ();
   virtual float GetPickedZ ();
   vtkWindow *GetVTKWindow ();
   vtkImager *New ();
   virtual vtkAssemblyPath *PickProp (float selectionX, float selectionY);
   virtual int RenderOpaqueGeometry ();
   virtual int RenderOverlay ();
   virtual int RenderTranslucentGeometry ();

=cut

package Graphics::VTK::ImagerCollection;


@Graphics::VTK::ImagerCollection::ISA = qw( Graphics::VTK::Collection );

=head1 Graphics::VTK::ImagerCollection

=over 1

=item *

Inherits from Collection

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddItem (vtkImager *a);
   const char *GetClassName();
   vtkImager *GetLastItem ();
   vtkImager *GetNextItem ();
   vtkImagerCollection *New ();

=cut

package Graphics::VTK::ImageReader;


@Graphics::VTK::ImageReader::ISA = qw( Graphics::VTK::ImageSource );

=head1 Graphics::VTK::ImageReader

=over 1

=item *

Inherits from ImageSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ComputeInternalFileName (int slice);
   void FileLowerLeftOff ();
   void FileLowerLeftOn ();
   const char *GetClassName();
   int GetDataByteOrder ();
   char *GetDataByteOrderAsString ();
   int  *GetDataExtent ();
      (Returns a 6-element Perl list)
   short unsigned GetDataMask ();
   float  *GetDataOrigin ();
      (Returns a 3-element Perl list)
   int GetDataScalarType ();
   float  *GetDataSpacing ();
      (Returns a 3-element Perl list)
   int  *GetDataVOI ();
      (Returns a 6-element Perl list)
   int GetFileDimensionality ();
   int GetFileLowerLeft ();
   char *GetFileName ();
   char *GetFilePattern ();
   char *GetFilePrefix ();
   int GetHeaderSize (int slice);
   int GetHeaderSize ();
   char *GetInternalFileName ();
   int GetNumberOfScalarComponents ();
   int GetSwapBytes ();
   vtkTransform *GetTransform ();
   vtkImageReader *New ();
   void OpenFile ();
   void SetDataByteOrder (int );
   void SetDataByteOrderToBigEndian ();
   void SetDataByteOrderToLittleEndian ();
   void SetDataExtent (int  , int , int , int , int , int );
   void SetDataMask (int val);
   void SetDataOrigin (float  , float , float );
   void SetDataScalarType (int type);
   void SetDataScalarTypeToDouble ();
   void SetDataScalarTypeToFloat ();
   void SetDataScalarTypeToInt ();
   void SetDataScalarTypeToShort ();
   void SetDataScalarTypeToUnsignedChar ();
   void SetDataScalarTypeToUnsignedShort ();
   void SetDataSpacing (float  , float , float );
   void SetDataVOI (int  , int , int , int , int , int );
   void SetFileDimensionality (int );
   void SetFileLowerLeft (int );
   void SetFileName (char *);
   void SetFilePattern (char *);
   void SetFilePrefix (char *);
   void SetHeaderSize (int size);
   void SetNumberOfScalarComponents (int );
   void SetSwapBytes (int );
   void SetTransform (vtkTransform *);
   void SwapBytesOff ();
   void SwapBytesOn ();


B<vtkImageReader Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeInverseTransformedExtent (int inExtent[6], int outExtent[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeInverseTransformedIncrements (int inIncr[3], int outIncr[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeTransformedExtent (int inExtent[6], int outExtent[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeTransformedIncrements (int inIncr[3], int outIncr[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ComputeTransformedOrigin (float origin[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   char *InternalFileNamechar *FileNamechar *FilePrefixchar *FilePatternint NumberOfScalarComponentsint FileLowerLeftifstream *Fileunsigned long DataIncrements[4]int DataExtent[6]unsigned short DataMaskint SwapBytesint FileDimensionalityint HeaderSizeint DataScalarTypeint ManualHeaderSizeint InitializedvtkTransform *Transformvoid ComputeTransformedSpacing (float Spacing[3]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int DataDimensions[3]float DataSpacing[3]float DataOrigin[3]int DataVOI[6]void ExecuteInformation ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void OpenAndSeekFile (int extent[6], int slice);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetDataExtent (int  a[6]);
      Method is redundant. Same as SetDataExtent( int, int, int, int, int, int)

   void SetDataOrigin (float  a[3]);
      Method is redundant. Same as SetDataOrigin( float, float, float)

   void SetDataSpacing (float  a[3]);
      Method is redundant. Same as SetDataSpacing( float, float, float)

   void SetDataVOI (int  a[6]);
      Method is redundant. Same as SetDataVOI( int, int, int, int, int, int)


=cut

package Graphics::VTK::ImageResample;


@Graphics::VTK::ImageResample::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageResample

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float GetAxisMagnificationFactor (int axis);
   const char *GetClassName();
   int GetDimensionality ();
   int GetInterpolate ();
   void InterpolateOff ();
   void InterpolateOn ();
   vtkImageResample *New ();
   void SetAxisMagnificationFactor (int axis, float factor);
   void SetAxisOutputSpacing (int axis, float spacing);
   void SetDimensionality (int );
   void SetInterpolate (int );


B<vtkImageResample Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   float MagnificationFactors[3]float OutputSpacing[3]int Interpolateint Dimensionalityvoid ComputeInputUpdateExtent (int inExt[6], int outExt[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageRFFT;


@Graphics::VTK::ImageRFFT::ISA = qw( Graphics::VTK::ImageFourierFilter );

=head1 Graphics::VTK::ImageRFFT

=over 1

=item *

Inherits from ImageFourierFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageRFFT *New ();


B<vtkImageRFFT Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeInputUpdateExtent (int inExt[6], int outExt[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int SplitExtent (int splitExt[6], int startExt[6], int num, int total);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int outExt[6], int threadId);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageRGBToHSV;


@Graphics::VTK::ImageRGBToHSV::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageRGBToHSV

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetMaximum ();
   vtkImageRGBToHSV *New ();
   void SetMaximum (float );


B<vtkImageRGBToHSV Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   float Maximumvoid ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int ext[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageRange3D;


@Graphics::VTK::ImageRange3D::ISA = qw( Graphics::VTK::ImageSpatialFilter );

=head1 Graphics::VTK::ImageRange3D

=over 1

=item *

Inherits from ImageSpatialFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageRange3D *New ();
   void SetKernelSize (int size0, int size1, int size2);


B<vtkImageRange3D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageSeedConnectivity;


@Graphics::VTK::ImageSeedConnectivity::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageSeedConnectivity

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddSeed (int i0, int i1, int i2);
   void AddSeed (int i0, int i1);
   const char *GetClassName();
   vtkImageConnector *GetConnector ();
   int GetDimensionality ();
   int GetInputConnectValue ();
   int GetOutputConnectedValue ();
   int GetOutputUnconnectedValue ();
   vtkImageSeedConnectivity *New ();
   void RemoveAllSeeds ();
   void SetDimensionality (int );
   void SetInputConnectValue (int );
   void SetOutputConnectedValue (int );
   void SetOutputUnconnectedValue (int );


B<vtkImageSeedConnectivity Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void AddSeed (int num, int *index);
      Don't know the size of pointer arg number 2

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ImageShiftScale;


@Graphics::VTK::ImageShiftScale::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageShiftScale

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void ClampOverflowOff ();
   void ClampOverflowOn ();
   int GetClampOverflow ();
   const char *GetClassName();
   int GetOutputScalarType ();
   float GetScale ();
   float GetShift ();
   vtkImageShiftScale *New ();
   void SetClampOverflow (int );
   void SetOutputScalarType (int );
   void SetOutputScalarTypeToChar ();
   void SetOutputScalarTypeToDouble ();
   void SetOutputScalarTypeToFloat ();
   void SetOutputScalarTypeToInt ();
   void SetOutputScalarTypeToLong ();
   void SetOutputScalarTypeToShort ();
   void SetOutputScalarTypeToUnsignedChar ();
   void SetOutputScalarTypeToUnsignedInt ();
   void SetOutputScalarTypeToUnsignedLong ();
   void SetOutputScalarTypeToUnsignedShort ();
   void SetScale (float );
   void SetShift (float );


B<vtkImageShiftScale Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageShrink3D;


@Graphics::VTK::ImageShrink3D::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageShrink3D

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AveragingOff ();
   void AveragingOn ();
   int GetAveraging ();
   const char *GetClassName();
   int GetMaximum ();
   int GetMean ();
   int GetMedian ();
   int GetMinimum ();
   int  *GetShift ();
      (Returns a 3-element Perl list)
   int  *GetShrinkFactors ();
      (Returns a 3-element Perl list)
   void MaximumOff ();
   void MaximumOn ();
   void MeanOff ();
   void MeanOn ();
   void MedianOff ();
   void MedianOn ();
   void MinimumOff ();
   void MinimumOn ();
   vtkImageShrink3D *New ();
   void SetAveraging (int );
   void SetMaximum (int );
   void SetMean (int );
   void SetMedian (int );
   void SetMinimum (int );
   void SetShift (int  , int , int );
   void SetShrinkFactors (int  , int , int );


B<vtkImageShrink3D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeInputUpdateExtent (int inExt[6], int outExt[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   int ShrinkFactors[3]int Shift[3]int Meanint Minimumint Maximumint Medianvoid ExecuteInformation (vtkImageData *inData, vtkImageData *outData);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetShift (int  a[3]);
      Method is redundant. Same as SetShift( int, int, int)

   void SetShrinkFactors (int  a[3]);
      Method is redundant. Same as SetShrinkFactors( int, int, int)

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int ext[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageSinusoidSource;


@Graphics::VTK::ImageSinusoidSource::ISA = qw( Graphics::VTK::ImageSource );

=head1 Graphics::VTK::ImageSinusoidSource

=over 1

=item *

Inherits from ImageSource

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   float GetAmplitude ();
   const char *GetClassName();
   float  *GetDirection ();
      (Returns a 3-element Perl list)
   float GetPeriod ();
   float GetPhase ();
   vtkImageSinusoidSource *New ();
   void SetAmplitude (float );
   void SetDirection (float , float , float );
   void SetPeriod (float );
   void SetPhase (float );
   void SetWholeExtent (int xMinx, int xMax, int yMin, int yMax, int zMin, int zMax);


B<vtkImageSinusoidSource Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int WholeExtent[6]float Direction[3]float Periodfloat Phasefloat Amplitudevoid ExecuteInformation ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetDirection (float *);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::ImageSkeleton2D;


@Graphics::VTK::ImageSkeleton2D::ISA = qw( Graphics::VTK::ImageIterateFilter );

=head1 Graphics::VTK::ImageSkeleton2D

=over 1

=item *

Inherits from ImageIterateFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetPrune ();
   vtkImageSkeleton2D *New ();
   void PruneOff ();
   void PruneOn ();
   void SetNumberOfIterations (int num);
   void SetPrune (int );


B<vtkImageSkeleton2D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int Prunevoid ComputeInputUpdateExtent (int inExt[6], int outExt[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int outExt[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageSobel2D;


@Graphics::VTK::ImageSobel2D::ISA = qw( Graphics::VTK::ImageSpatialFilter );

=head1 Graphics::VTK::ImageSobel2D

=over 1

=item *

Inherits from ImageSpatialFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageSobel2D *New ();


B<vtkImageSobel2D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int outExt[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageSobel3D;


@Graphics::VTK::ImageSobel3D::ISA = qw( Graphics::VTK::ImageSpatialFilter );

=head1 Graphics::VTK::ImageSobel3D

=over 1

=item *

Inherits from ImageSpatialFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageSobel3D *New ();


B<vtkImageSobel3D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int outExt[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageThreshold;


@Graphics::VTK::ImageThreshold::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageThreshold

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetInValue ();
   float GetLowerThreshold ();
   float GetOutValue ();
   int GetOutputScalarType ();
   int GetReplaceIn ();
   int GetReplaceOut ();
   float GetUpperThreshold ();
   vtkImageThreshold *New ();
   void ReplaceInOff ();
   void ReplaceInOn ();
   void ReplaceOutOff ();
   void ReplaceOutOn ();
   void SetInValue (float val);
   void SetOutValue (float val);
   void SetOutputScalarType (int );
   void SetOutputScalarTypeToChar ();
   void SetOutputScalarTypeToDouble ();
   void SetOutputScalarTypeToFloat ();
   void SetOutputScalarTypeToInt ();
   void SetOutputScalarTypeToLong ();
   void SetOutputScalarTypeToShort ();
   void SetOutputScalarTypeToUnsignedChar ();
   void SetOutputScalarTypeToUnsignedInt ();
   void SetOutputScalarTypeToUnsignedLong ();
   void SetOutputScalarTypeToUnsignedShort ();
   void SetReplaceIn (int );
   void SetReplaceOut (int );
   void ThresholdBetween (float lower, float upper);
   void ThresholdByLower (float thresh);
   void ThresholdByUpper (float thresh);


B<vtkImageThreshold Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageTranslateExtent;


@Graphics::VTK::ImageTranslateExtent::ISA = qw( Graphics::VTK::ImageToImageFilter );

=head1 Graphics::VTK::ImageTranslateExtent

=over 1

=item *

Inherits from ImageToImageFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int  *GetTranslation ();
      (Returns a 3-element Perl list)
   vtkImageTranslateExtent *New ();
   void SetTranslation (int  , int , int );
   void UpdateData (vtkDataObject *data);


B<vtkImageTranslateExtent Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int Translation[3]void ComputeInputUpdateExtent (int extent[6], int wholeExtent[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetTranslation (int  a[3]);
      Method is redundant. Same as SetTranslation( int, int, int)


=cut

package Graphics::VTK::ImageVariance3D;


@Graphics::VTK::ImageVariance3D::ISA = qw( Graphics::VTK::ImageSpatialFilter );

=head1 Graphics::VTK::ImageVariance3D

=over 1

=item *

Inherits from ImageSpatialFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageVariance3D *New ();
   void SetKernelSize (int size0, int size1, int size2);


B<vtkImageVariance3D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outData, int extent[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageViewer;


@Graphics::VTK::ImageViewer::ISA = qw( Graphics::VTK::Object );

=head1 Graphics::VTK::ImageViewer

=over 1

=item *

Inherits from Object

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   vtkActor2D *GetActor2D ();
   const char *GetClassName();
   float GetColorLevel ();
   float GetColorWindow ();
   int GetGrayScaleHint ();
   vtkImageMapper *GetImageMapper ();
   vtkImageWindow *GetImageWindow ();
   vtkImager *GetImager ();
   vtkImageData *GetInput ();
   int GetWholeZMax ();
   int GetWholeZMin ();
   char *GetWindowName ();
   int GetZSlice ();
   void GrayScaleHintOff ();
   void GrayScaleHintOn ();
   vtkImageViewer *New ();
   virtual void Render (void );
   void SetColorLevel (float s);
   void SetColorWindow (float s);
   void SetGrayScaleHint (int a);
   void SetInput (vtkImageData *in);
   void SetPosition (int a, int b);
   void SetSize (int a, int b);
   void SetZSlice (int s);


B<vtkImageViewer Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int *GetPosition ();
      Can't Handle 'int *' return type without a hint

   int *GetSize ();
      Can't Handle 'int *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetDisplayId (void *a);
      Don't know the size of pointer arg number 1

   void SetParentId (void *a);
      Don't know the size of pointer arg number 1

   virtual void SetPosition (int a[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void SetSize (int a[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetWindowId (void *a);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::ImageWindow;


@Graphics::VTK::ImageWindow::ISA = qw( Graphics::VTK::Window );

=head1 Graphics::VTK::ImageWindow

=over 1

=item *

Inherits from Window

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void AddImager (vtkImager *im);
   virtual void ClosePPMImageFile ();
   virtual void EraseWindow ();
   virtual void Frame () = 0;
   const char *GetClassName();
   char *GetFileName ();
   virtual void *GetGenericContext () = 0;
   virtual void *GetGenericDisplayId () = 0;
   virtual void *GetGenericDrawable ();
   virtual void *GetGenericParentId () = 0;
   virtual void *GetGenericWindowId () = 0;
   int GetGrayScaleHint ();
   vtkImagerCollection *GetImagers ();
   void GrayScaleHintOff ();
   void GrayScaleHintOn ();
   virtual void MakeCurrent ();
   vtkImageWindow *New ();
   virtual int OpenPPMImageFile ();
   void RemoveImager (vtkImager *im);
   virtual void Render ();
   virtual void SaveImageAsPPM ();
   void SetFileName (char *);
   void SetGrayScaleHint (int );
   virtual void SetPosition (int x, int y) = 0;
   virtual void SetSize (int , int ) = 0;
   virtual void SetWindowInfo (char *);
   virtual void SwapBuffers () = 0;
   virtual void WritePPMImageFile ();


B<vtkImageWindow Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual int *GetPosition () = 0;
      Can't Handle 'int *' return type without a hint

   virtual void GetPosition (int *x, int *y);
      Don't know the size of pointer arg number 1

   virtual int *GetSize () = 0;
      Can't Handle 'int *' return type without a hint

   virtual void GetSize (int *x, int *y);
      Don't know the size of pointer arg number 1

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

package Graphics::VTK::ImageWrapPad;


@Graphics::VTK::ImageWrapPad::ISA = qw( Graphics::VTK::ImagePadFilter );

=head1 Graphics::VTK::ImageWrapPad

=over 1

=item *

Inherits from ImagePadFilter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkImageWrapPad *New ();


B<vtkImageWrapPad Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void ComputeInputUpdateExtent (int inExt[6], int outExt[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void ThreadedExecute (vtkImageData *inData, vtkImageData *outRegion, int ext[6], int id);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ImageWriter;


@Graphics::VTK::ImageWriter::ISA = qw( Graphics::VTK::ProcessObject );

=head1 Graphics::VTK::ImageWriter

=over 1

=item *

Inherits from ProcessObject

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetFileDimensionality ();
   char *GetFileName ();
   char *GetFilePattern ();
   char *GetFilePrefix ();
   vtkImageData *GetInput ();
   long unsigned GetMemoryLimit ();
   vtkImageWriter *New ();
   void SetFileDimensionality (int );
   void SetFileName (char *);
   void SetFilePattern (char *filePattern);
   void SetFilePrefix (char *filePrefix);
   virtual void SetInput (vtkImageData *input);
   void SetMemoryLimit (unsigned long );
   virtual void Write ();


B<vtkImageWriter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   int FileDimensionalitychar *FilePrefixchar *FilePatternchar *FileNameint FileNumberint FileLowerLeftchar *InternalFileNameunsigned long MemoryLimitvoid RecursiveWrite (int dim, vtkImageData *region, ofstream *file);
      Don't know the size of pointer arg number 3

   void RecursiveWrite (int dim, vtkImageData *cache, vtkImageData *data, ofstream *file);
      Don't know the size of pointer arg number 4

   virtual void WriteFile (ofstream *file, vtkImageData *data, int extent[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void WriteFileHeader (ofstream *, vtkImageData *);
      Don't know the size of pointer arg number 1

   virtual void WriteFileTrailer (ofstream *, vtkImageData *);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::LabeledDataMapper;


@Graphics::VTK::LabeledDataMapper::ISA = qw( Graphics::VTK::Mapper2D );

=head1 Graphics::VTK::LabeledDataMapper

=over 1

=item *

Inherits from Mapper2D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BoldOff ();
   void BoldOn ();
   int GetBold ();
   const char *GetClassName();
   int GetFieldDataArray ();
   int GetFontFamily ();
   int GetFontSize ();
   vtkDataSet *GetInput ();
   int GetItalic ();
   char *GetLabelFormat ();
   int GetLabelMode ();
   int GetLabeledComponent ();
   int GetShadow ();
   void ItalicOff ();
   void ItalicOn ();
   vtkLabeledDataMapper *New ();
   virtual void ReleaseGraphicsResources (vtkWindow *);
   void RenderOpaqueGeometry (vtkViewport *viewport, vtkActor2D *actor);
   void RenderOverlay (vtkViewport *viewport, vtkActor2D *actor);
   void SetBold (int );
   void SetFieldDataArray (int );
   void SetFontFamily (int );
   void SetFontFamilyToArial ();
   void SetFontFamilyToCourier ();
   void SetFontFamilyToTimes ();
   void SetFontSize (int );
   void SetInput (vtkDataSet *);
   void SetItalic (int );
   void SetLabelFormat (char *);
   void SetLabelMode (int );
   void SetLabelModeToLabelFieldData ();
   void SetLabelModeToLabelIds ();
   void SetLabelModeToLabelNormals ();
   void SetLabelModeToLabelScalars ();
   void SetLabelModeToLabelTCoords ();
   void SetLabelModeToLabelTensors ();
   void SetLabelModeToLabelVectors ();
   void SetLabeledComponent (int );
   void SetShadow (int );
   void ShadowOff ();
   void ShadowOn ();


B<vtkLabeledDataMapper Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::ParallelCoordinatesActor;


@Graphics::VTK::ParallelCoordinatesActor::ISA = qw( Graphics::VTK::Actor2D );

=head1 Graphics::VTK::ParallelCoordinatesActor

=over 1

=item *

Inherits from Actor2D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BoldOff ();
   void BoldOn ();
   int GetBold ();
   const char *GetClassName();
   int GetFontFamily ();
   int GetIndependentVariables ();
   vtkDataObject *GetInput ();
   int GetItalic ();
   char *GetLabelFormat ();
   int GetNumberOfLabels ();
   int GetShadow ();
   char *GetTitle ();
   void ItalicOff ();
   void ItalicOn ();
   vtkParallelCoordinatesActor *New ();
   void ReleaseGraphicsResources (vtkWindow *);
   int RenderOpaqueGeometry (vtkViewport *);
   int RenderOverlay (vtkViewport *);
   int RenderTranslucentGeometry (vtkViewport *);
   void SetBold (int );
   void SetFontFamily (int );
   void SetFontFamilyToArial ();
   void SetFontFamilyToCourier ();
   void SetFontFamilyToTimes ();
   void SetIndependentVariables (int );
   void SetIndependentVariablesToColumns ();
   void SetIndependentVariablesToRows ();
   void SetInput (vtkDataObject *);
   void SetItalic (int );
   void SetLabelFormat (char *);
   void SetNumberOfLabels (int );
   void SetShadow (int );
   void SetTitle (char *);
   void ShadowOff ();
   void ShadowOn ();


B<vtkParallelCoordinatesActor Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int PlaceAxes (vtkViewport *viewport, int *size);
      Don't know the size of pointer arg number 2

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::PNMReader;


@Graphics::VTK::PNMReader::ISA = qw( Graphics::VTK::ImageReader );

=head1 Graphics::VTK::PNMReader

=over 1

=item *

Inherits from ImageReader

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkPNMReader *New ();

=cut

package Graphics::VTK::PNMWriter;


@Graphics::VTK::PNMWriter::ISA = qw( Graphics::VTK::ImageWriter );

=head1 Graphics::VTK::PNMWriter

=over 1

=item *

Inherits from ImageWriter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkPNMWriter *New ();


B<vtkPNMWriter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void WriteFile (ofstream *file, vtkImageData *data, int extent[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void WriteFileHeader (ofstream *, vtkImageData *);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::PolyDataMapper2D;


@Graphics::VTK::PolyDataMapper2D::ISA = qw( Graphics::VTK::Mapper2D );

=head1 Graphics::VTK::PolyDataMapper2D

=over 1

=item *

Inherits from Mapper2D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual void CreateDefaultLookupTable ();
   const char *GetClassName();
   int GetColorMode ();
   char *GetColorModeAsString ();
   vtkScalars *GetColors ();
   vtkPolyData *GetInput ();
   vtkScalarsToColors *GetLookupTable ();
   virtual unsigned long GetMTime ();
   float  *GetScalarRange ();
      (Returns a 2-element Perl list)
   int GetScalarVisibility ();
   vtkCoordinate *GetTransformCoordinate ();
   vtkPolyDataMapper2D *New ();
   void ScalarVisibilityOff ();
   void ScalarVisibilityOn ();
   void SetColorMode (int );
   void SetColorModeToDefault ();
   void SetColorModeToLuminance ();
   void SetColorModeToMapScalars ();
   void SetInput (vtkPolyData *);
   void SetLookupTable (vtkScalarsToColors *lut);
   void SetScalarRange (float  , float );
   void SetScalarVisibility (int );
   void SetTransformCoordinate (vtkCoordinate *);
   void ShallowCopy (vtkPolyDataMapper2D *m);


B<vtkPolyDataMapper2D Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetScalarRange (float  a[2]);
      Method is redundant. Same as SetScalarRange( float, float)


=cut

package Graphics::VTK::PostScriptWriter;


@Graphics::VTK::PostScriptWriter::ISA = qw( Graphics::VTK::ImageWriter );

=head1 Graphics::VTK::PostScriptWriter

=over 1

=item *

Inherits from ImageWriter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkPostScriptWriter *New ();


B<vtkPostScriptWriter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void WriteFile (ofstream *file, vtkImageData *data, int extent[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void WriteFileHeader (ofstream *, vtkImageData *);
      Don't know the size of pointer arg number 1

   virtual void WriteFileTrailer (ofstream *, vtkImageData *);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::ScalarBarActor;


@Graphics::VTK::ScalarBarActor::ISA = qw( Graphics::VTK::Actor2D );

=head1 Graphics::VTK::ScalarBarActor

=over 1

=item *

Inherits from Actor2D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BoldOff ();
   void BoldOn ();
   int GetBold ();
   const char *GetClassName();
   int GetFontFamily ();
   int GetItalic ();
   char *GetLabelFormat ();
   vtkScalarsToColors *GetLookupTable ();
   int GetMaximumNumberOfColors ();
   int GetNumberOfLabels ();
   int GetOrientation ();
   int GetShadow ();
   char *GetTitle ();
   void ItalicOff ();
   void ItalicOn ();
   vtkScalarBarActor *New ();
   virtual void ReleaseGraphicsResources (vtkWindow *);
   int RenderOpaqueGeometry (vtkViewport *viewport);
   int RenderOverlay (vtkViewport *viewport);
   int RenderTranslucentGeometry (vtkViewport *);
   void SetBold (int );
   void SetFontFamily (int );
   void SetFontFamilyToArial ();
   void SetFontFamilyToCourier ();
   void SetFontFamilyToTimes ();
   void SetItalic (int );
   void SetLabelFormat (char *);
   void SetLookupTable (vtkScalarsToColors *);
   void SetMaximumNumberOfColors (int );
   void SetNumberOfLabels (int );
   void SetOrientation (int );
   void SetOrientationToHorizontal ();
   void SetOrientationToVertical ();
   void SetShadow (int );
   void SetTitle (char *);
   void ShadowOff ();
   void ShadowOn ();
   void ShallowCopy (vtkProp *prop);


B<vtkScalarBarActor Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void AllocateAndSizeLabels (int *labelSize, int *size, vtkViewport *viewport, float *range);
      Don't know the size of pointer arg number 1

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   vtkScalarsToColors *LookupTableint MaximumNumberOfColorsint NumberOfLabelsint NumberOfLabelsBuiltint Orientationchar *Titleint Boldint Italicint Shadowint FontFamilychar *LabelFormatvtkTextMapper *TitleMappervtkActor2D *TitleActorvtkTextMapper *TextMappersvtkActor2D *TextActorsvtkPolyData *ScalarBarvtkPolyDataMapper2D *ScalarBarMappervtkActor2D *ScalarBarActorvtkTimeStamp BuildTimeint LastSize[2]int LastOrigin[2]void SizeTitle (int *titleSize, int *size, vtkViewport *viewport);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::ScaledTextActor;


@Graphics::VTK::ScaledTextActor::ISA = qw( Graphics::VTK::Actor2D );

=head1 Graphics::VTK::ScaledTextActor

=over 1

=item *

Inherits from Actor2D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   float GetMaximumLineHeight ();
   int  *GetMinimumSize ();
      (Returns a 2-element Perl list)
   vtkScaledTextActor *New ();
   void SetMapper (vtkTextMapper *mapper);
   void SetMaximumLineHeight (float );
   void SetMinimumSize (int  , int );
   void ShallowCopy (vtkProp *prop);


B<vtkScaledTextActor Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   int MinimumSize[2]float MaximumLineHeightvtkActor2D *TextActorvtkTimeStamp BuildTimeint LastSize[2]int LastOrigin[2]void SetMapper (vtkMapper2D *mapper);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetMinimumSize (int  a[2]);
      Method is redundant. Same as SetMinimumSize( int, int)


=cut

package Graphics::VTK::TextMapper;


@Graphics::VTK::TextMapper::ISA = qw( Graphics::VTK::Mapper2D );

=head1 Graphics::VTK::TextMapper

=over 1

=item *

Inherits from Mapper2D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void BoldOff ();
   void BoldOn ();
   int GetBold ();
   const char *GetClassName();
   int GetFontFamily ();
   int GetFontSize ();
   int GetHeight (vtkViewport *);
   char *GetInput ();
   int GetItalic ();
   int GetJustification ();
   float GetLineOffset ();
   float GetLineSpacing ();
   int GetNumberOfLines (char *input);
   int GetNumberOfLines ();
   int GetShadow ();
   int GetVerticalJustification ();
   int GetWidth (vtkViewport *);
   void ItalicOff ();
   void ItalicOn ();
   vtkTextMapper *New ();
   void SetBold (int val);
   void SetFontFamily (int val);
   void SetFontFamilyToArial ();
   void SetFontFamilyToCourier ();
   void SetFontFamilyToTimes ();
   virtual void SetFontSize (int size);
   void SetInput (char *inputString);
   void SetItalic (int val);
   void SetJustification (int );
   void SetJustificationToCentered ();
   void SetJustificationToLeft ();
   void SetJustificationToRight ();
   void SetLineOffset (float );
   void SetLineSpacing (float );
   void SetShadow (int val);
   void SetVerticalJustification (int );
   void SetVerticalJustificationToBottom ();
   void SetVerticalJustificationToCentered ();
   void SetVerticalJustificationToTop ();
   void ShadowOff ();
   void ShadowOn ();
   void ShallowCopy (vtkTextMapper *tm);


B<vtkTextMapper Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GetMultiLineSize (vtkViewport *viewport, int size[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void GetSize (vtkViewport *, int size[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::TIFFReader;


@Graphics::VTK::TIFFReader::ISA = qw( Graphics::VTK::ImageReader );

=head1 Graphics::VTK::TIFFReader

=over 1

=item *

Inherits from ImageReader

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkTIFFReader *New ();

=cut

package Graphics::VTK::TIFFWriter;


@Graphics::VTK::TIFFWriter::ISA = qw( Graphics::VTK::ImageWriter );

=head1 Graphics::VTK::TIFFWriter

=over 1

=item *

Inherits from ImageWriter

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkTIFFWriter *New ();


B<vtkTIFFWriter Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual void WriteFile (ofstream *file, vtkImageData *data, int ext[6]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   virtual void WriteFileHeader (ofstream *, vtkImageData *);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::MesaImager;


@Graphics::VTK::MesaImager::ISA = qw( Graphics::VTK::Imager );

=head1 Graphics::VTK::MesaImager

=over 1

=item *

Inherits from Imager

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Erase ();
   const char *GetClassName();
   vtkMesaImager *New ();
   int RenderOpaqueGeometry ();

=cut

package Graphics::VTK::MesaImageMapper;


@Graphics::VTK::MesaImageMapper::ISA = qw( Graphics::VTK::ImageMapper );

=head1 Graphics::VTK::MesaImageMapper

=over 1

=item *

Inherits from ImageMapper

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkMesaImageMapper *New ();
   void RenderData (vtkViewport *viewport, vtkImageData *data, vtkActor2D *actor);
   void RenderOpaqueGeometry (vtkViewport *viewport, vtkActor2D *actor);

=cut

package Graphics::VTK::MesaImageWindow;


@Graphics::VTK::MesaImageWindow::ISA = qw( Graphics::VTK::XImageWindow );

=head1 Graphics::VTK::MesaImageWindow

=over 1

=item *

Inherits from XImageWindow

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   virtual void EraseWindow ();
   void Frame ();
   const char *GetClassName();
   virtual int GetDesiredDepth ();
   virtual void *GetGenericContext ();
   virtual void *GetGenericDisplayId ();
   virtual void *GetGenericDrawable ();
   virtual void *GetGenericParentId ();
   virtual void *GetGenericWindowId ();
   void MakeCurrent ();
   virtual void MakeDefaultWindow ();
   vtkMesaImageWindow *New ();
   void Render ();
   virtual void SetOffScreenRendering (int i);
   void SwapBuffers ();


B<vtkMesaImageWindow Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   virtual Colormap GetDesiredColormap ();
      Can't Handle ColorMap return type yet

   virtual Visual *GetDesiredVisual ();
      Can't Handle Visual return type yet

   XVisualInfo *GetDesiredVisualInfo ();
      Can't Handle 'XVisualInfo *' return type yet

   virtual unsigned char *GetPixelData (int x, int y, int x2, int y2, int front);
      Can't Handle 'unsigned char *' return type without a hint

   virtual float *GetRGBAPixelData (int x, int y, int x2, int y2, int front);
      Can't Handle 'float *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   virtual void SetPixelData (int x, int y, int x2, int y2, unsigned char *, int front);
      Don't know the size of pointer arg number 5

   virtual void SetRGBAPixelData (int x, int y, int x2, int y2, float *, int front, int blend);
      Don't know the size of pointer arg number 5


=cut

package Graphics::VTK::XMesaTextMapper;


@Graphics::VTK::XMesaTextMapper::ISA = qw( Graphics::VTK::XTextMapper );

=head1 Graphics::VTK::XMesaTextMapper

=over 1

=item *

Inherits from XTextMapper

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkXMesaTextMapper *New ();
   virtual void ReleaseGraphicsResources (vtkWindow *);
   void RenderOpaqueGeometry (vtkViewport *viewport, vtkActor2D *actor);
   void RenderOverlay (vtkViewport *viewport, vtkActor2D *actor);


B<vtkXMesaTextMapper Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   int GetListBaseForFont (vtkTextMapper *tm, vtkViewport *vp, Font );
      Arg types of 'Font' not supported

=cut

package Graphics::VTK::MesaPolyDataMapper2D;


@Graphics::VTK::MesaPolyDataMapper2D::ISA = qw( Graphics::VTK::PolyDataMapper2D );

=head1 Graphics::VTK::MesaPolyDataMapper2D

=over 1

=item *

Inherits from PolyDataMapper2D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkMesaPolyDataMapper2D *New ();
   void RenderOpaqueGeometry (vtkViewport *viewport, vtkActor2D *actor);

=cut

package Graphics::VTK::OpenGLImager;


@Graphics::VTK::OpenGLImager::ISA = qw( Graphics::VTK::Imager );

=head1 Graphics::VTK::OpenGLImager

=over 1

=item *

Inherits from Imager

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Erase ();
   const char *GetClassName();
   vtkOpenGLImager *New ();
   int RenderOpaqueGeometry ();

=cut

package Graphics::VTK::OpenGLImageMapper;


@Graphics::VTK::OpenGLImageMapper::ISA = qw( Graphics::VTK::ImageMapper );

=head1 Graphics::VTK::OpenGLImageMapper

=over 1

=item *

Inherits from ImageMapper

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkOpenGLImageMapper *New ();
   void RenderData (vtkViewport *viewport, vtkImageData *data, vtkActor2D *actor);
   void RenderOpaqueGeometry (vtkViewport *viewport, vtkActor2D *actor);

=cut

package Graphics::VTK::OpenGLPolyDataMapper2D;


@Graphics::VTK::OpenGLPolyDataMapper2D::ISA = qw( Graphics::VTK::PolyDataMapper2D );

=head1 Graphics::VTK::OpenGLPolyDataMapper2D

=over 1

=item *

Inherits from PolyDataMapper2D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkOpenGLPolyDataMapper2D *New ();
   void RenderOpaqueGeometry (vtkViewport *viewport, vtkActor2D *actor);

=cut

package Graphics::VTK::XImageMapper;


@Graphics::VTK::XImageMapper::ISA = qw( Graphics::VTK::ImageMapper );

=head1 Graphics::VTK::XImageMapper

=over 1

=item *

Inherits from ImageMapper

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetNumberOfColors ();
   int GetXWindowDepth (vtkWindow *window);
   int GetXWindowVisualClass (vtkWindow *window);
   vtkXImageMapper *New ();
   void RenderData (vtkViewport *viewport, vtkImageData *data, vtkActor2D *actor);
   void RenderOverlay (vtkViewport *viewport, vtkActor2D *actor);


B<vtkXImageMapper Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GetXColors (int colors[]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetXWindowColorMasks (vtkWindow *window, unsigned long *rmask, unsigned long *gmask, unsigned long *bmask);
      Don't know the size of pointer arg number 2

   void GetXWindowVisualId (vtkWindow *window, Visual *visualID);
      Don't know the size of pointer arg number 2

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::XImageWindow;


@Graphics::VTK::XImageWindow::ISA = qw( Graphics::VTK::ImageWindow );

=head1 Graphics::VTK::XImageWindow

=over 1

=item *

Inherits from ImageWindow

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void EraseWindow ();
   void Frame ();
   const char *GetClassName();
   virtual int GetDesiredDepth ();
   void *GetGenericContext ();
   void *GetGenericDisplayId ();
   void *GetGenericDrawable ();
   void *GetGenericParentId ();
   void *GetGenericWindowId ();
   int GetNumberOfColors ();
   int GetVisualClass ();
   int GetVisualDepth ();
   vtkXImageWindow *New ();
   void SetBackgroundColor (float r, float g, float b);
   void SetParentId (Window );
   void SetPosition (int , int );
   void SetSize (int x, int y);
   void SetWindowId (Window );
   void SetWindowName (char *name);
   void SwapBuffers ();


B<vtkXImageWindow Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GetDefaultVisualInfo (XVisualInfo *info);
      Don't know the size of pointer arg number 1

   virtual Colormap GetDesiredColormap ();
      Can't Handle ColorMap return type yet

   virtual Visual *GetDesiredVisual ();
      Can't Handle Visual return type yet

   Display *GetDisplayId ();
      Can't Handle Display return type yet

   GC GetGC ();
      Can't Handle GC return type yet

   Window GetParentId ();
      Can't Handle Window return type yet

   unsigned char *GetPixelData (int x1, int y1, int x2, int y2, int );
      Can't Handle 'unsigned char *' return type without a hint

   int *GetPosition ();
      Can't Handle 'int *' return type without a hint

   void GetPosition (int *x, int *y);
      Don't know the size of pointer arg number 1

   void GetShiftsScalesAndMasks (int &rshift, int &gshift, int &bshift, int &rscale, int &gscale, int &bscale, unsigned long &rmask, unsigned long &gmask, unsigned long &bmask);
      Arg types of 'unsigned long &' not supported yet
   int *GetSize ();
      Can't Handle 'int *' return type without a hint

   void GetSize (int *x, int *y);
      Don't know the size of pointer arg number 1

   Visual *GetVisualId ();
      Can't Handle Visual return type yet

   Window GetWindowId ();
      Can't Handle Window return type yet

   Colormap MakeColorMap (Visual *visual);
      Can't Handle ColorMap return type yet

   Window ParentIdWindow WindowIdDisplay *DisplayIdVisual *VisualIdint VisualDepthint VisualClassColormap ColorMapGC Gcint OffsetXColor Colors[256]int NumberOfColorsPixmap Drawableint OwnDisplayint PixmapWidthint PixmapHeightvoid MakeDefaultWindow ();
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   void SetDisplayId (Display *);
      Don't know the size of pointer arg number 1

   void SetDisplayId (void *);
      Don't know the size of pointer arg number 1

   void SetParentId (void *);
      Don't know the size of pointer arg number 1

   void SetPosition (int a[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetSize (int a[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void SetWindowId (void *);
      Don't know the size of pointer arg number 1


=cut

package Graphics::VTK::XPolyDataMapper2D;


@Graphics::VTK::XPolyDataMapper2D::ISA = qw( Graphics::VTK::PolyDataMapper2D );

=head1 Graphics::VTK::XPolyDataMapper2D

=over 1

=item *

Inherits from PolyDataMapper2D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkXPolyDataMapper2D *New ();
   void RenderOverlay (vtkViewport *viewport, vtkActor2D *actor);

=cut

package Graphics::VTK::XTextMapper;


@Graphics::VTK::XTextMapper::ISA = qw( Graphics::VTK::TextMapper );

=head1 Graphics::VTK::XTextMapper

=over 1

=item *

Inherits from TextMapper

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkXTextMapper *New ();
   void RenderOverlay (vtkViewport *viewport, vtkActor2D *actor);
   void SetFontSize (int size);


B<vtkXTextMapper Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void DetermineSize (vtkViewport *viewport, int size[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void GetSize (vtkViewport *viewport, int size[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::Win32ImageMapper;


@Graphics::VTK::Win32ImageMapper::ISA = qw( Graphics::VTK::ImageMapper );

=head1 Graphics::VTK::Win32ImageMapper

=over 1

=item *

Inherits from ImageMapper

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkLookupTable *GetLookupTable ();
   unsigned long GetMTime ();
   vtkWin32ImageMapper *New ();
   void RenderData (vtkViewport *viewport, vtkImageData *data, vtkActor2D *actor);
   void RenderOverlay (vtkViewport *viewport, vtkActor2D *actor);
   void SetLookupTable (vtkLookupTable *);


B<vtkWin32ImageMapper Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   HBITMAP CreateBitmapObject (HBITMAP oldBitmap, BITMAPINFO &dataHeader, HDC windowDC, unsigned char &DataOut, vtkImageData *data, int width, int height);
      Arg types of 'unsigned char &' not supported yet
   void GenerateBitmapData (vtkImageData *data, void *inptr, unsigned char *DataOut, int dim, int DisplayExtent[6], float cwindow, float clevel, float cshift, float cscale, vtkLookupTable *lut);
      No TCL interface is provided by VTK, so we aren't going to provide one either.

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Win32OpenGLTextMapper;


@Graphics::VTK::Win32OpenGLTextMapper::ISA = qw( Graphics::VTK::Win32TextMapper );

=head1 Graphics::VTK::Win32OpenGLTextMapper

=over 1

=item *

Inherits from Win32TextMapper

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   int GetListBaseForFont (vtkTextMapper *tm, vtkViewport *vp);
   vtkWin32OpenGLTextMapper *New ();
   virtual void ReleaseGraphicsResources (vtkWindow *);
   void RenderGeometry (vtkViewport *viewport, vtkActor2D *actor);
   void RenderOpaqueGeometry (vtkViewport *viewport, vtkActor2D *actor);
   void RenderOverlay (vtkViewport *viewport, vtkActor2D *actor);
   void RenderTranslucentGeometry (vtkViewport *viewport, vtkActor2D *actor);

=cut

package Graphics::VTK::Win32OpenGLImageWindow;


@Graphics::VTK::Win32OpenGLImageWindow::ISA = qw( Graphics::VTK::ImageWindow );

=head1 Graphics::VTK::Win32OpenGLImageWindow

=over 1

=item *

Inherits from ImageWindow

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void Clean ();
   void Frame ();
   const char *GetClassName();
   vtkWin32OpenGLImageWindow *GetOutput ();
   void MakeCurrent ();
   virtual void MakeDefaultWindow ();
   vtkWin32OpenGLImageWindow *New ();
   virtual void OpenGLInit ();
   void Render ();
   void ResumeScreenRendering ();
   virtual void SetPosition (int , int );
   virtual void SetSize (int , int );
   virtual void SetWindowName (char *);
   void SetupMemoryRendering (int x, int y, HDC prn);
   virtual void SetupPalette (HDC hDC);
   virtual void SetupPixelFormat (HDC hDC, DWORD dwFlags, int debug, int bpp, int zbpp);
   void SwapBuffers ();


B<vtkWin32OpenGLImageWindow Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   HDC GetMemoryDC ();
      Can't Handle HDC return type yet

   unsigned char *GetMemoryData ();
      Can't Handle 'unsigned char *' return type without a hint

   virtual unsigned char *GetPixelData (int x, int y, int x2, int y2, int front);
      Can't Handle 'unsigned char *' return type without a hint

   virtual int *GetPosition ();
      Can't Handle 'int *' return type without a hint

   virtual float *GetRGBAPixelData (int x, int y, int x2, int y2, int front);
      Can't Handle 'float *' return type without a hint

   virtual int *GetSize ();
      Can't Handle 'int *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet

   virtual void ReleaseRGBAPixelData (float *data);
      Don't know the size of pointer arg number 1

   virtual void SetPixelData (int x, int y, int x2, int y2, unsigned char *, int front);
      Don't know the size of pointer arg number 5

   virtual void SetRGBAPixelData (int x, int y, int x2, int y2, float *, int front, int blend);
      Don't know the size of pointer arg number 5


=cut

package Graphics::VTK::Win32ImageWindow;


@Graphics::VTK::Win32ImageWindow::ISA = qw( Graphics::VTK::ImageWindow );

=head1 Graphics::VTK::Win32ImageWindow

=over 1

=item *

Inherits from ImageWindow

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   void EraseWindow ();
   void Frame ();
   const char *GetClassName();
   vtkWin32ImageWindow *GetOutput ();
   void MakeDefaultWindow ();
   vtkWin32ImageWindow *New ();
   void ResumeScreenRendering ();
   void SetBackgroundColor (float r, float g, float b);
   void SetPosition (int , int );
   void SetSize (int , int );
   void SetupMemoryRendering (int x, int y, HDC prn);
   void SwapBuffers ();


B<vtkWin32ImageWindow Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   unsigned char *GetDIBPtr ();
      Can't Handle 'unsigned char *' return type without a hint

   HDC GetMemoryDC ();
      Can't Handle HDC return type yet

   unsigned char *GetMemoryData ();
      Can't Handle 'unsigned char *' return type without a hint

   unsigned char *GetPixelData (int x1, int y1, int x2, int y2, int );
      Can't Handle 'unsigned char *' return type without a hint

   int *GetPosition ();
      Can't Handle 'int *' return type without a hint

   int *GetSize ();
      Can't Handle 'int *' return type without a hint

   void PrintSelf (ostream &os, vtkIndent indent);
      I/O Streams not Supported yet


=cut

package Graphics::VTK::Win32TextMapper;


@Graphics::VTK::Win32TextMapper::ISA = qw( Graphics::VTK::TextMapper );

=head1 Graphics::VTK::Win32TextMapper

=over 1

=item *

Inherits from TextMapper

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkWin32TextMapper *New ();
   void RenderOverlay (vtkViewport *viewport, vtkActor2D *actor);


B<vtkWin32TextMapper Unsupported Funcs:>

Functions which are not supported supported for this class by the PerlVTK module.

   void GetSize (vtkViewport *viewport, int size[2]);
      No TCL interface is provided by VTK, so we aren't going to provide one either.


=cut

package Graphics::VTK::Win32PolyDataMapper2D;


@Graphics::VTK::Win32PolyDataMapper2D::ISA = qw( Graphics::VTK::PolyDataMapper2D );

=head1 Graphics::VTK::Win32PolyDataMapper2D

=over 1

=item *

Inherits from PolyDataMapper2D

=back

B<Functions Supported for this class by the PerlVTK module:>
(To find more about their use check the VTK documentation at http://www.kitware.com.)

   const char *GetClassName();
   vtkWin32PolyDataMapper2D *New ();
   virtual void RenderOverlay (vtkViewport *viewport, vtkActor2D *actor);

=cut

1;
