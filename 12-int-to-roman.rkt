#lang racket

(define/contract (int-to-roman num)
  (-> exact-integer? string?)
  (define (convert n str)
    (cond
      [(>= n 1000) (convert (- n 1000) (string-append str "M"))]
      [(>= n 900) (convert (- n 900) (string-append str "CM"))]
      [(>= n 500) (convert (- n 500) (string-append str "D"))]
      [(>= n 400) (convert (- n 400) (string-append str "CD"))]
      [(>= n 100) (convert (- n 100) (string-append str "C"))]
      [(>= n 90) (convert (- n 90) (string-append str "XC"))]
      [(>= n 50) (convert (- n 50) (string-append str "L"))]
      [(>= n 40) (convert (- n 40) (string-append str "XL"))]
      [(>= n 10) (convert (- n 10) (string-append str "X"))]
      [(>= n 9) (convert (- n 9) (string-append str "IX"))]
      [(>= n 5) (convert (- n 5) (string-append str "V"))]
      [(>= n 4) (convert (- n 4) (string-append str "IV"))]
      [(>= n 1) (convert (- n 1) (string-append str "I"))]
      [else str]))
  (convert num ""))

(int-to-roman 1996) ; should be III
