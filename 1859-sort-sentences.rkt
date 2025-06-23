#lang racket

(define (sort-sentence s)
  (define slist (string-split s))
  (define out (make-list 10 ""))
  (for ([s slist])
    (define key (- (char->integer (string-ref s (sub1 (string-length s)))) 48))
    (set! out (list-set out key (substring s 0 (sub1 (string-length s))))))
  (string-join (filter-not (curry eq? "") out)))

(sort-sentence "is2 sentence4 This1 a3")
