#!/usr/bin/perl
# ---   *   ---   *   ---
# MWSP FUNCTION
# Inlining has never felt
# this FN good ;>
#
# LIBRE SOFTWARE
# Licensed under GNU GPL3
# be a bro and inherit
#
# CONTRIBUTORS
# lyeb,

# ---   *   ---   *   ---
# deps

package MWSP::Function;

  use v5.36.0;
  use strict;
  use warnings;

  use Readonly;
  use English qw(-no_match_vars);

  use lib $ENV{ARPATH}.'/lib/sys';

  use Style;
  use Arstd::Re;

  use lib $ENV{ARPATH}.'/MWS-plus';

  use MWSP::SHARE::Re;
  use MWSP::SHARE::Log;

# ---   *   ---   *   ---
# adds to your namespace

  use Exporter 'import';
  our @EXPORT=qw(fcall);

# ---   *   ---   *   ---
# info

  our $VERSION = v0.00.1;#a
  our $AUTHOR  = 'IBN-3DILA';

# ---   *   ---   *   ---
# GBL

  our $Icetab = {};

# ---   *   ---   *   ---
# cstruc

sub new($class,$name,%O) {

  # defaults
  $O{args} //= 0;
  $O{body} //= $NULLSTR;

  # redecl guard
  throw_parser_error(
    "Redefinition of function: '$name'"

  ) if exists $Icetab->{$name};


  # make args array
  my $args=($O{args})
    ? [split $COMMA_RE,$O{args}]
    : []
    ;


  # make ice
  my $self=bless {

    name    => $name,

    args    => $args,
    args_re => re_eiths($args,capt=>1,bwrap=>1),

    body    => $O{body},

  },$class;

  $Icetab->{$name}=$self;


  return $self;

};

# ---   *   ---   *   ---
# get from icetab

sub fetch($name) {

  # undef guard
  throw_parser_error(
    "Undefined function: '$name'"

  ) if ! exists $Icetab->{$name};


  return $Icetab->{$name};

};

# ---   *   ---   *   ---
# mines functions in stringref

sub read($class,$sref) {

  while($$sref=~ s[$FUNCTION_RE][]) {

    my $args=$+{args};
    my $name=$+{name};
    my $body=$+{body};

    $name=~ s[$NSPACE_RE$][];

    $class->new(
      $name,

      args=>$args,
      body=>$body

    );

  };

};

# ---   *   ---   *   ---
# ^pastes in function

sub fcall($name,@args) {
  my $ice=fetch($name);
  return $ice->call(@args);

};

# ---   *   ---   *   ---
# ^directly from ice

sub call($self,@args) {

  # errchks
  throw_parser_error(
    "Too few args for function '$self->{name}'"

  ) if @args < @{$self->{args}};

  throw_parser_error(
    "Too many args for function '$self->{name}'"

  ) if @args > @{$self->{args}};


  # convert args
  my $tab={map {
    $ARG=>(shift @args)

  } @{$self->{args}} };


  # make copy of own
  my $body=$self->{body};

  # ^replace varnames with values
  while($body=~
    s[$self->{args_re}][$tab->{$1}]

  ) {};


  return $body;

};

# ---   *   ---   *   ---
