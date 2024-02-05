#!/usr/bin/perl
# ---   *   ---   *   ---
# MWSP MAGIC:SHARE
# For when you want to know
# what mysticism sounds like!
#
# LIBRE SOFTWARE
# Licensed under GNU GPL3
# be a bro and inherit
#
# CONTRIBUTORS
# lyeb,

# ---   *   ---   *   ---
# deps

package MWSP::SHARE::Magic;

  use v5.36.0;
  use strict;
  use warnings;

  use Readonly;
  use English qw(-no_match_vars);

  use lib $ENV{'ARPATH'}.'/lib/sys/';

  use Style;
  use Chk;

  use Arstd::IO;

# ---   *   ---   *   ---
# info

  our $VERSION = v0.00.1;#a
  our $AUTHOR  = 'IBN-3DILA';

# ---   *   ---   *   ---
# magic school info

  Readonly our $SCHOOL_LIST=>[


    { id    => q[alt],
      sound => q["alteration cast"],
      skill => q[Alteration],

    },


    { id    => q[con],
      sound => q["conjuration cast"],
      skill => q[Conjuration],

    },


    { id    => q[ill],
      sound => q["illusion cast"],
      skill => q[Illusion],

    },


    { id    => q[mys],
      sound => q["mysticism cast"],
      skill => q[Mysticism],

    },


    { id    => q[res],
      sound => q["restoration cast"],
      skill => q[Restoration],

    },


    { id    => q[des],

      sound => [

        q["destruction cast"],

        q["fire cast"],
        q["frost_cast"],
        q["poison cast"],
        q["shock cast"],

      ],

      skill => q[Destruction],

    },

  ];

  # ^as a hashref
  Readonly our $SCHOOL=>{
    map {lc $ARG->{skill}=>$ARG} @$SCHOOL_LIST

  };

# ---   *   ---   *   ---
1; # ret
