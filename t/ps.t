
print "1..1\n";

use strict;
use HTML::TreeBuilder;
use HTML::FormatPS;

my $tree = HTML::TreeBuilder->new->parse_file("test.html") || die;
my $formatter = HTML::FormatPS->new(leftmargin => 0, rightmargin => 50);

open(PS, ">test.ps") || die "Can't create test.ps";
print PS $formatter->format($tree);
close PS;

print "ok 1\n";
