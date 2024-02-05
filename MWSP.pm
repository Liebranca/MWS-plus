#!/usr/bin/perl
# ---   *   ---   *   ---
# MWSP
# MWScript-plus
#
# LIBRE SOFTWARE
# Licensed under GNU GPL3
# be a bro and inherit
#
# CONTRIBUTORS
# lyeb,

# ---   *   ---   *   ---
# deps

package MWSP;

  use v5.36.0;
  use strict;
  use warnings;

  use Readonly;
  use English qw(-no_match_vars);

  use lib $ENV{ARPATH}.'/lib/sys/';

  use Style;
  use Chk;

  use Arstd::IO;

  use lib $ENV{ARPATH}.'/MWS-plus/';

  use MWSP::SHARE::Re;
  use MWSP::SHARE::Log;

  use MWSP::Function;

# ---   *   ---   *   ---
# info

  our $VERSION = v0.00.1;#a
  our $AUTHOR  = 'IBN-3DILA';

# ---   *   ---   *   ---
# GBL

  my $Cache = {
    insert => {},

  };

# ---   *   ---   *   ---
# ^paste into file

sub put_inserts($sref) {

  while($$sref=~ s[
    $INSERT_RE

  ][$Cache->{insert}->{$+{key}}]sxm

  ) {};

};

# ---   *   ---   *   ---
# modifies line from nicely
# formatted to horrible

sub unformat($sref) {

  my @out=();

  while($$sref=~ s[$LINE_FILTER][]) {

    my $line=$+{line};
    $line=~ s[$NEWLINE_RE][]sxmg;
    $line=~ s[$NSPACE_RE][ ]sxmg;

    push @out,$line;

  };

  return @out;

};

# ---   *   ---   *   ---
# ^removes comments

sub strip($sref) {
  $$sref=~ s[$COM_FILTER][\n]sxmg;

};

# ---   *   ---   *   ---
# filters codestr

sub fmw($sref) {
  strip($sref);
  MWSP::Function->read($sref);

};

# ---   *   ---   *   ---
# crux

sub read($class,$src) {

  my $body=(is_filepath($src))
    ? orc($src)
    : $src
    ;

  my @out=();


  # walk file
  my @lines   = split $NEWLINE_RE,$body;
  my $current = $NULLSTR;

  while(@lines) {

    # go next
    $current .= (shift @lines);
    $MWSP::SHARE::Log::LINENO++;

    # ^process line(s)
    fmw(\$current);

  };

};

# ---   *   ---   *   ---
1; # ret
