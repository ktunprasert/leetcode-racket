#lang racket

;; size of list is n+1
;; assume n = 3
;; start with
;; '(0 0 0 0)
;; '(1 0 0 0) fixed return
;; '(1 1 0 0) maybe start here - when n = 2 only care about (0, 1)
;; '(1 2 1 0) n = 3; (0, 1, 2) -> permutation = ((0,1) (1,2))
;; '(1 3 3 1) (0 1 2 3) -> ((0,1) (1,2) (2,3))
;; (define/contract (get-row n)
;;   (-> exact-integer? (listof exact-integer?))
(define (get-row n)
  (match n
    [0 '(1)]
    [1 '(1 1)]
    [_
     (let loop ([i 2]
                [arr '(1 1)])
       (cond
         [(> i n) arr]
         [else
          (loop (add1 i)
                (append '(1)
                        (build-list (sub1 i)
                                    (lambda (x) (+ (list-ref arr x) (list-ref arr (add1 x)))))
                        '(1)))]))]))

;; (get-row 0)
;; (get-row 1)
;; (get-row 4)
;; (get-row 25)
(get-row 1000)
