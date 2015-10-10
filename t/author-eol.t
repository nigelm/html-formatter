
BEGIN {
  unless ($ENV{AUTHOR_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for testing by the author');
  }
}

use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::EOL 0.18

use Test::More 0.88;
use Test::EOL;

my @files = (
    'lib/HTML/FormatMarkdown.pm',
    'lib/HTML/FormatPS.pm',
    'lib/HTML/FormatRTF.pm',
    'lib/HTML/FormatText.pm',
    'lib/HTML/Formatter.pm',
    't/00-compile.t',
    't/000-report-versions.t',
    't/01_ps.t',
    't/02_rtf.t',
    't/03_text.t',
    't/04_md.t',
    't/data/expected/test.md',
    't/data/expected/test.ps',
    't/data/expected/test.rtf',
    't/data/expected/test.txt',
    't/data/in/test.html',
    't/rt69426.t',
    't/support/generate_results.pl'
);

eol_unix_ok($_, { trailing_whitespace => 0 }) foreach @files;
done_testing;
