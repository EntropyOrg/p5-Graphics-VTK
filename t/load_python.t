use Test::Most;

BEGIN { use_ok('Graphics::VTK', ':python' ) }


my $ren = vtk::vtkRenderer();
my $renWin = vtk::vtkRenderWindow();
$renWin->AddRenderer($ren);
my $WIDTH = 640;
my $HEIGHT = 480;
$renWin->SetSize($WIDTH,$HEIGHT);

# create a renderwindowinteractor
my $iren = vtk::vtkRenderWindowInteractor();
$iren->SetRenderWindow($renWin);

# create cone
my $cone = vtk::vtkConeSource();
$cone->SetResolution(60);
$cone->SetCenter(-2,0,0);

# mapper
my $coneMapper = vtk::vtkPolyDataMapper();
$coneMapper->SetInputConnection($cone->GetOutputPort());

# actor
my $coneActor = vtk::vtkActor();
$coneActor->SetMapper($coneMapper);

# assign actor to the renderer
$ren->AddActor($coneActor);

# enable user interface interactor
$iren->Initialize();
$renWin->Render();
$iren->Start();


done_testing;
