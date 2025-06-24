#lang racket

(define (replace-digits s)
  (list->string (flatten (for/list ([dubs (in-slice 2 s)])
                           (if (= (length dubs) 2)
                               (begin
                                 (match-let ([(list a b) dubs])
                                   (list a
                                         (integer->char (+ (char->integer a)
                                                           (- (char->integer b)
                                                              (char->integer #\0)))))))
                               (car dubs))))))

(replace-digits "a1c1e1") ; abcdef
(replace-digits "a1c1e1z") ; abcdefz
