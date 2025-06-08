#lang racket

(define (count-pairs nums target)
  (for/sum ([lmao (in-combinations nums 2)] #:when (< (apply + lmao) target)) 1))

(count-pairs '(-1 1 2 3 1) 2)


