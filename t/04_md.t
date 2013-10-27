use strict;
use warnings;
use File::Spec;    # try to keep pathnames neutral
use Test::More 0.96;

BEGIN { use_ok("HTML::FormatMarkdown"); }

foreach my $infile ( glob( File::Spec->catfile( 't', 'data', 'in', '*.html' ) ) ) {
    my $obj = new_ok("HTML::FormatMarkdown");
    ok( -f $infile, "Testing file handling for $infile" );
    my $expfilename = ( File::Spec->splitpath($infile) )[2];
    $expfilename =~ s/\.html$/.md/i;
    my $expfile = File::Spec->catfile( 't', 'data', 'expected', $expfilename );
    ok( -f $expfile, '  Expected result file exists' );
    if ( -f $expfile ) {

        # read file content - split into lines, but we exclude the
        # doccomm line since it includes a timestamp and version information
        open( my $fh, '<', $expfile ) or die "Unable to open expected file $expfile - $!\n";
        my $exp_text = do { local ($/); <$fh> };
        my $exp_lines = [ split( /\n/, $exp_text ) ];

        # read and convert file
        my $text = HTML::FormatMarkdown->format_file( $infile, leftmargin => 5, rightmargin => 50 );
        my $got_lines = [ split( /\n/, $text ) ];

        ok( length($text), '  Returned a string from conversion' );
        is_deeply( $got_lines, $exp_lines, '  Correct text string returned' );
    }
}

# finish up
done_testing();
