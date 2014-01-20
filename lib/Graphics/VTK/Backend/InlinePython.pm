package Graphics::VTK::Backend::InlinePython;

use strict;
use warnings;

use Inline Python => <<'END';
import vtk

class vtkProxy(object):
  def __init__(self, target):
    self._target = target
    self._majorVersion = vtk.vtkVersion().GetVTKMajorVersion()

  def __getattr__(self, aname):
    target = self._target
    f = getattr(target, aname)

    def wrap_it(*args):
      u_args_l = []; # final arguments
      for arg in args:
        if isinstance(arg, vtkProxy):
          # unwrap vtkProxy for calling
	  arg = arg._target
	u_args_l.append( arg ) 
      u_args = tuple(u_args_l)

      # proxy the return value
      return vtkProxy(f(*u_args))

    return wrap_it

my_vtk = vtkProxy(vtk)
END

sub AUTOLOAD {
    (my $call = our $AUTOLOAD) =~ s/.*:://;

    # check if syntax is correct
    die "Not a Python identifier: $call" unless( $call =~ /^[^\d\W]\w*\Z/ );

    Inline::Python::py_eval("my_vtk.$call()", 0);
}

1;
