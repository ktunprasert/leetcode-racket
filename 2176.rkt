#lang racket

(define (count-pairs nums k)
  (define nmap (make-hash))
  (for ([(n i) (in-indexed nums)])
    (hash-update! nmap n (curry cons i) empty))
  (for*/sum ([lst (in-hash-values nmap)] [combs (in-combinations lst 2)]
                                         #:when (> (length lst) 1)
                                         #:when (zero? (modulo (apply * combs) k)))
            1))

(count-pairs (list 3 1 2 2 2 1 3) 2)
(count-pairs (list 1 2 3 4) 1)
;; (combinations (list 1 2 3) 2)
