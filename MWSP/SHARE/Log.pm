#!/usr/bin/perl
# ---   *   ---   *   ---
# MWSP LOG:SHARE
# dbout stuff
#
# LIBRE SOFTWARE
# Licensed under GNU GPL3
# be a bro and inherit
#
# CONTRIBUTORS
# lyeb,

# ---   *   ---   *   ---
# deps

package MWSP::SHARE::Log;

  use v5.36.0;
  use strict;
  use warnings;

  use Readonly;

  use lib $ENV{ARPATH}.'/lib/sys';
  use Style;

# ---   *   ---   *   ---
# adds to your namespace

  use Exporter 'import';
  our @EXPORT=qw(throw_parser_error);

# ---   *   ---   *   ---
# info

  our $VERSION = v0.00.1;#a
  our $AUTHOR  = 'IBN-3DILA';

# ---   *   ---   *   ---
# GBL

  our $LINENO=0;

# ---   *   ---   *   ---
# a good friend

sub throw_parser_error($me) {
  say {*STDERR} "[$LINENO] $me";
  exit -1;

};

# ---   *   ---   *   ---
1; # ret
