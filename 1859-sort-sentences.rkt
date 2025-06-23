#lang racket

(define (sort-sentence s)
  (define schars (string->list s))
  (define out (make-hash))
  (for/fold ([word empty]
             #:result (hash-set! out (first word) (reverse (cdr word))))
            ([c schars])
    (if (char=? c #\space)
        (begin
          (hash-set! out (first word) (reverse (cdr word)))
          empty)
        (cons c word)))
  (list->string (flatten (add-between (hash-values out #t) #\space))))

(sort-sentence "is2 sentence4 This1 a3")
