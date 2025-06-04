#lang racket

(define/contract
  (two-sum nums target)
  (-> (listof exact-integer?) exact-integer? (listof exact-integer?))
  ; body
  ;; (list 1)
  ;; (let (x ))
  (let loop1 ([i 0])
    ;; (when (or (>= i (length nums)) (>= j (length nums))) error "shouldn't happen")
    (when (>= i (length nums)) (error "shouldn't happen"))
    (define current (list-ref nums i))

    (let loop2 ([j i])
      (when (>= j (length nums)) (error "shouldn't happen"))
      (when (= (- target current) (list-ref nums j)) (list i j))

      (loop2 (add1 j))
      )

    (loop1 (add1 i))
    )
  )


(two-sum '(2 7 11 15) 9)
