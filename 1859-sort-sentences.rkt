#lang racket

(define (sort-sentence s)
  (define slist (string-split s))
  (string-join (map car
                    (sort (map (lambda (s)
                                 (cons (substring s 0 (sub1 (string-length s)))
                                       (string-ref s (sub1 (string-length s)))))
                               slist)
                          #:key cdr
                          char<?))))

(sort-sentence "is2 sentence4 This1 a3")
