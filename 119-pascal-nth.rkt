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
    [1 '(1)]
    [2 '(1 1)]
    ;; [_ (let loop ([i 2] [arr (append '(1 1) (make-list (add1 (quotient (add1 n) 2)) 0))])
    [_ (let loop ([i 2] [arr (append '(1 1) ((compose (curryr make-list 0) add1 (curryr quotient 2) add1) n))])
    ;; [_ (let loop ([i 2] [arr (append '(1 1) ((curryr compose add1 (curryr quotient 2) add1 (curryr make-list 0)) n))])
         (cond
           [(> i n) arr]
           [else (loop
                  (add1 i)
                  (reverse
                   (foldl append '(1)
                          (build-list n
                                      (lambda (x)
                                        (list
                                         (+
                                          (list-ref arr x)
                                          (list-ref arr (add1 x)))) )))) )]))]))

(get-row 4)
