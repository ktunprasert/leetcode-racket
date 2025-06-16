#lang racket

(define (decompress-rl-elist nums)
  (for/fold ([out empty]) ([code (in-slice 2 nums)])
    (append out (make-list (first code) (second code)))))

(decompress-rl-elist (list 1 2 3 4))
