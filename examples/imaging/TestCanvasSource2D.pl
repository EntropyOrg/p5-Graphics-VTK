#!/usr/local/bin/perl -w
#
use Graphics::VTK;

# Use the CanvasSource to draw using colors.
$VTK_DATA = 0;
$VTK_DATA = $ENV{VTK_DATA};
#source vtkImageInclude.tcl
$canvas = Graphics::VTK::ImageCanvasSource2D->new;
$canvas->SetNumberOfScalarComponents(3);
$canvas->SetScalarType($Graphics::VTK::UNSIGNED_CHAR);
$canvas->SetExtent(0,511,0,511,0,0);
$canvas->SetDrawColor(100,100,0);
$canvas->FillBox(0,511,0,511);
$canvas->SetDrawColor(200,0,200);
$canvas->FillBox(32,511,100,500);
$canvas->SetDrawColor(100,0,0);
$canvas->FillTube(550,20,30,400,5);
$canvas->SetDrawColor(255,255,255);
$canvas->DrawSegment3D(10,20,0,90,510,0);
$canvas->SetDrawColor(200,50,50);
$canvas->DrawSegment3D(510,90,0,10,20,0);
# Check segment clipping
$canvas->SetDrawColor(0,200,0);
$canvas->DrawSegment(-10,30,30,-10);
$canvas->DrawSegment(-10,481,30,521);
$canvas->DrawSegment(481,-10,521,30);
$canvas->DrawSegment(481,521,521,481);
# Check Filling a triangle
$canvas->SetDrawColor(20,200,200);
$canvas->FillTriangle(-100,100,190,150,40,300);
# Check drawing a circle
$canvas->SetDrawColor(250,250,10);
$canvas->DrawCircle(350,350,200.0);
# Check drawing a point
$canvas->SetDrawColor(250,250,250);
$canvas->DrawPoint(350,350);
$canvas->DrawPoint(350,550);
# Test filling functionality
$canvas->SetDrawColor(55,0,0);
$canvas->DrawCircle(450,350,80.0);
$canvas->SetDrawColor(100,255,100);
$canvas->FillPixel(450,350);
$viewer = Graphics::VTK::ImageViewer->new;
$viewer->SetInput($canvas->GetOutput);
$viewer->SetColorWindow(256);
$viewer->SetColorLevel(127.5);
# make interface
do 'WindowLevelInterface.pl';
