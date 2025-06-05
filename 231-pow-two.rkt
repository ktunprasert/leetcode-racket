#lang racket


(define
  (is-power-of-two n)
  (match n [0 #f] [_ (= 0 (bitwise-and n (sub1 n)))]))


;; (is-power-of-two -128)
;; (is-power-of-two -2)
;; (is-power-of-two -1)
(is-power-of-two 0)
;; (is-power-of-two 1)
;; (is-power-of-two 2)
;; (is-power-of-two 3)
;; (is-power-of-two 5)
