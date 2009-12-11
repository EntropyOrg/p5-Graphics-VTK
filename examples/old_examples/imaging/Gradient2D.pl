#!/usr/local/bin/perl -w
#
use Graphics::VTK;

# This Script test the euclidean to polar by coverting 2D vectors 
# from a gradient into polar, which is converted into HSV, and then to RGB.
$VTK_DATA = 0;
$VTK_DATA = $ENV{VTK_DATA};
#source vtkImageInclude.tcl
# Image pipeline
$reader = Graphics::VTK::ImageReader->new;
#reader DebugOn
$reader->SetDataByteOrderToLittleEndian;
$reader->SetDataExtent(0,255,0,255,1,93);
$reader->SetFilePrefix("$VTK_DATA/fullHead/headsq");
$reader->SetDataMask(0x7fff);
$ellipsoid = Graphics::VTK::ImageEllipsoidSource->new;
$ellipsoid->SetWholeExtent(0,255,0,255,0,44);
$ellipsoid->SetCenter(127,127,22);
$ellipsoid->SetRadius(100,100,100);
$ellipsoid->SetOutValue(0);
$ellipsoid->SetInValue(200);
$ellipsoid->SetOutputScalarType($Graphics::VTK::FLOAT);
$gauss = Graphics::VTK::ImageGaussianSource->new;
$gauss->SetWholeExtent(0,255,0,255,0,44);
$gauss->SetCenter(127,127,22);
$gauss->SetStandardDeviation(50.0);
$gauss->SetMaximum(8000.0);
$gradient = Graphics::VTK::ImageGradient->new;
$gradient->SetInput($reader->GetOutput);
#gradient SetInput [ellipsoid GetOutput]
#gradient SetInput [gauss GetOutput]
$gradient->SetDimensionality(2);
$gradient->ReleaseDataFlagOff;
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
#viewer DebugOn
$viewer->SetInput($rgb->GetOutput);
$viewer->SetZSlice(22);
$viewer->SetColorWindow(255);
$viewer->SetColorLevel(127.5);
$viewer->Render;
$wtoif = Graphics::VTK::WindowToImageFilter->new;
$wtoif->SetInput($viewer->GetImageWindow);
$psWriter = Graphics::VTK::PostScriptWriter->new;
$psWriter->SetInput($wtoif->GetOutput);
$psWriter->SetFileName('junk.ps');
$psWriter->Write;
#make interface
do 'WindowLevelInterface.pl';
