#lang racket

(define (pivot-array nums pivot)
  ;; (-> (listof exact-integer?) exact-integer? (listof exact-integer?))
  (define l '())
  (define m '())
  (define r '())
  (for ([n nums])
    ;; (eprintf "l~a m~a r~a\n" l m r  )
    (cond
      [(< n pivot) (set! l (append l (list n)) ) ]
      [(= n pivot) (set! m (append m (list n)) ) ]
      [(> n pivot) (set! r (append r (list n)) ) ]))

  (append l m r)
  )

(require rackunit)

;; Input: nums = [9,12,5,10,14,3,10], pivot = 10
;; Output: [9,5,3,10,10,12,14]
(check-equal? (pivot-array '(9 12 5 10 14 3 10) 10) '(9 5 3 10 10 12 14))

;; Input: nums = [-3,4,3,2], pivot = 2
;; Output: [-3,2,4,3]
(check-equal? (pivot-array '(-3 4 3 2) 2) '(-3 2 4 3))



