#!/usr/local/bin/perl -w
#
use Graphics::VTK;



use Tk;
use Graphics::VTK::Tk;
$MW = Tk::MainWindow->new;


# This simple example shows how to render a very large image (i.e., one
# that cannot fit on the screen).


# We start off by loading some Tcl modules. One is the basic VTK library
# the second is a package for rendering, and the last includes a set
# of color definitions.

$VTK_DATA_ROOT = 0;
$VTK_DATA_ROOT = $ENV{VTK_DATA_ROOT};
use Graphics::VTK::Tk::vtkInt;
use Graphics::VTK::Colors;

# We'll import some data to start. Since we are using an importer, we've
# got to give it a render window and such. Note that the render window 
# size is set fairly small.
$ren = Graphics::VTK::Renderer->new;
$ren->SetBackground(0.1,0.2,0.4);
$renWin = Graphics::VTK::RenderWindow->new;
$renWin->AddRenderer($ren);
$renWin->SetSize(125,125);
$iren = Graphics::VTK::RenderWindowInteractor->new;
$iren->SetRenderWindow($renWin);

$importer = Graphics::VTK::3DSImporter->new;
$importer->SetRenderWindow($renWin);
$importer->SetFileName("$VTK_DATA_ROOT/Data/Viewpoint/iflamigm.3ds");
$importer->ComputeNormalsOn;
$importer->Read;

# We'll set up the view we want.

$ren->GetActiveCamera->SetPosition(0,1,0);
$ren->GetActiveCamera->SetFocalPoint(0,0,0);
$ren->GetActiveCamera->SetViewUp(0,0,1);

# Let the renderer compute a good position and focal point.

$ren->ResetCamera;
$ren->GetActiveCamera->Dolly(1.4);
$ren->ResetCameraClippingRange;

# render the large image

$iren->AddObserver('UserEvent',
 sub
  {
   $MW->{'.vtkInteract'}->deiconify;
  }
);
$MW->withdraw;

# Here we request that the large image is four times bigger than the
# renderers image.

$renderLarge = Graphics::VTK::RenderLargeImage->new;
$renderLarge->SetInput($ren);
$renderLarge->SetMagnification(4);

# We write out the image which causes the rendering to occur. If you
# watch your screen you will see the pieces being rendered right after 
# one another.

$writer = Graphics::VTK::TIFFWriter->new;
$writer->SetInput($renderLarge->GetOutput);
$writer->SetFileName('largeImage.tif');
$writer->Write;

Graphics::VTK::Tk::vtkInt::vtkInteract($MW);

Tk->MainLoop;
