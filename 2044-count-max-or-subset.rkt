#lang racket

(define (count-max-or-subsets nums)
  (define max-or (apply bitwise-ior nums))
  (let loop ([count 0]
             [combs (combinations nums)])
    (if (empty? combs)
        count
        (let bit-loop ([inner-max-or 0]
                       [lst (first combs)])
          (cond
            [(empty? lst) (loop (+ count (if (= max-or inner-max-or) 1 0)) (rest combs))]
            [(= inner-max-or max-or) (loop (add1 count) (rest combs))]
            [else (bit-loop (bitwise-ior inner-max-or (first lst)) (rest lst))])))))

(count-max-or-subsets '(3 1))
(count-max-or-subsets '(2 2 2))
(count-max-or-subsets '(3 2 1 5))
