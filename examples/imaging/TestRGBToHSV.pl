#!/usr/local/bin/perl -w
#
use Graphics::VTK;

# Use the painter to draw using colors.
# This is not a pipeline object.  It will support pipeline objects.
# Please do not use this object directly.
$VTK_DATA = 0;
$VTK_DATA = $ENV{VTK_DATA};
#source vtkImageInclude.tcl
$canvas = Graphics::VTK::ImageCanvasSource2D->new;
$canvas->SetNumberOfScalarComponents(3);
$canvas->SetScalarType($Graphics::VTK::UNSIGNED_CHAR);
$canvas->SetExtent(0,320,0,320,0,0);
$canvas->SetDrawColor(0,0,0);
$canvas->FillBox(0,511,0,511);
# r, g, b
$canvas->SetDrawColor(255,0,0);
$canvas->FillBox(0,50,0,100);
$canvas->SetDrawColor(128,128,0);
$canvas->FillBox(50,100,0,100);
$canvas->SetDrawColor(0,255,0);
$canvas->FillBox(100,150,0,100);
$canvas->SetDrawColor(0,128,128);
$canvas->FillBox(150,200,0,100);
$canvas->SetDrawColor(0,0,255);
$canvas->FillBox(200,250,0,100);
$canvas->SetDrawColor(128,0,128);
$canvas->FillBox(250,300,0,100);
# intensity scale
$canvas->SetDrawColor(5,5,5);
$canvas->FillBox(0,50,110,210);
$canvas->SetDrawColor(55,55,55);
$canvas->FillBox(50,100,110,210);
$canvas->SetDrawColor(105,105,105);
$canvas->FillBox(100,150,110,210);
$canvas->SetDrawColor(155,155,155);
$canvas->FillBox(150,200,110,210);
$canvas->SetDrawColor(205,205,205);
$canvas->FillBox(200,250,110,210);
$canvas->SetDrawColor(255,255,255);
$canvas->FillBox(250,300,110,210);
# saturation scale
$canvas->SetDrawColor(245,0,0);
$canvas->FillBox(0,50,220,320);
$canvas->SetDrawColor(213,16,16);
$canvas->FillBox(50,100,220,320);
$canvas->SetDrawColor(181,32,32);
$canvas->FillBox(100,150,220,320);
$canvas->SetDrawColor(149,48,48);
$canvas->FillBox(150,200,220,320);
$canvas->SetDrawColor(117,64,64);
$canvas->FillBox(200,250,220,320);
$canvas->SetDrawColor(85,80,80);
$canvas->FillBox(250,300,220,320);
$convert = Graphics::VTK::ImageRGBToHSV->new;
$convert->SetInput($canvas->GetOutput);
$extract = Graphics::VTK::ImageExtractComponents->new;
$extract->SetInput($convert->GetOutput);
$extract->SetComponents(2);
$viewer = Graphics::VTK::ImageViewer->new;
$viewer->SetInput($extract->GetOutput);
$viewer->SetColorWindow(256);
$viewer->SetColorLevel(127.5);
#viewer SetInput [canvas GetOutput]
# make interface
do 'WindowLevelInterface.pl';
