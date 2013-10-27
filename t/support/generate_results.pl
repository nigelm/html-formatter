#!/usr/bin/env perl
#
# Generate the output test files
#
# Obviously just building these in the same way as we do the tests
# means they will always pass - so you should be checking these
# carefully!
#
use strict;
use warnings;
use File::Spec;    # try to keep pathnames neutral
use File::Slurp;
use HTML::FormatRTF;
use HTML::FormatPS;
use HTML::FormatText;
use HTML::FormatMarkdown;

foreach my $infile ( glob( File::Spec->catfile( 't', 'data', 'in', '*.html' ) ) ) {
    my $outfile =
        substr( File::Spec->catfile( 't', 'data', 'expected', ( File::Spec->splitpath($infile) )[2] ), 0, -4 );
    write_file( ( $outfile . 'ps' ), HTML::FormatPS->format_file( $infile, leftmargin => 5, rightmargin => 50 ) );
    write_file( ( $outfile . 'rtf' ), HTML::FormatRTF->format_file( $infile, leftmargin => 5, rightmargin => 50 ) );
    write_file( ( $outfile . 'txt' ), HTML::FormatText->format_file( $infile, leftmargin => 5, rightmargin => 50 ) );
    write_file( ( $outfile . 'md' ), HTML::FormatMarkdown->format_file( $infile, leftmargin => 5, rightmargin => 50 ) );
}
