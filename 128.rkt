#lang racket

(define/match (longest-consecutive nums)
  [('()) 0]
  [(_)
   (define sorted (sort nums <))
   (define max-seq 1)
   (let loop ([conseq 1]
              [start (first sorted)]
              [nums (rest sorted)])
     ;; (println (list "conseq" conseq "start" start "nums" nums) )
     (cond
       [(empty? nums) (max max-seq conseq)]
       [(= start (first nums)) (loop conseq start (rest nums))]
       [(= start (sub1 (first nums))) (loop (add1 conseq) (first nums) (rest nums))]
       ;; case when sequence breaks
       [else
        (set! max-seq (max max-seq conseq))
        (loop 1 (first nums) (rest nums))]))])

(longest-consecutive '(100 4 200 1 3 2)) ; should return 4
(longest-consecutive '(0 1 2 3 4 5)) ; should return 6
(longest-consecutive '(1 0 1 2)) ; 3
(longest-consecutive empty) ; 0

(longest-consecutive '(0 3 7 2 5 8 4 6 0 1) ; should return 9
                     )
