#lang racket

(define (replace-digits s)
  (list->string (flatten (for/list ([dubs (in-slice 2 s)])
                           (match-define (list a b) dubs)
                           (list a
                                 (integer->char (+ (char->integer a)
                                                   (- (char->integer b) (char->integer #\0)))))))))

(replace-digits "a1c1e1") ; abcdef
