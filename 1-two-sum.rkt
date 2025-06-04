#lang racket

(define/contract
  (two-sum nums target)
  (-> (listof exact-integer?) exact-integer? (listof exact-integer?))
  (let loop1 ([i 0])
    (when (>= i (length nums)) (error "shouldn't happen"))
    (define current (list-ref nums i))

    (let loop2 ([j (add1 i)])
      (cond
        [(>= j (length nums)) (loop1 (add1 i))]
        [(= (+ current (list-ref nums j)) target) (list i j)]
        [else (loop2 (add1 j))]
        )
      )
    )
  )


(two-sum '(2 7 11 15) 9)
