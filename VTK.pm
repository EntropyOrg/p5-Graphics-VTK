package Graphics::VTK;
use 5.004;
use strict;
use Carp;
use vars qw/ $VERSION /;

# Load the Real Libs:
use Graphics::VTK::Common;
use Graphics::VTK::Graphics;
use Graphics::VTK::Contrib;
use Graphics::VTK::Imaging;
use Graphics::VTK::Patented;

$VERSION = '3.2.001';

# VTK Pre-defined Constants:
$Graphics::VTK::ABS = 9;
$Graphics::VTK::ACCUMULATION_MODE_MAX = 1;
$Graphics::VTK::ACCUMULATION_MODE_MIN = 0;
$Graphics::VTK::ACCUMULATION_MODE_SUM = 2;
$Graphics::VTK::ADD = 0;
$Graphics::VTK::ADDC = 17;
$Graphics::VTK::AND = 0;
$Graphics::VTK::ARIAL = 0;
$Graphics::VTK::ARROW_GLYPH = 9;
$Graphics::VTK::ASCII = 1;
$Graphics::VTK::ATAN = 14;
$Graphics::VTK::ATAN2 = 15;
$Graphics::VTK::ATTRIBUTE_MODE_DEFAULT = 0;
$Graphics::VTK::ATTRIBUTE_MODE_USE_CELL_DATA = 2;
$Graphics::VTK::ATTRIBUTE_MODE_USE_POINT_DATA = 1;
$Graphics::VTK::BACKGROUND_LOCATION = 0;
$Graphics::VTK::BINARY = 2;
$Graphics::VTK::BIT = 1;
$Graphics::VTK::BIT_MAX = 1;
$Graphics::VTK::BIT_MIN = 0;
$Graphics::VTK::BLEND_MODE_COMPOSITE = 0;
$Graphics::VTK::BLEND_MODE_MAX_INTENSITY = 1;
$Graphics::VTK::BLEND_MODE_MIN_INTENSITY = 2;
$Graphics::VTK::BOUNDS_TAG = 60;
$Graphics::VTK::BREAK_RMI_TAG = 239954;
$Graphics::VTK::BUILD_VERSION = 0;
$Graphics::VTK::CELL_DATA = 0;
$Graphics::VTK::CELL_DATA_FIELD = 2;
$Graphics::VTK::CELL_ID_TAG = 10;
$Graphics::VTK::CELL_MODE = 1;
$Graphics::VTK::CELL_SIZE = 512;
$Graphics::VTK::CHAR = 2;
$Graphics::VTK::CHAR_MAX = 127;
$Graphics::VTK::CIRCLE_GLYPH = 7;
$Graphics::VTK::COLOR_BY_INPUT = 0;
$Graphics::VTK::COLOR_BY_SCALAR = 1;
$Graphics::VTK::COLOR_BY_SCALE = 0;
$Graphics::VTK::COLOR_BY_SOURCE = 1;
$Graphics::VTK::COLOR_BY_VECTOR = 2;
$Graphics::VTK::COLOR_MODE_DEFAULT = 0;
$Graphics::VTK::COLOR_MODE_LINEAR_256 = 1;
$Graphics::VTK::COLOR_MODE_LUMINANCE = 2;
$Graphics::VTK::COLOR_MODE_LUT = 0;
$Graphics::VTK::COLOR_MODE_MAP_SCALARS = 1;
$Graphics::VTK::COLOR_MODE_RANDOM_COLORS = 2;
$Graphics::VTK::COLOR_MODE_SPECIFIED_COLOR = 1;
$Graphics::VTK::COMPLEX_MULTIPLY = 19;
$Graphics::VTK::COMPOSITE_CLASSIFY_FIRST = 0;
$Graphics::VTK::COMPOSITE_INTERPOLATE_FIRST = 1;
$Graphics::VTK::CONJUGATE = 18;
$Graphics::VTK::COS = 6;
$Graphics::VTK::COURIER = 1;
$Graphics::VTK::CROSS_GLYPH = 3;
$Graphics::VTK::CTF_HSV = 1;
$Graphics::VTK::CTF_RGB = 0;
$Graphics::VTK::CULLER_SORT_BACK_TO_FRONT = 2;
$Graphics::VTK::CULLER_SORT_FRONT_TO_BACK = 1;
$Graphics::VTK::CULLER_SORT_NONE = 0;
$Graphics::VTK::CURSOR_TYPE_CROSSHAIR = 0;
$Graphics::VTK::CURSOR_TYPE_PLANE = 1;
$Graphics::VTK::DASH_GLYPH = 2;
$Graphics::VTK::DATA_OBJECT = 7;
$Graphics::VTK::DATA_OBJECT_FIELD = 0;
$Graphics::VTK::DATA_SCALING_OFF = 3;
$Graphics::VTK::DATA_SET = 8;
$Graphics::VTK::DIAMOND_GLYPH = 8;
$Graphics::VTK::DICE_MODE_MEMORY_LIMIT = 2;
$Graphics::VTK::DICE_MODE_NUMBER_OF_POINTS = 0;
$Graphics::VTK::DICE_MODE_SPECIFIED_NUMBER = 1;
$Graphics::VTK::DIFFERENCE = 2;
$Graphics::VTK::DIRECTION_BACK_TO_FRONT = 0;
$Graphics::VTK::DIRECTION_FRONT_TO_BACK = 1;
$Graphics::VTK::DIRECTION_SPECIFIED_VECTOR = 2;
$Graphics::VTK::DISPLAY = 0;
$Graphics::VTK::DIVIDE = 3;
$Graphics::VTK::DOUBLE = 11;
$Graphics::VTK::DOUBLE_MAX = 1;
$Graphics::VTK::EMPTY_CELL = 0;
$Graphics::VTK::EXP = 7;
$Graphics::VTK::EXTRACT_ALL_REGIONS = 5;
$Graphics::VTK::EXTRACT_CELL_SEEDED_REGIONS = 2;
$Graphics::VTK::EXTRACT_CLOSEST_POINT_REGION = 6;
$Graphics::VTK::EXTRACT_COMPONENT = 0;
$Graphics::VTK::EXTRACT_DETERMINANT = 2;
$Graphics::VTK::EXTRACT_EFFECTIVE_STRESS = 1;
$Graphics::VTK::EXTRACT_LARGEST_REGION = 4;
$Graphics::VTK::EXTRACT_POINT_SEEDED_REGIONS = 1;
$Graphics::VTK::EXTRACT_SPECIFIED_REGIONS = 3;
$Graphics::VTK::FILE_BYTE_ORDER_BIG_ENDIAN = 0;
$Graphics::VTK::FILE_BYTE_ORDER_LITTLE_ENDIAN = 1;
$Graphics::VTK::FLAT = 0;
$Graphics::VTK::FLOAT = 10;
$Graphics::VTK::FLY_CLOSEST_TRIAD = 1;
$Graphics::VTK::FLY_OUTER_EDGES = 0;
$Graphics::VTK::FOREGROUND_LOCATION = 1;
$Graphics::VTK::FRAMEBUFFER_VOLUME_MAPPER = 1;
$Graphics::VTK::GOURAUD = 1;
$Graphics::VTK::GRID_CUBIC = 3;
$Graphics::VTK::GRID_LINEAR = 1;
$Graphics::VTK::GRID_NEAREST = 0;
$Graphics::VTK::HEXAHEDRON = 12;
$Graphics::VTK::HOOKEDARROW_GLYPH = 11;
$Graphics::VTK::IMAGE_BLEND_MODE_COMPOUND = 1;
$Graphics::VTK::IMAGE_BLEND_MODE_NORMAL = 0;
$Graphics::VTK::IMAGE_DATA = 6;
$Graphics::VTK::IMAGE_DATA_STREAMER_BLOCK_MODE = 3;
$Graphics::VTK::IMAGE_DATA_STREAMER_X_SLAB_MODE = 0;
$Graphics::VTK::IMAGE_DATA_STREAMER_Y_SLAB_MODE = 1;
$Graphics::VTK::IMAGE_DATA_STREAMER_Z_SLAB_MODE = 2;
$Graphics::VTK::IMAGE_NON_MAXIMUM_SUPPRESSION_MAGNITUDE_INPUT = 0;
$Graphics::VTK::IMAGE_NON_MAXIMUM_SUPPRESSION_VECTOR_INPUT = 1;
$Graphics::VTK::IMAGE_VIEWER_LOWER_LEFT = 1;
$Graphics::VTK::IMAGE_VIEWER_UPPER_LEFT = 0;
$Graphics::VTK::INDEXING_BY_SCALAR = 1;
$Graphics::VTK::INDEXING_BY_VECTOR = 2;
$Graphics::VTK::INDEXING_OFF = 0;
$Graphics::VTK::INSIDE_CLOSEST_POINT_REGION = 2;
$Graphics::VTK::INSIDE_LARGEST_REGION = 1;
$Graphics::VTK::INSIDE_SMALLEST_REGION = 0;
$Graphics::VTK::INT = 6;
$Graphics::VTK::INTEGRATE_BACKWARD = 1;
$Graphics::VTK::INTEGRATE_BOTH_DIRECTIONS = 2;
$Graphics::VTK::INTEGRATE_FORWARD = 0;
$Graphics::VTK::INTERACTOR_STYLE_ACTOR_NONE = 0;
$Graphics::VTK::INTERACTOR_STYLE_ACTOR_PAN = 2;
$Graphics::VTK::INTERACTOR_STYLE_ACTOR_ROTATE = 1;
$Graphics::VTK::INTERACTOR_STYLE_ACTOR_SCALE = 5;
$Graphics::VTK::INTERACTOR_STYLE_ACTOR_SPIN = 4;
$Graphics::VTK::INTERACTOR_STYLE_ACTOR_ZOOM = 3;
$Graphics::VTK::INTERACTOR_STYLE_CAMERA_NONE = 0;
$Graphics::VTK::INTERACTOR_STYLE_CAMERA_PAN = 2;
$Graphics::VTK::INTERACTOR_STYLE_CAMERA_ROTATE = 1;
$Graphics::VTK::INTERACTOR_STYLE_CAMERA_SPIN = 4;
$Graphics::VTK::INTERACTOR_STYLE_CAMERA_ZOOM = 3;
$Graphics::VTK::INTERSECTION = 1;
$Graphics::VTK::INVERT = 4;
$Graphics::VTK::IV_COLUMN = 0;
$Graphics::VTK::IV_ROW = 1;
$Graphics::VTK::LABEL_FIELD_DATA = 6;
$Graphics::VTK::LABEL_IDS = 0;
$Graphics::VTK::LABEL_NORMALS = 3;
$Graphics::VTK::LABEL_SCALARS = 1;
$Graphics::VTK::LABEL_TCOORDS = 4;
$Graphics::VTK::LABEL_TENSORS = 5;
$Graphics::VTK::LABEL_VECTORS = 2;
$Graphics::VTK::LANDMARK_RIGIDBODY = 6;
$Graphics::VTK::LANDMARK_SIMILARITY = 7;
$Graphics::VTK::LARGE_FLOAT = 1;
$Graphics::VTK::LARGE_INTEGER = 2147483647;
$Graphics::VTK::LIGHT_TYPE_CAMERA_LIGHT = 2;
$Graphics::VTK::LIGHT_TYPE_HEADLIGHT = 1;
$Graphics::VTK::LIGHT_TYPE_SCENE_LIGHT = 3;
$Graphics::VTK::LINE = 3;
$Graphics::VTK::LINEAR_INTERPOLATION = 1;
$Graphics::VTK::LOG = 8;
$Graphics::VTK::LOG_EVENT_LENGTH = 40;
$Graphics::VTK::LONG = 8;
$Graphics::VTK::LUMINANCE = 1;
$Graphics::VTK::LUMINANCE_ALPHA = 2;
$Graphics::VTK::MAJOR_VERSION = 3;
$Graphics::VTK::MAX = 13;
$Graphics::VTK::MAXIMIZE_OPACITY = 1;
$Graphics::VTK::MAXIMIZE_SCALAR_VALUE = 0;
$Graphics::VTK::MAX_LABELS = 25;
$Graphics::VTK::MAX_SHADING_TABLES = 100;
$Graphics::VTK::MAX_SPATIAL_REP_LEVEL = 24;
$Graphics::VTK::MAX_SPHERE_RESOLUTION = 1024;
$Graphics::VTK::MAX_SUPERQUADRIC_RESOLUTION = 1024;
$Graphics::VTK::MAX_THREADS = 1;
$Graphics::VTK::MAX_VIEW_RAYS_LEVEL = 4;
$Graphics::VTK::MIL_CCIR = 2;
$Graphics::VTK::MIL_COMPOSITE = 1;
$Graphics::VTK::MIL_CORONA = 4;
$Graphics::VTK::MIL_DEFAULT = 0;
$Graphics::VTK::MIL_DIGITAL = 4;
$Graphics::VTK::MIL_GENESIS = 6;
$Graphics::VTK::MIL_METEOR = 1;
$Graphics::VTK::MIL_METEOR_II = 2;
$Graphics::VTK::MIL_METEOR_II_DIG = 3;
$Graphics::VTK::MIL_MONO = 0;
$Graphics::VTK::MIL_NONSTANDARD = 5;
$Graphics::VTK::MIL_NTSC = 1;
$Graphics::VTK::MIL_PAL = 3;
$Graphics::VTK::MIL_PULSAR = 5;
$Graphics::VTK::MIL_RGB = 3;
$Graphics::VTK::MIL_RS170 = 0;
$Graphics::VTK::MIL_SECAM = 4;
$Graphics::VTK::MIL_YC = 2;
$Graphics::VTK::MIN = 12;
$Graphics::VTK::MINOR_VERSION = 2;
$Graphics::VTK::MP_CONTROLLER_MAX_PROCESSES = 1024;
$Graphics::VTK::MP_CONTROLLER_RMI_ARG_TAG = 315168;
$Graphics::VTK::MP_CONTROLLER_RMI_TAG = 315167;
$Graphics::VTK::MULTIPLY = 2;
$Graphics::VTK::MULTIPLYBYK = 16;
$Graphics::VTK::MULTI_PROCESS_LOG_MAX = 1000;
$Graphics::VTK::NAND = 3;
$Graphics::VTK::NEAREST_INTERPOLATION = 0;
$Graphics::VTK::NOP = 6;
$Graphics::VTK::NOR = 4;
$Graphics::VTK::NORMALIZED_DISPLAY = 1;
$Graphics::VTK::NORMALIZED_VIEWPORT = 3;
$Graphics::VTK::NORMAL_EXTRUSION = 2;
$Graphics::VTK::NOT = 5;
$Graphics::VTK::NO_GLYPH = 0;
$Graphics::VTK::NUMBER_STATISTICS = 12;
$Graphics::VTK::NUM_CELLS_TAG = 40;
$Graphics::VTK::NUM_POINTS_TAG = 30;
$Graphics::VTK::OR = 1;
$Graphics::VTK::ORIENT_HORIZONTAL = 0;
$Graphics::VTK::ORIENT_VERTICAL = 1;
$Graphics::VTK::PARAMETRIC_CURVE = 51;
$Graphics::VTK::PARAMETRIC_SURFACE = 52;
$Graphics::VTK::PHONG = 2;
$Graphics::VTK::PIECES_EXTENT = 0;
$Graphics::VTK::PIECEWISE_FUNCTION = 5;
$Graphics::VTK::PIXEL = 8;
$Graphics::VTK::PLOT_FIELD_DATA = 6;
$Graphics::VTK::PLOT_NORMALS = 3;
$Graphics::VTK::PLOT_SCALARS = 1;
$Graphics::VTK::PLOT_TCOORDS = 4;
$Graphics::VTK::PLOT_TENSORS = 5;
$Graphics::VTK::PLOT_VECTORS = 2;
$Graphics::VTK::POINTS = 0;
$Graphics::VTK::POINT_COORDS_TAG = 20;
$Graphics::VTK::POINT_DATA = 1;
$Graphics::VTK::POINT_DATA_FIELD = 1;
$Graphics::VTK::POINT_EXTRUSION = 3;
$Graphics::VTK::POINT_SHELL = 0;
$Graphics::VTK::POINT_UNIFORM = 1;
$Graphics::VTK::POLYGON = 7;
$Graphics::VTK::POLY_DATA = 0;
$Graphics::VTK::POLY_DATA_TAG = 50;
$Graphics::VTK::POLY_LINE = 4;
$Graphics::VTK::POLY_VERTEX = 2;
$Graphics::VTK::PORT_DATA_TRANSFER_TAG = 98974;
$Graphics::VTK::PORT_DOWN_DATA_TIME_TAG = 98970;
$Graphics::VTK::PORT_INFORMATION_TRANSFER_TAG = 98973;
$Graphics::VTK::PORT_NEW_DATA_TIME_TAG = 98975;
$Graphics::VTK::PORT_TRANSFER_NEEDED_TAG = 98972;
$Graphics::VTK::PORT_UPDATE_EXTENT_TAG = 98971;
$Graphics::VTK::PYRAMID = 14;
$Graphics::VTK::QUAD = 9;
$Graphics::VTK::RAYCAST_VOLUME_MAPPER = 0;
$Graphics::VTK::RBF_CUSTOM = 0;
$Graphics::VTK::RBF_R = 1;
$Graphics::VTK::RBF_R2LOGR = 2;
$Graphics::VTK::RECTILINEAR_GRID = 3;
$Graphics::VTK::REPLACECBYK = 20;
$Graphics::VTK::RESLICE_CUBIC = 3;
$Graphics::VTK::RESLICE_LINEAR = 1;
$Graphics::VTK::RESLICE_NEAREST = 0;
$Graphics::VTK::RESOLVE_OFF = 0;
$Graphics::VTK::RESOLVE_POLYGON_OFFSET = 1;
$Graphics::VTK::RESOLVE_SHIFT_ZBUFFER = 2;
$Graphics::VTK::RGB = 3;
$Graphics::VTK::RGBA = 4;
$Graphics::VTK::RULED_MODE_POINT_WALK = 1;
$Graphics::VTK::RULED_MODE_RESAMPLE = 0;
$Graphics::VTK::SCALAR_MODE_DEFAULT = 0;
$Graphics::VTK::SCALAR_MODE_USE_CELL_DATA = 2;
$Graphics::VTK::SCALAR_MODE_USE_POINT_DATA = 1;
$Graphics::VTK::SCALE_BY_SCALAR = 0;
$Graphics::VTK::SCALE_BY_VECTOR = 1;
$Graphics::VTK::SCALE_BY_VECTORCOMPONENTS = 2;
$Graphics::VTK::SHORT = 4;
$Graphics::VTK::SHORT_MAX = 32767;
$Graphics::VTK::SIN = 5;
$Graphics::VTK::SINGLE_POINT = 1;
$Graphics::VTK::SOFTWAREBUFFER_VOLUME_MAPPER = 2;
$Graphics::VTK::SORT_BY_CELL = 1;
$Graphics::VTK::SORT_BY_VALUE = 0;
$Graphics::VTK::SQR = 10;
$Graphics::VTK::SQRT = 11;
$Graphics::VTK::SQUARE_GLYPH = 6;
$Graphics::VTK::STEREO_CRYSTAL_EYES = 1;
$Graphics::VTK::STEREO_DRESDEN = 6;
$Graphics::VTK::STEREO_INTERLACED = 3;
$Graphics::VTK::STEREO_LEFT = 4;
$Graphics::VTK::STEREO_RED_BLUE = 2;
$Graphics::VTK::STEREO_RIGHT = 5;
$Graphics::VTK::STRUCTURED_GRID = 2;
$Graphics::VTK::STRUCTURED_POINTS = 1;
$Graphics::VTK::STYLE_PIXELIZE = 0;
$Graphics::VTK::STYLE_POLYGONALIZE = 1;
$Graphics::VTK::STYLE_RUN_LENGTH = 2;
$Graphics::VTK::SUBTRACT = 1;
$Graphics::VTK::SURFACE = 2;
$Graphics::VTK::TENSOR_MODE_COMPUTE_GRADIENT = 1;
$Graphics::VTK::TENSOR_MODE_COMPUTE_STRAIN = 2;
$Graphics::VTK::TENSOR_MODE_PASS_TENSORS = 0;
$Graphics::VTK::TETRA = 10;
$Graphics::VTK::TEXTURE_QUALITY_16BIT = 16;
$Graphics::VTK::TEXTURE_QUALITY_32BIT = 32;
$Graphics::VTK::TEXTURE_QUALITY_DEFAULT = 0;
$Graphics::VTK::TEXT_BOTTOM = 0;
$Graphics::VTK::TEXT_CENTERED = 1;
$Graphics::VTK::TEXT_LEFT = 0;
$Graphics::VTK::TEXT_RIGHT = 2;
$Graphics::VTK::TEXT_TOP = 2;
$Graphics::VTK::THICKARROW_GLYPH = 10;
$Graphics::VTK::THICKCROSS_GLYPH = 4;
$Graphics::VTK::THREAD_RETURN_VALUE = 0;
$Graphics::VTK::THREAD_SAFE_LOG_MAX = 1000;
$Graphics::VTK::TIMES = 2;
$Graphics::VTK::TOL = 1;
$Graphics::VTK::TRIANGLE = 5;
$Graphics::VTK::TRIANGLE_GLYPH = 5;
$Graphics::VTK::TRIANGLE_STRIP = 6;
$Graphics::VTK::UNCHANGED = 0;
$Graphics::VTK::UNION = 0;
$Graphics::VTK::UNION_OF_MAGNITUDES = 3;
$Graphics::VTK::UNSIGNED_CHAR = 3;
$Graphics::VTK::UNSIGNED_CHAR_MAX = 255;
$Graphics::VTK::UNSIGNED_CHAR_MIN = 0;
$Graphics::VTK::UNSIGNED_INT = 7;
$Graphics::VTK::UNSIGNED_INT_MIN = 0;
$Graphics::VTK::UNSIGNED_LONG = 9;
$Graphics::VTK::UNSIGNED_LONG_MIN = 0;
$Graphics::VTK::UNSIGNED_SHORT = 5;
$Graphics::VTK::UNSIGNED_SHORT_MAX = 65535;
$Graphics::VTK::UNSIGNED_SHORT_MIN = 0;
$Graphics::VTK::UNSTRUCTURED_GRID = 4;
$Graphics::VTK::USERDEFINED = 6;
$Graphics::VTK::USE_CONTRIB = 1;
$Graphics::VTK::USE_GRAPHICS = 1;
$Graphics::VTK::USE_IMAGING = 1;
$Graphics::VTK::USE_MESA = 1;
$Graphics::VTK::USE_NORMAL = 1;
$Graphics::VTK::USE_PATENTED = 1;
$Graphics::VTK::USE_PTHREADS = 1;
$Graphics::VTK::USE_TKWIDGET = 1;
$Graphics::VTK::USE_VECTOR = 0;
$Graphics::VTK::VARY_RADIUS_BY_SCALAR = 1;
$Graphics::VTK::VARY_RADIUS_BY_VECTOR = 2;
$Graphics::VTK::VARY_RADIUS_OFF = 0;
$Graphics::VTK::VECTOR_EXTRUSION = 1;
$Graphics::VTK::VECTOR_MODE_COMPUTE_GRADIENT = 1;
$Graphics::VTK::VECTOR_MODE_COMPUTE_VORTICITY = 2;
$Graphics::VTK::VECTOR_MODE_PASS_VECTORS = 0;
$Graphics::VTK::VECTOR_ROTATION_OFF = 2;
$Graphics::VTK::VERTEX = 1;
$Graphics::VTK::VERTEX_GLYPH = 1;
$Graphics::VTK::VIEW = 4;
$Graphics::VTK::VIEWPORT = 2;
$Graphics::VTK::VOID = 0;
$Graphics::VTK::VOLUME_12BIT_LOWER = 2;
$Graphics::VTK::VOLUME_12BIT_UPPER = 1;
$Graphics::VTK::VOLUME_8BIT = 0;
$Graphics::VTK::VOXEL = 11;
$Graphics::VTK::VOXEL_MODE = 0;
$Graphics::VTK::WEDGE = 13;
$Graphics::VTK::WHOLE_MULTI_GRID_NO_IBLANKING = 2;
$Graphics::VTK::WHOLE_SINGLE_GRID_NO_IBLANKING = 0;
$Graphics::VTK::WIREFRAME = 1;
$Graphics::VTK::WORLD = 5;
$Graphics::VTK::XOR = 2;
$Graphics::VTK::XYPLOT_ARC_LENGTH = 1;
$Graphics::VTK::XYPLOT_COLUMN = 1;
$Graphics::VTK::XYPLOT_INDEX = 0;
$Graphics::VTK::XYPLOT_NORMALIZED_ARC_LENGTH = 2;
$Graphics::VTK::XYPLOT_ROW = 0;
$Graphics::VTK::XYPLOT_VALUE = 3;
$Graphics::VTK::XYZ_GRID = 8;
$Graphics::VTK::XY_PLANE = 5;
$Graphics::VTK::XZ_PLANE = 7;
$Graphics::VTK::X_LINE = 2;
$Graphics::VTK::YZ_PLANE = 6;
$Graphics::VTK::Y_LINE = 3;
$Graphics::VTK::Z_LINE = 4;

