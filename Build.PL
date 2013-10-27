
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Base class for HTML formatters",
  "dist_author" => [
    "Nigel Metheringham <nigelm\@cpan.org>",
    "Sean M Burke <sburke\@cpan.org>",
    "Gisle Aas <gisle\@ActiveState.com>"
  ],
  "dist_name" => "HTML-Format",
  "dist_version" => "2.11",
  "license" => "perl",
  "module_name" => "HTML::Format",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Carp" => 0,
    "Data::Dumper" => 0,
    "Encode" => 0,
    "Font::Metrics::Courier" => 0,
    "Font::Metrics::CourierBold" => 0,
    "Font::Metrics::CourierBoldOblique" => 0,
    "Font::Metrics::CourierOblique" => 0,
    "Font::Metrics::Helvetica" => 0,
    "Font::Metrics::HelveticaBold" => 0,
    "Font::Metrics::HelveticaBoldOblique" => 0,
    "Font::Metrics::HelveticaOblique" => 0,
    "Font::Metrics::TimesBold" => 0,
    "Font::Metrics::TimesBoldItalic" => 0,
    "Font::Metrics::TimesItalic" => 0,
    "Font::Metrics::TimesRoman" => 0,
    "HTML::Element" => "3.15",
    "HTML::TreeBuilder" => 0,
    "IO::File" => 0,
    "base" => 0,
    "integer" => 0,
    "parent" => 0,
    "perl" => "5.008",
    "strict" => 0,
    "utf8" => 0,
    "warnings" => 0
  },
  "script_files" => [],
  "test_requires" => {
    "File::Slurp" => 0,
    "File::Spec" => 0,
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Scalar::Util" => 0,
    "Test::More" => "0.96",
    "bytes" => 0
  }
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
