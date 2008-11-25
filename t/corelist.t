#!/usr/bin/perl -w

use strict;
use warnings;

use Test::More 'no_plan';

use FindBin qw($Bin);

require "$Bin/../dh-make-perl";        # Load our code for testing.

my @std_modules = get_stdmodules();

# Check to see if our module list contains some obvious candidates.

my %modules_index;
@modules_index{@std_modules} = ();

foreach my $module ( qw(Fatal File::Copy FindBin CGI IO::Handle Safe) ) {
    ok(exists $modules_index{$module}, "$module should be a core module");
}
