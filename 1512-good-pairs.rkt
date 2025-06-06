#lang racket

;; hashmap
(define (num-identical-pairs nums)
  ;; (-> (listof exact-integer?) exact-integer?)
  (define h (make-hash))
  (define good 0)

  (for ([n nums])
    (begin
      (if (hash-has-key? h n)
          (begin
            (set! good (+ good (hash-ref h n)))
            (hash-update! h n add1)
            )
          (hash-set! h n 1)) )
    )

  good
  )

(require rackunit)

(check-equal? (num-identical-pairs '(1 2 3 1 1 3)) 4)
(check-equal? (num-identical-pairs '(1 1 1 1)) 6)
(check-equal? (num-identical-pairs '(1 2 3)) 0)
