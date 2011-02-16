
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Base class for HTML formatters',
  'AUTHOR' => 'Nigel Metheringham <nigelm@cpan.org>, Sean M Burke <sburke@cpan.org>, Gisle Aas <gisle@ActiveState.com>',
  'BUILD_REQUIRES' => {
    'English' => '0',
    'File::Find' => '0',
    'File::Slurp' => '0',
    'File::Spec' => '0',
    'File::Temp' => '0',
    'Scalar::Util' => '0',
    'Test::More' => '0.96',
    'perl' => '5.004'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'HTML-Format',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'HTML::Format',
  'PREREQ_PM' => {
    'Carp' => '0',
    'Data::Dumper' => '0',
    'Font::Metrics::Courier' => '0',
    'Font::Metrics::CourierBold' => '0',
    'Font::Metrics::CourierBoldOblique' => '0',
    'Font::Metrics::CourierOblique' => '0',
    'Font::Metrics::Helvetica' => '0',
    'Font::Metrics::HelveticaBold' => '0',
    'Font::Metrics::HelveticaBoldOblique' => '0',
    'Font::Metrics::HelveticaOblique' => '0',
    'Font::Metrics::TimesBold' => '0',
    'Font::Metrics::TimesBoldItalic' => '0',
    'Font::Metrics::TimesItalic' => '0',
    'Font::Metrics::TimesRoman' => '0',
    'HTML::Element' => '3.15',
    'HTML::TreeBuilder' => '0',
    'integer' => '0',
    'vars' => '0'
  },
  'VERSION' => '2.04.02',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



