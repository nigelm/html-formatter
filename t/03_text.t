use strict;
use warnings;
use File::Spec;    # try to keep pathnames neutral
use Test::More 0.96;

BEGIN { use_ok("HTML::FormatText"); }

foreach my $infile ( glob( File::Spec->catfile( 't', 'data', 'in', '*.html' ) ) ) {
    my $obj = new_ok("HTML::FormatText");
    ok( -f $infile, "Testing file handling for $infile" );
    my $expfilename = ( File::Spec->splitpath($infile) )[2];
    $expfilename =~ s/\.html$/.txt/i;
    my $expfile = File::Spec->catfile( 't', 'data', 'expected', $expfilename );
    ok( -f $expfile, '  Expected result file exists' );
    if ( -f $expfile ) {

        # read file content - use older style slurp
        local (*FH);
        open( FH, $expfile ) or die "Unable to open expected file $expfile - $!\n";
        my $exp_text = do { local ($/); <FH> };
        my $exp_lines = [ split( /\n/, $exp_text ) ];

        # read and convert file
        my $text = HTML::FormatText->format_file( $infile, leftmargin => 5, rightmargin => 50 );
        my $got_lines = [ split( /\n/, $text ) ];

        ok( length($text), '  Returned a string from conversion' );
        is_deeply( $got_lines, $exp_lines, '  Correct text string returned' );
    }
}

# build a set of tests
my @test_fragments = (
    [ "<p></p>",                                  "\n",                           "Empty paragraph" ],
    [ "<p></p><p></p>",                           "\n",                           "Double empty paragraph" ],
    [ "<p>This is paragraph</p>",                 "   This is paragraph\n",       "Minimal paragraph" ],
    [ "<p>Two</p><p>Paragraphs</p>",              "   Two\n\n   Paragraphs\n",    "Two Paragraphs" ],
    [ "<p>An <em>italicised</em> paragraph</p>",  "   An italicised paragraph\n", "Em Formatted paragraph" ],
    [ "<p>A <strong>bold</strong> paragraph</p>", "   A bold paragraph\n",        "Strong Formatted paragraph" ],
    [   "<ol><li>one</li><li>two</li><li>three</li></ol>",
        "     1. one\n\n     2. two\n\n     3. three\n",
        "Numbered list"
    ],
    [ "<ul><li>one</li><li>two</li><li>three</li></ul>", "     * one\n\n     * two\n\n     * three\n", "Bullet list" ],
);

# and step through them
ok( scalar(@test_fragments), 'Fragment tests' );
foreach my $frags (@test_fragments) {
    my $fmt = HTML::FormatText->new();
    is( $fmt->format_from_string( $frags->[0] ), $frags->[1], ( '  ' . $frags->[2] ) );
}

# finish up
done_testing();
