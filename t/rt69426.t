use strict;
use warnings;
use Test::More 0.96;
use Data::Dump qw[dump];
use File::Slurp;

# Bug was that a right single quote character - &rsquo;
# caused a garbage character to go into the output.  This was due to
# unicode conversion to \x{2109} which was not correctly handled on
# output.  Fix was to:-
#  1. Push everything through Encode to the right charset
#     which fixed the majority of printable characters, however
#  2. A few punctation characters were incorrectly handled, so
#     are special cased by the formatter into the ascii part of
#     the table.

BEGIN { use_ok("HTML::FormatPS"); use_ok("HTML::TreeBuilder"); }

my $obj   = new_ok("HTML::FormatPS");
my $htree = new_ok("HTML::TreeBuilder");

my $html = '<html><body>it&rsquo;s an apostrophe.</body></html>';
ok( $html, 'HTML string containing an apostrophe' );

ok( $htree->parse_content($html), 'Parse HTML content' );

my $result = $obj->format_string($html);
ok( $result, 'Converted HTML object' );

# count high bit characters
my $count;
{
    use bytes;
    $count = $result =~ tr/\177-\377//;
}

ok( ( $count == 0 ), 'No unexpected high-bit characters found' );

# same test, this time using a pound symbol (which exists in latin1)
$html = '<html><body>A &pound; symbol</body></html>';
ok( $html, 'HTML string containing a British pound symbol' );

ok( $htree->parse_content($html), 'Parse HTML content' );

$result = $obj->format_string($html);
ok( $result, 'Converted HTML object' );

# count high bit characters - excluding latin1 pound \243
{
    use bytes;
    $count = $result =~ tr/\177-\242\244-\377//;
}

ok( ( $count == 0 ), 'No unexpected high-bit characters found' );

# finish up
done_testing();
