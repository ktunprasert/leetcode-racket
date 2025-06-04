#lang racket

(define/contract (search-insert nums target)
  (-> (listof exact-integer?) exact-integer? exact-integer?)
  (let bin-search ([low 0]
                   [high (sub1 (length nums))])
    (define mid (quotient (+ low high) 2))
    (define mid-val (list-ref nums mid))
    (cond
      [(> low high) low]
      [(= mid-val target) mid]
      [(> mid-val target) (bin-search low (sub1 mid))]
      [(< mid-val target) (bin-search (add1 mid) high)]
      )
    )
  )

(search-insert '(1 3 5 6) 5) ; should be 2
(search-insert '(1 3 5 6) 4) ; should be 2
(search-insert '(1 3 5 6) 2) ; should be 1
(search-insert '(1 3 5 6) 7) ; should be 4
