
use strict;
use warnings;

use 5.012;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Fast and lightweight Perl client for Riak",
  "AUTHOR" => "Tiago Peczenyj <tiago.peczenyj\@gmail.com>, Damien Krotkine <dams\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Module::Build" => "0.3601"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "DISTNAME" => "Riak-Light",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Riak::Light",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Const::Fast" => 0,
    "Google::ProtocolBuffers" => 0,
    "JSON" => 0,
    "Moo" => 0,
    "Time::Out" => 0,
    "Type::Params" => 0,
    "Types::Standard" => 0
  },
  "TEST_REQUIRES" => {
    "Test::Exception" => 0,
    "Test::MockModule" => 0,
    "Test::MockObject" => 0,
    "Test::More" => 0,
    "Test::TCP" => 0
  },
  "VERSION" => "0.060",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

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



