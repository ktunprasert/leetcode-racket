#lang racket

;; (define/contract (score-of-string s)
;;   (-> string? exact-integer?)
;;   )

(define (score-of-string s)
  (define sref->int (compose char->integer (curry string-ref s)))
  (let loop ([i 0]
             [acc 0])
    (cond
      [(= i (sub1 (string-length s))) acc]
      [else (loop (add1 i) (+ acc (abs (- (sref->int i) (sref->int (add1 i))))))])))

(score-of-string "hello")
(score-of-string "zaz")
