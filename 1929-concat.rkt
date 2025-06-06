#lang racket

(define/contract (get-concatenation nums)
  (-> (listof exact-integer?) (listof exact-integer?))
  (append nums nums))

(get-concatenation '(1 2 3 4 5))
