! Copyright (C) 2013 Guillermo Alcantara
! See http://factorcode.org/license.txt for BSD license.
USING: ideal.ast kernel math.parser peg peg.ebnf
sequences strings ;
IN: ideal

: manage-negatives ( vector -- newvector )
    [ second ] [ first ] bi
    "-" = [ CHAR: - prefix ] [ ] if
    >string string>number ;

EBNF: ideal-tokenizer
Digit             = [0-9]
Digits            = Digit+

SingleLineComment = "#" (!("\n") .)* "\n" => [[ ignore ]]
Space             = " " | "\r" | "\t" | "\n" 
                    | SingleLineComment
Spaces            = Space* => [[ drop ignore ]]

NameFirst         = [a-zA-Z]
                    | "$" => [[ CHAR: $ ]]
                    | "_" => [[ CHAR: _ ]]
NameLast          = "?" => [[ CHAR: ? ]]
                    | "!" => [[ CHAR: ! ]]
NameRest          = NameFirst | Digit
iName             = NameFirst NameRest* => [[ first2 swap prefix >string ]]
Name              = iName => [[ ast-name boa ]]
OptionalNegative  = "-"?
Number            = "-"? Digits =>
                    [[ manage-negatives ast-number boa ]]

Token             = Spaces ( Number | Name )
Tokens            = Token*
;EBNF

EBNF: parse-ideal
tokenizer         = <foreign ideal-tokenizer Token>

Space             = " " | "\t" | "\n" 
Spaces            = Space* => [[ ignore ]]
Name              = . ?[ ast-name? ]?
Number            = . ?[ ast-number? ]?

Expression        = ( Name | Number )
Program           = Expression* Spaces => [[ ast-root boa ]]

;EBNF
