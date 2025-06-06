#lang racket

(define (kids-with-candies candies extraCandies)
  (define max-candies (apply max candies))
  (for/list ([c candies])
    (>= (+ c extraCandies) max-candies)))

(kids-with-candies '(2 3 5 1 3) 3)
