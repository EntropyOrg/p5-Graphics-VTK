#!/usr/local/bin/perl -w
#
use Graphics::VTK;

# Show the constant kernel.  Smooth an impulse function.
$VTK_DATA = 0;
$VTK_DATA = $ENV{VTK_DATA};
#source vtkImageInclude.tcl
$canvas = Graphics::VTK::ImageCanvasSource2D->new;
$canvas->SetScalarType($Graphics::VTK::FLOAT);
$canvas->SetExtent(0,255,0,255,0,0);
# back ground zero
$canvas->SetDrawColor(0);
$canvas->FillBox(0,255,0,255);
$canvas->SetDrawColor(255);
$canvas->FillBox(30,225,30,225);
$canvas->SetDrawColor(0);
$canvas->FillBox(60,195,60,195);
$canvas->SetDrawColor(255);
$canvas->FillTube(100,100,154,154,40.0);
$canvas->SetDrawColor(0);
$canvas->DrawSegment(45,45,45,210);
$canvas->DrawSegment(45,210,210,210);
$canvas->DrawSegment(210,210,210,45);
$canvas->DrawSegment(210,45,45,45);
$canvas->DrawSegment(100,150,150,100);
$canvas->DrawSegment(110,160,160,110);
$canvas->DrawSegment(90,140,140,90);
$canvas->DrawSegment(120,170,170,120);
$canvas->DrawSegment(80,130,130,80);
$shotNoiseAmplitude = 255.0;
$shotNoiseFraction = 0.1;
$shotNoiseExtent = "0 255 0 255 0 0";
$shotNoiseSource = Graphics::VTK::ImageNoiseSource->new;
$shotNoiseSource->SetWholeExtent($shotNoiseExtent);
$shotNoiseSource->SetMinimum(0.0);
$shotNoiseSource->SetMaximum(1.0);
$shotNoiseSource->ReleaseDataFlagOff;
$shotNoiseThresh1 = Graphics::VTK::ImageThreshold->new;
$shotNoiseThresh1->SetInput($shotNoiseSource->GetOutput);
$shotNoiseThresh1->ThresholdByLower(1.0 - $shotNoiseFraction);
$shotNoiseThresh1->SetInValue(0);
$shotNoiseThresh1->SetOutValue($shotNoiseAmplitude);
$shotNoiseThresh2 = Graphics::VTK::ImageThreshold->new;
$shotNoiseThresh2->SetInput($shotNoiseSource->GetOutput);
$shotNoiseThresh2->ThresholdByLower($shotNoiseFraction);
$shotNoiseThresh2->SetInValue(-$shotNoiseAmplitude);
$shotNoiseThresh2->SetOutValue(0.0);
$shotNoise = Graphics::VTK::ImageMathematics->new;
$shotNoise->SetInput1($shotNoiseThresh1->GetOutput);
$shotNoise->SetInput2($shotNoiseThresh2->GetOutput);
$shotNoise->SetOperationToAdd;
$add = Graphics::VTK::ImageMathematics->new;
$add->SetInput1($shotNoise->GetOutput);
$add->SetInput2($canvas->GetOutput);
$add->SetOperationToAdd;
$median = Graphics::VTK::ImageMedian3D->new;
$median->SetInput($add->GetOutput);
$median->SetKernelSize(3,3,1);
$hybrid1 = Graphics::VTK::ImageHybridMedian2D->new;
$hybrid1->SetInput($add->GetOutput);
$hybrid2 = Graphics::VTK::ImageHybridMedian2D->new;
$hybrid2->SetInput($hybrid1->GetOutput);
$viewer = Graphics::VTK::ImageViewer->new;
$viewer->SetInput($hybrid1->GetOutput);
$viewer->SetColorWindow(256);
$viewer->SetColorLevel(127.5);
do 'WindowLevelInterface.pl';
