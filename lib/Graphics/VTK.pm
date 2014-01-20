package Graphics::VTK;

use strict;
use warnings;

sub import {
	my ($self, $opt) = @_;
	if( $opt eq ':python' ) {
		eval {
			require Graphics::VTK::Backend::InlinePython;
			*vtk::AUTOLOAD = \&Graphics::VTK::Backend::InlinePython::AUTOLOAD;
			1;
		} or do {
			my $error = $@;
			die "Could not load Inline::Python: $error";
		}
	}
}

1;
