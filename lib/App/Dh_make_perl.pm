package App::Dh_make_perl;

use strict;
use warnings;
use autodie;

use base 'Exporter';

our @EXPORT_OK = qw( create_readme );

=head2 create_readme

    create_readme( $filename, $module, $maintainer);

Creates minimalist README information in $filename.  Returns
nothing on success.  Throws an exception on error.

=cut

sub create_readme {

    my ($filename, $module_name, $maintainer) = @_;

    open(my $fh, '>', $filename);

    print {$fh} "This is the debian package for the $module_name module.\n",
                "It was created by $maintainer using dh-make-perl.\n";

    close($fh);

    return;
}

1;
