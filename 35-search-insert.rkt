#lang racket

(define/contract (search-insert nums target)
  (-> (listof exact-integer?) exact-integer? exact-integer?)
  (define (bin-search nums target low high)
    (define mid (quotient (+ low high) 2))
    (define mid-val (list-ref nums mid))
    ;; (eprintf "target: ~a\tlow: ~a, high: ~a, mid: ~a, mid-val: ~a\n" target low high mid mid-val)
    ;; (eprintf "\t\t(h-l): ~a\n" (- high low))
    (match (- high low)
      [1 (cond
           [(> target mid-val) (add1 mid)]
           [else mid])]
      [_
       (cond
         [(= mid-val target) mid]
         [(> mid-val target) (bin-search nums target low mid)]
         [(< mid-val target) (bin-search nums target mid high)]
         )]
      )
    )
  (bin-search nums target 0 (length nums))
  )

;; (search-insert '(1 3 5 6) 5) ; should be 2
;; (search-insert '(1 3 5 6) 4) ; should be 2
;; (search-insert '(1 3 5 6) 2) ; should be 1
(search-insert '(1 3 5 6) 7) ; should be 4
