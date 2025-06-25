#lang racket

(define/contract (are-occurrences-equal s)
  (-> string? boolean?)
  (define char-count (make-hash))
  (for ([c s])
    (hash-update! char-count c add1 0))
  (apply = (hash-values char-count)))


(are-occurrences-equal "abacbc") ; => #t
