require 5.004;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME	 => 'HTML-Format',
    VERSION_FROM => 'lib/HTML/Formatter.pm',
    PREREQ_PM    => {
		     'HTML::Element' => 1.44,
		     'Font::AFM'     => 1.17,
		    },
    dist         => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
);
