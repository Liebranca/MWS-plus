#!/usr/bin/perl
# ---   *   ---   *   ---

package main;

  use v5.36.0;
  use strict;
  use warnings;

  use lib $ENV{ARPATH}.'/MWS-plus/';

  use MWSP;
  use MWSP::Function;

# ---   *   ---   *   ---
# the bit

my $s=q[

f(x,y) test {x+y};

];

MWSP->read($s);
say fcall(test=>20,36);

# ---   *   ---   *   ---
1; # ret
