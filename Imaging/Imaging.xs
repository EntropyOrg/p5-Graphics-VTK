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
#include "vtkImaging.h"
#include "vtkImageDecomposeFilter.h"
#include "vtkImageFilter.h"
#include "vtkImageInPlaceFilter.h"
#include "vtkImageIterateFilter.h"
#include "vtkImageMultipleInputFilter.h"
#include "vtkImagePadFilter.h"
#include "vtkImageSpatialFilter.h"
#include "vtkImageToImageFilter.h"
#include "vtkImageTwoInputFilter.h"
#include "vtkImageFourierFilter.h"
#include "vtkImagingFactory.h"
#include "vtkDataSetCollection.h"

#include "vtkAxisActor2D.h"
#include "vtkBMPReader.h"
#include "vtkBMPWriter.h"
#include "vtkGlyphSource2D.h"
#include "vtkImageAccumulate.h"
#include "vtkImageAnisotropicDiffusion2D.h"
#include "vtkImageAnisotropicDiffusion3D.h"
#include "vtkImageAppend.h"
#include "vtkImageAppendComponents.h"
#include "vtkImageBlend.h"
#include "vtkImageButterworthHighPass.h"
#include "vtkImageButterworthLowPass.h"
#include "vtkImageCacheFilter.h"
#include "vtkImageCanvasSource2D.h"
#include "vtkImageCast.h"
#include "vtkImageCityBlockDistance.h"
#include "vtkImageClip.h"
#include "vtkImageComposite.h"
#include "vtkImageConnector.h"
#include "vtkImageConstantPad.h"
#include "vtkImageContinuousDilate3D.h"
#include "vtkImageContinuousErode3D.h"
#include "vtkImageCorrelation.h"
#include "vtkImageCursor3D.h"
#include "vtkImageDataStreamer.h"
#include "vtkImageDifference.h"
#include "vtkImageDilateErode3D.h"
#include "vtkImageDivergence.h"
#include "vtkImageDotProduct.h"
#include "vtkImageEllipsoidSource.h"
#include "vtkImageEuclideanToPolar.h"
#include "vtkImageExport.h"
#include "vtkImageExtractComponents.h"
#include "vtkImageFFT.h"
#include "vtkImageFlip.h"
#include "vtkImageFourierCenter.h"
#include "vtkImageGaussianSmooth.h"
#include "vtkImageGaussianSource.h"
#include "vtkImageGridSource.h"
#include "vtkImageGradient.h"
#include "vtkImageGradientMagnitude.h"
#include "vtkImageHSVToRGB.h"
#include "vtkImageHybridMedian2D.h"
#include "vtkImageIdealHighPass.h"
#include "vtkImageIdealLowPass.h"
#include "vtkImageImport.h"
#include "vtkImageIslandRemoval2D.h"
#include "vtkImageLaplacian.h"
#include "vtkImageLogarithmicScale.h"
#include "vtkImageLogic.h"
#include "vtkImageLuminance.h"
#include "vtkImageMagnify.h"
#include "vtkImageMagnitude.h"
#include "vtkImageMandelbrotSource.h"
#include "vtkImageMapper.h"
#include "vtkImageMapToColors.h"
#include "vtkImageMapToRGBA.h"
#include "vtkImageMapToWindowLevelColors.h"
#include "vtkImageMask.h"
#include "vtkImageMaskBits.h"
#include "vtkImageMathematics.h"
#include "vtkImageMedian3D.h"
#include "vtkImageMirrorPad.h"
#include "vtkImageNoiseSource.h"
#include "vtkImageNonMaximumSuppression.h"
#include "vtkImageNormalize.h"
#include "vtkImageOpenClose3D.h"
#include "vtkImagePermute.h"
#include "vtkImageQuantizeRGBToIndex.h"
#include "vtkImager.h"
#include "vtkImagerCollection.h"
#include "vtkImageReader.h"
#include "vtkImageResample.h"
#include "vtkImageRFFT.h"
#include "vtkImageRGBToHSV.h"
#include "vtkImageRange3D.h"
#include "vtkImageSeedConnectivity.h"
#include "vtkImageShiftScale.h"
#include "vtkImageShrink3D.h"
#include "vtkImageSinusoidSource.h"
#include "vtkImageSkeleton2D.h"
#include "vtkImageSobel2D.h"
#include "vtkImageSobel3D.h"
#include "vtkImageThreshold.h"
#include "vtkImageTranslateExtent.h"
#include "vtkImageVariance3D.h"
#include "vtkImageViewer.h"
#include "vtkImageWindow.h"
#include "vtkImageWrapPad.h"
#include "vtkImageWriter.h"
#include "vtkLabeledDataMapper.h"
#include "vtkParallelCoordinatesActor.h"
#include "vtkPNMReader.h"
#include "vtkPNMWriter.h"
#include "vtkPolyDataMapper2D.h"
#include "vtkPostScriptWriter.h"
#include "vtkScalarBarActor.h"
#include "vtkScaledTextActor.h"
#include "vtkTextMapper.h"
#include "vtkTIFFReader.h"
#include "vtkTIFFWriter.h"
#ifdef USE_MESA
#include "vtkMesaImager.h"
#include "vtkMesaImageMapper.h"
#include "vtkMesaImageWindow.h"
#include "vtkXMesaTextMapper.h"
#include "vtkMesaPolyDataMapper2D.h"
#endif
#ifndef USE_MESA
#include "vtkOpenGLImager.h"
#include "vtkOpenGLImageMapper.h"
#include "vtkOpenGLPolyDataMapper2D.h"
#endif
#ifndef WIN32
#include "vtkXImageMapper.h"
#include "vtkXImageWindow.h"
#include "vtkXPolyDataMapper2D.h"
#include "vtkXTextMapper.h"
#endif
#ifdef WIN32
#include "vtkWin32ImageMapper.h"
#include "vtkWin32OpenGLTextMapper.h"
#include "vtkWin32OpenGLImageWindow.h"
#include "vtkWin32ImageWindow.h"
#include "vtkWin32TextMapper.h"
#include "vtkWin32PolyDataMapper2D.h"
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

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageDecomposeFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageDecomposeFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageDecomposeFilter::GetDimensionality()
		CODE:
		RETVAL = THIS->GetDimensionality();
		OUTPUT:
		RETVAL


static vtkImageDecomposeFilter*
vtkImageDecomposeFilter::New()
		CODE:
		RETVAL = vtkImageDecomposeFilter::New();
		OUTPUT:
		RETVAL


void
vtkImageDecomposeFilter::SetDimensionality(dim)
		int 	dim
		CODE:
		THIS->SetDimensionality(dim);
		XSRETURN_EMPTY;


