# MWS-plus

A preprocessor for MWScript, the vanilla scripting language of Morrowind.

This tool doesn't extend the language in the traditional sense, it makes it easier to write instead.


## DEPENDENCIES

- [`avtomat`](https://github.com/Liebranca/avtomat)


## FEATURES

Incomplete list, includes `^` planned and `*` being worked on.

### GENERATORS:

- Functions are available through automated duplication of their definitions. This gives you some level of abstraction, but at the cost of increased code size.

- (`^`) Basic structures, implemented in a similar fashion as functions.


### SYNTAX:

- Expressions are terminated by a `;` colon and comments are started via `#` hashtag. This change allows for multi-line expressions.

- (`*`) Spaces around parentheses are automatic.

- (`*`) `if` and `while` blocks are enclosed by `{}` curly braces.


## CHANGELOG

### v0.00.1a

- I remembered I had some code for generating CS scripts laying around so I published it.

- Made initial feature list.

- Implemented `*::Function` class for mining and inlining of code.

- Implemented basic read/proc method in `main`; for now it just strips and mines functions from a codestring or file.

- Wrote regexes and primitive error logging.
