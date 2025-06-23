#lang racket

(define (sort-sentence s)
  (define slist (string-split s))
  (define smap (make-hash))
  (for ([s slist])
    (define key (string-ref s (sub1 (string-length s))))
    (hash-set! smap key (substring s 0 (sub1 (string-length s)))))
  (string-join (hash-values smap #t)))

(sort-sentence "is2 sentence4 This1 a3")