=head1 NAME

Graphics::VTK  - A Perl interface to Visualization ToolKit

=head1 SYNOPSIS

C<use Graphics::VTK;>

=head1 DESCRIPTION


PerlVTK is an interface to the C++ visualization toolkit VTK 3.20.

It is designed to work similarly to the TCL bindings that come with the stock VTK 
package.

For installation instructions, see the README file.
You must have VTK installed before installing PerlVTK.
The homepage for VTK is http://www.kitware.com/.

To see how to use the module, check out the examples in the examples 
directory. 

All vtk objects in Perl must be created through the function new.
For example: 

  $renderer = Graphics::VTK::vtkRenderer->new;

To know exactly which functions are supported by this module, check the 
perldocs in L<Graphics::VTK::Common>, L<Graphics::VTK::Contrib>, L<Graphics::VTK::Graphics>,
L<Graphics::VTK::Imaging>.

Have fun!


=head1 SEE ALSO


=head1 AUTHOR

Roberto De Leo <rdl@math.umd.edu>
John Cerney <j-cerney1@raytheon.com>

=cut


package Graphics::VTK::Object;

use vars qw/%objectList %executeMethodList $debug/;
%objectList = (); 
$debug = 0;

# Hash of any sub refs that are passed to an objects
#  'SetExecuteMethod' routines. (e.g. vtkProgrammableSource::SetExecuteMethod)
#  Sub refs are stored in this hash table by the XS code so that perl doesn't
#   garbage-collect the sub refs when they are still being used by the VTK library
#  The hash is cleaned up when the object is destroyed
%executeMethodList = ();

# Stub for any objects New command
#  Creates a list of the vtk objects we have created,
#  so that we will be sure to only DESTROY the objects
#  that are created in perl, and not in VTK
sub Graphics::VTK::Object::new{

	my $type = shift;
	
	print "In VTKobject::new type = '$type'\n" if $debug;
	my $obj = $type->New(@_);
	
	$objectList{$obj}= 1;
	$executeMethodList{$obj} = {};
	
	
	return $obj;
	
}
	
	


# Destroy methods for objects (only if we created them)
sub Graphics::VTK::Object::DESTROY{
		my $self = shift;
		
		if( defined( $objectList{$self} )){
			print "Deleteing vtk object ".ref($self)."\n" if $debug;
			$self->Delete;
			delete $executeMethodList{$self};
			delete $objectList{$self};
		}
		else{
			print "Not Deleting vtk object ".ref($self)."\n" if $debug;
		}
}

1;


