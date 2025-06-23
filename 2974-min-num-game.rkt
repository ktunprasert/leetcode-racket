#lang racket

(define (number-game nums)
  (let loop ([nums (sort nums <)]
             [out empty])
    (cond
      [(empty? nums) (flatten (reverse out))]
      [else (loop (drop nums 2) (cons (reverse (take nums 2)) out))])))

(number-game (list 5 4 2 3))
;; (number-game (list 2 5))
