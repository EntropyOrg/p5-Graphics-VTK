# Test Scipt for the Graphics::VTK package
#
#  This checks for the presence of a VTK_DATA environment 
#  variable, and then runs all the known-good example scripts
#
#

use Cwd; # to get the current pwd

my @scripts = (qw!
graphics/Decimate.pl
graphics/volSimple.pl
graphics/InputStr.pl
graphics/3DMorph.pl
graphics/CSpline.pl
graphics/CamBlur.pl
graphics/ColorSph.pl
graphics/TkRenderWidget.pl
graphics/quadricCut.pl
graphics/TestTubeCap.pl
graphics/polyViewer.pl
graphics/sphereFlake.pl

imaging/TkViewer.pl
imaging/TestTkImageWindowWidget.pl
imaging/xyPlot.pl

contrib/cubeAxes.pl
contrib/squadviewer.pl
contrib/subDivideTetra.pl

patented/3DMorph.pl
patented/TestGridSynchronizedTemplates3D.pl
patented/ParallelStream.pl
patented/financialField.pl
patented/financialField2.pl

pipeline/Cone.pl
pipeline/financialField.pl

!);


# Check for VTK_DATA environment variable
unless(defined($ENV{VTK_DATA})){
	die("Error VTK_DATA Environment variable not defined.\nVTK Test Data Should be Downloaded from the VTK website (www.kitware.com),\nand this environment variable set to its location to test this module\n");
}

my $pwd = cwd;

foreach my $script(@scripts){
	my ($dir,$scr) = split("/",$script);
	chdir "$pwd/examples/$dir";
	print "Running script $script. Press 'q' or Select File->Exit to Quit\n";
	my $command = "perl -Mblib -w $scr";
	system $command;
	
}

chdir $pwd;

