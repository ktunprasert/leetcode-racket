#lang racket

(define (convert-date-to-binary date)
  (let* ([splitted (string-split date "-")]
         [converted (map (compose (curryr number->string 2) string->number) splitted)])
    (string-join converted "-")))

;; ((compose (curryr string-split "-")) date))

(convert-date-to-binary "2023-10-01")
