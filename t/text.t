
print "1..1\n";

use strict;
use HTML::TreeBuilder;
use HTML::FormatText;

print "Does this look decent?\n\n";

my $tree = HTML::TreeBuilder->new->parse_file("test.html") || die;

my $formatter = HTML::FormatText->new(leftmargin => 5, rightmargin => 50);
print $formatter->format($tree);

print "\nok 1\n";

