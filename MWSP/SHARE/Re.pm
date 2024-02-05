#!/usr/bin/perl
# ---   *   ---   *   ---
# MWSP RE:SHARE
# Patterns we use!
#
# LIBRE SOFTWARE
# Licensed under GNU GPL3
# be a bro and inherit
#
# CONTRIBUTORS
# lyeb,

# ---   *   ---   *   ---
# deps

package MWSP::SHARE::Re;

  use v5.36.0;
  use strict;
  use warnings;
  use Readonly;

# ---   *   ---   *   ---
# adds to your namespace

  use Exporter 'import';
  our @EXPORT=qw(

    $LINE_FILTER
    $COM_FILTER
    $INSERT_RE
    $FUNCTION_RE

  );

# ---   *   ---   *   ---
# info

  our $VERSION = v0.00.1;#a
  our $AUTHOR  = 'IBN-3DILA';

# ---   *   ---   *   ---
# ROM

  Readonly our $LINE_FILTER=>qr{
    ^(?<line> [^;]+) ;

  }x;

  Readonly our $COM_FILTER=>qr{
    \# [^\n]* (?:\n|$)

  }x;

  Readonly our $INSERT_RE=>qr{
    \s* \[insert \s+ (?<key> [^\]]+) \s* \] \s* ;

  }x;

  Readonly our $NAME_RE=>qr{
    [_A-Za-z][_A-Za-z0-9]*

  }x;

  Readonly our $FUNCTION_RE=>qr{

    \s* f (?:\((?<args> (?:$NAME_RE | ,)+)\))?

    \s+ (?<name> [^\{]+)
    \s* \{ (?<body> [^\}]+) \} \s* ;

  }x;

# ---   *   ---   *   ---
1; # ret
