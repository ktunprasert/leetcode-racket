#lang racket

;; (define/contract (score-of-string s)
;;   (-> string? exact-integer?)
;;   )

(define
  (score-of-string s)
  (define sref->int (compose char->integer (curry string-ref s)))
  (apply + (build-list (sub1 (string-length s)) (lambda (i) (abs (- (sref->int i) (sref->int (add1 i))) )) )))


(score-of-string "hello")
(score-of-string "zaz")
