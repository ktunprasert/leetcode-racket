#lang racket

(define (decompress-rl-elist nums)
  (flatten (for/list ([code (in-slice 2 nums)])
             (make-list (first code) (second code)))))

(decompress-rl-elist (list 1 2 3 4))
