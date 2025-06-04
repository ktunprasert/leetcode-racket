#lang racket

(define/contract (search-insert nums target)
  (-> (listof exact-integer?) exact-integer? exact-integer?)
  (define (bin-search nums target low high)
    (define mid (quotient (+ low high) 2))
    (define mid-val (list-ref nums mid))
    (cond
      [(> low high) low]
      [(= mid-val target) mid]
      [(> mid-val target) (bin-search nums target low (sub1 mid))]
      [(< mid-val target) (bin-search nums target (add1 mid) high)]
      )
    )
  (bin-search nums target 0 (sub1 (length nums)))
  )

(search-insert '(1 3 5 6) 5) ; should be 2
(search-insert '(1 3 5 6) 4) ; should be 2
(search-insert '(1 3 5 6) 2) ; should be 1
(search-insert '(1 3 5 6) 7) ; should be 4
