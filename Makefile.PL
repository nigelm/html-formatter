require 5.004;
# Time-stamp: "2002-10-29 01:22:18 MST"
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME	 => 'HTML-Format',
    VERSION_FROM => 'lib/HTML/Formatter.pm',
    PREREQ_PM    => {
		     'HTML::Element' => 1.44,
		     'Font::AFM'     => 1.17,
		    },
    dist         => { COMPRESS => 'gzip -6f', SUFFIX => 'gz', },
);
