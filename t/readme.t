#!/usr/bin/perl -w

use strict;
use autodie;

use File::Temp qw(tempfile);
use FindBin qw($Bin);

use Test::More 'no_plan';

use App::Dh_make_perl qw(create_readme);

use constant UNWRITABLE_FILE => "$Bin/foo/bar/baz/xyzzy/this_should_not_exist";

my $TEST_MODULE = "My::Example";
my $TEST_AUTHOR = "J. Random Hacker";

my ($tmp_fh, $tmp_name) = tempfile();

### Testing correct usage.

eval {
    create_readme($tmp_name, $TEST_MODULE, $TEST_AUTHOR);
};

is($@, "", "Good call to create_readme should not die");

my $contents = do { local $/; <$tmp_fh> };      # Slurp file.

# Make sure our readme contains module name, author, and generator.

like($contents, qr/\Q$TEST_MODULE\E/, "Readme should contain module name");
like($contents, qr/\Q$TEST_AUTHOR\E/, "Readme should contain author name");
like($contents, qr/dh-make-perl/    , "Readme should contain dh-make-perl");

### Testing incorrect usage.

eval {
    create_readme(UNWRITABLE_FILE, $TEST_MODULE, $TEST_AUTHOR);
};

ok($@, "Exception should be thrown on trying to write to a bad file");


TODO: {

    local $TODO = "create_readme does not yet do args checks";

    eval {
        local $SIG{__WARN__} = sub { return; }; # Temporarily disable warnings
        create_readme($tmp_name, $TEST_MODULE); # Wrong number of args
    };

    ok($@, "Exception should be thrown if incorrect arguments passed");

};
