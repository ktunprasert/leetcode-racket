#lang racket

(define/match (longest-consecutive nums)
  [('()) 0]
  [(_)
   (define num-set (make-hash))
   (for ([n nums])
     (hash-set! num-set n #t))
   (define max-length 0)
   (for ([num nums]
         #:unless (hash-has-key? num-set (sub1 num)))
     (define current-num num)
     (define current-length 1)
     (let loop ()
       (when (hash-has-key? num-set (add1 current-num))
         (set! current-num (add1 current-num))
         (set! current-length (add1 current-length))
         (loop)))
     (set! max-length (max max-length current-length)))
   max-length])

(longest-consecutive '(100 4 200 1 3 2)) ; should return 4
;; (longest-consecutive '(0 1 2 3 4 5)) ; should return 6
;; (longest-consecutive '(1 0 1 2)) ; 3
(longest-consecutive '(0 3 7 2 5 8 4 6 0 1)) ; should return 9
;; (longest-consecutive empty) ; 0
