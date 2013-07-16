! Copyright (C) 2013 Guillermo Alcantara
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test ideal ideal.ast ;
IN: ideal.tests 

{ T{ ast-root f V{ T{ ast-number f 81 } } } } [
  "81" parse-ideal
] unit-test

{ T{ ast-root f V{ T{ ast-number f -8 } } } } [
  "-8" parse-ideal
] unit-test

{ T{ ast-root f V{ T{ ast-name f "foo" } } } } [
  "foo" parse-ideal
] unit-test
