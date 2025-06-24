#lang racket

(define (to-lower-case s)
  (list->string (for/list ([c s])
                  (if (and (char>=? c #\A) (char<=? c #\Z))
                      (integer->char (+ (char->integer c) 32))
                      c))))

(to-lower-case "Hello World!")
