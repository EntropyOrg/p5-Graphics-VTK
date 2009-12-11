#!/usr/local/bin/perl -w
#
use Graphics::VTK;

# This Script test the euclidean to polar by coverting 2D vectors 
# from a gradient into polar, which is converted into HSV, and then to RGB.
$VTK_DATA = 0;
$VTK_DATA = $ENV{VTK_DATA};
#source vtkImageInclude.tcl
$reader = Graphics::VTK::ImageReader->new;
$reader->SetDataByteOrderToLittleEndian;
$reader->SetDataExtent(0,255,0,255,1,93);
$reader->SetFilePrefix("$VTK_DATA/fullHead/headsq");
$reader->SetDataMask(0x7fff);
$cast = Graphics::VTK::ImageCast->new;
$cast->SetInput($reader->GetOutput);
$cast->SetOutputScalarTypeToFloat;
$magnify = Graphics::VTK::ImageMagnify->new;
$magnify->SetInput($cast->GetOutput);
$magnify->SetMagnificationFactors(2,2,1);
$magnify->InterpolateOn;
# remove high freqeuncy artifacts due to linear interpolation
$smooth = Graphics::VTK::ImageGaussianSmooth->new;
$smooth->SetInput($magnify->GetOutput);
$smooth->SetDimensionality(2);
$smooth->SetStandardDeviations(1.5,1.5,0);
$smooth->SetRadiusFactors(2.01,2.01,0);
$gradient = Graphics::VTK::ImageGradient->new;
$gradient->SetInput($smooth->GetOutput);
$gradient->SetDimensionality(2);
$polar = Graphics::VTK::ImageEuclideanToPolar->new;
$polar->SetInput($gradient->GetOutput);
$polar->SetThetaMaximum(255);
$pad = Graphics::VTK::ImageConstantPad->new;
$pad->SetInput($polar->GetOutput);
$pad->SetOutputNumberOfScalarComponents(3);
$pad->SetConstant(200);
# permute components so saturation will be constant
$permute = Graphics::VTK::ImageExtractComponents->new;
$permute->SetInput($pad->GetOutput);
$permute->SetComponents(0,2,1);
$rgb = Graphics::VTK::ImageHSVToRGB->new;
$rgb->SetInput($permute->GetOutput);
$rgb->SetMaximum(255);
$viewer = Graphics::VTK::ImageViewer->new;
$viewer->SetInput($rgb->GetOutput);
$viewer->SetZSlice(22);
$viewer->SetColorWindow(255);
$viewer->SetColorLevel(127);
#make interface
do 'WindowLevelInterface.pl';
