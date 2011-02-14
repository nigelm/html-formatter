use strict;
use warnings;
use File::Spec;    # try to keep pathnames neutral
use Test::More 0.96;

BEGIN { use_ok("HTML::FormatRTF"); }
my $obj = new_ok("HTML::FormatRTF");

foreach my $infile ( glob( File::Spec->catfile( 't', 'data', 'in', '*.html' ) ) ) {
    subtest "Testing file handling for $infile" => sub {
        my $expfilename = ( File::Spec->splitpath($infile) )[2];
        $expfilename =~ s/\.html$/.rtf/i;
        my $expfile = File::Spec->catfile( 't', 'data', 'expected', $expfilename );
        plan 'skip_all' unless ( -f $infile and -f $expfile );

        # read file content - split into lines, but we exclude the
        # doccomm line since it includes a timestamp and version information
        local (*FH);
        open( FH, $expfile ) or die "Unable to open expected file $expfile - $!\n";
        my $exp_text = do { local ($/); <FH> };
        my $exp_lines = [ grep !/doccomm/, ( split( /\n/, $exp_text ) ) ];

        # read and convert file
        my $text = HTML::FormatRTF->format_file( $infile, leftmargin => 5, rightmargin => 50 );
        my $got_lines = [ grep !/doccomm/, ( split( /\n/, $text ) ) ];

        ok( length($text), "Returned a string" );
        is_deeply( $got_lines, $exp_lines, "Correct text string returned" );
    };
}

# finish up
done_testing();
