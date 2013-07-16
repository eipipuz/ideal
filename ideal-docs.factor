! Copyright (C) 2007 Chris Double.
! See http://factorcode.org/license.txt for BSD license.
USING: help.markup help.syntax ;
IN: ideal
 
HELP: parse-ideal
{ $values
  { "string" "a string" }
  { "ast" "an Ideal abstract syntax tree" }
}
{ $description
  "Parse the input string using the Ideal parser. "
  "Throws an error if the string is not valid Ideal. "
  "Returns an AST if successful."
} ;
