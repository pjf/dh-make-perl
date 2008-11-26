#!/usr/bin/perl -w

use strict;
use warnings;

use Test::More 'no_plan';

use FindBin qw($Bin);

require "$Bin/../dh-make-perl";        # Load our code for testing.

# Check to see if our module list contains some obvious candidates.

foreach my $module ( qw(Fatal File::Copy FindBin CGI IO::Handle Safe) ) {
    ok(is_core_module($module), "$module should be a core module");
}