void
vtkImageDecomposeFilter::SetFilteredAxes(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetFilteredAxes(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 3
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetFilteredAxes(arg1, arg2);
		XSRETURN_EMPTY;
	CASE: items == 2
		int 	arg1
		CODE:
		THIS->SetFilteredAxes(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageDecomposeFilter::SetFilteredAxes\n");


MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageFilter*
vtkImageFilter::New()
		CODE:
		RETVAL = vtkImageFilter::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageInPlaceFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageInPlaceFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageInPlaceFilter*
vtkImageInPlaceFilter::New()
		CODE:
		RETVAL = vtkImageInPlaceFilter::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageIterateFilter PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImageIterateFilter::ComputeInputUpdateExtents(output)
		vtkDataObject *	output
		CODE:
		THIS->ComputeInputUpdateExtents(output);
		XSRETURN_EMPTY;


const char *
vtkImageIterateFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageIterateFilter::GetIteration()
		CODE:
		RETVAL = THIS->GetIteration();
		OUTPUT:
		RETVAL


int
vtkImageIterateFilter::GetNumberOfIterations()
		CODE:
		RETVAL = THIS->GetNumberOfIterations();
		OUTPUT:
		RETVAL


static vtkImageIterateFilter*
vtkImageIterateFilter::New()
		CODE:
		RETVAL = vtkImageIterateFilter::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageMultipleInputFilter PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImageMultipleInputFilter::AddInput(arg1 = 0)
	CASE: items == 2
		vtkImageData *	arg1
		CODE:
		THIS->AddInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageMultipleInputFilter::AddInput\n");



void
vtkImageMultipleInputFilter::BypassOff()
		CODE:
		THIS->BypassOff();
		XSRETURN_EMPTY;


void
vtkImageMultipleInputFilter::BypassOn()
		CODE:
		THIS->BypassOn();
		XSRETURN_EMPTY;


int
vtkImageMultipleInputFilter::GetBypass()
		CODE:
		RETVAL = THIS->GetBypass();
		OUTPUT:
		RETVAL


const char *
vtkImageMultipleInputFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkImageData *
vtkImageMultipleInputFilter::GetInput(arg1 = 0)
	CASE: items == 2
		int 	arg1
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImageData";
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
		char  CLASS[80] = "Graphics::VTK::vtkImageData";
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
		croak("Unsupported number of args and/or types supplied to vtkImageMultipleInputFilter::GetInput\n");



int
vtkImageMultipleInputFilter::GetNumberOfThreads()
		CODE:
		RETVAL = THIS->GetNumberOfThreads();
		OUTPUT:
		RETVAL


static vtkImageMultipleInputFilter*
vtkImageMultipleInputFilter::New()
		CODE:
		RETVAL = vtkImageMultipleInputFilter::New();
		OUTPUT:
		RETVAL


void
vtkImageMultipleInputFilter::RemoveInput(arg1 = 0)
	CASE: items == 2
		vtkImageData *	arg1
		CODE:
		THIS->RemoveInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageMultipleInputFilter::RemoveInput\n");



void
vtkImageMultipleInputFilter::SetBypass(arg1)
		int 	arg1
		CODE:
		THIS->SetBypass(arg1);
		XSRETURN_EMPTY;


void
vtkImageMultipleInputFilter::SetInput(num, input)
		int 	num
		vtkImageData *	input
		CODE:
		THIS->SetInput(num, input);
		XSRETURN_EMPTY;


void
vtkImageMultipleInputFilter::SetNumberOfThreads(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfThreads(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImagePadFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImagePadFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImagePadFilter::GetOutputNumberOfScalarComponents()
		CODE:
		RETVAL = THIS->GetOutputNumberOfScalarComponents();
		OUTPUT:
		RETVAL


static vtkImagePadFilter*
vtkImagePadFilter::New()
		CODE:
		RETVAL = vtkImagePadFilter::New();
		OUTPUT:
		RETVAL


void
vtkImagePadFilter::SetOutputNumberOfScalarComponents(arg1)
		int 	arg1
		CODE:
		THIS->SetOutputNumberOfScalarComponents(arg1);
		XSRETURN_EMPTY;


void
vtkImagePadFilter::SetOutputWholeExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int 	arg1
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
		croak("Unsupported number of args and/or types supplied to vtkImagePadFilter::SetOutputWholeExtent\n");


MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageSpatialFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageSpatialFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int *
vtkImageSpatialFilter::GetKernelSize()
		PREINIT:
		int * retval;
		PPCODE:
		retval = THIS->GetKernelSize();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


static vtkImageSpatialFilter*
vtkImageSpatialFilter::New()
		CODE:
		RETVAL = vtkImageSpatialFilter::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageToImageFilter PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImageToImageFilter::ExecuteImageInformation()
		CODE:
		THIS->ExecuteImageInformation();
		XSRETURN_EMPTY;


const char *
vtkImageToImageFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkImageData *
vtkImageToImageFilter::GetInput()
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


long
vtkImageToImageFilter::GetInputMemoryLimit()
		CODE:
		RETVAL = THIS->GetInputMemoryLimit();
		OUTPUT:
		RETVAL


int
vtkImageToImageFilter::GetNumberOfThreads()
		CODE:
		RETVAL = THIS->GetNumberOfThreads();
		OUTPUT:
		RETVAL


static vtkImageToImageFilter*
vtkImageToImageFilter::New()
		CODE:
		RETVAL = vtkImageToImageFilter::New();
		OUTPUT:
		RETVAL


void
vtkImageToImageFilter::SetInput(input)
		vtkImageData *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;


void
vtkImageToImageFilter::SetInputMemoryLimit(arg1)
		int 	arg1
		CODE:
		THIS->SetInputMemoryLimit(arg1);
		XSRETURN_EMPTY;


void
vtkImageToImageFilter::SetNumberOfThreads(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfThreads(arg1);
		XSRETURN_EMPTY;


void
vtkImageToImageFilter::UpdateImageInformation()
		CODE:
		THIS->UpdateImageInformation();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageTwoInputFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageTwoInputFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkImageData *
vtkImageTwoInputFilter::GetInput1()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImageData";
		CODE:
		RETVAL = THIS->GetInput1();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkImageData *
vtkImageTwoInputFilter::GetInput2()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImageData";
		CODE:
		RETVAL = THIS->GetInput2();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkImageTwoInputFilter*
vtkImageTwoInputFilter::New()
		CODE:
		RETVAL = vtkImageTwoInputFilter::New();
		OUTPUT:
		RETVAL


void
vtkImageTwoInputFilter::SetInput1(input)
		vtkImageData *	input
		CODE:
		THIS->SetInput1(input);
		XSRETURN_EMPTY;


void
vtkImageTwoInputFilter::SetInput2(input)
		vtkImageData *	input
		CODE:
		THIS->SetInput2(input);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageFourierFilter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageFourierFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageFourierFilter*
vtkImageFourierFilter::New()
		CODE:
		RETVAL = vtkImageFourierFilter::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImagingFactory PREFIX = vtk

PROTOTYPES: DISABLE



vtkObject *
vtkImagingFactory::CreateInstance(vtkclassname)
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
vtkImagingFactory::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImagingFactory*
vtkImagingFactory::New()
		CODE:
		RETVAL = vtkImagingFactory::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::AxisActor2D PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkAxisActor2D::AdjustLabelsOff()
		CODE:
		THIS->AdjustLabelsOff();
		XSRETURN_EMPTY;


void
vtkAxisActor2D::AdjustLabelsOn()
		CODE:
		THIS->AdjustLabelsOn();
		XSRETURN_EMPTY;


void
vtkAxisActor2D::AxisVisibilityOff()
		CODE:
		THIS->AxisVisibilityOff();
		XSRETURN_EMPTY;


void
vtkAxisActor2D::AxisVisibilityOn()
		CODE:
		THIS->AxisVisibilityOn();
		XSRETURN_EMPTY;


void
vtkAxisActor2D::BoldOff()
		CODE:
		THIS->BoldOff();
		XSRETURN_EMPTY;


void
vtkAxisActor2D::BoldOn()
		CODE:
		THIS->BoldOn();
		XSRETURN_EMPTY;


int
vtkAxisActor2D::GetAdjustLabels()
		CODE:
		RETVAL = THIS->GetAdjustLabels();
		OUTPUT:
		RETVAL


int
vtkAxisActor2D::GetAxisVisibility()
		CODE:
		RETVAL = THIS->GetAxisVisibility();
		OUTPUT:
		RETVAL


int
vtkAxisActor2D::GetBold()
		CODE:
		RETVAL = THIS->GetBold();
		OUTPUT:
		RETVAL


const char *
vtkAxisActor2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkAxisActor2D::GetFontFactor()
		CODE:
		RETVAL = THIS->GetFontFactor();
		OUTPUT:
		RETVAL


int
vtkAxisActor2D::GetFontFamily()
		CODE:
		RETVAL = THIS->GetFontFamily();
		OUTPUT:
		RETVAL


int
vtkAxisActor2D::GetItalic()
		CODE:
		RETVAL = THIS->GetItalic();
		OUTPUT:
		RETVAL


float
vtkAxisActor2D::GetLabelFactor()
		CODE:
		RETVAL = THIS->GetLabelFactor();
		OUTPUT:
		RETVAL


char *
vtkAxisActor2D::GetLabelFormat()
		CODE:
		RETVAL = THIS->GetLabelFormat();
		OUTPUT:
		RETVAL


int
vtkAxisActor2D::GetLabelVisibility()
		CODE:
		RETVAL = THIS->GetLabelVisibility();
		OUTPUT:
		RETVAL


int
vtkAxisActor2D::GetNumberOfLabels()
		CODE:
		RETVAL = THIS->GetNumberOfLabels();
		OUTPUT:
		RETVAL


float *
vtkAxisActor2D::GetPoint1()
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetPoint1();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


vtkCoordinate *
vtkAxisActor2D::GetPoint1Coordinate()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCoordinate";
		CODE:
		RETVAL = THIS->GetPoint1Coordinate();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float *
vtkAxisActor2D::GetPoint2()
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetPoint2();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


vtkCoordinate *
vtkAxisActor2D::GetPoint2Coordinate()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCoordinate";
		CODE:
		RETVAL = THIS->GetPoint2Coordinate();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float  *
vtkAxisActor2D::GetRange()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


int
vtkAxisActor2D::GetShadow()
		CODE:
		RETVAL = THIS->GetShadow();
		OUTPUT:
		RETVAL


int
vtkAxisActor2D::GetTickLength()
		CODE:
		RETVAL = THIS->GetTickLength();
		OUTPUT:
		RETVAL


int
vtkAxisActor2D::GetTickOffset()
		CODE:
		RETVAL = THIS->GetTickOffset();
		OUTPUT:
		RETVAL


int
vtkAxisActor2D::GetTickVisibility()
		CODE:
		RETVAL = THIS->GetTickVisibility();
		OUTPUT:
		RETVAL


char *
vtkAxisActor2D::GetTitle()
		CODE:
		RETVAL = THIS->GetTitle();
		OUTPUT:
		RETVAL


int
vtkAxisActor2D::GetTitleVisibility()
		CODE:
		RETVAL = THIS->GetTitleVisibility();
		OUTPUT:
		RETVAL


void
vtkAxisActor2D::ItalicOff()
		CODE:
		THIS->ItalicOff();
		XSRETURN_EMPTY;


void
vtkAxisActor2D::ItalicOn()
		CODE:
		THIS->ItalicOn();
		XSRETURN_EMPTY;


void
vtkAxisActor2D::LabelVisibilityOff()
		CODE:
		THIS->LabelVisibilityOff();
		XSRETURN_EMPTY;


void
vtkAxisActor2D::LabelVisibilityOn()
		CODE:
		THIS->LabelVisibilityOn();
		XSRETURN_EMPTY;


static vtkAxisActor2D*
vtkAxisActor2D::New()
		CODE:
		RETVAL = vtkAxisActor2D::New();
		OUTPUT:
		RETVAL


void
vtkAxisActor2D::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;


int
vtkAxisActor2D::RenderOpaqueGeometry(viewport)
		vtkViewport *	viewport
		CODE:
		RETVAL = THIS->RenderOpaqueGeometry(viewport);
		OUTPUT:
		RETVAL


int
vtkAxisActor2D::RenderOverlay(viewport)
		vtkViewport *	viewport
		CODE:
		RETVAL = THIS->RenderOverlay(viewport);
		OUTPUT:
		RETVAL


int
vtkAxisActor2D::RenderTranslucentGeometry(arg1)
		vtkViewport *	arg1
		CODE:
		RETVAL = THIS->RenderTranslucentGeometry(arg1);
		OUTPUT:
		RETVAL


void
vtkAxisActor2D::SetAdjustLabels(arg1)
		int 	arg1
		CODE:
		THIS->SetAdjustLabels(arg1);
		XSRETURN_EMPTY;


void
vtkAxisActor2D::SetAxisVisibility(arg1)
		int 	arg1
		CODE:
		THIS->SetAxisVisibility(arg1);
		XSRETURN_EMPTY;


void
vtkAxisActor2D::SetBold(arg1)
		int 	arg1
		CODE:
		THIS->SetBold(arg1);
		XSRETURN_EMPTY;


void
vtkAxisActor2D::SetFontFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetFontFactor(arg1);
		XSRETURN_EMPTY;


void
vtkAxisActor2D::SetFontFamily(arg1)
		int 	arg1
		CODE:
		THIS->SetFontFamily(arg1);
		XSRETURN_EMPTY;


void
vtkAxisActor2D::SetFontFamilyToArial()
		CODE:
		THIS->SetFontFamilyToArial();
		XSRETURN_EMPTY;


void
vtkAxisActor2D::SetFontFamilyToCourier()
		CODE:
		THIS->SetFontFamilyToCourier();
		XSRETURN_EMPTY;


void
vtkAxisActor2D::SetFontFamilyToTimes()
		CODE:
		THIS->SetFontFamilyToTimes();
		XSRETURN_EMPTY;


void
vtkAxisActor2D::SetItalic(arg1)
		int 	arg1
		CODE:
		THIS->SetItalic(arg1);
		XSRETURN_EMPTY;


void
vtkAxisActor2D::SetLabelFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetLabelFactor(arg1);
		XSRETURN_EMPTY;


void
vtkAxisActor2D::SetLabelFormat(arg1)
		char *	arg1
		CODE:
		THIS->SetLabelFormat(arg1);
		XSRETURN_EMPTY;


void
vtkAxisActor2D::SetLabelVisibility(arg1)
		int 	arg1
		CODE:
		THIS->SetLabelVisibility(arg1);
		XSRETURN_EMPTY;


void
vtkAxisActor2D::SetNumberOfLabels(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfLabels(arg1);
		XSRETURN_EMPTY;


void
vtkAxisActor2D::SetPoint1(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float 	arg1
		float	arg2
		CODE:
		THIS->SetPoint1(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkAxisActor2D::SetPoint1\n");



void
vtkAxisActor2D::SetPoint2(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float 	arg1
		float	arg2
		CODE:
		THIS->SetPoint2(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkAxisActor2D::SetPoint2\n");



void
vtkAxisActor2D::SetRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkAxisActor2D::SetRange\n");



void
vtkAxisActor2D::SetShadow(arg1)
		int 	arg1
		CODE:
		THIS->SetShadow(arg1);
		XSRETURN_EMPTY;


void
vtkAxisActor2D::SetTickLength(arg1)
		int 	arg1
		CODE:
		THIS->SetTickLength(arg1);
		XSRETURN_EMPTY;


void
vtkAxisActor2D::SetTickOffset(arg1)
		int 	arg1
		CODE:
		THIS->SetTickOffset(arg1);
		XSRETURN_EMPTY;


void
vtkAxisActor2D::SetTickVisibility(arg1)
		int 	arg1
		CODE:
		THIS->SetTickVisibility(arg1);
		XSRETURN_EMPTY;


void
vtkAxisActor2D::SetTitle(arg1)
		char *	arg1
		CODE:
		THIS->SetTitle(arg1);
		XSRETURN_EMPTY;


void
vtkAxisActor2D::SetTitleVisibility(arg1)
		int 	arg1
		CODE:
		THIS->SetTitleVisibility(arg1);
		XSRETURN_EMPTY;


void
vtkAxisActor2D::ShadowOff()
		CODE:
		THIS->ShadowOff();
		XSRETURN_EMPTY;


void
vtkAxisActor2D::ShadowOn()
		CODE:
		THIS->ShadowOn();
		XSRETURN_EMPTY;


void
vtkAxisActor2D::ShallowCopy(prop)
		vtkProp *	prop
		CODE:
		THIS->ShallowCopy(prop);
		XSRETURN_EMPTY;


void
vtkAxisActor2D::TickVisibilityOff()
		CODE:
		THIS->TickVisibilityOff();
		XSRETURN_EMPTY;


void
vtkAxisActor2D::TickVisibilityOn()
		CODE:
		THIS->TickVisibilityOn();
		XSRETURN_EMPTY;


void
vtkAxisActor2D::TitleVisibilityOff()
		CODE:
		THIS->TitleVisibilityOff();
		XSRETURN_EMPTY;


void
vtkAxisActor2D::TitleVisibilityOn()
		CODE:
		THIS->TitleVisibilityOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::BMPReader PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkBMPReader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkBMPReader::GetDepth()
		CODE:
		RETVAL = THIS->GetDepth();
		OUTPUT:
		RETVAL


static vtkBMPReader*
vtkBMPReader::New()
		CODE:
		RETVAL = vtkBMPReader::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::BMPWriter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkBMPWriter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkBMPWriter*
vtkBMPWriter::New()
		CODE:
		RETVAL = vtkBMPWriter::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::GlyphSource2D PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkGlyphSource2D::CrossOff()
		CODE:
		THIS->CrossOff();
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::CrossOn()
		CODE:
		THIS->CrossOn();
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::DashOff()
		CODE:
		THIS->DashOff();
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::DashOn()
		CODE:
		THIS->DashOn();
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::FilledOff()
		CODE:
		THIS->FilledOff();
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::FilledOn()
		CODE:
		THIS->FilledOn();
		XSRETURN_EMPTY;


float  *
vtkGlyphSource2D::GetCenter()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetCenter();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


const char *
vtkGlyphSource2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkGlyphSource2D::GetColor()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetColor();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkGlyphSource2D::GetCross()
		CODE:
		RETVAL = THIS->GetCross();
		OUTPUT:
		RETVAL


int
vtkGlyphSource2D::GetDash()
		CODE:
		RETVAL = THIS->GetDash();
		OUTPUT:
		RETVAL


int
vtkGlyphSource2D::GetFilled()
		CODE:
		RETVAL = THIS->GetFilled();
		OUTPUT:
		RETVAL


int
vtkGlyphSource2D::GetGlyphType()
		CODE:
		RETVAL = THIS->GetGlyphType();
		OUTPUT:
		RETVAL


float
vtkGlyphSource2D::GetRotationAngle()
		CODE:
		RETVAL = THIS->GetRotationAngle();
		OUTPUT:
		RETVAL


float
vtkGlyphSource2D::GetScale()
		CODE:
		RETVAL = THIS->GetScale();
		OUTPUT:
		RETVAL


float
vtkGlyphSource2D::GetScale2()
		CODE:
		RETVAL = THIS->GetScale2();
		OUTPUT:
		RETVAL


static vtkGlyphSource2D*
vtkGlyphSource2D::New()
		CODE:
		RETVAL = vtkGlyphSource2D::New();
		OUTPUT:
		RETVAL


void
vtkGlyphSource2D::RotationAngleOff()
		CODE:
		THIS->RotationAngleOff();
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::RotationAngleOn()
		CODE:
		THIS->RotationAngleOn();
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::SetCenter(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetCenter(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkGlyphSource2D::SetCenter\n");



void
vtkGlyphSource2D::SetColor(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetColor(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkGlyphSource2D::SetColor\n");



void
vtkGlyphSource2D::SetCross(arg1)
		int 	arg1
		CODE:
		THIS->SetCross(arg1);
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::SetDash(arg1)
		int 	arg1
		CODE:
		THIS->SetDash(arg1);
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::SetFilled(arg1)
		int 	arg1
		CODE:
		THIS->SetFilled(arg1);
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::SetGlyphType(arg1)
		int 	arg1
		CODE:
		THIS->SetGlyphType(arg1);
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::SetGlyphTypeToArrow()
		CODE:
		THIS->SetGlyphTypeToArrow();
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::SetGlyphTypeToCircle()
		CODE:
		THIS->SetGlyphTypeToCircle();
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::SetGlyphTypeToCross()
		CODE:
		THIS->SetGlyphTypeToCross();
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::SetGlyphTypeToDash()
		CODE:
		THIS->SetGlyphTypeToDash();
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::SetGlyphTypeToDiamond()
		CODE:
		THIS->SetGlyphTypeToDiamond();
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::SetGlyphTypeToHookedArrow()
		CODE:
		THIS->SetGlyphTypeToHookedArrow();
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::SetGlyphTypeToNone()
		CODE:
		THIS->SetGlyphTypeToNone();
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::SetGlyphTypeToSquare()
		CODE:
		THIS->SetGlyphTypeToSquare();
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::SetGlyphTypeToThickArrow()
		CODE:
		THIS->SetGlyphTypeToThickArrow();
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::SetGlyphTypeToThickCross()
		CODE:
		THIS->SetGlyphTypeToThickCross();
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::SetGlyphTypeToTriangle()
		CODE:
		THIS->SetGlyphTypeToTriangle();
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::SetGlyphTypeToVertex()
		CODE:
		THIS->SetGlyphTypeToVertex();
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::SetRotationAngle(arg1)
		float 	arg1
		CODE:
		THIS->SetRotationAngle(arg1);
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::SetScale(arg1)
		float 	arg1
		CODE:
		THIS->SetScale(arg1);
		XSRETURN_EMPTY;


void
vtkGlyphSource2D::SetScale2(arg1)
		float 	arg1
		CODE:
		THIS->SetScale2(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageAccumulate PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageAccumulate::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkImageAccumulate::GetComponentOrigin()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetComponentOrigin();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkImageAccumulate::GetComponentSpacing()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetComponentSpacing();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


static vtkImageAccumulate*
vtkImageAccumulate::New()
		CODE:
		RETVAL = vtkImageAccumulate::New();
		OUTPUT:
		RETVAL


void
vtkImageAccumulate::SetComponentExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int 	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetComponentExtent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageAccumulate::SetComponentExtent\n");



void
vtkImageAccumulate::SetComponentOrigin(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetComponentOrigin(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageAccumulate::SetComponentOrigin\n");



void
vtkImageAccumulate::SetComponentSpacing(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetComponentSpacing(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageAccumulate::SetComponentSpacing\n");


MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageAnisotropicDiffusion2D PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImageAnisotropicDiffusion2D::CornersOff()
		CODE:
		THIS->CornersOff();
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion2D::CornersOn()
		CODE:
		THIS->CornersOn();
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion2D::EdgesOff()
		CODE:
		THIS->EdgesOff();
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion2D::EdgesOn()
		CODE:
		THIS->EdgesOn();
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion2D::FacesOff()
		CODE:
		THIS->FacesOff();
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion2D::FacesOn()
		CODE:
		THIS->FacesOn();
		XSRETURN_EMPTY;


const char *
vtkImageAnisotropicDiffusion2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageAnisotropicDiffusion2D::GetCorners()
		CODE:
		RETVAL = THIS->GetCorners();
		OUTPUT:
		RETVAL


float
vtkImageAnisotropicDiffusion2D::GetDiffusionFactor()
		CODE:
		RETVAL = THIS->GetDiffusionFactor();
		OUTPUT:
		RETVAL


float
vtkImageAnisotropicDiffusion2D::GetDiffusionThreshold()
		CODE:
		RETVAL = THIS->GetDiffusionThreshold();
		OUTPUT:
		RETVAL


int
vtkImageAnisotropicDiffusion2D::GetEdges()
		CODE:
		RETVAL = THIS->GetEdges();
		OUTPUT:
		RETVAL


int
vtkImageAnisotropicDiffusion2D::GetFaces()
		CODE:
		RETVAL = THIS->GetFaces();
		OUTPUT:
		RETVAL


int
vtkImageAnisotropicDiffusion2D::GetGradientMagnitudeThreshold()
		CODE:
		RETVAL = THIS->GetGradientMagnitudeThreshold();
		OUTPUT:
		RETVAL


int
vtkImageAnisotropicDiffusion2D::GetNumberOfIterations()
		CODE:
		RETVAL = THIS->GetNumberOfIterations();
		OUTPUT:
		RETVAL


void
vtkImageAnisotropicDiffusion2D::GradientMagnitudeThresholdOff()
		CODE:
		THIS->GradientMagnitudeThresholdOff();
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion2D::GradientMagnitudeThresholdOn()
		CODE:
		THIS->GradientMagnitudeThresholdOn();
		XSRETURN_EMPTY;


static vtkImageAnisotropicDiffusion2D*
vtkImageAnisotropicDiffusion2D::New()
		CODE:
		RETVAL = vtkImageAnisotropicDiffusion2D::New();
		OUTPUT:
		RETVAL


void
vtkImageAnisotropicDiffusion2D::SetCorners(arg1)
		int 	arg1
		CODE:
		THIS->SetCorners(arg1);
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion2D::SetDiffusionFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetDiffusionFactor(arg1);
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion2D::SetDiffusionThreshold(arg1)
		float 	arg1
		CODE:
		THIS->SetDiffusionThreshold(arg1);
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion2D::SetEdges(arg1)
		int 	arg1
		CODE:
		THIS->SetEdges(arg1);
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion2D::SetFaces(arg1)
		int 	arg1
		CODE:
		THIS->SetFaces(arg1);
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion2D::SetGradientMagnitudeThreshold(arg1)
		int 	arg1
		CODE:
		THIS->SetGradientMagnitudeThreshold(arg1);
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion2D::SetNumberOfIterations(num)
		int 	num
		CODE:
		THIS->SetNumberOfIterations(num);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageAnisotropicDiffusion3D PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImageAnisotropicDiffusion3D::CornersOff()
		CODE:
		THIS->CornersOff();
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion3D::CornersOn()
		CODE:
		THIS->CornersOn();
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion3D::EdgesOff()
		CODE:
		THIS->EdgesOff();
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion3D::EdgesOn()
		CODE:
		THIS->EdgesOn();
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion3D::FacesOff()
		CODE:
		THIS->FacesOff();
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion3D::FacesOn()
		CODE:
		THIS->FacesOn();
		XSRETURN_EMPTY;


const char *
vtkImageAnisotropicDiffusion3D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageAnisotropicDiffusion3D::GetCorners()
		CODE:
		RETVAL = THIS->GetCorners();
		OUTPUT:
		RETVAL


float
vtkImageAnisotropicDiffusion3D::GetDiffusionFactor()
		CODE:
		RETVAL = THIS->GetDiffusionFactor();
		OUTPUT:
		RETVAL


float
vtkImageAnisotropicDiffusion3D::GetDiffusionThreshold()
		CODE:
		RETVAL = THIS->GetDiffusionThreshold();
		OUTPUT:
		RETVAL


int
vtkImageAnisotropicDiffusion3D::GetEdges()
		CODE:
		RETVAL = THIS->GetEdges();
		OUTPUT:
		RETVAL


int
vtkImageAnisotropicDiffusion3D::GetFaces()
		CODE:
		RETVAL = THIS->GetFaces();
		OUTPUT:
		RETVAL


int
vtkImageAnisotropicDiffusion3D::GetGradientMagnitudeThreshold()
		CODE:
		RETVAL = THIS->GetGradientMagnitudeThreshold();
		OUTPUT:
		RETVAL


int
vtkImageAnisotropicDiffusion3D::GetNumberOfIterations()
		CODE:
		RETVAL = THIS->GetNumberOfIterations();
		OUTPUT:
		RETVAL


void
vtkImageAnisotropicDiffusion3D::GradientMagnitudeThresholdOff()
		CODE:
		THIS->GradientMagnitudeThresholdOff();
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion3D::GradientMagnitudeThresholdOn()
		CODE:
		THIS->GradientMagnitudeThresholdOn();
		XSRETURN_EMPTY;


static vtkImageAnisotropicDiffusion3D*
vtkImageAnisotropicDiffusion3D::New()
		CODE:
		RETVAL = vtkImageAnisotropicDiffusion3D::New();
		OUTPUT:
		RETVAL


void
vtkImageAnisotropicDiffusion3D::SetCorners(arg1)
		int 	arg1
		CODE:
		THIS->SetCorners(arg1);
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion3D::SetDiffusionFactor(arg1)
		float 	arg1
		CODE:
		THIS->SetDiffusionFactor(arg1);
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion3D::SetDiffusionThreshold(arg1)
		float 	arg1
		CODE:
		THIS->SetDiffusionThreshold(arg1);
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion3D::SetEdges(arg1)
		int 	arg1
		CODE:
		THIS->SetEdges(arg1);
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion3D::SetFaces(arg1)
		int 	arg1
		CODE:
		THIS->SetFaces(arg1);
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion3D::SetGradientMagnitudeThreshold(arg1)
		int 	arg1
		CODE:
		THIS->SetGradientMagnitudeThreshold(arg1);
		XSRETURN_EMPTY;


void
vtkImageAnisotropicDiffusion3D::SetNumberOfIterations(num)
		int 	num
		CODE:
		THIS->SetNumberOfIterations(num);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageAppend PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkImageAppend::GetAppendAxis()
		CODE:
		RETVAL = THIS->GetAppendAxis();
		OUTPUT:
		RETVAL


const char *
vtkImageAppend::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageAppend::GetPreserveExtents()
		CODE:
		RETVAL = THIS->GetPreserveExtents();
		OUTPUT:
		RETVAL


static vtkImageAppend*
vtkImageAppend::New()
		CODE:
		RETVAL = vtkImageAppend::New();
		OUTPUT:
		RETVAL


void
vtkImageAppend::PreserveExtentsOff()
		CODE:
		THIS->PreserveExtentsOff();
		XSRETURN_EMPTY;


void
vtkImageAppend::PreserveExtentsOn()
		CODE:
		THIS->PreserveExtentsOn();
		XSRETURN_EMPTY;


void
vtkImageAppend::SetAppendAxis(arg1)
		int 	arg1
		CODE:
		THIS->SetAppendAxis(arg1);
		XSRETURN_EMPTY;


void
vtkImageAppend::SetPreserveExtents(arg1)
		int 	arg1
		CODE:
		THIS->SetPreserveExtents(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageAppendComponents PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageAppendComponents::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageAppendComponents*
vtkImageAppendComponents::New()
		CODE:
		RETVAL = vtkImageAppendComponents::New();
		OUTPUT:
		RETVAL


void
vtkImageAppendComponents::SetInput2(input)
		vtkImageData *	input
		CODE:
		THIS->SetInput2(input);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageBlend PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkImageBlend::GetBlendMode()
		CODE:
		RETVAL = THIS->GetBlendMode();
		OUTPUT:
		RETVAL


const char *
vtkImageBlend::GetBlendModeAsString()
		CODE:
		RETVAL = THIS->GetBlendModeAsString();
		OUTPUT:
		RETVAL


const char *
vtkImageBlend::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkImageBlend::GetCompoundThreshold()
		CODE:
		RETVAL = THIS->GetCompoundThreshold();
		OUTPUT:
		RETVAL


double
vtkImageBlend::GetOpacity(idx)
		int 	idx
		CODE:
		RETVAL = THIS->GetOpacity(idx);
		OUTPUT:
		RETVAL


static vtkImageBlend*
vtkImageBlend::New()
		CODE:
		RETVAL = vtkImageBlend::New();
		OUTPUT:
		RETVAL


void
vtkImageBlend::SetBlendMode(arg1)
		int 	arg1
		CODE:
		THIS->SetBlendMode(arg1);
		XSRETURN_EMPTY;


void
vtkImageBlend::SetBlendModeToCompound()
		CODE:
		THIS->SetBlendModeToCompound();
		XSRETURN_EMPTY;


void
vtkImageBlend::SetBlendModeToNormal()
		CODE:
		THIS->SetBlendModeToNormal();
		XSRETURN_EMPTY;


void
vtkImageBlend::SetCompoundThreshold(arg1)
		float 	arg1
		CODE:
		THIS->SetCompoundThreshold(arg1);
		XSRETURN_EMPTY;


void
vtkImageBlend::SetOpacity(idx, opacity)
		int 	idx
		double 	opacity
		CODE:
		THIS->SetOpacity(idx, opacity);
		XSRETURN_EMPTY;


void
vtkImageBlend::UpdateData(output)
		vtkDataObject *	output
		CODE:
		THIS->UpdateData(output);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageButterworthHighPass PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageButterworthHighPass::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkImageButterworthHighPass::GetCutOff()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetCutOff();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkImageButterworthHighPass::GetOrder()
		CODE:
		RETVAL = THIS->GetOrder();
		OUTPUT:
		RETVAL


float
vtkImageButterworthHighPass::GetXCutOff()
		CODE:
		RETVAL = THIS->GetXCutOff();
		OUTPUT:
		RETVAL


float
vtkImageButterworthHighPass::GetYCutOff()
		CODE:
		RETVAL = THIS->GetYCutOff();
		OUTPUT:
		RETVAL


float
vtkImageButterworthHighPass::GetZCutOff()
		CODE:
		RETVAL = THIS->GetZCutOff();
		OUTPUT:
		RETVAL


static vtkImageButterworthHighPass*
vtkImageButterworthHighPass::New()
		CODE:
		RETVAL = vtkImageButterworthHighPass::New();
		OUTPUT:
		RETVAL


void
vtkImageButterworthHighPass::SetCutOff(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetCutOff(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 2
		float 	arg1
		CODE:
		THIS->SetCutOff(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageButterworthHighPass::SetCutOff\n");



void
vtkImageButterworthHighPass::SetOrder(arg1)
		int 	arg1
		CODE:
		THIS->SetOrder(arg1);
		XSRETURN_EMPTY;


void
vtkImageButterworthHighPass::SetXCutOff(v)
		float 	v
		CODE:
		THIS->SetXCutOff(v);
		XSRETURN_EMPTY;


void
vtkImageButterworthHighPass::SetYCutOff(v)
		float 	v
		CODE:
		THIS->SetYCutOff(v);
		XSRETURN_EMPTY;


void
vtkImageButterworthHighPass::SetZCutOff(v)
		float 	v
		CODE:
		THIS->SetZCutOff(v);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageButterworthLowPass PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageButterworthLowPass::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkImageButterworthLowPass::GetCutOff()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetCutOff();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkImageButterworthLowPass::GetOrder()
		CODE:
		RETVAL = THIS->GetOrder();
		OUTPUT:
		RETVAL


float
vtkImageButterworthLowPass::GetXCutOff()
		CODE:
		RETVAL = THIS->GetXCutOff();
		OUTPUT:
		RETVAL


float
vtkImageButterworthLowPass::GetYCutOff()
		CODE:
		RETVAL = THIS->GetYCutOff();
		OUTPUT:
		RETVAL


float
vtkImageButterworthLowPass::GetZCutOff()
		CODE:
		RETVAL = THIS->GetZCutOff();
		OUTPUT:
		RETVAL


static vtkImageButterworthLowPass*
vtkImageButterworthLowPass::New()
		CODE:
		RETVAL = vtkImageButterworthLowPass::New();
		OUTPUT:
		RETVAL


void
vtkImageButterworthLowPass::SetCutOff(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetCutOff(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 2
		float 	arg1
		CODE:
		THIS->SetCutOff(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageButterworthLowPass::SetCutOff\n");



void
vtkImageButterworthLowPass::SetOrder(arg1)
		int 	arg1
		CODE:
		THIS->SetOrder(arg1);
		XSRETURN_EMPTY;


void
vtkImageButterworthLowPass::SetXCutOff(v)
		float 	v
		CODE:
		THIS->SetXCutOff(v);
		XSRETURN_EMPTY;


void
vtkImageButterworthLowPass::SetYCutOff(v)
		float 	v
		CODE:
		THIS->SetYCutOff(v);
		XSRETURN_EMPTY;


void
vtkImageButterworthLowPass::SetZCutOff(v)
		float 	v
		CODE:
		THIS->SetZCutOff(v);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageCacheFilter PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkImageCacheFilter::GetCacheSize()
		CODE:
		RETVAL = THIS->GetCacheSize();
		OUTPUT:
		RETVAL


const char *
vtkImageCacheFilter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageCacheFilter*
vtkImageCacheFilter::New()
		CODE:
		RETVAL = vtkImageCacheFilter::New();
		OUTPUT:
		RETVAL


void
vtkImageCacheFilter::SetCacheSize(size)
		int 	size
		CODE:
		THIS->SetCacheSize(size);
		XSRETURN_EMPTY;


void
vtkImageCacheFilter::UpdateData(outData)
		vtkDataObject *	outData
		CODE:
		THIS->UpdateData(outData);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageCanvasSource2D PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImageCanvasSource2D::DrawCircle(c0, c1, radius)
		int 	c0
		int 	c1
		float 	radius
		CODE:
		THIS->DrawCircle(c0, c1, radius);
		XSRETURN_EMPTY;


void
vtkImageCanvasSource2D::DrawPoint(p0, p1)
		int 	p0
		int 	p1
		CODE:
		THIS->DrawPoint(p0, p1);
		XSRETURN_EMPTY;


void
vtkImageCanvasSource2D::DrawSegment(x0, y0, x1, y1)
		int 	x0
		int 	y0
		int 	x1
		int 	y1
		CODE:
		THIS->DrawSegment(x0, y0, x1, y1);
		XSRETURN_EMPTY;


void
vtkImageCanvasSource2D::DrawSegment3D(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		float 	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		float 	arg5
		float 	arg6
		CODE:
		THIS->DrawSegment3D(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageCanvasSource2D::DrawSegment3D\n");



void
vtkImageCanvasSource2D::FillBox(min0, max0, min1, max1)
		int 	min0
		int 	max0
		int 	min1
		int 	max1
		CODE:
		THIS->FillBox(min0, max0, min1, max1);
		XSRETURN_EMPTY;


void
vtkImageCanvasSource2D::FillPixel(x, y)
		int 	x
		int 	y
		CODE:
		THIS->FillPixel(x, y);
		XSRETURN_EMPTY;


void
vtkImageCanvasSource2D::FillTriangle(x0, y0, x1, y1, x2, y2)
		int 	x0
		int 	y0
		int 	x1
		int 	y1
		int 	x2
		int 	y2
		CODE:
		THIS->FillTriangle(x0, y0, x1, y1, x2, y2);
		XSRETURN_EMPTY;


void
vtkImageCanvasSource2D::FillTube(x0, y0, x1, y1, radius)
		int 	x0
		int 	y0
		int 	x1
		int 	y1
		float 	radius
		CODE:
		THIS->FillTube(x0, y0, x1, y1, radius);
		XSRETURN_EMPTY;


const char *
vtkImageCanvasSource2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageCanvasSource2D::GetDefaultZ()
		CODE:
		RETVAL = THIS->GetDefaultZ();
		OUTPUT:
		RETVAL


float  *
vtkImageCanvasSource2D::GetDrawColor()
	CASE: items == 1
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetDrawColor();
		EXTEND(SP, 4);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));


vtkImageData *
vtkImageCanvasSource2D::GetImageData()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImageData";
		CODE:
		RETVAL = THIS->GetImageData();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkImageData *
vtkImageCanvasSource2D::GetOutput()
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


static vtkImageCanvasSource2D*
vtkImageCanvasSource2D::New()
		CODE:
		RETVAL = vtkImageCanvasSource2D::New();
		OUTPUT:
		RETVAL


void
vtkImageCanvasSource2D::SetDefaultZ(arg1)
		int 	arg1
		CODE:
		THIS->SetDefaultZ(arg1);
		XSRETURN_EMPTY;


void
vtkImageCanvasSource2D::SetDrawColor(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		float  	arg1
		float 	arg2
		float 	arg3
		float 	arg4
		CODE:
		THIS->SetDrawColor(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetDrawColor(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 3
		float 	arg1
		float 	arg2
		CODE:
		THIS->SetDrawColor(arg1, arg2);
		XSRETURN_EMPTY;
	CASE: items == 2
		float 	arg1
		CODE:
		THIS->SetDrawColor(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageCanvasSource2D::SetDrawColor\n");



void
vtkImageCanvasSource2D::SetExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkImageCanvasSource2D::SetExtent\n");



void
vtkImageCanvasSource2D::SetImageData(image)
		vtkImageData *	image
		CODE:
		THIS->SetImageData(image);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageCast PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImageCast::ClampOverflowOff()
		CODE:
		THIS->ClampOverflowOff();
		XSRETURN_EMPTY;


void
vtkImageCast::ClampOverflowOn()
		CODE:
		THIS->ClampOverflowOn();
		XSRETURN_EMPTY;


int
vtkImageCast::GetClampOverflow()
		CODE:
		RETVAL = THIS->GetClampOverflow();
		OUTPUT:
		RETVAL


const char *
vtkImageCast::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageCast::GetOutputScalarType()
		CODE:
		RETVAL = THIS->GetOutputScalarType();
		OUTPUT:
		RETVAL


static vtkImageCast*
vtkImageCast::New()
		CODE:
		RETVAL = vtkImageCast::New();
		OUTPUT:
		RETVAL


void
vtkImageCast::SetClampOverflow(arg1)
		int 	arg1
		CODE:
		THIS->SetClampOverflow(arg1);
		XSRETURN_EMPTY;


void
vtkImageCast::SetOutputScalarType(arg1)
		int 	arg1
		CODE:
		THIS->SetOutputScalarType(arg1);
		XSRETURN_EMPTY;


void
vtkImageCast::SetOutputScalarTypeToChar()
		CODE:
		THIS->SetOutputScalarTypeToChar();
		XSRETURN_EMPTY;


void
vtkImageCast::SetOutputScalarTypeToDouble()
		CODE:
		THIS->SetOutputScalarTypeToDouble();
		XSRETURN_EMPTY;


void
vtkImageCast::SetOutputScalarTypeToFloat()
		CODE:
		THIS->SetOutputScalarTypeToFloat();
		XSRETURN_EMPTY;


void
vtkImageCast::SetOutputScalarTypeToInt()
		CODE:
		THIS->SetOutputScalarTypeToInt();
		XSRETURN_EMPTY;


void
vtkImageCast::SetOutputScalarTypeToLong()
		CODE:
		THIS->SetOutputScalarTypeToLong();
		XSRETURN_EMPTY;


void
vtkImageCast::SetOutputScalarTypeToShort()
		CODE:
		THIS->SetOutputScalarTypeToShort();
		XSRETURN_EMPTY;


void
vtkImageCast::SetOutputScalarTypeToUnsignedChar()
		CODE:
		THIS->SetOutputScalarTypeToUnsignedChar();
		XSRETURN_EMPTY;


void
vtkImageCast::SetOutputScalarTypeToUnsignedInt()
		CODE:
		THIS->SetOutputScalarTypeToUnsignedInt();
		XSRETURN_EMPTY;


void
vtkImageCast::SetOutputScalarTypeToUnsignedLong()
		CODE:
		THIS->SetOutputScalarTypeToUnsignedLong();
		XSRETURN_EMPTY;


void
vtkImageCast::SetOutputScalarTypeToUnsignedShort()
		CODE:
		THIS->SetOutputScalarTypeToUnsignedShort();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageCityBlockDistance PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageCityBlockDistance::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageCityBlockDistance*
vtkImageCityBlockDistance::New()
		CODE:
		RETVAL = vtkImageCityBlockDistance::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageClip PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImageClip::ClipDataOff()
		CODE:
		THIS->ClipDataOff();
		XSRETURN_EMPTY;


void
vtkImageClip::ClipDataOn()
		CODE:
		THIS->ClipDataOn();
		XSRETURN_EMPTY;


const char *
vtkImageClip::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageClip::GetClipData()
		CODE:
		RETVAL = THIS->GetClipData();
		OUTPUT:
		RETVAL


static vtkImageClip*
vtkImageClip::New()
		CODE:
		RETVAL = vtkImageClip::New();
		OUTPUT:
		RETVAL


void
vtkImageClip::ResetOutputWholeExtent()
		CODE:
		THIS->ResetOutputWholeExtent();
		XSRETURN_EMPTY;


void
vtkImageClip::SetClipData(arg1)
		int 	arg1
		CODE:
		THIS->SetClipData(arg1);
		XSRETURN_EMPTY;


void
vtkImageClip::SetOutputWholeExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int 	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetOutputWholeExtent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE: items == 3
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetOutputWholeExtent(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageClip::SetOutputWholeExtent\n");


MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageComposite PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImageComposite::AddInput(arg1 = 0)
	CASE: items == 2
		vtkImageData *	arg1
		CODE:
		THIS->AddInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageComposite::AddInput\n");



const char *
vtkImageComposite::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkImageData *
vtkImageComposite::GetInput(idx)
		int 	idx
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImageData";
		CODE:
		RETVAL = THIS->GetInput(idx);
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkStructuredPoints *
vtkImageComposite::GetOutput(arg1 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkImageComposite::GetOutput\n");



static vtkImageComposite*
vtkImageComposite::New()
		CODE:
		RETVAL = vtkImageComposite::New();
		OUTPUT:
		RETVAL


void
vtkImageComposite::RemoveInput(arg1 = 0)
	CASE: items == 2
		vtkImageData *	arg1
		CODE:
		THIS->RemoveInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageComposite::RemoveInput\n");



void
vtkImageComposite::SetOutput(output)
		vtkStructuredPoints *	output
		CODE:
		THIS->SetOutput(output);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageConnector PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageConnector::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


unsigned char
vtkImageConnector::GetConnectedValue()
		CODE:
		RETVAL = THIS->GetConnectedValue();
		OUTPUT:
		RETVAL


unsigned char
vtkImageConnector::GetUnconnectedValue()
		CODE:
		RETVAL = THIS->GetUnconnectedValue();
		OUTPUT:
		RETVAL


static vtkImageConnector*
vtkImageConnector::New()
		CODE:
		RETVAL = vtkImageConnector::New();
		OUTPUT:
		RETVAL


void
vtkImageConnector::RemoveAllSeeds()
		CODE:
		THIS->RemoveAllSeeds();
		XSRETURN_EMPTY;


void
vtkImageConnector::SetConnectedValue(arg1)
		unsigned char 	arg1
		CODE:
		THIS->SetConnectedValue(arg1);
		XSRETURN_EMPTY;


void
vtkImageConnector::SetUnconnectedValue(arg1)
		unsigned char 	arg1
		CODE:
		THIS->SetUnconnectedValue(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageConstantPad PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageConstantPad::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkImageConstantPad::GetConstant()
		CODE:
		RETVAL = THIS->GetConstant();
		OUTPUT:
		RETVAL


static vtkImageConstantPad*
vtkImageConstantPad::New()
		CODE:
		RETVAL = vtkImageConstantPad::New();
		OUTPUT:
		RETVAL


void
vtkImageConstantPad::SetConstant(arg1)
		float 	arg1
		CODE:
		THIS->SetConstant(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageContinuousDilate3D PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageContinuousDilate3D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageContinuousDilate3D*
vtkImageContinuousDilate3D::New()
		CODE:
		RETVAL = vtkImageContinuousDilate3D::New();
		OUTPUT:
		RETVAL


void
vtkImageContinuousDilate3D::SetKernelSize(size0, size1, size2)
		int 	size0
		int 	size1
		int 	size2
		CODE:
		THIS->SetKernelSize(size0, size1, size2);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageContinuousErode3D PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageContinuousErode3D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageContinuousErode3D*
vtkImageContinuousErode3D::New()
		CODE:
		RETVAL = vtkImageContinuousErode3D::New();
		OUTPUT:
		RETVAL


void
vtkImageContinuousErode3D::SetKernelSize(size0, size1, size2)
		int 	size0
		int 	size1
		int 	size2
		CODE:
		THIS->SetKernelSize(size0, size1, size2);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageCorrelation PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageCorrelation::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageCorrelation::GetDimensionality()
		CODE:
		RETVAL = THIS->GetDimensionality();
		OUTPUT:
		RETVAL


static vtkImageCorrelation*
vtkImageCorrelation::New()
		CODE:
		RETVAL = vtkImageCorrelation::New();
		OUTPUT:
		RETVAL


void
vtkImageCorrelation::SetDimensionality(arg1)
		int 	arg1
		CODE:
		THIS->SetDimensionality(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageCursor3D PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageCursor3D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkImageCursor3D::GetCursorPosition()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetCursorPosition();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkImageCursor3D::GetCursorRadius()
		CODE:
		RETVAL = THIS->GetCursorRadius();
		OUTPUT:
		RETVAL


float
vtkImageCursor3D::GetCursorValue()
		CODE:
		RETVAL = THIS->GetCursorValue();
		OUTPUT:
		RETVAL


static vtkImageCursor3D*
vtkImageCursor3D::New()
		CODE:
		RETVAL = vtkImageCursor3D::New();
		OUTPUT:
		RETVAL


void
vtkImageCursor3D::SetCursorPosition(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetCursorPosition(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageCursor3D::SetCursorPosition\n");



void
vtkImageCursor3D::SetCursorRadius(arg1)
		int 	arg1
		CODE:
		THIS->SetCursorRadius(arg1);
		XSRETURN_EMPTY;


void
vtkImageCursor3D::SetCursorValue(arg1)
		float 	arg1
		CODE:
		THIS->SetCursorValue(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageDataStreamer PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageDataStreamer::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageDataStreamer::GetIncrementalUpdate()
		CODE:
		RETVAL = THIS->GetIncrementalUpdate();
		OUTPUT:
		RETVAL


unsigned long
vtkImageDataStreamer::GetMemoryLimit()
		CODE:
		RETVAL = THIS->GetMemoryLimit();
		OUTPUT:
		RETVAL


void
vtkImageDataStreamer::IncrementalUpdateOff()
		CODE:
		THIS->IncrementalUpdateOff();
		XSRETURN_EMPTY;


void
vtkImageDataStreamer::IncrementalUpdateOn()
		CODE:
		THIS->IncrementalUpdateOn();
		XSRETURN_EMPTY;


static vtkImageDataStreamer*
vtkImageDataStreamer::New()
		CODE:
		RETVAL = vtkImageDataStreamer::New();
		OUTPUT:
		RETVAL


void
vtkImageDataStreamer::SetIncrementalUpdate(arg1)
		int 	arg1
		CODE:
		THIS->SetIncrementalUpdate(arg1);
		XSRETURN_EMPTY;


void
vtkImageDataStreamer::SetMemoryLimit(arg1)
		unsigned long 	arg1
		CODE:
		THIS->SetMemoryLimit(arg1);
		XSRETURN_EMPTY;


void
vtkImageDataStreamer::SetSplitModeToBlock()
		CODE:
		THIS->SetSplitModeToBlock();
		XSRETURN_EMPTY;


void
vtkImageDataStreamer::SetSplitModeToXSlab()
		CODE:
		THIS->SetSplitModeToXSlab();
		XSRETURN_EMPTY;


void
vtkImageDataStreamer::SetSplitModeToYSlab()
		CODE:
		THIS->SetSplitModeToYSlab();
		XSRETURN_EMPTY;


void
vtkImageDataStreamer::SetSplitModeToZSlab()
		CODE:
		THIS->SetSplitModeToZSlab();
		XSRETURN_EMPTY;


void
vtkImageDataStreamer::TriggerAsynchronousUpdate()
		CODE:
		THIS->TriggerAsynchronousUpdate();
		XSRETURN_EMPTY;


void
vtkImageDataStreamer::UpdateData(out)
		vtkDataObject *	out
		CODE:
		THIS->UpdateData(out);
		XSRETURN_EMPTY;


void
vtkImageDataStreamer::UpdateInformation()
		CODE:
		THIS->UpdateInformation();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageDifference PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImageDifference::AllowShiftOff()
		CODE:
		THIS->AllowShiftOff();
		XSRETURN_EMPTY;


void
vtkImageDifference::AllowShiftOn()
		CODE:
		THIS->AllowShiftOn();
		XSRETURN_EMPTY;


void
vtkImageDifference::AveragingOff()
		CODE:
		THIS->AveragingOff();
		XSRETURN_EMPTY;


void
vtkImageDifference::AveragingOn()
		CODE:
		THIS->AveragingOn();
		XSRETURN_EMPTY;


int
vtkImageDifference::GetAllowShift()
		CODE:
		RETVAL = THIS->GetAllowShift();
		OUTPUT:
		RETVAL


int
vtkImageDifference::GetAveraging()
		CODE:
		RETVAL = THIS->GetAveraging();
		OUTPUT:
		RETVAL


const char *
vtkImageDifference::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkImageDifference::GetError()
	CASE: items == 1
		CODE:
		RETVAL = THIS->GetError();
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageDifference::GetError\n");



vtkImageData *
vtkImageDifference::GetImage()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImageData";
		CODE:
		RETVAL = THIS->GetImage();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkImageDifference::GetThreshold()
		CODE:
		RETVAL = THIS->GetThreshold();
		OUTPUT:
		RETVAL


float
vtkImageDifference::GetThresholdedError()
	CASE: items == 1
		CODE:
		RETVAL = THIS->GetThresholdedError();
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageDifference::GetThresholdedError\n");



static vtkImageDifference*
vtkImageDifference::New()
		CODE:
		RETVAL = vtkImageDifference::New();
		OUTPUT:
		RETVAL


void
vtkImageDifference::SetAllowShift(arg1)
		int 	arg1
		CODE:
		THIS->SetAllowShift(arg1);
		XSRETURN_EMPTY;


void
vtkImageDifference::SetAveraging(arg1)
		int 	arg1
		CODE:
		THIS->SetAveraging(arg1);
		XSRETURN_EMPTY;


void
vtkImageDifference::SetImage(image)
		vtkImageData *	image
		CODE:
		THIS->SetImage(image);
		XSRETURN_EMPTY;


void
vtkImageDifference::SetInput(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		vtkImageData *	arg2
		CODE:
		THIS->SetInput(arg1, arg2);
		XSRETURN_EMPTY;
	CASE: items == 2
		vtkImageData *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageDifference::SetInput\n");



void
vtkImageDifference::SetThreshold(arg1)
		int 	arg1
		CODE:
		THIS->SetThreshold(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageDilateErode3D PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageDilateErode3D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkImageDilateErode3D::GetDilateValue()
		CODE:
		RETVAL = THIS->GetDilateValue();
		OUTPUT:
		RETVAL


float
vtkImageDilateErode3D::GetErodeValue()
		CODE:
		RETVAL = THIS->GetErodeValue();
		OUTPUT:
		RETVAL


static vtkImageDilateErode3D*
vtkImageDilateErode3D::New()
		CODE:
		RETVAL = vtkImageDilateErode3D::New();
		OUTPUT:
		RETVAL


void
vtkImageDilateErode3D::SetDilateValue(arg1)
		float 	arg1
		CODE:
		THIS->SetDilateValue(arg1);
		XSRETURN_EMPTY;


void
vtkImageDilateErode3D::SetErodeValue(arg1)
		float 	arg1
		CODE:
		THIS->SetErodeValue(arg1);
		XSRETURN_EMPTY;


void
vtkImageDilateErode3D::SetKernelSize(size0, size1, size2)
		int 	size0
		int 	size1
		int 	size2
		CODE:
		THIS->SetKernelSize(size0, size1, size2);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageDivergence PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageDivergence::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageDivergence*
vtkImageDivergence::New()
		CODE:
		RETVAL = vtkImageDivergence::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageDotProduct PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageDotProduct::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageDotProduct*
vtkImageDotProduct::New()
		CODE:
		RETVAL = vtkImageDotProduct::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageEllipsoidSource PREFIX = vtk

PROTOTYPES: DISABLE



float  *
vtkImageEllipsoidSource::GetCenter()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetCenter();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


const char *
vtkImageEllipsoidSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkImageEllipsoidSource::GetInValue()
		CODE:
		RETVAL = THIS->GetInValue();
		OUTPUT:
		RETVAL


float
vtkImageEllipsoidSource::GetOutValue()
		CODE:
		RETVAL = THIS->GetOutValue();
		OUTPUT:
		RETVAL


int
vtkImageEllipsoidSource::GetOutputScalarType()
		CODE:
		RETVAL = THIS->GetOutputScalarType();
		OUTPUT:
		RETVAL


float  *
vtkImageEllipsoidSource::GetRadius()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetRadius();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


static vtkImageEllipsoidSource*
vtkImageEllipsoidSource::New()
		CODE:
		RETVAL = vtkImageEllipsoidSource::New();
		OUTPUT:
		RETVAL


void
vtkImageEllipsoidSource::SetCenter(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetCenter(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageEllipsoidSource::SetCenter\n");



void
vtkImageEllipsoidSource::SetInValue(arg1)
		float 	arg1
		CODE:
		THIS->SetInValue(arg1);
		XSRETURN_EMPTY;


void
vtkImageEllipsoidSource::SetOutValue(arg1)
		float 	arg1
		CODE:
		THIS->SetOutValue(arg1);
		XSRETURN_EMPTY;


void
vtkImageEllipsoidSource::SetOutputScalarType(arg1)
		int 	arg1
		CODE:
		THIS->SetOutputScalarType(arg1);
		XSRETURN_EMPTY;


void
vtkImageEllipsoidSource::SetOutputScalarTypeToChar()
		CODE:
		THIS->SetOutputScalarTypeToChar();
		XSRETURN_EMPTY;


void
vtkImageEllipsoidSource::SetOutputScalarTypeToDouble()
		CODE:
		THIS->SetOutputScalarTypeToDouble();
		XSRETURN_EMPTY;


void
vtkImageEllipsoidSource::SetOutputScalarTypeToFloat()
		CODE:
		THIS->SetOutputScalarTypeToFloat();
		XSRETURN_EMPTY;


void
vtkImageEllipsoidSource::SetOutputScalarTypeToInt()
		CODE:
		THIS->SetOutputScalarTypeToInt();
		XSRETURN_EMPTY;


void
vtkImageEllipsoidSource::SetOutputScalarTypeToLong()
		CODE:
		THIS->SetOutputScalarTypeToLong();
		XSRETURN_EMPTY;


void
vtkImageEllipsoidSource::SetOutputScalarTypeToShort()
		CODE:
		THIS->SetOutputScalarTypeToShort();
		XSRETURN_EMPTY;


void
vtkImageEllipsoidSource::SetOutputScalarTypeToUnsignedChar()
		CODE:
		THIS->SetOutputScalarTypeToUnsignedChar();
		XSRETURN_EMPTY;


void
vtkImageEllipsoidSource::SetOutputScalarTypeToUnsignedInt()
		CODE:
		THIS->SetOutputScalarTypeToUnsignedInt();
		XSRETURN_EMPTY;


void
vtkImageEllipsoidSource::SetOutputScalarTypeToUnsignedLong()
		CODE:
		THIS->SetOutputScalarTypeToUnsignedLong();
		XSRETURN_EMPTY;


void
vtkImageEllipsoidSource::SetOutputScalarTypeToUnsignedShort()
		CODE:
		THIS->SetOutputScalarTypeToUnsignedShort();
		XSRETURN_EMPTY;


void
vtkImageEllipsoidSource::SetRadius(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetRadius(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageEllipsoidSource::SetRadius\n");



void
vtkImageEllipsoidSource::SetWholeExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int 	arg1
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
		croak("Unsupported number of args and/or types supplied to vtkImageEllipsoidSource::SetWholeExtent\n");


MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageEuclideanToPolar PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageEuclideanToPolar::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkImageEuclideanToPolar::GetThetaMaximum()
		CODE:
		RETVAL = THIS->GetThetaMaximum();
		OUTPUT:
		RETVAL


static vtkImageEuclideanToPolar*
vtkImageEuclideanToPolar::New()
		CODE:
		RETVAL = vtkImageEuclideanToPolar::New();
		OUTPUT:
		RETVAL


void
vtkImageEuclideanToPolar::SetThetaMaximum(arg1)
		float 	arg1
		CODE:
		THIS->SetThetaMaximum(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageExport PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageExport::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int *
vtkImageExport::GetDataDimensions()
	CASE: items == 1
		PREINIT:
		int * retval;
		PPCODE:
		retval = THIS->GetDataDimensions();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int *
vtkImageExport::GetDataExtent()
	CASE: items == 1
		PREINIT:
		int * retval;
		PPCODE:
		retval = THIS->GetDataExtent();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


int
vtkImageExport::GetDataMemorySize()
		CODE:
		RETVAL = THIS->GetDataMemorySize();
		OUTPUT:
		RETVAL


int
vtkImageExport::GetDataNumberOfScalarComponents()
		CODE:
		RETVAL = THIS->GetDataNumberOfScalarComponents();
		OUTPUT:
		RETVAL


float *
vtkImageExport::GetDataOrigin()
	CASE: items == 1
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetDataOrigin();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkImageExport::GetDataScalarType()
		CODE:
		RETVAL = THIS->GetDataScalarType();
		OUTPUT:
		RETVAL


float *
vtkImageExport::GetDataSpacing()
	CASE: items == 1
		PREINIT:
		float * retval;
		PPCODE:
		retval = THIS->GetDataSpacing();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkImageExport::GetImageLowerLeft()
		CODE:
		RETVAL = THIS->GetImageLowerLeft();
		OUTPUT:
		RETVAL


vtkImageData *
vtkImageExport::GetInput()
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


void *
vtkImageExport::GetPointerToData()
		CODE:
		RETVAL = THIS->GetPointerToData();
		OUTPUT:
		RETVAL


void
vtkImageExport::ImageLowerLeftOff()
		CODE:
		THIS->ImageLowerLeftOff();
		XSRETURN_EMPTY;


void
vtkImageExport::ImageLowerLeftOn()
		CODE:
		THIS->ImageLowerLeftOn();
		XSRETURN_EMPTY;


static vtkImageExport*
vtkImageExport::New()
		CODE:
		RETVAL = vtkImageExport::New();
		OUTPUT:
		RETVAL


void
vtkImageExport::SetImageLowerLeft(arg1)
		int 	arg1
		CODE:
		THIS->SetImageLowerLeft(arg1);
		XSRETURN_EMPTY;


void
vtkImageExport::SetInput(input)
		vtkImageData *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageExtractComponents PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageExtractComponents::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int  *
vtkImageExtractComponents::GetComponents()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetComponents();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkImageExtractComponents::GetNumberOfComponents()
		CODE:
		RETVAL = THIS->GetNumberOfComponents();
		OUTPUT:
		RETVAL


static vtkImageExtractComponents*
vtkImageExtractComponents::New()
		CODE:
		RETVAL = vtkImageExtractComponents::New();
		OUTPUT:
		RETVAL


void
vtkImageExtractComponents::SetComponents(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetComponents(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 3
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetComponents(arg1, arg2);
		XSRETURN_EMPTY;
	CASE: items == 2
		int 	arg1
		CODE:
		THIS->SetComponents(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageExtractComponents::SetComponents\n");


MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageFFT PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageFFT::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageFFT*
vtkImageFFT::New()
		CODE:
		RETVAL = vtkImageFFT::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageFlip PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageFlip::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageFlip::GetFilteredAxis()
		CODE:
		RETVAL = THIS->GetFilteredAxis();
		OUTPUT:
		RETVAL


int
vtkImageFlip::GetPreserveImageExtent()
		CODE:
		RETVAL = THIS->GetPreserveImageExtent();
		OUTPUT:
		RETVAL


static vtkImageFlip*
vtkImageFlip::New()
		CODE:
		RETVAL = vtkImageFlip::New();
		OUTPUT:
		RETVAL


void
vtkImageFlip::PreserveImageExtentOff()
		CODE:
		THIS->PreserveImageExtentOff();
		XSRETURN_EMPTY;


void
vtkImageFlip::PreserveImageExtentOn()
		CODE:
		THIS->PreserveImageExtentOn();
		XSRETURN_EMPTY;


void
vtkImageFlip::SetFilteredAxes(axis)
		int 	axis
		CODE:
		THIS->SetFilteredAxes(axis);
		XSRETURN_EMPTY;


void
vtkImageFlip::SetFilteredAxis(arg1)
		int 	arg1
		CODE:
		THIS->SetFilteredAxis(arg1);
		XSRETURN_EMPTY;


void
vtkImageFlip::SetPreserveImageExtent(arg1)
		int 	arg1
		CODE:
		THIS->SetPreserveImageExtent(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageFourierCenter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageFourierCenter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageFourierCenter*
vtkImageFourierCenter::New()
		CODE:
		RETVAL = vtkImageFourierCenter::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageGaussianSmooth PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageGaussianSmooth::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageGaussianSmooth::GetDimensionality()
		CODE:
		RETVAL = THIS->GetDimensionality();
		OUTPUT:
		RETVAL


float  *
vtkImageGaussianSmooth::GetRadiusFactors()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetRadiusFactors();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float  *
vtkImageGaussianSmooth::GetStandardDeviations()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetStandardDeviations();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


static vtkImageGaussianSmooth*
vtkImageGaussianSmooth::New()
		CODE:
		RETVAL = vtkImageGaussianSmooth::New();
		OUTPUT:
		RETVAL


void
vtkImageGaussianSmooth::SetDimensionality(arg1)
		int 	arg1
		CODE:
		THIS->SetDimensionality(arg1);
		XSRETURN_EMPTY;


void
vtkImageGaussianSmooth::SetRadiusFactor(f)
		float 	f
		CODE:
		THIS->SetRadiusFactor(f);
		XSRETURN_EMPTY;


void
vtkImageGaussianSmooth::SetRadiusFactors(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetRadiusFactors(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 3
		float 	arg1
		float 	arg2
		CODE:
		THIS->SetRadiusFactors(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageGaussianSmooth::SetRadiusFactors\n");



void
vtkImageGaussianSmooth::SetStandardDeviation(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetStandardDeviation(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 3
		float 	arg1
		float 	arg2
		CODE:
		THIS->SetStandardDeviation(arg1, arg2);
		XSRETURN_EMPTY;
	CASE: items == 2
		float 	arg1
		CODE:
		THIS->SetStandardDeviation(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageGaussianSmooth::SetStandardDeviation\n");



void
vtkImageGaussianSmooth::SetStandardDeviations(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetStandardDeviations(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 3
		float 	arg1
		float 	arg2
		CODE:
		THIS->SetStandardDeviations(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageGaussianSmooth::SetStandardDeviations\n");


MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageGaussianSource PREFIX = vtk

PROTOTYPES: DISABLE



float  *
vtkImageGaussianSource::GetCenter()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetCenter();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


const char *
vtkImageGaussianSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkImageGaussianSource::GetMaximum()
		CODE:
		RETVAL = THIS->GetMaximum();
		OUTPUT:
		RETVAL


float
vtkImageGaussianSource::GetStandardDeviation()
		CODE:
		RETVAL = THIS->GetStandardDeviation();
		OUTPUT:
		RETVAL


static vtkImageGaussianSource*
vtkImageGaussianSource::New()
		CODE:
		RETVAL = vtkImageGaussianSource::New();
		OUTPUT:
		RETVAL


void
vtkImageGaussianSource::SetCenter(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetCenter(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageGaussianSource::SetCenter\n");



void
vtkImageGaussianSource::SetMaximum(arg1)
		float 	arg1
		CODE:
		THIS->SetMaximum(arg1);
		XSRETURN_EMPTY;


void
vtkImageGaussianSource::SetStandardDeviation(arg1)
		float 	arg1
		CODE:
		THIS->SetStandardDeviation(arg1);
		XSRETURN_EMPTY;


void
vtkImageGaussianSource::SetWholeExtent(xMinx, xMax, yMin, yMax, zMin, zMax)
		int 	xMinx
		int 	xMax
		int 	yMin
		int 	yMax
		int 	zMin
		int 	zMax
		CODE:
		THIS->SetWholeExtent(xMinx, xMax, yMin, yMax, zMin, zMax);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageGridSource PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageGridSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int  *
vtkImageGridSource::GetDataExtent()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetDataExtent();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


float  *
vtkImageGridSource::GetDataOrigin()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetDataOrigin();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkImageGridSource::GetDataScalarType()
		CODE:
		RETVAL = THIS->GetDataScalarType();
		OUTPUT:
		RETVAL


const char *
vtkImageGridSource::GetDataScalarTypeAsString()
		CODE:
		RETVAL = THIS->GetDataScalarTypeAsString();
		OUTPUT:
		RETVAL


float  *
vtkImageGridSource::GetDataSpacing()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetDataSpacing();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float
vtkImageGridSource::GetFillValue()
		CODE:
		RETVAL = THIS->GetFillValue();
		OUTPUT:
		RETVAL


int  *
vtkImageGridSource::GetGridOrigin()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetGridOrigin();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int  *
vtkImageGridSource::GetGridSpacing()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetGridSpacing();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float
vtkImageGridSource::GetLineValue()
		CODE:
		RETVAL = THIS->GetLineValue();
		OUTPUT:
		RETVAL


static vtkImageGridSource*
vtkImageGridSource::New()
		CODE:
		RETVAL = vtkImageGridSource::New();
		OUTPUT:
		RETVAL


void
vtkImageGridSource::SetDataExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int  	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetDataExtent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageGridSource::SetDataExtent\n");



void
vtkImageGridSource::SetDataOrigin(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetDataOrigin(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageGridSource::SetDataOrigin\n");



void
vtkImageGridSource::SetDataScalarType(arg1)
		int 	arg1
		CODE:
		THIS->SetDataScalarType(arg1);
		XSRETURN_EMPTY;


void
vtkImageGridSource::SetDataScalarTypeToFloat()
		CODE:
		THIS->SetDataScalarTypeToFloat();
		XSRETURN_EMPTY;


void
vtkImageGridSource::SetDataScalarTypeToInt()
		CODE:
		THIS->SetDataScalarTypeToInt();
		XSRETURN_EMPTY;


void
vtkImageGridSource::SetDataScalarTypeToShort()
		CODE:
		THIS->SetDataScalarTypeToShort();
		XSRETURN_EMPTY;


void
vtkImageGridSource::SetDataScalarTypeToUnsignedChar()
		CODE:
		THIS->SetDataScalarTypeToUnsignedChar();
		XSRETURN_EMPTY;


void
vtkImageGridSource::SetDataScalarTypeToUnsignedShort()
		CODE:
		THIS->SetDataScalarTypeToUnsignedShort();
		XSRETURN_EMPTY;


void
vtkImageGridSource::SetDataSpacing(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetDataSpacing(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageGridSource::SetDataSpacing\n");



void
vtkImageGridSource::SetFillValue(arg1)
		float 	arg1
		CODE:
		THIS->SetFillValue(arg1);
		XSRETURN_EMPTY;


void
vtkImageGridSource::SetGridOrigin(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int  	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetGridOrigin(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageGridSource::SetGridOrigin\n");



void
vtkImageGridSource::SetGridSpacing(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int  	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetGridSpacing(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageGridSource::SetGridSpacing\n");



void
vtkImageGridSource::SetLineValue(arg1)
		float 	arg1
		CODE:
		THIS->SetLineValue(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageGradient PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageGradient::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageGradient::GetDimensionality()
		CODE:
		RETVAL = THIS->GetDimensionality();
		OUTPUT:
		RETVAL


int
vtkImageGradient::GetHandleBoundaries()
		CODE:
		RETVAL = THIS->GetHandleBoundaries();
		OUTPUT:
		RETVAL


void
vtkImageGradient::HandleBoundariesOff()
		CODE:
		THIS->HandleBoundariesOff();
		XSRETURN_EMPTY;


void
vtkImageGradient::HandleBoundariesOn()
		CODE:
		THIS->HandleBoundariesOn();
		XSRETURN_EMPTY;


static vtkImageGradient*
vtkImageGradient::New()
		CODE:
		RETVAL = vtkImageGradient::New();
		OUTPUT:
		RETVAL


void
vtkImageGradient::SetDimensionality(arg1)
		int 	arg1
		CODE:
		THIS->SetDimensionality(arg1);
		XSRETURN_EMPTY;


void
vtkImageGradient::SetHandleBoundaries(arg1)
		int 	arg1
		CODE:
		THIS->SetHandleBoundaries(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageGradientMagnitude PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageGradientMagnitude::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageGradientMagnitude::GetDimensionality()
		CODE:
		RETVAL = THIS->GetDimensionality();
		OUTPUT:
		RETVAL


int
vtkImageGradientMagnitude::GetHandleBoundaries()
		CODE:
		RETVAL = THIS->GetHandleBoundaries();
		OUTPUT:
		RETVAL


void
vtkImageGradientMagnitude::HandleBoundariesOff()
		CODE:
		THIS->HandleBoundariesOff();
		XSRETURN_EMPTY;


void
vtkImageGradientMagnitude::HandleBoundariesOn()
		CODE:
		THIS->HandleBoundariesOn();
		XSRETURN_EMPTY;


static vtkImageGradientMagnitude*
vtkImageGradientMagnitude::New()
		CODE:
		RETVAL = vtkImageGradientMagnitude::New();
		OUTPUT:
		RETVAL


void
vtkImageGradientMagnitude::SetDimensionality(arg1)
		int 	arg1
		CODE:
		THIS->SetDimensionality(arg1);
		XSRETURN_EMPTY;


void
vtkImageGradientMagnitude::SetHandleBoundaries(arg1)
		int 	arg1
		CODE:
		THIS->SetHandleBoundaries(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageHSVToRGB PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageHSVToRGB::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkImageHSVToRGB::GetMaximum()
		CODE:
		RETVAL = THIS->GetMaximum();
		OUTPUT:
		RETVAL


static vtkImageHSVToRGB*
vtkImageHSVToRGB::New()
		CODE:
		RETVAL = vtkImageHSVToRGB::New();
		OUTPUT:
		RETVAL


void
vtkImageHSVToRGB::SetMaximum(arg1)
		float 	arg1
		CODE:
		THIS->SetMaximum(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageHybridMedian2D PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageHybridMedian2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageHybridMedian2D*
vtkImageHybridMedian2D::New()
		CODE:
		RETVAL = vtkImageHybridMedian2D::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageIdealHighPass PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageIdealHighPass::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkImageIdealHighPass::GetCutOff()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetCutOff();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float
vtkImageIdealHighPass::GetXCutOff()
		CODE:
		RETVAL = THIS->GetXCutOff();
		OUTPUT:
		RETVAL


float
vtkImageIdealHighPass::GetYCutOff()
		CODE:
		RETVAL = THIS->GetYCutOff();
		OUTPUT:
		RETVAL


float
vtkImageIdealHighPass::GetZCutOff()
		CODE:
		RETVAL = THIS->GetZCutOff();
		OUTPUT:
		RETVAL


static vtkImageIdealHighPass*
vtkImageIdealHighPass::New()
		CODE:
		RETVAL = vtkImageIdealHighPass::New();
		OUTPUT:
		RETVAL


void
vtkImageIdealHighPass::SetCutOff(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetCutOff(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 2
		float 	arg1
		CODE:
		THIS->SetCutOff(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageIdealHighPass::SetCutOff\n");



void
vtkImageIdealHighPass::SetXCutOff(v)
		float 	v
		CODE:
		THIS->SetXCutOff(v);
		XSRETURN_EMPTY;


void
vtkImageIdealHighPass::SetYCutOff(v)
		float 	v
		CODE:
		THIS->SetYCutOff(v);
		XSRETURN_EMPTY;


void
vtkImageIdealHighPass::SetZCutOff(v)
		float 	v
		CODE:
		THIS->SetZCutOff(v);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageIdealLowPass PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageIdealLowPass::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkImageIdealLowPass::GetCutOff()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetCutOff();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float
vtkImageIdealLowPass::GetXCutOff()
		CODE:
		RETVAL = THIS->GetXCutOff();
		OUTPUT:
		RETVAL


float
vtkImageIdealLowPass::GetYCutOff()
		CODE:
		RETVAL = THIS->GetYCutOff();
		OUTPUT:
		RETVAL


float
vtkImageIdealLowPass::GetZCutOff()
		CODE:
		RETVAL = THIS->GetZCutOff();
		OUTPUT:
		RETVAL


static vtkImageIdealLowPass*
vtkImageIdealLowPass::New()
		CODE:
		RETVAL = vtkImageIdealLowPass::New();
		OUTPUT:
		RETVAL


void
vtkImageIdealLowPass::SetCutOff(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetCutOff(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 2
		float 	arg1
		CODE:
		THIS->SetCutOff(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageIdealLowPass::SetCutOff\n");



void
vtkImageIdealLowPass::SetXCutOff(v)
		float 	v
		CODE:
		THIS->SetXCutOff(v);
		XSRETURN_EMPTY;


void
vtkImageIdealLowPass::SetYCutOff(v)
		float 	v
		CODE:
		THIS->SetYCutOff(v);
		XSRETURN_EMPTY;


void
vtkImageIdealLowPass::SetZCutOff(v)
		float 	v
		CODE:
		THIS->SetZCutOff(v);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageImport PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageImport::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int  *
vtkImageImport::GetDataExtent()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetDataExtent();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


float  *
vtkImageImport::GetDataOrigin()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetDataOrigin();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkImageImport::GetDataScalarType()
		CODE:
		RETVAL = THIS->GetDataScalarType();
		OUTPUT:
		RETVAL


const char *
vtkImageImport::GetDataScalarTypeAsString()
		CODE:
		RETVAL = THIS->GetDataScalarTypeAsString();
		OUTPUT:
		RETVAL


float  *
vtkImageImport::GetDataSpacing()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetDataSpacing();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


void *
vtkImageImport::GetImportVoidPointer()
		CODE:
		RETVAL = THIS->GetImportVoidPointer();
		OUTPUT:
		RETVAL


int
vtkImageImport::GetNumberOfScalarComponents()
		CODE:
		RETVAL = THIS->GetNumberOfScalarComponents();
		OUTPUT:
		RETVAL


static vtkImageImport*
vtkImageImport::New()
		CODE:
		RETVAL = vtkImageImport::New();
		OUTPUT:
		RETVAL


void
vtkImageImport::SetDataExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int  	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetDataExtent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageImport::SetDataExtent\n");



void
vtkImageImport::SetDataOrigin(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetDataOrigin(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageImport::SetDataOrigin\n");



void
vtkImageImport::SetDataScalarType(arg1)
		int 	arg1
		CODE:
		THIS->SetDataScalarType(arg1);
		XSRETURN_EMPTY;


void
vtkImageImport::SetDataScalarTypeToDouble()
		CODE:
		THIS->SetDataScalarTypeToDouble();
		XSRETURN_EMPTY;


void
vtkImageImport::SetDataScalarTypeToFloat()
		CODE:
		THIS->SetDataScalarTypeToFloat();
		XSRETURN_EMPTY;


void
vtkImageImport::SetDataScalarTypeToInt()
		CODE:
		THIS->SetDataScalarTypeToInt();
		XSRETURN_EMPTY;


void
vtkImageImport::SetDataScalarTypeToShort()
		CODE:
		THIS->SetDataScalarTypeToShort();
		XSRETURN_EMPTY;


void
vtkImageImport::SetDataScalarTypeToUnsignedChar()
		CODE:
		THIS->SetDataScalarTypeToUnsignedChar();
		XSRETURN_EMPTY;


void
vtkImageImport::SetDataScalarTypeToUnsignedShort()
		CODE:
		THIS->SetDataScalarTypeToUnsignedShort();
		XSRETURN_EMPTY;


void
vtkImageImport::SetDataSpacing(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetDataSpacing(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageImport::SetDataSpacing\n");



void
vtkImageImport::SetNumberOfScalarComponents(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfScalarComponents(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageIslandRemoval2D PREFIX = vtk

PROTOTYPES: DISABLE



int
vtkImageIslandRemoval2D::GetAreaThreshold()
		CODE:
		RETVAL = THIS->GetAreaThreshold();
		OUTPUT:
		RETVAL


const char *
vtkImageIslandRemoval2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkImageIslandRemoval2D::GetIslandValue()
		CODE:
		RETVAL = THIS->GetIslandValue();
		OUTPUT:
		RETVAL


float
vtkImageIslandRemoval2D::GetReplaceValue()
		CODE:
		RETVAL = THIS->GetReplaceValue();
		OUTPUT:
		RETVAL


int
vtkImageIslandRemoval2D::GetSquareNeighborhood()
		CODE:
		RETVAL = THIS->GetSquareNeighborhood();
		OUTPUT:
		RETVAL


static vtkImageIslandRemoval2D*
vtkImageIslandRemoval2D::New()
		CODE:
		RETVAL = vtkImageIslandRemoval2D::New();
		OUTPUT:
		RETVAL


void
vtkImageIslandRemoval2D::SetAreaThreshold(arg1)
		int 	arg1
		CODE:
		THIS->SetAreaThreshold(arg1);
		XSRETURN_EMPTY;


void
vtkImageIslandRemoval2D::SetIslandValue(arg1)
		float 	arg1
		CODE:
		THIS->SetIslandValue(arg1);
		XSRETURN_EMPTY;


void
vtkImageIslandRemoval2D::SetReplaceValue(arg1)
		float 	arg1
		CODE:
		THIS->SetReplaceValue(arg1);
		XSRETURN_EMPTY;


void
vtkImageIslandRemoval2D::SetSquareNeighborhood(arg1)
		int 	arg1
		CODE:
		THIS->SetSquareNeighborhood(arg1);
		XSRETURN_EMPTY;


void
vtkImageIslandRemoval2D::SquareNeighborhoodOff()
		CODE:
		THIS->SquareNeighborhoodOff();
		XSRETURN_EMPTY;


void
vtkImageIslandRemoval2D::SquareNeighborhoodOn()
		CODE:
		THIS->SquareNeighborhoodOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageLaplacian PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageLaplacian::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageLaplacian::GetDimensionality()
		CODE:
		RETVAL = THIS->GetDimensionality();
		OUTPUT:
		RETVAL


static vtkImageLaplacian*
vtkImageLaplacian::New()
		CODE:
		RETVAL = vtkImageLaplacian::New();
		OUTPUT:
		RETVAL


void
vtkImageLaplacian::SetDimensionality(arg1)
		int 	arg1
		CODE:
		THIS->SetDimensionality(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageLogarithmicScale PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageLogarithmicScale::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkImageLogarithmicScale::GetConstant()
		CODE:
		RETVAL = THIS->GetConstant();
		OUTPUT:
		RETVAL


static vtkImageLogarithmicScale*
vtkImageLogarithmicScale::New()
		CODE:
		RETVAL = vtkImageLogarithmicScale::New();
		OUTPUT:
		RETVAL


void
vtkImageLogarithmicScale::SetConstant(arg1)
		float 	arg1
		CODE:
		THIS->SetConstant(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageLogic PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageLogic::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageLogic::GetOperation()
		CODE:
		RETVAL = THIS->GetOperation();
		OUTPUT:
		RETVAL


float
vtkImageLogic::GetOutputTrueValue()
		CODE:
		RETVAL = THIS->GetOutputTrueValue();
		OUTPUT:
		RETVAL


static vtkImageLogic*
vtkImageLogic::New()
		CODE:
		RETVAL = vtkImageLogic::New();
		OUTPUT:
		RETVAL


void
vtkImageLogic::SetOperation(arg1)
		int 	arg1
		CODE:
		THIS->SetOperation(arg1);
		XSRETURN_EMPTY;


void
vtkImageLogic::SetOperationToAnd()
		CODE:
		THIS->SetOperationToAnd();
		XSRETURN_EMPTY;


void
vtkImageLogic::SetOperationToNand()
		CODE:
		THIS->SetOperationToNand();
		XSRETURN_EMPTY;


void
vtkImageLogic::SetOperationToNor()
		CODE:
		THIS->SetOperationToNor();
		XSRETURN_EMPTY;


void
vtkImageLogic::SetOperationToNot()
		CODE:
		THIS->SetOperationToNot();
		XSRETURN_EMPTY;


void
vtkImageLogic::SetOperationToOr()
		CODE:
		THIS->SetOperationToOr();
		XSRETURN_EMPTY;


void
vtkImageLogic::SetOperationToXor()
		CODE:
		THIS->SetOperationToXor();
		XSRETURN_EMPTY;


void
vtkImageLogic::SetOutputTrueValue(arg1)
		float 	arg1
		CODE:
		THIS->SetOutputTrueValue(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageLuminance PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageLuminance::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageLuminance*
vtkImageLuminance::New()
		CODE:
		RETVAL = vtkImageLuminance::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageMagnify PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageMagnify::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageMagnify::GetInterpolate()
		CODE:
		RETVAL = THIS->GetInterpolate();
		OUTPUT:
		RETVAL


int  *
vtkImageMagnify::GetMagnificationFactors()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetMagnificationFactors();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


void
vtkImageMagnify::InterpolateOff()
		CODE:
		THIS->InterpolateOff();
		XSRETURN_EMPTY;


void
vtkImageMagnify::InterpolateOn()
		CODE:
		THIS->InterpolateOn();
		XSRETURN_EMPTY;


static vtkImageMagnify*
vtkImageMagnify::New()
		CODE:
		RETVAL = vtkImageMagnify::New();
		OUTPUT:
		RETVAL


void
vtkImageMagnify::SetInterpolate(arg1)
		int 	arg1
		CODE:
		THIS->SetInterpolate(arg1);
		XSRETURN_EMPTY;


void
vtkImageMagnify::SetMagnificationFactors(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int  	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetMagnificationFactors(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageMagnify::SetMagnificationFactors\n");


MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageMagnitude PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageMagnitude::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageMagnitude*
vtkImageMagnitude::New()
		CODE:
		RETVAL = vtkImageMagnitude::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageMandelbrotSource PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImageMandelbrotSource::CopyOriginAndSample(source)
		vtkImageMandelbrotSource *	source
		CODE:
		THIS->CopyOriginAndSample(source);
		XSRETURN_EMPTY;


const char *
vtkImageMandelbrotSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


unsigned short
vtkImageMandelbrotSource::GetMaximumNumberOfIterations()
		CODE:
		RETVAL = THIS->GetMaximumNumberOfIterations();
		OUTPUT:
		RETVAL


double  *
vtkImageMandelbrotSource::GetOriginCX()
		PREINIT:
		double  * retval;
		PPCODE:
		retval = THIS->GetOriginCX();
		EXTEND(SP, 4);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));


int  *
vtkImageMandelbrotSource::GetProjectionAxes()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetProjectionAxes();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


double  *
vtkImageMandelbrotSource::GetSampleCX()
		PREINIT:
		double  * retval;
		PPCODE:
		retval = THIS->GetSampleCX();
		EXTEND(SP, 4);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));


int  *
vtkImageMandelbrotSource::GetWholeExtent()
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


static vtkImageMandelbrotSource*
vtkImageMandelbrotSource::New()
		CODE:
		RETVAL = vtkImageMandelbrotSource::New();
		OUTPUT:
		RETVAL


void
vtkImageMandelbrotSource::Pan(x, y, z)
		double 	x
		double 	y
		double 	z
		CODE:
		THIS->Pan(x, y, z);
		XSRETURN_EMPTY;


void
vtkImageMandelbrotSource::SetMaximumNumberOfIterations(arg1)
		unsigned short 	arg1
		CODE:
		THIS->SetMaximumNumberOfIterations(arg1);
		XSRETURN_EMPTY;


void
vtkImageMandelbrotSource::SetOriginCX(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		double  	arg1
		double 	arg2
		double 	arg3
		double 	arg4
		CODE:
		THIS->SetOriginCX(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageMandelbrotSource::SetOriginCX\n");



void
vtkImageMandelbrotSource::SetProjectionAxes(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int  	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetProjectionAxes(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageMandelbrotSource::SetProjectionAxes\n");



void
vtkImageMandelbrotSource::SetSample(v)
		double 	v
		CODE:
		THIS->SetSample(v);
		XSRETURN_EMPTY;


void
vtkImageMandelbrotSource::SetSampleCX(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		double  	arg1
		double 	arg2
		double 	arg3
		double 	arg4
		CODE:
		THIS->SetSampleCX(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageMandelbrotSource::SetSampleCX\n");



void
vtkImageMandelbrotSource::SetWholeExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int 	arg1
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
		croak("Unsupported number of args and/or types supplied to vtkImageMandelbrotSource::SetWholeExtent\n");



void
vtkImageMandelbrotSource::Zoom(factor)
		double 	factor
		CODE:
		THIS->Zoom(factor);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageMapper PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageMapper::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkImageMapper::GetColorLevel()
		CODE:
		RETVAL = THIS->GetColorLevel();
		OUTPUT:
		RETVAL


float
vtkImageMapper::GetColorScale()
		CODE:
		RETVAL = THIS->GetColorScale();
		OUTPUT:
		RETVAL


float
vtkImageMapper::GetColorShift()
		CODE:
		RETVAL = THIS->GetColorShift();
		OUTPUT:
		RETVAL


float
vtkImageMapper::GetColorWindow()
		CODE:
		RETVAL = THIS->GetColorWindow();
		OUTPUT:
		RETVAL


int  *
vtkImageMapper::GetCustomDisplayExtents()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetCustomDisplayExtents();
		EXTEND(SP, 4);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));


vtkImageData *
vtkImageMapper::GetInput()
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


unsigned long
vtkImageMapper::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


int
vtkImageMapper::GetRenderToRectangle()
		CODE:
		RETVAL = THIS->GetRenderToRectangle();
		OUTPUT:
		RETVAL


int
vtkImageMapper::GetUseCustomExtents()
		CODE:
		RETVAL = THIS->GetUseCustomExtents();
		OUTPUT:
		RETVAL


int
vtkImageMapper::GetWholeZMax()
		CODE:
		RETVAL = THIS->GetWholeZMax();
		OUTPUT:
		RETVAL


int
vtkImageMapper::GetWholeZMin()
		CODE:
		RETVAL = THIS->GetWholeZMin();
		OUTPUT:
		RETVAL


int
vtkImageMapper::GetZSlice()
		CODE:
		RETVAL = THIS->GetZSlice();
		OUTPUT:
		RETVAL


static vtkImageMapper*
vtkImageMapper::New()
		CODE:
		RETVAL = vtkImageMapper::New();
		OUTPUT:
		RETVAL


void
vtkImageMapper::RenderData(arg1, arg2, arg3)
		vtkViewport *	arg1
		vtkImageData *	arg2
		vtkActor2D *	arg3
		CODE:
		THIS->RenderData(arg1, arg2, arg3);
		XSRETURN_EMPTY;


void
vtkImageMapper::RenderStart(viewport, actor)
		vtkViewport *	viewport
		vtkActor2D *	actor
		CODE:
		THIS->RenderStart(viewport, actor);
		XSRETURN_EMPTY;


void
vtkImageMapper::RenderToRectangleOff()
		CODE:
		THIS->RenderToRectangleOff();
		XSRETURN_EMPTY;


void
vtkImageMapper::RenderToRectangleOn()
		CODE:
		THIS->RenderToRectangleOn();
		XSRETURN_EMPTY;


void
vtkImageMapper::SetColorLevel(arg1)
		float 	arg1
		CODE:
		THIS->SetColorLevel(arg1);
		XSRETURN_EMPTY;


void
vtkImageMapper::SetColorWindow(arg1)
		float 	arg1
		CODE:
		THIS->SetColorWindow(arg1);
		XSRETURN_EMPTY;


void
vtkImageMapper::SetCustomDisplayExtents(arg1_0, arg1_1, arg1_2, arg1_3)
		int	arg1_0
		int	arg1_1
		int	arg1_2
		int	arg1_3
		CODE:
		int arg1[] = { arg1_0, arg1_1, arg1_2, arg1_3};
		THIS->SetCustomDisplayExtents(arg1);
		XSRETURN_EMPTY;


void
vtkImageMapper::SetInput(arg1)
		vtkImageData *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;


void
vtkImageMapper::SetUseCustomExtents(arg1)
		int 	arg1
		CODE:
		THIS->SetUseCustomExtents(arg1);
		XSRETURN_EMPTY;


void
vtkImageMapper::SetZSlice(arg1)
		int 	arg1
		CODE:
		THIS->SetZSlice(arg1);
		XSRETURN_EMPTY;


void
vtkImageMapper::UseCustomExtentsOff()
		CODE:
		THIS->UseCustomExtentsOff();
		XSRETURN_EMPTY;


void
vtkImageMapper::UseCustomExtentsOn()
		CODE:
		THIS->UseCustomExtentsOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageMapToColors PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageMapToColors::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkScalarsToColors *
vtkImageMapToColors::GetLookupTable()
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
vtkImageMapToColors::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


int
vtkImageMapToColors::GetOutputFormat()
		CODE:
		RETVAL = THIS->GetOutputFormat();
		OUTPUT:
		RETVAL


static vtkImageMapToColors*
vtkImageMapToColors::New()
		CODE:
		RETVAL = vtkImageMapToColors::New();
		OUTPUT:
		RETVAL


void
vtkImageMapToColors::SetLookupTable(arg1)
		vtkScalarsToColors *	arg1
		CODE:
		THIS->SetLookupTable(arg1);
		XSRETURN_EMPTY;


void
vtkImageMapToColors::SetOutputFormat(arg1)
		int 	arg1
		CODE:
		THIS->SetOutputFormat(arg1);
		XSRETURN_EMPTY;


void
vtkImageMapToColors::SetOutputFormatToLuminance()
		CODE:
		THIS->SetOutputFormatToLuminance();
		XSRETURN_EMPTY;


void
vtkImageMapToColors::SetOutputFormatToLuminanceAlpha()
		CODE:
		THIS->SetOutputFormatToLuminanceAlpha();
		XSRETURN_EMPTY;


void
vtkImageMapToColors::SetOutputFormatToRGB()
		CODE:
		THIS->SetOutputFormatToRGB();
		XSRETURN_EMPTY;


void
vtkImageMapToColors::SetOutputFormatToRGBA()
		CODE:
		THIS->SetOutputFormatToRGBA();
		XSRETURN_EMPTY;


void
vtkImageMapToColors::UpdateData(output)
		vtkDataObject *	output
		CODE:
		THIS->UpdateData(output);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageMapToRGBA PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageMapToRGBA::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageMapToRGBA*
vtkImageMapToRGBA::New()
		CODE:
		RETVAL = vtkImageMapToRGBA::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageMapToWindowLevelColors PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageMapToWindowLevelColors::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkImageMapToWindowLevelColors::GetLevel()
		CODE:
		RETVAL = THIS->GetLevel();
		OUTPUT:
		RETVAL


float
vtkImageMapToWindowLevelColors::GetWindow()
		CODE:
		RETVAL = THIS->GetWindow();
		OUTPUT:
		RETVAL


static vtkImageMapToWindowLevelColors*
vtkImageMapToWindowLevelColors::New()
		CODE:
		RETVAL = vtkImageMapToWindowLevelColors::New();
		OUTPUT:
		RETVAL


void
vtkImageMapToWindowLevelColors::SetLevel(arg1)
		float 	arg1
		CODE:
		THIS->SetLevel(arg1);
		XSRETURN_EMPTY;


void
vtkImageMapToWindowLevelColors::SetWindow(arg1)
		float 	arg1
		CODE:
		THIS->SetWindow(arg1);
		XSRETURN_EMPTY;


void
vtkImageMapToWindowLevelColors::UpdateData(output)
		vtkDataObject *	output
		CODE:
		THIS->UpdateData(output);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageMask PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageMask::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageMask::GetMaskedOutputValueLength()
		CODE:
		RETVAL = THIS->GetMaskedOutputValueLength();
		OUTPUT:
		RETVAL


int
vtkImageMask::GetNotMask()
		CODE:
		RETVAL = THIS->GetNotMask();
		OUTPUT:
		RETVAL


static vtkImageMask*
vtkImageMask::New()
		CODE:
		RETVAL = vtkImageMask::New();
		OUTPUT:
		RETVAL


void
vtkImageMask::NotMaskOff()
		CODE:
		THIS->NotMaskOff();
		XSRETURN_EMPTY;


void
vtkImageMask::NotMaskOn()
		CODE:
		THIS->NotMaskOn();
		XSRETURN_EMPTY;


void
vtkImageMask::SetImageInput(in)
		vtkImageData *	in
		CODE:
		THIS->SetImageInput(in);
		XSRETURN_EMPTY;


void
vtkImageMask::SetMaskInput(in)
		vtkImageData *	in
		CODE:
		THIS->SetMaskInput(in);
		XSRETURN_EMPTY;


void
vtkImageMask::SetMaskedOutputValue(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetMaskedOutputValue(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 3
		float 	arg1
		float 	arg2
		CODE:
		THIS->SetMaskedOutputValue(arg1, arg2);
		XSRETURN_EMPTY;
	CASE: items == 2
		float 	arg1
		CODE:
		THIS->SetMaskedOutputValue(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageMask::SetMaskedOutputValue\n");



void
vtkImageMask::SetNotMask(arg1)
		int 	arg1
		CODE:
		THIS->SetNotMask(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageMaskBits PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageMaskBits::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


unsigned int  *
vtkImageMaskBits::GetMasks()
		PREINIT:
		unsigned int  * retval;
		PPCODE:
		retval = THIS->GetMasks();
		EXTEND(SP, 4);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));


int
vtkImageMaskBits::GetOperation()
		CODE:
		RETVAL = THIS->GetOperation();
		OUTPUT:
		RETVAL


static vtkImageMaskBits*
vtkImageMaskBits::New()
		CODE:
		RETVAL = vtkImageMaskBits::New();
		OUTPUT:
		RETVAL


void
vtkImageMaskBits::SetMask(mask)
		unsigned int 	mask
		CODE:
		THIS->SetMask(mask);
		XSRETURN_EMPTY;


void
vtkImageMaskBits::SetMasks(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0)
	CASE: items == 5
		unsigned int  	arg1
		unsigned int 	arg2
		unsigned int 	arg3
		unsigned int 	arg4
		CODE:
		THIS->SetMasks(arg1, arg2, arg3, arg4);
		XSRETURN_EMPTY;
	CASE: items == 4
		unsigned int 	arg1
		unsigned int 	arg2
		unsigned int 	arg3
		CODE:
		THIS->SetMasks(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 3
		unsigned int 	arg1
		unsigned int 	arg2
		CODE:
		THIS->SetMasks(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageMaskBits::SetMasks\n");



void
vtkImageMaskBits::SetOperation(arg1)
		int 	arg1
		CODE:
		THIS->SetOperation(arg1);
		XSRETURN_EMPTY;


void
vtkImageMaskBits::SetOperationToAnd()
		CODE:
		THIS->SetOperationToAnd();
		XSRETURN_EMPTY;


void
vtkImageMaskBits::SetOperationToNand()
		CODE:
		THIS->SetOperationToNand();
		XSRETURN_EMPTY;


void
vtkImageMaskBits::SetOperationToNor()
		CODE:
		THIS->SetOperationToNor();
		XSRETURN_EMPTY;


void
vtkImageMaskBits::SetOperationToOr()
		CODE:
		THIS->SetOperationToOr();
		XSRETURN_EMPTY;


void
vtkImageMaskBits::SetOperationToXor()
		CODE:
		THIS->SetOperationToXor();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageMathematics PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageMathematics::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


double
vtkImageMathematics::GetConstantC()
		CODE:
		RETVAL = THIS->GetConstantC();
		OUTPUT:
		RETVAL


double
vtkImageMathematics::GetConstantK()
		CODE:
		RETVAL = THIS->GetConstantK();
		OUTPUT:
		RETVAL


int
vtkImageMathematics::GetOperation()
		CODE:
		RETVAL = THIS->GetOperation();
		OUTPUT:
		RETVAL


static vtkImageMathematics*
vtkImageMathematics::New()
		CODE:
		RETVAL = vtkImageMathematics::New();
		OUTPUT:
		RETVAL


void
vtkImageMathematics::SetConstantC(arg1)
		double 	arg1
		CODE:
		THIS->SetConstantC(arg1);
		XSRETURN_EMPTY;


void
vtkImageMathematics::SetConstantK(arg1)
		double 	arg1
		CODE:
		THIS->SetConstantK(arg1);
		XSRETURN_EMPTY;


void
vtkImageMathematics::SetOperation(arg1)
		int 	arg1
		CODE:
		THIS->SetOperation(arg1);
		XSRETURN_EMPTY;


void
vtkImageMathematics::SetOperationToATAN()
		CODE:
		THIS->SetOperationToATAN();
		XSRETURN_EMPTY;


void
vtkImageMathematics::SetOperationToATAN2()
		CODE:
		THIS->SetOperationToATAN2();
		XSRETURN_EMPTY;


void
vtkImageMathematics::SetOperationToAbsoluteValue()
		CODE:
		THIS->SetOperationToAbsoluteValue();
		XSRETURN_EMPTY;


void
vtkImageMathematics::SetOperationToAdd()
		CODE:
		THIS->SetOperationToAdd();
		XSRETURN_EMPTY;


void
vtkImageMathematics::SetOperationToAddConstant()
		CODE:
		THIS->SetOperationToAddConstant();
		XSRETURN_EMPTY;


void
vtkImageMathematics::SetOperationToComplexMultiply()
		CODE:
		THIS->SetOperationToComplexMultiply();
		XSRETURN_EMPTY;


void
vtkImageMathematics::SetOperationToConjugate()
		CODE:
		THIS->SetOperationToConjugate();
		XSRETURN_EMPTY;


void
vtkImageMathematics::SetOperationToCos()
		CODE:
		THIS->SetOperationToCos();
		XSRETURN_EMPTY;


void
vtkImageMathematics::SetOperationToDivide()
		CODE:
		THIS->SetOperationToDivide();
		XSRETURN_EMPTY;


void
vtkImageMathematics::SetOperationToExp()
		CODE:
		THIS->SetOperationToExp();
		XSRETURN_EMPTY;


void
vtkImageMathematics::SetOperationToInvert()
		CODE:
		THIS->SetOperationToInvert();
		XSRETURN_EMPTY;


void
vtkImageMathematics::SetOperationToLog()
		CODE:
		THIS->SetOperationToLog();
		XSRETURN_EMPTY;


void
vtkImageMathematics::SetOperationToMax()
		CODE:
		THIS->SetOperationToMax();
		XSRETURN_EMPTY;


void
vtkImageMathematics::SetOperationToMin()
		CODE:
		THIS->SetOperationToMin();
		XSRETURN_EMPTY;


void
vtkImageMathematics::SetOperationToMultiply()
		CODE:
		THIS->SetOperationToMultiply();
		XSRETURN_EMPTY;


void
vtkImageMathematics::SetOperationToMultiplyByK()
		CODE:
		THIS->SetOperationToMultiplyByK();
		XSRETURN_EMPTY;


void
vtkImageMathematics::SetOperationToReplaceCByK()
		CODE:
		THIS->SetOperationToReplaceCByK();
		XSRETURN_EMPTY;


void
vtkImageMathematics::SetOperationToSin()
		CODE:
		THIS->SetOperationToSin();
		XSRETURN_EMPTY;


void
vtkImageMathematics::SetOperationToSquare()
		CODE:
		THIS->SetOperationToSquare();
		XSRETURN_EMPTY;


void
vtkImageMathematics::SetOperationToSquareRoot()
		CODE:
		THIS->SetOperationToSquareRoot();
		XSRETURN_EMPTY;


void
vtkImageMathematics::SetOperationToSubtract()
		CODE:
		THIS->SetOperationToSubtract();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageMedian3D PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageMedian3D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageMedian3D::GetNumberOfElements()
		CODE:
		RETVAL = THIS->GetNumberOfElements();
		OUTPUT:
		RETVAL


static vtkImageMedian3D*
vtkImageMedian3D::New()
		CODE:
		RETVAL = vtkImageMedian3D::New();
		OUTPUT:
		RETVAL


void
vtkImageMedian3D::SetKernelSize(size0, size1, size2)
		int 	size0
		int 	size1
		int 	size2
		CODE:
		THIS->SetKernelSize(size0, size1, size2);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageMirrorPad PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageMirrorPad::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageMirrorPad*
vtkImageMirrorPad::New()
		CODE:
		RETVAL = vtkImageMirrorPad::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageNoiseSource PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageNoiseSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkImageNoiseSource::GetMaximum()
		CODE:
		RETVAL = THIS->GetMaximum();
		OUTPUT:
		RETVAL


float
vtkImageNoiseSource::GetMinimum()
		CODE:
		RETVAL = THIS->GetMinimum();
		OUTPUT:
		RETVAL


static vtkImageNoiseSource*
vtkImageNoiseSource::New()
		CODE:
		RETVAL = vtkImageNoiseSource::New();
		OUTPUT:
		RETVAL


void
vtkImageNoiseSource::SetMaximum(arg1)
		float 	arg1
		CODE:
		THIS->SetMaximum(arg1);
		XSRETURN_EMPTY;


void
vtkImageNoiseSource::SetMinimum(arg1)
		float 	arg1
		CODE:
		THIS->SetMinimum(arg1);
		XSRETURN_EMPTY;


void
vtkImageNoiseSource::SetWholeExtent(xMinx, xMax, yMin, yMax, zMin, zMax)
		int 	xMinx
		int 	xMax
		int 	yMin
		int 	yMax
		int 	zMin
		int 	zMax
		CODE:
		THIS->SetWholeExtent(xMinx, xMax, yMin, yMax, zMin, zMax);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageNonMaximumSuppression PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageNonMaximumSuppression::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageNonMaximumSuppression::GetDimensionality()
		CODE:
		RETVAL = THIS->GetDimensionality();
		OUTPUT:
		RETVAL


int
vtkImageNonMaximumSuppression::GetHandleBoundaries()
		CODE:
		RETVAL = THIS->GetHandleBoundaries();
		OUTPUT:
		RETVAL


void
vtkImageNonMaximumSuppression::HandleBoundariesOff()
		CODE:
		THIS->HandleBoundariesOff();
		XSRETURN_EMPTY;


void
vtkImageNonMaximumSuppression::HandleBoundariesOn()
		CODE:
		THIS->HandleBoundariesOn();
		XSRETURN_EMPTY;


static vtkImageNonMaximumSuppression*
vtkImageNonMaximumSuppression::New()
		CODE:
		RETVAL = vtkImageNonMaximumSuppression::New();
		OUTPUT:
		RETVAL


void
vtkImageNonMaximumSuppression::SetDimensionality(arg1)
		int 	arg1
		CODE:
		THIS->SetDimensionality(arg1);
		XSRETURN_EMPTY;


void
vtkImageNonMaximumSuppression::SetHandleBoundaries(arg1)
		int 	arg1
		CODE:
		THIS->SetHandleBoundaries(arg1);
		XSRETURN_EMPTY;


void
vtkImageNonMaximumSuppression::SetMagnitudeInput(input)
		vtkImageData *	input
		CODE:
		THIS->SetMagnitudeInput(input);
		XSRETURN_EMPTY;


void
vtkImageNonMaximumSuppression::SetVectorInput(input)
		vtkImageData *	input
		CODE:
		THIS->SetVectorInput(input);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageNormalize PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageNormalize::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageNormalize*
vtkImageNormalize::New()
		CODE:
		RETVAL = vtkImageNormalize::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageOpenClose3D PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImageOpenClose3D::DebugOff()
		CODE:
		THIS->DebugOff();
		XSRETURN_EMPTY;


void
vtkImageOpenClose3D::DebugOn()
		CODE:
		THIS->DebugOn();
		XSRETURN_EMPTY;


const char *
vtkImageOpenClose3D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkImageOpenClose3D::GetCloseValue()
		CODE:
		RETVAL = THIS->GetCloseValue();
		OUTPUT:
		RETVAL


vtkImageDilateErode3D *
vtkImageOpenClose3D::GetFilter0()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImageDilateErode3D";
		CODE:
		RETVAL = THIS->GetFilter0();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkImageDilateErode3D *
vtkImageOpenClose3D::GetFilter1()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImageDilateErode3D";
		CODE:
		RETVAL = THIS->GetFilter1();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


unsigned long
vtkImageOpenClose3D::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


float
vtkImageOpenClose3D::GetOpenValue()
		CODE:
		RETVAL = THIS->GetOpenValue();
		OUTPUT:
		RETVAL


vtkImageData *
vtkImageOpenClose3D::GetOutput(arg1 = 0)
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
		croak("Unsupported number of args and/or types supplied to vtkImageOpenClose3D::GetOutput\n");



void
vtkImageOpenClose3D::Modified()
		CODE:
		THIS->Modified();
		XSRETURN_EMPTY;


static vtkImageOpenClose3D*
vtkImageOpenClose3D::New()
		CODE:
		RETVAL = vtkImageOpenClose3D::New();
		OUTPUT:
		RETVAL


void
vtkImageOpenClose3D::SetCloseValue(value)
		float 	value
		CODE:
		THIS->SetCloseValue(value);
		XSRETURN_EMPTY;


void
vtkImageOpenClose3D::SetInput(Input)
		vtkImageData *	Input
		CODE:
		THIS->SetInput(Input);
		XSRETURN_EMPTY;


void
vtkImageOpenClose3D::SetKernelSize(size0, size1, size2)
		int 	size0
		int 	size1
		int 	size2
		CODE:
		THIS->SetKernelSize(size0, size1, size2);
		XSRETURN_EMPTY;


void
vtkImageOpenClose3D::SetOpenValue(value)
		float 	value
		CODE:
		THIS->SetOpenValue(value);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImagePermute PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImagePermute::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int  *
vtkImagePermute::GetFilteredAxes()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetFilteredAxes();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


static vtkImagePermute*
vtkImagePermute::New()
		CODE:
		RETVAL = vtkImagePermute::New();
		OUTPUT:
		RETVAL


void
vtkImagePermute::SetFilteredAxes(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int  	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetFilteredAxes(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImagePermute::SetFilteredAxes\n");


MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageQuantizeRGBToIndex PREFIX = vtk

PROTOTYPES: DISABLE



float
vtkImageQuantizeRGBToIndex::GetBuildTreeExecuteTime()
		CODE:
		RETVAL = THIS->GetBuildTreeExecuteTime();
		OUTPUT:
		RETVAL


const char *
vtkImageQuantizeRGBToIndex::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkImageQuantizeRGBToIndex::GetInitializeExecuteTime()
		CODE:
		RETVAL = THIS->GetInitializeExecuteTime();
		OUTPUT:
		RETVAL


float
vtkImageQuantizeRGBToIndex::GetLookupIndexExecuteTime()
		CODE:
		RETVAL = THIS->GetLookupIndexExecuteTime();
		OUTPUT:
		RETVAL


vtkLookupTable *
vtkImageQuantizeRGBToIndex::GetLookupTable()
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
vtkImageQuantizeRGBToIndex::GetNumberOfColors()
		CODE:
		RETVAL = THIS->GetNumberOfColors();
		OUTPUT:
		RETVAL


static vtkImageQuantizeRGBToIndex*
vtkImageQuantizeRGBToIndex::New()
		CODE:
		RETVAL = vtkImageQuantizeRGBToIndex::New();
		OUTPUT:
		RETVAL


void
vtkImageQuantizeRGBToIndex::SetNumberOfColors(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfColors(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::Imager PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImager::Erase()
		CODE:
		THIS->Erase();
		XSRETURN_EMPTY;


const char *
vtkImager::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkImageWindow *
vtkImager::GetImageWindow()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImageWindow";
		CODE:
		RETVAL = THIS->GetImageWindow();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


float
vtkImager::GetPickedZ()
		CODE:
		RETVAL = THIS->GetPickedZ();
		OUTPUT:
		RETVAL


vtkWindow *
vtkImager::GetVTKWindow()
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


static vtkImager*
vtkImager::New()
		CODE:
		RETVAL = vtkImager::New();
		OUTPUT:
		RETVAL


vtkAssemblyPath *
vtkImager::PickProp(selectionX, selectionY)
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


int
vtkImager::RenderOpaqueGeometry()
		CODE:
		RETVAL = THIS->RenderOpaqueGeometry();
		OUTPUT:
		RETVAL


int
vtkImager::RenderOverlay()
		CODE:
		RETVAL = THIS->RenderOverlay();
		OUTPUT:
		RETVAL


int
vtkImager::RenderTranslucentGeometry()
		CODE:
		RETVAL = THIS->RenderTranslucentGeometry();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImagerCollection PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImagerCollection::AddItem(arg1 = 0)
	CASE: items == 2
		vtkImager *	arg1
		CODE:
		THIS->AddItem(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImagerCollection::AddItem\n");



const char *
vtkImagerCollection::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkImager *
vtkImagerCollection::GetLastItem()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImager";
		CODE:
		RETVAL = THIS->GetLastItem();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkImager *
vtkImagerCollection::GetNextItem()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImager";
		CODE:
		RETVAL = THIS->GetNextItem();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkImagerCollection*
vtkImagerCollection::New()
		CODE:
		RETVAL = vtkImagerCollection::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageReader PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImageReader::ComputeInternalFileName(slice)
		int 	slice
		CODE:
		THIS->ComputeInternalFileName(slice);
		XSRETURN_EMPTY;


void
vtkImageReader::FileLowerLeftOff()
		CODE:
		THIS->FileLowerLeftOff();
		XSRETURN_EMPTY;


void
vtkImageReader::FileLowerLeftOn()
		CODE:
		THIS->FileLowerLeftOn();
		XSRETURN_EMPTY;


const char *
vtkImageReader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageReader::GetDataByteOrder()
		CODE:
		RETVAL = THIS->GetDataByteOrder();
		OUTPUT:
		RETVAL


const char *
vtkImageReader::GetDataByteOrderAsString()
		CODE:
		RETVAL = THIS->GetDataByteOrderAsString();
		OUTPUT:
		RETVAL


int  *
vtkImageReader::GetDataExtent()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetDataExtent();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


unsigned short
vtkImageReader::GetDataMask()
		CODE:
		RETVAL = THIS->GetDataMask();
		OUTPUT:
		RETVAL


float  *
vtkImageReader::GetDataOrigin()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetDataOrigin();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int
vtkImageReader::GetDataScalarType()
		CODE:
		RETVAL = THIS->GetDataScalarType();
		OUTPUT:
		RETVAL


float  *
vtkImageReader::GetDataSpacing()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetDataSpacing();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int  *
vtkImageReader::GetDataVOI()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetDataVOI();
		EXTEND(SP, 6);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));
		PUSHs(sv_2mortal(newSVnv(retval[3])));
		PUSHs(sv_2mortal(newSVnv(retval[4])));
		PUSHs(sv_2mortal(newSVnv(retval[5])));


int
vtkImageReader::GetFileDimensionality()
		CODE:
		RETVAL = THIS->GetFileDimensionality();
		OUTPUT:
		RETVAL


int
vtkImageReader::GetFileLowerLeft()
		CODE:
		RETVAL = THIS->GetFileLowerLeft();
		OUTPUT:
		RETVAL


char *
vtkImageReader::GetFileName()
		CODE:
		RETVAL = THIS->GetFileName();
		OUTPUT:
		RETVAL


char *
vtkImageReader::GetFilePattern()
		CODE:
		RETVAL = THIS->GetFilePattern();
		OUTPUT:
		RETVAL


char *
vtkImageReader::GetFilePrefix()
		CODE:
		RETVAL = THIS->GetFilePrefix();
		OUTPUT:
		RETVAL


int
vtkImageReader::GetHeaderSize(arg1 = 0)
	CASE: items == 2
		int 	arg1
		CODE:
		RETVAL = THIS->GetHeaderSize(arg1);
		OUTPUT:
		RETVAL
	CASE: items == 1
		CODE:
		RETVAL = THIS->GetHeaderSize();
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageReader::GetHeaderSize\n");



char *
vtkImageReader::GetInternalFileName()
		CODE:
		RETVAL = THIS->GetInternalFileName();
		OUTPUT:
		RETVAL


int
vtkImageReader::GetNumberOfScalarComponents()
		CODE:
		RETVAL = THIS->GetNumberOfScalarComponents();
		OUTPUT:
		RETVAL


int
vtkImageReader::GetSwapBytes()
		CODE:
		RETVAL = THIS->GetSwapBytes();
		OUTPUT:
		RETVAL


vtkTransform *
vtkImageReader::GetTransform()
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


static vtkImageReader*
vtkImageReader::New()
		CODE:
		RETVAL = vtkImageReader::New();
		OUTPUT:
		RETVAL


void
vtkImageReader::OpenFile()
		CODE:
		THIS->OpenFile();
		XSRETURN_EMPTY;


void
vtkImageReader::SetDataByteOrder(arg1)
		int 	arg1
		CODE:
		THIS->SetDataByteOrder(arg1);
		XSRETURN_EMPTY;


void
vtkImageReader::SetDataByteOrderToBigEndian()
		CODE:
		THIS->SetDataByteOrderToBigEndian();
		XSRETURN_EMPTY;


void
vtkImageReader::SetDataByteOrderToLittleEndian()
		CODE:
		THIS->SetDataByteOrderToLittleEndian();
		XSRETURN_EMPTY;


void
vtkImageReader::SetDataExtent(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int  	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetDataExtent(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageReader::SetDataExtent\n");



void
vtkImageReader::SetDataMask(val)
		int 	val
		CODE:
		THIS->SetDataMask(val);
		XSRETURN_EMPTY;


void
vtkImageReader::SetDataOrigin(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetDataOrigin(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageReader::SetDataOrigin\n");



void
vtkImageReader::SetDataScalarType(type)
		int 	type
		CODE:
		THIS->SetDataScalarType(type);
		XSRETURN_EMPTY;


void
vtkImageReader::SetDataScalarTypeToDouble()
		CODE:
		THIS->SetDataScalarTypeToDouble();
		XSRETURN_EMPTY;


void
vtkImageReader::SetDataScalarTypeToFloat()
		CODE:
		THIS->SetDataScalarTypeToFloat();
		XSRETURN_EMPTY;


void
vtkImageReader::SetDataScalarTypeToInt()
		CODE:
		THIS->SetDataScalarTypeToInt();
		XSRETURN_EMPTY;


void
vtkImageReader::SetDataScalarTypeToShort()
		CODE:
		THIS->SetDataScalarTypeToShort();
		XSRETURN_EMPTY;


void
vtkImageReader::SetDataScalarTypeToUnsignedChar()
		CODE:
		THIS->SetDataScalarTypeToUnsignedChar();
		XSRETURN_EMPTY;


void
vtkImageReader::SetDataScalarTypeToUnsignedShort()
		CODE:
		THIS->SetDataScalarTypeToUnsignedShort();
		XSRETURN_EMPTY;


void
vtkImageReader::SetDataSpacing(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float  	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetDataSpacing(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageReader::SetDataSpacing\n");



void
vtkImageReader::SetDataVOI(arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 0, arg6 = 0)
	CASE: items == 7
		int  	arg1
		int 	arg2
		int 	arg3
		int 	arg4
		int 	arg5
		int 	arg6
		CODE:
		THIS->SetDataVOI(arg1, arg2, arg3, arg4, arg5, arg6);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageReader::SetDataVOI\n");



void
vtkImageReader::SetFileDimensionality(arg1)
		int 	arg1
		CODE:
		THIS->SetFileDimensionality(arg1);
		XSRETURN_EMPTY;


void
vtkImageReader::SetFileLowerLeft(arg1)
		int 	arg1
		CODE:
		THIS->SetFileLowerLeft(arg1);
		XSRETURN_EMPTY;


void
vtkImageReader::SetFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetFileName(arg1);
		XSRETURN_EMPTY;


void
vtkImageReader::SetFilePattern(arg1)
		char *	arg1
		CODE:
		THIS->SetFilePattern(arg1);
		XSRETURN_EMPTY;


void
vtkImageReader::SetFilePrefix(arg1)
		char *	arg1
		CODE:
		THIS->SetFilePrefix(arg1);
		XSRETURN_EMPTY;


void
vtkImageReader::SetHeaderSize(size)
		int 	size
		CODE:
		THIS->SetHeaderSize(size);
		XSRETURN_EMPTY;


void
vtkImageReader::SetNumberOfScalarComponents(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfScalarComponents(arg1);
		XSRETURN_EMPTY;


void
vtkImageReader::SetSwapBytes(arg1)
		int 	arg1
		CODE:
		THIS->SetSwapBytes(arg1);
		XSRETURN_EMPTY;


void
vtkImageReader::SetTransform(arg1)
		vtkTransform *	arg1
		CODE:
		THIS->SetTransform(arg1);
		XSRETURN_EMPTY;


void
vtkImageReader::SwapBytesOff()
		CODE:
		THIS->SwapBytesOff();
		XSRETURN_EMPTY;


void
vtkImageReader::SwapBytesOn()
		CODE:
		THIS->SwapBytesOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageResample PREFIX = vtk

PROTOTYPES: DISABLE



float
vtkImageResample::GetAxisMagnificationFactor(axis)
		int 	axis
		CODE:
		RETVAL = THIS->GetAxisMagnificationFactor(axis);
		OUTPUT:
		RETVAL


const char *
vtkImageResample::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageResample::GetDimensionality()
		CODE:
		RETVAL = THIS->GetDimensionality();
		OUTPUT:
		RETVAL


int
vtkImageResample::GetInterpolate()
		CODE:
		RETVAL = THIS->GetInterpolate();
		OUTPUT:
		RETVAL


void
vtkImageResample::InterpolateOff()
		CODE:
		THIS->InterpolateOff();
		XSRETURN_EMPTY;


void
vtkImageResample::InterpolateOn()
		CODE:
		THIS->InterpolateOn();
		XSRETURN_EMPTY;


static vtkImageResample*
vtkImageResample::New()
		CODE:
		RETVAL = vtkImageResample::New();
		OUTPUT:
		RETVAL


void
vtkImageResample::SetAxisMagnificationFactor(axis, factor)
		int 	axis
		float 	factor
		CODE:
		THIS->SetAxisMagnificationFactor(axis, factor);
		XSRETURN_EMPTY;


void
vtkImageResample::SetAxisOutputSpacing(axis, spacing)
		int 	axis
		float 	spacing
		CODE:
		THIS->SetAxisOutputSpacing(axis, spacing);
		XSRETURN_EMPTY;


void
vtkImageResample::SetDimensionality(arg1)
		int 	arg1
		CODE:
		THIS->SetDimensionality(arg1);
		XSRETURN_EMPTY;


void
vtkImageResample::SetInterpolate(arg1)
		int 	arg1
		CODE:
		THIS->SetInterpolate(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageRFFT PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageRFFT::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageRFFT*
vtkImageRFFT::New()
		CODE:
		RETVAL = vtkImageRFFT::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageRGBToHSV PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageRGBToHSV::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkImageRGBToHSV::GetMaximum()
		CODE:
		RETVAL = THIS->GetMaximum();
		OUTPUT:
		RETVAL


static vtkImageRGBToHSV*
vtkImageRGBToHSV::New()
		CODE:
		RETVAL = vtkImageRGBToHSV::New();
		OUTPUT:
		RETVAL


void
vtkImageRGBToHSV::SetMaximum(arg1)
		float 	arg1
		CODE:
		THIS->SetMaximum(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageRange3D PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageRange3D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageRange3D*
vtkImageRange3D::New()
		CODE:
		RETVAL = vtkImageRange3D::New();
		OUTPUT:
		RETVAL


void
vtkImageRange3D::SetKernelSize(size0, size1, size2)
		int 	size0
		int 	size1
		int 	size2
		CODE:
		THIS->SetKernelSize(size0, size1, size2);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageSeedConnectivity PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImageSeedConnectivity::AddSeed(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int 	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->AddSeed(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE: items == 3
		int 	arg1
		int 	arg2
		CODE:
		THIS->AddSeed(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageSeedConnectivity::AddSeed\n");



const char *
vtkImageSeedConnectivity::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkImageConnector *
vtkImageSeedConnectivity::GetConnector()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImageConnector";
		CODE:
		RETVAL = THIS->GetConnector();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


int
vtkImageSeedConnectivity::GetDimensionality()
		CODE:
		RETVAL = THIS->GetDimensionality();
		OUTPUT:
		RETVAL


int
vtkImageSeedConnectivity::GetInputConnectValue()
		CODE:
		RETVAL = THIS->GetInputConnectValue();
		OUTPUT:
		RETVAL


int
vtkImageSeedConnectivity::GetOutputConnectedValue()
		CODE:
		RETVAL = THIS->GetOutputConnectedValue();
		OUTPUT:
		RETVAL


int
vtkImageSeedConnectivity::GetOutputUnconnectedValue()
		CODE:
		RETVAL = THIS->GetOutputUnconnectedValue();
		OUTPUT:
		RETVAL


static vtkImageSeedConnectivity*
vtkImageSeedConnectivity::New()
		CODE:
		RETVAL = vtkImageSeedConnectivity::New();
		OUTPUT:
		RETVAL


void
vtkImageSeedConnectivity::RemoveAllSeeds()
		CODE:
		THIS->RemoveAllSeeds();
		XSRETURN_EMPTY;


void
vtkImageSeedConnectivity::SetDimensionality(arg1)
		int 	arg1
		CODE:
		THIS->SetDimensionality(arg1);
		XSRETURN_EMPTY;


void
vtkImageSeedConnectivity::SetInputConnectValue(arg1)
		int 	arg1
		CODE:
		THIS->SetInputConnectValue(arg1);
		XSRETURN_EMPTY;


void
vtkImageSeedConnectivity::SetOutputConnectedValue(arg1)
		int 	arg1
		CODE:
		THIS->SetOutputConnectedValue(arg1);
		XSRETURN_EMPTY;


void
vtkImageSeedConnectivity::SetOutputUnconnectedValue(arg1)
		int 	arg1
		CODE:
		THIS->SetOutputUnconnectedValue(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageShiftScale PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImageShiftScale::ClampOverflowOff()
		CODE:
		THIS->ClampOverflowOff();
		XSRETURN_EMPTY;


void
vtkImageShiftScale::ClampOverflowOn()
		CODE:
		THIS->ClampOverflowOn();
		XSRETURN_EMPTY;


int
vtkImageShiftScale::GetClampOverflow()
		CODE:
		RETVAL = THIS->GetClampOverflow();
		OUTPUT:
		RETVAL


const char *
vtkImageShiftScale::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageShiftScale::GetOutputScalarType()
		CODE:
		RETVAL = THIS->GetOutputScalarType();
		OUTPUT:
		RETVAL


float
vtkImageShiftScale::GetScale()
		CODE:
		RETVAL = THIS->GetScale();
		OUTPUT:
		RETVAL


float
vtkImageShiftScale::GetShift()
		CODE:
		RETVAL = THIS->GetShift();
		OUTPUT:
		RETVAL


static vtkImageShiftScale*
vtkImageShiftScale::New()
		CODE:
		RETVAL = vtkImageShiftScale::New();
		OUTPUT:
		RETVAL


void
vtkImageShiftScale::SetClampOverflow(arg1)
		int 	arg1
		CODE:
		THIS->SetClampOverflow(arg1);
		XSRETURN_EMPTY;


void
vtkImageShiftScale::SetOutputScalarType(arg1)
		int 	arg1
		CODE:
		THIS->SetOutputScalarType(arg1);
		XSRETURN_EMPTY;


void
vtkImageShiftScale::SetOutputScalarTypeToChar()
		CODE:
		THIS->SetOutputScalarTypeToChar();
		XSRETURN_EMPTY;


void
vtkImageShiftScale::SetOutputScalarTypeToDouble()
		CODE:
		THIS->SetOutputScalarTypeToDouble();
		XSRETURN_EMPTY;


void
vtkImageShiftScale::SetOutputScalarTypeToFloat()
		CODE:
		THIS->SetOutputScalarTypeToFloat();
		XSRETURN_EMPTY;


void
vtkImageShiftScale::SetOutputScalarTypeToInt()
		CODE:
		THIS->SetOutputScalarTypeToInt();
		XSRETURN_EMPTY;


void
vtkImageShiftScale::SetOutputScalarTypeToLong()
		CODE:
		THIS->SetOutputScalarTypeToLong();
		XSRETURN_EMPTY;


void
vtkImageShiftScale::SetOutputScalarTypeToShort()
		CODE:
		THIS->SetOutputScalarTypeToShort();
		XSRETURN_EMPTY;


void
vtkImageShiftScale::SetOutputScalarTypeToUnsignedChar()
		CODE:
		THIS->SetOutputScalarTypeToUnsignedChar();
		XSRETURN_EMPTY;


void
vtkImageShiftScale::SetOutputScalarTypeToUnsignedInt()
		CODE:
		THIS->SetOutputScalarTypeToUnsignedInt();
		XSRETURN_EMPTY;


void
vtkImageShiftScale::SetOutputScalarTypeToUnsignedLong()
		CODE:
		THIS->SetOutputScalarTypeToUnsignedLong();
		XSRETURN_EMPTY;


void
vtkImageShiftScale::SetOutputScalarTypeToUnsignedShort()
		CODE:
		THIS->SetOutputScalarTypeToUnsignedShort();
		XSRETURN_EMPTY;


void
vtkImageShiftScale::SetScale(arg1)
		float 	arg1
		CODE:
		THIS->SetScale(arg1);
		XSRETURN_EMPTY;


void
vtkImageShiftScale::SetShift(arg1)
		float 	arg1
		CODE:
		THIS->SetShift(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageShrink3D PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImageShrink3D::AveragingOff()
		CODE:
		THIS->AveragingOff();
		XSRETURN_EMPTY;


void
vtkImageShrink3D::AveragingOn()
		CODE:
		THIS->AveragingOn();
		XSRETURN_EMPTY;


int
vtkImageShrink3D::GetAveraging()
		CODE:
		RETVAL = THIS->GetAveraging();
		OUTPUT:
		RETVAL


const char *
vtkImageShrink3D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageShrink3D::GetMaximum()
		CODE:
		RETVAL = THIS->GetMaximum();
		OUTPUT:
		RETVAL


int
vtkImageShrink3D::GetMean()
		CODE:
		RETVAL = THIS->GetMean();
		OUTPUT:
		RETVAL


int
vtkImageShrink3D::GetMedian()
		CODE:
		RETVAL = THIS->GetMedian();
		OUTPUT:
		RETVAL


int
vtkImageShrink3D::GetMinimum()
		CODE:
		RETVAL = THIS->GetMinimum();
		OUTPUT:
		RETVAL


int  *
vtkImageShrink3D::GetShift()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetShift();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


int  *
vtkImageShrink3D::GetShrinkFactors()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetShrinkFactors();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


void
vtkImageShrink3D::MaximumOff()
		CODE:
		THIS->MaximumOff();
		XSRETURN_EMPTY;


void
vtkImageShrink3D::MaximumOn()
		CODE:
		THIS->MaximumOn();
		XSRETURN_EMPTY;


void
vtkImageShrink3D::MeanOff()
		CODE:
		THIS->MeanOff();
		XSRETURN_EMPTY;


void
vtkImageShrink3D::MeanOn()
		CODE:
		THIS->MeanOn();
		XSRETURN_EMPTY;


void
vtkImageShrink3D::MedianOff()
		CODE:
		THIS->MedianOff();
		XSRETURN_EMPTY;


void
vtkImageShrink3D::MedianOn()
		CODE:
		THIS->MedianOn();
		XSRETURN_EMPTY;


void
vtkImageShrink3D::MinimumOff()
		CODE:
		THIS->MinimumOff();
		XSRETURN_EMPTY;


void
vtkImageShrink3D::MinimumOn()
		CODE:
		THIS->MinimumOn();
		XSRETURN_EMPTY;


static vtkImageShrink3D*
vtkImageShrink3D::New()
		CODE:
		RETVAL = vtkImageShrink3D::New();
		OUTPUT:
		RETVAL


void
vtkImageShrink3D::SetAveraging(arg1)
		int 	arg1
		CODE:
		THIS->SetAveraging(arg1);
		XSRETURN_EMPTY;


void
vtkImageShrink3D::SetMaximum(arg1)
		int 	arg1
		CODE:
		THIS->SetMaximum(arg1);
		XSRETURN_EMPTY;


void
vtkImageShrink3D::SetMean(arg1)
		int 	arg1
		CODE:
		THIS->SetMean(arg1);
		XSRETURN_EMPTY;


void
vtkImageShrink3D::SetMedian(arg1)
		int 	arg1
		CODE:
		THIS->SetMedian(arg1);
		XSRETURN_EMPTY;


void
vtkImageShrink3D::SetMinimum(arg1)
		int 	arg1
		CODE:
		THIS->SetMinimum(arg1);
		XSRETURN_EMPTY;


void
vtkImageShrink3D::SetShift(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int  	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetShift(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageShrink3D::SetShift\n");



void
vtkImageShrink3D::SetShrinkFactors(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int  	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetShrinkFactors(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageShrink3D::SetShrinkFactors\n");


MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageSinusoidSource PREFIX = vtk

PROTOTYPES: DISABLE



float
vtkImageSinusoidSource::GetAmplitude()
		CODE:
		RETVAL = THIS->GetAmplitude();
		OUTPUT:
		RETVAL


const char *
vtkImageSinusoidSource::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float  *
vtkImageSinusoidSource::GetDirection()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetDirection();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


float
vtkImageSinusoidSource::GetPeriod()
		CODE:
		RETVAL = THIS->GetPeriod();
		OUTPUT:
		RETVAL


float
vtkImageSinusoidSource::GetPhase()
		CODE:
		RETVAL = THIS->GetPhase();
		OUTPUT:
		RETVAL


static vtkImageSinusoidSource*
vtkImageSinusoidSource::New()
		CODE:
		RETVAL = vtkImageSinusoidSource::New();
		OUTPUT:
		RETVAL


void
vtkImageSinusoidSource::SetAmplitude(arg1)
		float 	arg1
		CODE:
		THIS->SetAmplitude(arg1);
		XSRETURN_EMPTY;


void
vtkImageSinusoidSource::SetDirection(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		float 	arg1
		float 	arg2
		float 	arg3
		CODE:
		THIS->SetDirection(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageSinusoidSource::SetDirection\n");



void
vtkImageSinusoidSource::SetPeriod(arg1)
		float 	arg1
		CODE:
		THIS->SetPeriod(arg1);
		XSRETURN_EMPTY;


void
vtkImageSinusoidSource::SetPhase(arg1)
		float 	arg1
		CODE:
		THIS->SetPhase(arg1);
		XSRETURN_EMPTY;


void
vtkImageSinusoidSource::SetWholeExtent(xMinx, xMax, yMin, yMax, zMin, zMax)
		int 	xMinx
		int 	xMax
		int 	yMin
		int 	yMax
		int 	zMin
		int 	zMax
		CODE:
		THIS->SetWholeExtent(xMinx, xMax, yMin, yMax, zMin, zMax);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageSkeleton2D PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageSkeleton2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageSkeleton2D::GetPrune()
		CODE:
		RETVAL = THIS->GetPrune();
		OUTPUT:
		RETVAL


static vtkImageSkeleton2D*
vtkImageSkeleton2D::New()
		CODE:
		RETVAL = vtkImageSkeleton2D::New();
		OUTPUT:
		RETVAL


void
vtkImageSkeleton2D::PruneOff()
		CODE:
		THIS->PruneOff();
		XSRETURN_EMPTY;


void
vtkImageSkeleton2D::PruneOn()
		CODE:
		THIS->PruneOn();
		XSRETURN_EMPTY;


void
vtkImageSkeleton2D::SetNumberOfIterations(num)
		int 	num
		CODE:
		THIS->SetNumberOfIterations(num);
		XSRETURN_EMPTY;


void
vtkImageSkeleton2D::SetPrune(arg1)
		int 	arg1
		CODE:
		THIS->SetPrune(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageSobel2D PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageSobel2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageSobel2D*
vtkImageSobel2D::New()
		CODE:
		RETVAL = vtkImageSobel2D::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageSobel3D PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageSobel3D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageSobel3D*
vtkImageSobel3D::New()
		CODE:
		RETVAL = vtkImageSobel3D::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageThreshold PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageThreshold::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkImageThreshold::GetInValue()
		CODE:
		RETVAL = THIS->GetInValue();
		OUTPUT:
		RETVAL


float
vtkImageThreshold::GetLowerThreshold()
		CODE:
		RETVAL = THIS->GetLowerThreshold();
		OUTPUT:
		RETVAL


float
vtkImageThreshold::GetOutValue()
		CODE:
		RETVAL = THIS->GetOutValue();
		OUTPUT:
		RETVAL


int
vtkImageThreshold::GetOutputScalarType()
		CODE:
		RETVAL = THIS->GetOutputScalarType();
		OUTPUT:
		RETVAL


int
vtkImageThreshold::GetReplaceIn()
		CODE:
		RETVAL = THIS->GetReplaceIn();
		OUTPUT:
		RETVAL


int
vtkImageThreshold::GetReplaceOut()
		CODE:
		RETVAL = THIS->GetReplaceOut();
		OUTPUT:
		RETVAL


float
vtkImageThreshold::GetUpperThreshold()
		CODE:
		RETVAL = THIS->GetUpperThreshold();
		OUTPUT:
		RETVAL


static vtkImageThreshold*
vtkImageThreshold::New()
		CODE:
		RETVAL = vtkImageThreshold::New();
		OUTPUT:
		RETVAL


void
vtkImageThreshold::ReplaceInOff()
		CODE:
		THIS->ReplaceInOff();
		XSRETURN_EMPTY;


void
vtkImageThreshold::ReplaceInOn()
		CODE:
		THIS->ReplaceInOn();
		XSRETURN_EMPTY;


void
vtkImageThreshold::ReplaceOutOff()
		CODE:
		THIS->ReplaceOutOff();
		XSRETURN_EMPTY;


void
vtkImageThreshold::ReplaceOutOn()
		CODE:
		THIS->ReplaceOutOn();
		XSRETURN_EMPTY;


void
vtkImageThreshold::SetInValue(val)
		float 	val
		CODE:
		THIS->SetInValue(val);
		XSRETURN_EMPTY;


void
vtkImageThreshold::SetOutValue(val)
		float 	val
		CODE:
		THIS->SetOutValue(val);
		XSRETURN_EMPTY;


void
vtkImageThreshold::SetOutputScalarType(arg1)
		int 	arg1
		CODE:
		THIS->SetOutputScalarType(arg1);
		XSRETURN_EMPTY;


void
vtkImageThreshold::SetOutputScalarTypeToChar()
		CODE:
		THIS->SetOutputScalarTypeToChar();
		XSRETURN_EMPTY;


void
vtkImageThreshold::SetOutputScalarTypeToDouble()
		CODE:
		THIS->SetOutputScalarTypeToDouble();
		XSRETURN_EMPTY;


void
vtkImageThreshold::SetOutputScalarTypeToFloat()
		CODE:
		THIS->SetOutputScalarTypeToFloat();
		XSRETURN_EMPTY;


void
vtkImageThreshold::SetOutputScalarTypeToInt()
		CODE:
		THIS->SetOutputScalarTypeToInt();
		XSRETURN_EMPTY;


void
vtkImageThreshold::SetOutputScalarTypeToLong()
		CODE:
		THIS->SetOutputScalarTypeToLong();
		XSRETURN_EMPTY;


void
vtkImageThreshold::SetOutputScalarTypeToShort()
		CODE:
		THIS->SetOutputScalarTypeToShort();
		XSRETURN_EMPTY;


void
vtkImageThreshold::SetOutputScalarTypeToUnsignedChar()
		CODE:
		THIS->SetOutputScalarTypeToUnsignedChar();
		XSRETURN_EMPTY;


void
vtkImageThreshold::SetOutputScalarTypeToUnsignedInt()
		CODE:
		THIS->SetOutputScalarTypeToUnsignedInt();
		XSRETURN_EMPTY;


void
vtkImageThreshold::SetOutputScalarTypeToUnsignedLong()
		CODE:
		THIS->SetOutputScalarTypeToUnsignedLong();
		XSRETURN_EMPTY;


void
vtkImageThreshold::SetOutputScalarTypeToUnsignedShort()
		CODE:
		THIS->SetOutputScalarTypeToUnsignedShort();
		XSRETURN_EMPTY;


void
vtkImageThreshold::SetReplaceIn(arg1)
		int 	arg1
		CODE:
		THIS->SetReplaceIn(arg1);
		XSRETURN_EMPTY;


void
vtkImageThreshold::SetReplaceOut(arg1)
		int 	arg1
		CODE:
		THIS->SetReplaceOut(arg1);
		XSRETURN_EMPTY;


void
vtkImageThreshold::ThresholdBetween(lower, upper)
		float 	lower
		float 	upper
		CODE:
		THIS->ThresholdBetween(lower, upper);
		XSRETURN_EMPTY;


void
vtkImageThreshold::ThresholdByLower(thresh)
		float 	thresh
		CODE:
		THIS->ThresholdByLower(thresh);
		XSRETURN_EMPTY;


void
vtkImageThreshold::ThresholdByUpper(thresh)
		float 	thresh
		CODE:
		THIS->ThresholdByUpper(thresh);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageTranslateExtent PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageTranslateExtent::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int  *
vtkImageTranslateExtent::GetTranslation()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetTranslation();
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));
		PUSHs(sv_2mortal(newSVnv(retval[2])));


static vtkImageTranslateExtent*
vtkImageTranslateExtent::New()
		CODE:
		RETVAL = vtkImageTranslateExtent::New();
		OUTPUT:
		RETVAL


void
vtkImageTranslateExtent::SetTranslation(arg1 = 0, arg2 = 0, arg3 = 0)
	CASE: items == 4
		int  	arg1
		int 	arg2
		int 	arg3
		CODE:
		THIS->SetTranslation(arg1, arg2, arg3);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageTranslateExtent::SetTranslation\n");



void
vtkImageTranslateExtent::UpdateData(data)
		vtkDataObject *	data
		CODE:
		THIS->UpdateData(data);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageVariance3D PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageVariance3D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageVariance3D*
vtkImageVariance3D::New()
		CODE:
		RETVAL = vtkImageVariance3D::New();
		OUTPUT:
		RETVAL


void
vtkImageVariance3D::SetKernelSize(size0, size1, size2)
		int 	size0
		int 	size1
		int 	size2
		CODE:
		THIS->SetKernelSize(size0, size1, size2);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageViewer PREFIX = vtk

PROTOTYPES: DISABLE



vtkActor2D *
vtkImageViewer::GetActor2D()
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


const char *
vtkImageViewer::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkImageViewer::GetColorLevel()
		CODE:
		RETVAL = THIS->GetColorLevel();
		OUTPUT:
		RETVAL


float
vtkImageViewer::GetColorWindow()
		CODE:
		RETVAL = THIS->GetColorWindow();
		OUTPUT:
		RETVAL


int
vtkImageViewer::GetGrayScaleHint()
		CODE:
		RETVAL = THIS->GetGrayScaleHint();
		OUTPUT:
		RETVAL


vtkImageMapper *
vtkImageViewer::GetImageMapper()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImageMapper";
		CODE:
		RETVAL = THIS->GetImageMapper();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkImageWindow *
vtkImageViewer::GetImageWindow()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImageWindow";
		CODE:
		RETVAL = THIS->GetImageWindow();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkImager *
vtkImageViewer::GetImager()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImager";
		CODE:
		RETVAL = THIS->GetImager();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


vtkImageData *
vtkImageViewer::GetInput()
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
vtkImageViewer::GetWholeZMax()
		CODE:
		RETVAL = THIS->GetWholeZMax();
		OUTPUT:
		RETVAL


int
vtkImageViewer::GetWholeZMin()
		CODE:
		RETVAL = THIS->GetWholeZMin();
		OUTPUT:
		RETVAL


char *
vtkImageViewer::GetWindowName()
		CODE:
		RETVAL = THIS->GetWindowName();
		OUTPUT:
		RETVAL


int
vtkImageViewer::GetZSlice()
		CODE:
		RETVAL = THIS->GetZSlice();
		OUTPUT:
		RETVAL


void
vtkImageViewer::GrayScaleHintOff()
		CODE:
		THIS->GrayScaleHintOff();
		XSRETURN_EMPTY;


void
vtkImageViewer::GrayScaleHintOn()
		CODE:
		THIS->GrayScaleHintOn();
		XSRETURN_EMPTY;


static vtkImageViewer*
vtkImageViewer::New()
		CODE:
		RETVAL = vtkImageViewer::New();
		OUTPUT:
		RETVAL


void
vtkImageViewer::Render()
		CODE:
		THIS->Render();
		XSRETURN_EMPTY;


void
vtkImageViewer::SetColorLevel(s)
		float 	s
		CODE:
		THIS->SetColorLevel(s);
		XSRETURN_EMPTY;


void
vtkImageViewer::SetColorWindow(s)
		float 	s
		CODE:
		THIS->SetColorWindow(s);
		XSRETURN_EMPTY;


void
vtkImageViewer::SetGrayScaleHint(a)
		int 	a
		CODE:
		THIS->SetGrayScaleHint(a);
		XSRETURN_EMPTY;


void
vtkImageViewer::SetInput(in)
		vtkImageData *	in
		CODE:
		THIS->SetInput(in);
		XSRETURN_EMPTY;


void
vtkImageViewer::SetPosition(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetPosition(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageViewer::SetPosition\n");



void
vtkImageViewer::SetSize(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetSize(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageViewer::SetSize\n");



void
vtkImageViewer::SetZSlice(s)
		int 	s
		CODE:
		THIS->SetZSlice(s);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageWindow PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkImageWindow::AddImager(im)
		vtkImager *	im
		CODE:
		THIS->AddImager(im);
		XSRETURN_EMPTY;


void
vtkImageWindow::ClosePPMImageFile()
		CODE:
		THIS->ClosePPMImageFile();
		XSRETURN_EMPTY;


void
vtkImageWindow::EraseWindow()
		CODE:
		THIS->EraseWindow();
		XSRETURN_EMPTY;


void
vtkImageWindow::Frame()
		CODE:
		THIS->Frame();
		XSRETURN_EMPTY;


const char *
vtkImageWindow::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


char *
vtkImageWindow::GetFileName()
		CODE:
		RETVAL = THIS->GetFileName();
		OUTPUT:
		RETVAL


void *
vtkImageWindow::GetGenericContext()
		CODE:
		RETVAL = THIS->GetGenericContext();
		OUTPUT:
		RETVAL


void *
vtkImageWindow::GetGenericDisplayId()
		CODE:
		RETVAL = THIS->GetGenericDisplayId();
		OUTPUT:
		RETVAL


void *
vtkImageWindow::GetGenericDrawable()
		CODE:
		RETVAL = THIS->GetGenericDrawable();
		OUTPUT:
		RETVAL


void *
vtkImageWindow::GetGenericParentId()
		CODE:
		RETVAL = THIS->GetGenericParentId();
		OUTPUT:
		RETVAL


void *
vtkImageWindow::GetGenericWindowId()
		CODE:
		RETVAL = THIS->GetGenericWindowId();
		OUTPUT:
		RETVAL


int
vtkImageWindow::GetGrayScaleHint()
		CODE:
		RETVAL = THIS->GetGrayScaleHint();
		OUTPUT:
		RETVAL


vtkImagerCollection *
vtkImageWindow::GetImagers()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkImagerCollection";
		CODE:
		RETVAL = THIS->GetImagers();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkImageWindow::GrayScaleHintOff()
		CODE:
		THIS->GrayScaleHintOff();
		XSRETURN_EMPTY;


void
vtkImageWindow::GrayScaleHintOn()
		CODE:
		THIS->GrayScaleHintOn();
		XSRETURN_EMPTY;


void
vtkImageWindow::MakeCurrent()
		CODE:
		THIS->MakeCurrent();
		XSRETURN_EMPTY;


static vtkImageWindow*
vtkImageWindow::New()
		CODE:
		RETVAL = vtkImageWindow::New();
		OUTPUT:
		RETVAL


int
vtkImageWindow::OpenPPMImageFile()
		CODE:
		RETVAL = THIS->OpenPPMImageFile();
		OUTPUT:
		RETVAL


void
vtkImageWindow::RemoveImager(im)
		vtkImager *	im
		CODE:
		THIS->RemoveImager(im);
		XSRETURN_EMPTY;


void
vtkImageWindow::Render()
		CODE:
		THIS->Render();
		XSRETURN_EMPTY;


void
vtkImageWindow::SaveImageAsPPM()
		CODE:
		THIS->SaveImageAsPPM();
		XSRETURN_EMPTY;


void
vtkImageWindow::SetFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetFileName(arg1);
		XSRETURN_EMPTY;


void
vtkImageWindow::SetGrayScaleHint(arg1)
		int 	arg1
		CODE:
		THIS->SetGrayScaleHint(arg1);
		XSRETURN_EMPTY;


void
vtkImageWindow::SetPosition(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetPosition(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageWindow::SetPosition\n");



void
vtkImageWindow::SetSize(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetSize(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkImageWindow::SetSize\n");



void
vtkImageWindow::SetWindowInfo(arg1)
		char *	arg1
		CODE:
		THIS->SetWindowInfo(arg1);
		XSRETURN_EMPTY;


void
vtkImageWindow::SwapBuffers()
		CODE:
		THIS->SwapBuffers();
		XSRETURN_EMPTY;


void
vtkImageWindow::WritePPMImageFile()
		CODE:
		THIS->WritePPMImageFile();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageWrapPad PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageWrapPad::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkImageWrapPad*
vtkImageWrapPad::New()
		CODE:
		RETVAL = vtkImageWrapPad::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ImageWriter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkImageWriter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkImageWriter::GetFileDimensionality()
		CODE:
		RETVAL = THIS->GetFileDimensionality();
		OUTPUT:
		RETVAL


char *
vtkImageWriter::GetFileName()
		CODE:
		RETVAL = THIS->GetFileName();
		OUTPUT:
		RETVAL


char *
vtkImageWriter::GetFilePattern()
		CODE:
		RETVAL = THIS->GetFilePattern();
		OUTPUT:
		RETVAL


char *
vtkImageWriter::GetFilePrefix()
		CODE:
		RETVAL = THIS->GetFilePrefix();
		OUTPUT:
		RETVAL


vtkImageData *
vtkImageWriter::GetInput()
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


unsigned long
vtkImageWriter::GetMemoryLimit()
		CODE:
		RETVAL = THIS->GetMemoryLimit();
		OUTPUT:
		RETVAL


static vtkImageWriter*
vtkImageWriter::New()
		CODE:
		RETVAL = vtkImageWriter::New();
		OUTPUT:
		RETVAL


void
vtkImageWriter::SetFileDimensionality(arg1)
		int 	arg1
		CODE:
		THIS->SetFileDimensionality(arg1);
		XSRETURN_EMPTY;


void
vtkImageWriter::SetFileName(arg1)
		char *	arg1
		CODE:
		THIS->SetFileName(arg1);
		XSRETURN_EMPTY;


void
vtkImageWriter::SetFilePattern(filePattern)
		char *	filePattern
		CODE:
		THIS->SetFilePattern(filePattern);
		XSRETURN_EMPTY;


void
vtkImageWriter::SetFilePrefix(filePrefix)
		char *	filePrefix
		CODE:
		THIS->SetFilePrefix(filePrefix);
		XSRETURN_EMPTY;


void
vtkImageWriter::SetInput(input)
		vtkImageData *	input
		CODE:
		THIS->SetInput(input);
		XSRETURN_EMPTY;


void
vtkImageWriter::SetMemoryLimit(arg1)
		unsigned long 	arg1
		CODE:
		THIS->SetMemoryLimit(arg1);
		XSRETURN_EMPTY;


void
vtkImageWriter::Write()
		CODE:
		THIS->Write();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::LabeledDataMapper PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkLabeledDataMapper::BoldOff()
		CODE:
		THIS->BoldOff();
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::BoldOn()
		CODE:
		THIS->BoldOn();
		XSRETURN_EMPTY;


int
vtkLabeledDataMapper::GetBold()
		CODE:
		RETVAL = THIS->GetBold();
		OUTPUT:
		RETVAL


const char *
vtkLabeledDataMapper::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkLabeledDataMapper::GetFieldDataArray()
		CODE:
		RETVAL = THIS->GetFieldDataArray();
		OUTPUT:
		RETVAL


int
vtkLabeledDataMapper::GetFontFamily()
		CODE:
		RETVAL = THIS->GetFontFamily();
		OUTPUT:
		RETVAL


int
vtkLabeledDataMapper::GetFontSize()
		CODE:
		RETVAL = THIS->GetFontSize();
		OUTPUT:
		RETVAL


vtkDataSet *
vtkLabeledDataMapper::GetInput()
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
vtkLabeledDataMapper::GetItalic()
		CODE:
		RETVAL = THIS->GetItalic();
		OUTPUT:
		RETVAL


char *
vtkLabeledDataMapper::GetLabelFormat()
		CODE:
		RETVAL = THIS->GetLabelFormat();
		OUTPUT:
		RETVAL


int
vtkLabeledDataMapper::GetLabelMode()
		CODE:
		RETVAL = THIS->GetLabelMode();
		OUTPUT:
		RETVAL


int
vtkLabeledDataMapper::GetLabeledComponent()
		CODE:
		RETVAL = THIS->GetLabeledComponent();
		OUTPUT:
		RETVAL


int
vtkLabeledDataMapper::GetShadow()
		CODE:
		RETVAL = THIS->GetShadow();
		OUTPUT:
		RETVAL


void
vtkLabeledDataMapper::ItalicOff()
		CODE:
		THIS->ItalicOff();
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::ItalicOn()
		CODE:
		THIS->ItalicOn();
		XSRETURN_EMPTY;


static vtkLabeledDataMapper*
vtkLabeledDataMapper::New()
		CODE:
		RETVAL = vtkLabeledDataMapper::New();
		OUTPUT:
		RETVAL


void
vtkLabeledDataMapper::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::RenderOpaqueGeometry(viewport, actor)
		vtkViewport *	viewport
		vtkActor2D *	actor
		CODE:
		THIS->RenderOpaqueGeometry(viewport, actor);
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::RenderOverlay(viewport, actor)
		vtkViewport *	viewport
		vtkActor2D *	actor
		CODE:
		THIS->RenderOverlay(viewport, actor);
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::SetBold(arg1)
		int 	arg1
		CODE:
		THIS->SetBold(arg1);
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::SetFieldDataArray(arg1)
		int 	arg1
		CODE:
		THIS->SetFieldDataArray(arg1);
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::SetFontFamily(arg1)
		int 	arg1
		CODE:
		THIS->SetFontFamily(arg1);
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::SetFontFamilyToArial()
		CODE:
		THIS->SetFontFamilyToArial();
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::SetFontFamilyToCourier()
		CODE:
		THIS->SetFontFamilyToCourier();
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::SetFontFamilyToTimes()
		CODE:
		THIS->SetFontFamilyToTimes();
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::SetFontSize(arg1)
		int 	arg1
		CODE:
		THIS->SetFontSize(arg1);
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::SetInput(arg1)
		vtkDataSet *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::SetItalic(arg1)
		int 	arg1
		CODE:
		THIS->SetItalic(arg1);
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::SetLabelFormat(arg1)
		char *	arg1
		CODE:
		THIS->SetLabelFormat(arg1);
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::SetLabelMode(arg1)
		int 	arg1
		CODE:
		THIS->SetLabelMode(arg1);
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::SetLabelModeToLabelFieldData()
		CODE:
		THIS->SetLabelModeToLabelFieldData();
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::SetLabelModeToLabelIds()
		CODE:
		THIS->SetLabelModeToLabelIds();
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::SetLabelModeToLabelNormals()
		CODE:
		THIS->SetLabelModeToLabelNormals();
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::SetLabelModeToLabelScalars()
		CODE:
		THIS->SetLabelModeToLabelScalars();
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::SetLabelModeToLabelTCoords()
		CODE:
		THIS->SetLabelModeToLabelTCoords();
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::SetLabelModeToLabelTensors()
		CODE:
		THIS->SetLabelModeToLabelTensors();
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::SetLabelModeToLabelVectors()
		CODE:
		THIS->SetLabelModeToLabelVectors();
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::SetLabeledComponent(arg1)
		int 	arg1
		CODE:
		THIS->SetLabeledComponent(arg1);
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::SetShadow(arg1)
		int 	arg1
		CODE:
		THIS->SetShadow(arg1);
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::ShadowOff()
		CODE:
		THIS->ShadowOff();
		XSRETURN_EMPTY;


void
vtkLabeledDataMapper::ShadowOn()
		CODE:
		THIS->ShadowOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ParallelCoordinatesActor PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkParallelCoordinatesActor::BoldOff()
		CODE:
		THIS->BoldOff();
		XSRETURN_EMPTY;


void
vtkParallelCoordinatesActor::BoldOn()
		CODE:
		THIS->BoldOn();
		XSRETURN_EMPTY;


int
vtkParallelCoordinatesActor::GetBold()
		CODE:
		RETVAL = THIS->GetBold();
		OUTPUT:
		RETVAL


const char *
vtkParallelCoordinatesActor::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkParallelCoordinatesActor::GetFontFamily()
		CODE:
		RETVAL = THIS->GetFontFamily();
		OUTPUT:
		RETVAL


int
vtkParallelCoordinatesActor::GetIndependentVariables()
		CODE:
		RETVAL = THIS->GetIndependentVariables();
		OUTPUT:
		RETVAL


vtkDataObject *
vtkParallelCoordinatesActor::GetInput()
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
vtkParallelCoordinatesActor::GetItalic()
		CODE:
		RETVAL = THIS->GetItalic();
		OUTPUT:
		RETVAL


char *
vtkParallelCoordinatesActor::GetLabelFormat()
		CODE:
		RETVAL = THIS->GetLabelFormat();
		OUTPUT:
		RETVAL


int
vtkParallelCoordinatesActor::GetNumberOfLabels()
		CODE:
		RETVAL = THIS->GetNumberOfLabels();
		OUTPUT:
		RETVAL


int
vtkParallelCoordinatesActor::GetShadow()
		CODE:
		RETVAL = THIS->GetShadow();
		OUTPUT:
		RETVAL


char *
vtkParallelCoordinatesActor::GetTitle()
		CODE:
		RETVAL = THIS->GetTitle();
		OUTPUT:
		RETVAL


void
vtkParallelCoordinatesActor::ItalicOff()
		CODE:
		THIS->ItalicOff();
		XSRETURN_EMPTY;


void
vtkParallelCoordinatesActor::ItalicOn()
		CODE:
		THIS->ItalicOn();
		XSRETURN_EMPTY;


static vtkParallelCoordinatesActor*
vtkParallelCoordinatesActor::New()
		CODE:
		RETVAL = vtkParallelCoordinatesActor::New();
		OUTPUT:
		RETVAL


void
vtkParallelCoordinatesActor::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;


int
vtkParallelCoordinatesActor::RenderOpaqueGeometry(arg1)
		vtkViewport *	arg1
		CODE:
		RETVAL = THIS->RenderOpaqueGeometry(arg1);
		OUTPUT:
		RETVAL


int
vtkParallelCoordinatesActor::RenderOverlay(arg1)
		vtkViewport *	arg1
		CODE:
		RETVAL = THIS->RenderOverlay(arg1);
		OUTPUT:
		RETVAL


int
vtkParallelCoordinatesActor::RenderTranslucentGeometry(arg1)
		vtkViewport *	arg1
		CODE:
		RETVAL = THIS->RenderTranslucentGeometry(arg1);
		OUTPUT:
		RETVAL


void
vtkParallelCoordinatesActor::SetBold(arg1)
		int 	arg1
		CODE:
		THIS->SetBold(arg1);
		XSRETURN_EMPTY;


void
vtkParallelCoordinatesActor::SetFontFamily(arg1)
		int 	arg1
		CODE:
		THIS->SetFontFamily(arg1);
		XSRETURN_EMPTY;


void
vtkParallelCoordinatesActor::SetFontFamilyToArial()
		CODE:
		THIS->SetFontFamilyToArial();
		XSRETURN_EMPTY;


void
vtkParallelCoordinatesActor::SetFontFamilyToCourier()
		CODE:
		THIS->SetFontFamilyToCourier();
		XSRETURN_EMPTY;


void
vtkParallelCoordinatesActor::SetFontFamilyToTimes()
		CODE:
		THIS->SetFontFamilyToTimes();
		XSRETURN_EMPTY;


void
vtkParallelCoordinatesActor::SetIndependentVariables(arg1)
		int 	arg1
		CODE:
		THIS->SetIndependentVariables(arg1);
		XSRETURN_EMPTY;


void
vtkParallelCoordinatesActor::SetIndependentVariablesToColumns()
		CODE:
		THIS->SetIndependentVariablesToColumns();
		XSRETURN_EMPTY;


void
vtkParallelCoordinatesActor::SetIndependentVariablesToRows()
		CODE:
		THIS->SetIndependentVariablesToRows();
		XSRETURN_EMPTY;


void
vtkParallelCoordinatesActor::SetInput(arg1)
		vtkDataObject *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;


void
vtkParallelCoordinatesActor::SetItalic(arg1)
		int 	arg1
		CODE:
		THIS->SetItalic(arg1);
		XSRETURN_EMPTY;


void
vtkParallelCoordinatesActor::SetLabelFormat(arg1)
		char *	arg1
		CODE:
		THIS->SetLabelFormat(arg1);
		XSRETURN_EMPTY;


void
vtkParallelCoordinatesActor::SetNumberOfLabels(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfLabels(arg1);
		XSRETURN_EMPTY;


void
vtkParallelCoordinatesActor::SetShadow(arg1)
		int 	arg1
		CODE:
		THIS->SetShadow(arg1);
		XSRETURN_EMPTY;


void
vtkParallelCoordinatesActor::SetTitle(arg1)
		char *	arg1
		CODE:
		THIS->SetTitle(arg1);
		XSRETURN_EMPTY;


void
vtkParallelCoordinatesActor::ShadowOff()
		CODE:
		THIS->ShadowOff();
		XSRETURN_EMPTY;


void
vtkParallelCoordinatesActor::ShadowOn()
		CODE:
		THIS->ShadowOn();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::PNMReader PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkPNMReader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkPNMReader*
vtkPNMReader::New()
		CODE:
		RETVAL = vtkPNMReader::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::PNMWriter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkPNMWriter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkPNMWriter*
vtkPNMWriter::New()
		CODE:
		RETVAL = vtkPNMWriter::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::PolyDataMapper2D PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkPolyDataMapper2D::CreateDefaultLookupTable()
		CODE:
		THIS->CreateDefaultLookupTable();
		XSRETURN_EMPTY;


const char *
vtkPolyDataMapper2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkPolyDataMapper2D::GetColorMode()
		CODE:
		RETVAL = THIS->GetColorMode();
		OUTPUT:
		RETVAL


const char *
vtkPolyDataMapper2D::GetColorModeAsString()
		CODE:
		RETVAL = THIS->GetColorModeAsString();
		OUTPUT:
		RETVAL


vtkScalars *
vtkPolyDataMapper2D::GetColors()
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


vtkPolyData *
vtkPolyDataMapper2D::GetInput()
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


vtkScalarsToColors *
vtkPolyDataMapper2D::GetLookupTable()
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
vtkPolyDataMapper2D::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


float  *
vtkPolyDataMapper2D::GetScalarRange()
		PREINIT:
		float  * retval;
		PPCODE:
		retval = THIS->GetScalarRange();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


int
vtkPolyDataMapper2D::GetScalarVisibility()
		CODE:
		RETVAL = THIS->GetScalarVisibility();
		OUTPUT:
		RETVAL


vtkCoordinate *
vtkPolyDataMapper2D::GetTransformCoordinate()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkCoordinate";
		CODE:
		RETVAL = THIS->GetTransformCoordinate();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


static vtkPolyDataMapper2D*
vtkPolyDataMapper2D::New()
		CODE:
		RETVAL = vtkPolyDataMapper2D::New();
		OUTPUT:
		RETVAL


void
vtkPolyDataMapper2D::ScalarVisibilityOff()
		CODE:
		THIS->ScalarVisibilityOff();
		XSRETURN_EMPTY;


void
vtkPolyDataMapper2D::ScalarVisibilityOn()
		CODE:
		THIS->ScalarVisibilityOn();
		XSRETURN_EMPTY;


void
vtkPolyDataMapper2D::SetColorMode(arg1)
		int 	arg1
		CODE:
		THIS->SetColorMode(arg1);
		XSRETURN_EMPTY;


void
vtkPolyDataMapper2D::SetColorModeToDefault()
		CODE:
		THIS->SetColorModeToDefault();
		XSRETURN_EMPTY;


void
vtkPolyDataMapper2D::SetColorModeToLuminance()
		CODE:
		THIS->SetColorModeToLuminance();
		XSRETURN_EMPTY;


void
vtkPolyDataMapper2D::SetColorModeToMapScalars()
		CODE:
		THIS->SetColorModeToMapScalars();
		XSRETURN_EMPTY;


void
vtkPolyDataMapper2D::SetInput(arg1)
		vtkPolyData *	arg1
		CODE:
		THIS->SetInput(arg1);
		XSRETURN_EMPTY;


void
vtkPolyDataMapper2D::SetLookupTable(lut)
		vtkScalarsToColors *	lut
		CODE:
		THIS->SetLookupTable(lut);
		XSRETURN_EMPTY;


void
vtkPolyDataMapper2D::SetScalarRange(arg1 = 0, arg2 = 0)
	CASE: items == 3
		float  	arg1
		float 	arg2
		CODE:
		THIS->SetScalarRange(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkPolyDataMapper2D::SetScalarRange\n");



void
vtkPolyDataMapper2D::SetScalarVisibility(arg1)
		int 	arg1
		CODE:
		THIS->SetScalarVisibility(arg1);
		XSRETURN_EMPTY;


void
vtkPolyDataMapper2D::SetTransformCoordinate(arg1)
		vtkCoordinate *	arg1
		CODE:
		THIS->SetTransformCoordinate(arg1);
		XSRETURN_EMPTY;


void
vtkPolyDataMapper2D::ShallowCopy(m)
		vtkPolyDataMapper2D *	m
		CODE:
		THIS->ShallowCopy(m);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::PostScriptWriter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkPostScriptWriter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkPostScriptWriter*
vtkPostScriptWriter::New()
		CODE:
		RETVAL = vtkPostScriptWriter::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ScalarBarActor PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkScalarBarActor::BoldOff()
		CODE:
		THIS->BoldOff();
		XSRETURN_EMPTY;


void
vtkScalarBarActor::BoldOn()
		CODE:
		THIS->BoldOn();
		XSRETURN_EMPTY;


int
vtkScalarBarActor::GetBold()
		CODE:
		RETVAL = THIS->GetBold();
		OUTPUT:
		RETVAL


const char *
vtkScalarBarActor::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkScalarBarActor::GetFontFamily()
		CODE:
		RETVAL = THIS->GetFontFamily();
		OUTPUT:
		RETVAL


int
vtkScalarBarActor::GetItalic()
		CODE:
		RETVAL = THIS->GetItalic();
		OUTPUT:
		RETVAL


char *
vtkScalarBarActor::GetLabelFormat()
		CODE:
		RETVAL = THIS->GetLabelFormat();
		OUTPUT:
		RETVAL


vtkScalarsToColors *
vtkScalarBarActor::GetLookupTable()
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
vtkScalarBarActor::GetMaximumNumberOfColors()
		CODE:
		RETVAL = THIS->GetMaximumNumberOfColors();
		OUTPUT:
		RETVAL


int
vtkScalarBarActor::GetNumberOfLabels()
		CODE:
		RETVAL = THIS->GetNumberOfLabels();
		OUTPUT:
		RETVAL


int
vtkScalarBarActor::GetOrientation()
		CODE:
		RETVAL = THIS->GetOrientation();
		OUTPUT:
		RETVAL


int
vtkScalarBarActor::GetShadow()
		CODE:
		RETVAL = THIS->GetShadow();
		OUTPUT:
		RETVAL


char *
vtkScalarBarActor::GetTitle()
		CODE:
		RETVAL = THIS->GetTitle();
		OUTPUT:
		RETVAL


void
vtkScalarBarActor::ItalicOff()
		CODE:
		THIS->ItalicOff();
		XSRETURN_EMPTY;


void
vtkScalarBarActor::ItalicOn()
		CODE:
		THIS->ItalicOn();
		XSRETURN_EMPTY;


static vtkScalarBarActor*
vtkScalarBarActor::New()
		CODE:
		RETVAL = vtkScalarBarActor::New();
		OUTPUT:
		RETVAL


void
vtkScalarBarActor::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;


int
vtkScalarBarActor::RenderOpaqueGeometry(viewport)
		vtkViewport *	viewport
		CODE:
		RETVAL = THIS->RenderOpaqueGeometry(viewport);
		OUTPUT:
		RETVAL


int
vtkScalarBarActor::RenderOverlay(viewport)
		vtkViewport *	viewport
		CODE:
		RETVAL = THIS->RenderOverlay(viewport);
		OUTPUT:
		RETVAL


int
vtkScalarBarActor::RenderTranslucentGeometry(arg1)
		vtkViewport *	arg1
		CODE:
		RETVAL = THIS->RenderTranslucentGeometry(arg1);
		OUTPUT:
		RETVAL


void
vtkScalarBarActor::SetBold(arg1)
		int 	arg1
		CODE:
		THIS->SetBold(arg1);
		XSRETURN_EMPTY;


void
vtkScalarBarActor::SetFontFamily(arg1)
		int 	arg1
		CODE:
		THIS->SetFontFamily(arg1);
		XSRETURN_EMPTY;


void
vtkScalarBarActor::SetFontFamilyToArial()
		CODE:
		THIS->SetFontFamilyToArial();
		XSRETURN_EMPTY;


void
vtkScalarBarActor::SetFontFamilyToCourier()
		CODE:
		THIS->SetFontFamilyToCourier();
		XSRETURN_EMPTY;


void
vtkScalarBarActor::SetFontFamilyToTimes()
		CODE:
		THIS->SetFontFamilyToTimes();
		XSRETURN_EMPTY;


void
vtkScalarBarActor::SetItalic(arg1)
		int 	arg1
		CODE:
		THIS->SetItalic(arg1);
		XSRETURN_EMPTY;


void
vtkScalarBarActor::SetLabelFormat(arg1)
		char *	arg1
		CODE:
		THIS->SetLabelFormat(arg1);
		XSRETURN_EMPTY;


void
vtkScalarBarActor::SetLookupTable(arg1)
		vtkScalarsToColors *	arg1
		CODE:
		THIS->SetLookupTable(arg1);
		XSRETURN_EMPTY;


void
vtkScalarBarActor::SetMaximumNumberOfColors(arg1)
		int 	arg1
		CODE:
		THIS->SetMaximumNumberOfColors(arg1);
		XSRETURN_EMPTY;


void
vtkScalarBarActor::SetNumberOfLabels(arg1)
		int 	arg1
		CODE:
		THIS->SetNumberOfLabels(arg1);
		XSRETURN_EMPTY;


void
vtkScalarBarActor::SetOrientation(arg1)
		int 	arg1
		CODE:
		THIS->SetOrientation(arg1);
		XSRETURN_EMPTY;


void
vtkScalarBarActor::SetOrientationToHorizontal()
		CODE:
		THIS->SetOrientationToHorizontal();
		XSRETURN_EMPTY;


void
vtkScalarBarActor::SetOrientationToVertical()
		CODE:
		THIS->SetOrientationToVertical();
		XSRETURN_EMPTY;


void
vtkScalarBarActor::SetShadow(arg1)
		int 	arg1
		CODE:
		THIS->SetShadow(arg1);
		XSRETURN_EMPTY;


void
vtkScalarBarActor::SetTitle(arg1)
		char *	arg1
		CODE:
		THIS->SetTitle(arg1);
		XSRETURN_EMPTY;


void
vtkScalarBarActor::ShadowOff()
		CODE:
		THIS->ShadowOff();
		XSRETURN_EMPTY;


void
vtkScalarBarActor::ShadowOn()
		CODE:
		THIS->ShadowOn();
		XSRETURN_EMPTY;


void
vtkScalarBarActor::ShallowCopy(prop)
		vtkProp *	prop
		CODE:
		THIS->ShallowCopy(prop);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::ScaledTextActor PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkScaledTextActor::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


float
vtkScaledTextActor::GetMaximumLineHeight()
		CODE:
		RETVAL = THIS->GetMaximumLineHeight();
		OUTPUT:
		RETVAL


int  *
vtkScaledTextActor::GetMinimumSize()
		PREINIT:
		int  * retval;
		PPCODE:
		retval = THIS->GetMinimumSize();
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(newSVnv(retval[0])));
		PUSHs(sv_2mortal(newSVnv(retval[1])));


static vtkScaledTextActor*
vtkScaledTextActor::New()
		CODE:
		RETVAL = vtkScaledTextActor::New();
		OUTPUT:
		RETVAL


void
vtkScaledTextActor::SetMapper(arg1 = 0)
	CASE: items == 2
		vtkTextMapper *	arg1
		CODE:
		THIS->SetMapper(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkScaledTextActor::SetMapper\n");



void
vtkScaledTextActor::SetMaximumLineHeight(arg1)
		float 	arg1
		CODE:
		THIS->SetMaximumLineHeight(arg1);
		XSRETURN_EMPTY;


void
vtkScaledTextActor::SetMinimumSize(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int  	arg1
		int 	arg2
		CODE:
		THIS->SetMinimumSize(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkScaledTextActor::SetMinimumSize\n");



void
vtkScaledTextActor::ShallowCopy(prop)
		vtkProp *	prop
		CODE:
		THIS->ShallowCopy(prop);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::TextMapper PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkTextMapper::BoldOff()
		CODE:
		THIS->BoldOff();
		XSRETURN_EMPTY;


void
vtkTextMapper::BoldOn()
		CODE:
		THIS->BoldOn();
		XSRETURN_EMPTY;


int
vtkTextMapper::GetBold()
		CODE:
		RETVAL = THIS->GetBold();
		OUTPUT:
		RETVAL


const char *
vtkTextMapper::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkTextMapper::GetFontFamily()
		CODE:
		RETVAL = THIS->GetFontFamily();
		OUTPUT:
		RETVAL


int
vtkTextMapper::GetFontSize()
		CODE:
		RETVAL = THIS->GetFontSize();
		OUTPUT:
		RETVAL


int
vtkTextMapper::GetHeight(arg1)
		vtkViewport *	arg1
		CODE:
		RETVAL = THIS->GetHeight(arg1);
		OUTPUT:
		RETVAL


char *
vtkTextMapper::GetInput()
		CODE:
		RETVAL = THIS->GetInput();
		OUTPUT:
		RETVAL


int
vtkTextMapper::GetItalic()
		CODE:
		RETVAL = THIS->GetItalic();
		OUTPUT:
		RETVAL


int
vtkTextMapper::GetJustification()
		CODE:
		RETVAL = THIS->GetJustification();
		OUTPUT:
		RETVAL


float
vtkTextMapper::GetLineOffset()
		CODE:
		RETVAL = THIS->GetLineOffset();
		OUTPUT:
		RETVAL


float
vtkTextMapper::GetLineSpacing()
		CODE:
		RETVAL = THIS->GetLineSpacing();
		OUTPUT:
		RETVAL


int
vtkTextMapper::GetNumberOfLines(arg1 = 0)
	CASE: items == 2
		char *	arg1
		CODE:
		RETVAL = THIS->GetNumberOfLines(arg1);
		OUTPUT:
		RETVAL
	CASE: items == 1
		CODE:
		RETVAL = THIS->GetNumberOfLines();
		OUTPUT:
		RETVAL
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkTextMapper::GetNumberOfLines\n");



int
vtkTextMapper::GetShadow()
		CODE:
		RETVAL = THIS->GetShadow();
		OUTPUT:
		RETVAL


int
vtkTextMapper::GetVerticalJustification()
		CODE:
		RETVAL = THIS->GetVerticalJustification();
		OUTPUT:
		RETVAL


int
vtkTextMapper::GetWidth(arg1)
		vtkViewport *	arg1
		CODE:
		RETVAL = THIS->GetWidth(arg1);
		OUTPUT:
		RETVAL


void
vtkTextMapper::ItalicOff()
		CODE:
		THIS->ItalicOff();
		XSRETURN_EMPTY;


void
vtkTextMapper::ItalicOn()
		CODE:
		THIS->ItalicOn();
		XSRETURN_EMPTY;


static vtkTextMapper*
vtkTextMapper::New()
		CODE:
		RETVAL = vtkTextMapper::New();
		OUTPUT:
		RETVAL


void
vtkTextMapper::SetBold(val)
		int 	val
		CODE:
		THIS->SetBold(val);
		XSRETURN_EMPTY;


void
vtkTextMapper::SetFontFamily(val)
		int 	val
		CODE:
		THIS->SetFontFamily(val);
		XSRETURN_EMPTY;


void
vtkTextMapper::SetFontFamilyToArial()
		CODE:
		THIS->SetFontFamilyToArial();
		XSRETURN_EMPTY;


void
vtkTextMapper::SetFontFamilyToCourier()
		CODE:
		THIS->SetFontFamilyToCourier();
		XSRETURN_EMPTY;


void
vtkTextMapper::SetFontFamilyToTimes()
		CODE:
		THIS->SetFontFamilyToTimes();
		XSRETURN_EMPTY;


void
vtkTextMapper::SetFontSize(size)
		int 	size
		CODE:
		THIS->SetFontSize(size);
		XSRETURN_EMPTY;


void
vtkTextMapper::SetInput(inputString)
		char *	inputString
		CODE:
		THIS->SetInput(inputString);
		XSRETURN_EMPTY;


void
vtkTextMapper::SetItalic(val)
		int 	val
		CODE:
		THIS->SetItalic(val);
		XSRETURN_EMPTY;


void
vtkTextMapper::SetJustification(arg1)
		int 	arg1
		CODE:
		THIS->SetJustification(arg1);
		XSRETURN_EMPTY;


void
vtkTextMapper::SetJustificationToCentered()
		CODE:
		THIS->SetJustificationToCentered();
		XSRETURN_EMPTY;


void
vtkTextMapper::SetJustificationToLeft()
		CODE:
		THIS->SetJustificationToLeft();
		XSRETURN_EMPTY;


void
vtkTextMapper::SetJustificationToRight()
		CODE:
		THIS->SetJustificationToRight();
		XSRETURN_EMPTY;


void
vtkTextMapper::SetLineOffset(arg1)
		float 	arg1
		CODE:
		THIS->SetLineOffset(arg1);
		XSRETURN_EMPTY;


void
vtkTextMapper::SetLineSpacing(arg1)
		float 	arg1
		CODE:
		THIS->SetLineSpacing(arg1);
		XSRETURN_EMPTY;


void
vtkTextMapper::SetShadow(val)
		int 	val
		CODE:
		THIS->SetShadow(val);
		XSRETURN_EMPTY;


void
vtkTextMapper::SetVerticalJustification(arg1)
		int 	arg1
		CODE:
		THIS->SetVerticalJustification(arg1);
		XSRETURN_EMPTY;


void
vtkTextMapper::SetVerticalJustificationToBottom()
		CODE:
		THIS->SetVerticalJustificationToBottom();
		XSRETURN_EMPTY;


void
vtkTextMapper::SetVerticalJustificationToCentered()
		CODE:
		THIS->SetVerticalJustificationToCentered();
		XSRETURN_EMPTY;


void
vtkTextMapper::SetVerticalJustificationToTop()
		CODE:
		THIS->SetVerticalJustificationToTop();
		XSRETURN_EMPTY;


void
vtkTextMapper::ShadowOff()
		CODE:
		THIS->ShadowOff();
		XSRETURN_EMPTY;


void
vtkTextMapper::ShadowOn()
		CODE:
		THIS->ShadowOn();
		XSRETURN_EMPTY;


void
vtkTextMapper::ShallowCopy(tm)
		vtkTextMapper *	tm
		CODE:
		THIS->ShallowCopy(tm);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::TIFFReader PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkTIFFReader::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkTIFFReader*
vtkTIFFReader::New()
		CODE:
		RETVAL = vtkTIFFReader::New();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::TIFFWriter PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkTIFFWriter::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkTIFFWriter*
vtkTIFFWriter::New()
		CODE:
		RETVAL = vtkTIFFWriter::New();
		OUTPUT:
		RETVAL

#ifdef USE_MESA

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::MesaImager PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkMesaImager::Erase()
		CODE:
		THIS->Erase();
		XSRETURN_EMPTY;


const char *
vtkMesaImager::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkMesaImager*
vtkMesaImager::New()
		CODE:
		RETVAL = vtkMesaImager::New();
		OUTPUT:
		RETVAL


int
vtkMesaImager::RenderOpaqueGeometry()
		CODE:
		RETVAL = THIS->RenderOpaqueGeometry();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::MesaImageMapper PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkMesaImageMapper::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkMesaImageMapper*
vtkMesaImageMapper::New()
		CODE:
		RETVAL = vtkMesaImageMapper::New();
		OUTPUT:
		RETVAL


void
vtkMesaImageMapper::RenderData(viewport, data, actor)
		vtkViewport *	viewport
		vtkImageData *	data
		vtkActor2D *	actor
		CODE:
		THIS->RenderData(viewport, data, actor);
		XSRETURN_EMPTY;


void
vtkMesaImageMapper::RenderOpaqueGeometry(viewport, actor)
		vtkViewport *	viewport
		vtkActor2D *	actor
		CODE:
		THIS->RenderOpaqueGeometry(viewport, actor);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::MesaImageWindow PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkMesaImageWindow::EraseWindow()
		CODE:
		THIS->EraseWindow();
		XSRETURN_EMPTY;


void
vtkMesaImageWindow::Frame()
		CODE:
		THIS->Frame();
		XSRETURN_EMPTY;


const char *
vtkMesaImageWindow::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkMesaImageWindow::GetDesiredDepth()
		CODE:
		RETVAL = THIS->GetDesiredDepth();
		OUTPUT:
		RETVAL


void *
vtkMesaImageWindow::GetGenericContext()
		CODE:
		RETVAL = THIS->GetGenericContext();
		OUTPUT:
		RETVAL


void *
vtkMesaImageWindow::GetGenericDisplayId()
		CODE:
		RETVAL = THIS->GetGenericDisplayId();
		OUTPUT:
		RETVAL


void *
vtkMesaImageWindow::GetGenericDrawable()
		CODE:
		RETVAL = THIS->GetGenericDrawable();
		OUTPUT:
		RETVAL


void *
vtkMesaImageWindow::GetGenericParentId()
		CODE:
		RETVAL = THIS->GetGenericParentId();
		OUTPUT:
		RETVAL


void *
vtkMesaImageWindow::GetGenericWindowId()
		CODE:
		RETVAL = THIS->GetGenericWindowId();
		OUTPUT:
		RETVAL


void
vtkMesaImageWindow::MakeCurrent()
		CODE:
		THIS->MakeCurrent();
		XSRETURN_EMPTY;


void
vtkMesaImageWindow::MakeDefaultWindow()
		CODE:
		THIS->MakeDefaultWindow();
		XSRETURN_EMPTY;


static vtkMesaImageWindow*
vtkMesaImageWindow::New()
		CODE:
		RETVAL = vtkMesaImageWindow::New();
		OUTPUT:
		RETVAL


void
vtkMesaImageWindow::Render()
		CODE:
		THIS->Render();
		XSRETURN_EMPTY;


void
vtkMesaImageWindow::SetOffScreenRendering(i)
		int 	i
		CODE:
		THIS->SetOffScreenRendering(i);
		XSRETURN_EMPTY;


void
vtkMesaImageWindow::SwapBuffers()
		CODE:
		THIS->SwapBuffers();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::XMesaTextMapper PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkXMesaTextMapper::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkXMesaTextMapper*
vtkXMesaTextMapper::New()
		CODE:
		RETVAL = vtkXMesaTextMapper::New();
		OUTPUT:
		RETVAL


void
vtkXMesaTextMapper::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;


void
vtkXMesaTextMapper::RenderOpaqueGeometry(viewport, actor)
		vtkViewport *	viewport
		vtkActor2D *	actor
		CODE:
		THIS->RenderOpaqueGeometry(viewport, actor);
		XSRETURN_EMPTY;


void
vtkXMesaTextMapper::RenderOverlay(viewport, actor)
		vtkViewport *	viewport
		vtkActor2D *	actor
		CODE:
		THIS->RenderOverlay(viewport, actor);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::MesaPolyDataMapper2D PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkMesaPolyDataMapper2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkMesaPolyDataMapper2D*
vtkMesaPolyDataMapper2D::New()
		CODE:
		RETVAL = vtkMesaPolyDataMapper2D::New();
		OUTPUT:
		RETVAL


void
vtkMesaPolyDataMapper2D::RenderOpaqueGeometry(viewport, actor)
		vtkViewport *	viewport
		vtkActor2D *	actor
		CODE:
		THIS->RenderOpaqueGeometry(viewport, actor);
		XSRETURN_EMPTY;

#endif

#ifndef USE_MESA

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::OpenGLImager PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkOpenGLImager::Erase()
		CODE:
		THIS->Erase();
		XSRETURN_EMPTY;


const char *
vtkOpenGLImager::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkOpenGLImager*
vtkOpenGLImager::New()
		CODE:
		RETVAL = vtkOpenGLImager::New();
		OUTPUT:
		RETVAL


int
vtkOpenGLImager::RenderOpaqueGeometry()
		CODE:
		RETVAL = THIS->RenderOpaqueGeometry();
		OUTPUT:
		RETVAL

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::OpenGLImageMapper PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkOpenGLImageMapper::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkOpenGLImageMapper*
vtkOpenGLImageMapper::New()
		CODE:
		RETVAL = vtkOpenGLImageMapper::New();
		OUTPUT:
		RETVAL


void
vtkOpenGLImageMapper::RenderData(viewport, data, actor)
		vtkViewport *	viewport
		vtkImageData *	data
		vtkActor2D *	actor
		CODE:
		THIS->RenderData(viewport, data, actor);
		XSRETURN_EMPTY;


void
vtkOpenGLImageMapper::RenderOpaqueGeometry(viewport, actor)
		vtkViewport *	viewport
		vtkActor2D *	actor
		CODE:
		THIS->RenderOpaqueGeometry(viewport, actor);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::OpenGLPolyDataMapper2D PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkOpenGLPolyDataMapper2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkOpenGLPolyDataMapper2D*
vtkOpenGLPolyDataMapper2D::New()
		CODE:
		RETVAL = vtkOpenGLPolyDataMapper2D::New();
		OUTPUT:
		RETVAL


void
vtkOpenGLPolyDataMapper2D::RenderOpaqueGeometry(viewport, actor)
		vtkViewport *	viewport
		vtkActor2D *	actor
		CODE:
		THIS->RenderOpaqueGeometry(viewport, actor);
		XSRETURN_EMPTY;

#endif

#ifndef WIN32

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::XImageMapper PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkXImageMapper::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkXImageMapper::GetNumberOfColors()
		CODE:
		RETVAL = THIS->GetNumberOfColors();
		OUTPUT:
		RETVAL


int
vtkXImageMapper::GetXWindowDepth(window)
		vtkWindow *	window
		CODE:
		RETVAL = THIS->GetXWindowDepth(window);
		OUTPUT:
		RETVAL


int
vtkXImageMapper::GetXWindowVisualClass(window)
		vtkWindow *	window
		CODE:
		RETVAL = THIS->GetXWindowVisualClass(window);
		OUTPUT:
		RETVAL


static vtkXImageMapper*
vtkXImageMapper::New()
		CODE:
		RETVAL = vtkXImageMapper::New();
		OUTPUT:
		RETVAL


void
vtkXImageMapper::RenderData(viewport, data, actor)
		vtkViewport *	viewport
		vtkImageData *	data
		vtkActor2D *	actor
		CODE:
		THIS->RenderData(viewport, data, actor);
		XSRETURN_EMPTY;


void
vtkXImageMapper::RenderOverlay(viewport, actor)
		vtkViewport *	viewport
		vtkActor2D *	actor
		CODE:
		THIS->RenderOverlay(viewport, actor);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::XImageWindow PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkXImageWindow::EraseWindow()
		CODE:
		THIS->EraseWindow();
		XSRETURN_EMPTY;


void
vtkXImageWindow::Frame()
		CODE:
		THIS->Frame();
		XSRETURN_EMPTY;


const char *
vtkXImageWindow::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkXImageWindow::GetDesiredDepth()
		CODE:
		RETVAL = THIS->GetDesiredDepth();
		OUTPUT:
		RETVAL


void *
vtkXImageWindow::GetGenericContext()
		CODE:
		RETVAL = THIS->GetGenericContext();
		OUTPUT:
		RETVAL


void *
vtkXImageWindow::GetGenericDisplayId()
		CODE:
		RETVAL = THIS->GetGenericDisplayId();
		OUTPUT:
		RETVAL


void *
vtkXImageWindow::GetGenericDrawable()
		CODE:
		RETVAL = THIS->GetGenericDrawable();
		OUTPUT:
		RETVAL


void *
vtkXImageWindow::GetGenericParentId()
		CODE:
		RETVAL = THIS->GetGenericParentId();
		OUTPUT:
		RETVAL


void *
vtkXImageWindow::GetGenericWindowId()
		CODE:
		RETVAL = THIS->GetGenericWindowId();
		OUTPUT:
		RETVAL


int
vtkXImageWindow::GetNumberOfColors()
		CODE:
		RETVAL = THIS->GetNumberOfColors();
		OUTPUT:
		RETVAL


int
vtkXImageWindow::GetVisualClass()
		CODE:
		RETVAL = THIS->GetVisualClass();
		OUTPUT:
		RETVAL


int
vtkXImageWindow::GetVisualDepth()
		CODE:
		RETVAL = THIS->GetVisualDepth();
		OUTPUT:
		RETVAL


static vtkXImageWindow*
vtkXImageWindow::New()
		CODE:
		RETVAL = vtkXImageWindow::New();
		OUTPUT:
		RETVAL


void
vtkXImageWindow::SetBackgroundColor(r, g, b)
		float 	r
		float 	g
		float 	b
		CODE:
		THIS->SetBackgroundColor(r, g, b);
		XSRETURN_EMPTY;


void
vtkXImageWindow::SetParentId(arg1 = 0)
	CASE: items == 2
		Window 	arg1
		CODE:
		THIS->SetParentId(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkXImageWindow::SetParentId\n");



void
vtkXImageWindow::SetPosition(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetPosition(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkXImageWindow::SetPosition\n");



void
vtkXImageWindow::SetSize(arg1 = 0, arg2 = 0)
	CASE: items == 3
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetSize(arg1, arg2);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkXImageWindow::SetSize\n");



void
vtkXImageWindow::SetWindowId(arg1 = 0)
	CASE: items == 2
		Window 	arg1
		CODE:
		THIS->SetWindowId(arg1);
		XSRETURN_EMPTY;
	CASE:
		CODE:
		croak("Unsupported number of args and/or types supplied to vtkXImageWindow::SetWindowId\n");



void
vtkXImageWindow::SetWindowName(name)
		char *	name
		CODE:
		THIS->SetWindowName(name);
		XSRETURN_EMPTY;


void
vtkXImageWindow::SwapBuffers()
		CODE:
		THIS->SwapBuffers();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::XPolyDataMapper2D PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkXPolyDataMapper2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkXPolyDataMapper2D*
vtkXPolyDataMapper2D::New()
		CODE:
		RETVAL = vtkXPolyDataMapper2D::New();
		OUTPUT:
		RETVAL


void
vtkXPolyDataMapper2D::RenderOverlay(viewport, actor)
		vtkViewport *	viewport
		vtkActor2D *	actor
		CODE:
		THIS->RenderOverlay(viewport, actor);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::XTextMapper PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkXTextMapper::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkXTextMapper*
vtkXTextMapper::New()
		CODE:
		RETVAL = vtkXTextMapper::New();
		OUTPUT:
		RETVAL


void
vtkXTextMapper::RenderOverlay(viewport, actor)
		vtkViewport *	viewport
		vtkActor2D *	actor
		CODE:
		THIS->RenderOverlay(viewport, actor);
		XSRETURN_EMPTY;


void
vtkXTextMapper::SetFontSize(size)
		int 	size
		CODE:
		THIS->SetFontSize(size);
		XSRETURN_EMPTY;

#endif

#ifdef WIN32

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::Win32ImageMapper PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkWin32ImageMapper::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkLookupTable *
vtkWin32ImageMapper::GetLookupTable()
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


unsigned long
vtkWin32ImageMapper::GetMTime()
		CODE:
		RETVAL = THIS->GetMTime();
		OUTPUT:
		RETVAL


static vtkWin32ImageMapper*
vtkWin32ImageMapper::New()
		CODE:
		RETVAL = vtkWin32ImageMapper::New();
		OUTPUT:
		RETVAL


void
vtkWin32ImageMapper::RenderData(viewport, data, actor)
		vtkViewport *	viewport
		vtkImageData *	data
		vtkActor2D *	actor
		CODE:
		THIS->RenderData(viewport, data, actor);
		XSRETURN_EMPTY;


void
vtkWin32ImageMapper::RenderOverlay(viewport, actor)
		vtkViewport *	viewport
		vtkActor2D *	actor
		CODE:
		THIS->RenderOverlay(viewport, actor);
		XSRETURN_EMPTY;


void
vtkWin32ImageMapper::SetLookupTable(arg1)
		vtkLookupTable *	arg1
		CODE:
		THIS->SetLookupTable(arg1);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::Win32OpenGLTextMapper PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkWin32OpenGLTextMapper::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


int
vtkWin32OpenGLTextMapper::GetListBaseForFont(tm, vp)
		vtkTextMapper *	tm
		vtkViewport *	vp
		CODE:
		RETVAL = THIS->GetListBaseForFont(tm, vp);
		OUTPUT:
		RETVAL


static vtkWin32OpenGLTextMapper*
vtkWin32OpenGLTextMapper::New()
		CODE:
		RETVAL = vtkWin32OpenGLTextMapper::New();
		OUTPUT:
		RETVAL


void
vtkWin32OpenGLTextMapper::ReleaseGraphicsResources(arg1)
		vtkWindow *	arg1
		CODE:
		THIS->ReleaseGraphicsResources(arg1);
		XSRETURN_EMPTY;


void
vtkWin32OpenGLTextMapper::RenderGeometry(viewport, actor)
		vtkViewport *	viewport
		vtkActor2D *	actor
		CODE:
		THIS->RenderGeometry(viewport, actor);
		XSRETURN_EMPTY;


void
vtkWin32OpenGLTextMapper::RenderOpaqueGeometry(viewport, actor)
		vtkViewport *	viewport
		vtkActor2D *	actor
		CODE:
		THIS->RenderOpaqueGeometry(viewport, actor);
		XSRETURN_EMPTY;


void
vtkWin32OpenGLTextMapper::RenderOverlay(viewport, actor)
		vtkViewport *	viewport
		vtkActor2D *	actor
		CODE:
		THIS->RenderOverlay(viewport, actor);
		XSRETURN_EMPTY;


void
vtkWin32OpenGLTextMapper::RenderTranslucentGeometry(viewport, actor)
		vtkViewport *	viewport
		vtkActor2D *	actor
		CODE:
		THIS->RenderTranslucentGeometry(viewport, actor);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::Win32OpenGLImageWindow PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkWin32OpenGLImageWindow::Clean()
		CODE:
		THIS->Clean();
		XSRETURN_EMPTY;


void
vtkWin32OpenGLImageWindow::Frame()
		CODE:
		THIS->Frame();
		XSRETURN_EMPTY;


const char *
vtkWin32OpenGLImageWindow::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkWin32OpenGLImageWindow *
vtkWin32OpenGLImageWindow::GetOutput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkWin32OpenGLImageWindow";
		CODE:
		RETVAL = THIS->GetOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkWin32OpenGLImageWindow::MakeCurrent()
		CODE:
		THIS->MakeCurrent();
		XSRETURN_EMPTY;


void
vtkWin32OpenGLImageWindow::MakeDefaultWindow()
		CODE:
		THIS->MakeDefaultWindow();
		XSRETURN_EMPTY;


static vtkWin32OpenGLImageWindow*
vtkWin32OpenGLImageWindow::New()
		CODE:
		RETVAL = vtkWin32OpenGLImageWindow::New();
		OUTPUT:
		RETVAL


void
vtkWin32OpenGLImageWindow::OpenGLInit()
		CODE:
		THIS->OpenGLInit();
		XSRETURN_EMPTY;


void
vtkWin32OpenGLImageWindow::Render()
		CODE:
		THIS->Render();
		XSRETURN_EMPTY;


void
vtkWin32OpenGLImageWindow::ResumeScreenRendering()
		CODE:
		THIS->ResumeScreenRendering();
		XSRETURN_EMPTY;


void
vtkWin32OpenGLImageWindow::SetPosition(arg1, arg2)
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetPosition(arg1, arg2);
		XSRETURN_EMPTY;


void
vtkWin32OpenGLImageWindow::SetSize(arg1, arg2)
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetSize(arg1, arg2);
		XSRETURN_EMPTY;


void
vtkWin32OpenGLImageWindow::SetWindowName(arg1)
		char *	arg1
		CODE:
		THIS->SetWindowName(arg1);
		XSRETURN_EMPTY;


void
vtkWin32OpenGLImageWindow::SetupMemoryRendering(x, y, prn)
		int 	x
		int 	y
		HDC 	prn
		CODE:
		THIS->SetupMemoryRendering(x, y, prn);
		XSRETURN_EMPTY;


void
vtkWin32OpenGLImageWindow::SetupPalette(hDC)
		HDC 	hDC
		CODE:
		THIS->SetupPalette(hDC);
		XSRETURN_EMPTY;


void
vtkWin32OpenGLImageWindow::SetupPixelFormat(hDC, dwFlags, debug, bpp, zbpp)
		HDC 	hDC
		DWORD 	dwFlags
		int 	debug
		int 	bpp
		int 	zbpp
		CODE:
		THIS->SetupPixelFormat(hDC, dwFlags, debug, bpp, zbpp);
		XSRETURN_EMPTY;


void
vtkWin32OpenGLImageWindow::SwapBuffers()
		CODE:
		THIS->SwapBuffers();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::Win32ImageWindow PREFIX = vtk

PROTOTYPES: DISABLE



void
vtkWin32ImageWindow::EraseWindow()
		CODE:
		THIS->EraseWindow();
		XSRETURN_EMPTY;


void
vtkWin32ImageWindow::Frame()
		CODE:
		THIS->Frame();
		XSRETURN_EMPTY;


const char *
vtkWin32ImageWindow::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


vtkWin32ImageWindow *
vtkWin32ImageWindow::GetOutput()
		PREINIT:
		char  CLASS[80] = "Graphics::VTK::vtkWin32ImageWindow";
		CODE:
		RETVAL = THIS->GetOutput();
		if(RETVAL != NULL){
			strcpy(CLASS,"Graphics::VTK::");
			strcat(CLASS,RETVAL->GetClassName()+3);
		}
		OUTPUT:
		RETVAL


void
vtkWin32ImageWindow::MakeDefaultWindow()
		CODE:
		THIS->MakeDefaultWindow();
		XSRETURN_EMPTY;


static vtkWin32ImageWindow*
vtkWin32ImageWindow::New()
		CODE:
		RETVAL = vtkWin32ImageWindow::New();
		OUTPUT:
		RETVAL


void
vtkWin32ImageWindow::ResumeScreenRendering()
		CODE:
		THIS->ResumeScreenRendering();
		XSRETURN_EMPTY;


void
vtkWin32ImageWindow::SetBackgroundColor(r, g, b)
		float 	r
		float 	g
		float 	b
		CODE:
		THIS->SetBackgroundColor(r, g, b);
		XSRETURN_EMPTY;


void
vtkWin32ImageWindow::SetPosition(arg1, arg2)
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetPosition(arg1, arg2);
		XSRETURN_EMPTY;


void
vtkWin32ImageWindow::SetSize(arg1, arg2)
		int 	arg1
		int 	arg2
		CODE:
		THIS->SetSize(arg1, arg2);
		XSRETURN_EMPTY;


void
vtkWin32ImageWindow::SetupMemoryRendering(x, y, prn)
		int 	x
		int 	y
		HDC 	prn
		CODE:
		THIS->SetupMemoryRendering(x, y, prn);
		XSRETURN_EMPTY;


void
vtkWin32ImageWindow::SwapBuffers()
		CODE:
		THIS->SwapBuffers();
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::Win32TextMapper PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkWin32TextMapper::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkWin32TextMapper*
vtkWin32TextMapper::New()
		CODE:
		RETVAL = vtkWin32TextMapper::New();
		OUTPUT:
		RETVAL


void
vtkWin32TextMapper::RenderOverlay(viewport, actor)
		vtkViewport *	viewport
		vtkActor2D *	actor
		CODE:
		THIS->RenderOverlay(viewport, actor);
		XSRETURN_EMPTY;

MODULE = Graphics::VTK::Imaging	PACKAGE = Graphics::VTK::Win32PolyDataMapper2D PREFIX = vtk

PROTOTYPES: DISABLE



const char *
vtkWin32PolyDataMapper2D::GetClassName()
		CODE:
		RETVAL = THIS->GetClassName();
		OUTPUT:
		RETVAL


static vtkWin32PolyDataMapper2D*
vtkWin32PolyDataMapper2D::New()
		CODE:
		RETVAL = vtkWin32PolyDataMapper2D::New();
		OUTPUT:
		RETVAL


void
vtkWin32PolyDataMapper2D::RenderOverlay(viewport, actor)
		vtkViewport *	viewport
		vtkActor2D *	actor
		CODE:
		THIS->RenderOverlay(viewport, actor);
		XSRETURN_EMPTY;

#endif


