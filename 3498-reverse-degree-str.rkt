#lang racket

(define (reverse-degree s)
  (for/sum ([c s] [i (in-naturals)]) (* (add1 i) (- 123 (char->integer c)))))

(reverse-degree "abc")
