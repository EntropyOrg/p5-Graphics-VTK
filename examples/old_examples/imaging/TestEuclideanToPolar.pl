#!/usr/local/bin/perl -w
#
use Graphics::VTK;

# This Script test the euclidean to polar by coverting 2D vectors 
# from a gradient into polar, which is converted into HSV, and then to RGB.
$VTK_DATA = 0;
$VTK_DATA = $ENV{VTK_DATA};
#source vtkImageInclude.tcl
# Image pipeline
$gauss = Graphics::VTK::ImageGaussianSource->new;
$gauss->SetWholeExtent(0,255,0,255,0,44);
$gauss->SetCenter(127,127,22);
$gauss->SetStandardDeviation(50.0);
$gauss->SetMaximum(10000.0);
$gradient = Graphics::VTK::ImageGradient->new;
$gradient->SetInput($gauss->GetOutput);
$gradient->SetDimensionality(2);
$polar = Graphics::VTK::ImageEuclideanToPolar->new;
$polar->SetInput($gradient->GetOutput);
$polar->SetThetaMaximum(255);
$viewer = Graphics::VTK::ImageViewer->new;
#viewer DebugOn
$viewer->SetInput($polar->GetOutput);
$viewer->SetZSlice(22);
$viewer->SetColorWindow(255);
$viewer->SetColorLevel(127.5);
#make interface
do 'WindowLevelInterface.pl';
