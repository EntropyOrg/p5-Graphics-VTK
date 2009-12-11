#!/usr/local/bin/perl -w
#
use Graphics::VTK;

$VTK_DATA = 0;
$VTK_DATA = $ENV{VTK_DATA};
# Make an image larger by repeating the data.  Tile.
#source vtkImageInclude.tcl
# Image pipeline
$reader = Graphics::VTK::ImageReader->new;
$reader->SetDataByteOrderToLittleEndian;
$reader->SetDataExtent(0,255,0,255,1,93);
$reader->SetDataVOI(100,255,100,255,1,93);
$reader->SetFilePrefix("$VTK_DATA/fullHead/headsq");
$reader->SetDataMask(0x7fff);
#reader ReleaseDataFlagOff
#reader DebugOn
$pad = Graphics::VTK::ImageMirrorPad->new;
$pad->SetInput($reader->GetOutput);
$pad->SetOutputWholeExtent(-220,340,-220,340,0,92);
$pad->SetOutputNumberOfScalarComponents(3);
$viewer = Graphics::VTK::ImageViewer->new;
$viewer->SetInput($pad->GetOutput);
$viewer->SetZSlice(22);
$viewer->SetColorWindow(2000);
$viewer->SetColorLevel(1000);
$viewer->GetActor2D->SetDisplayPosition(220,220);
#make interface
do 'WindowLevelInterface.pl';
