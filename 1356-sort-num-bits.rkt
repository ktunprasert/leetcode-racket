#lang racket

(define (bit-count n [count 0])
  (cond
    [(zero? n) count]
    [else (bit-count (bitwise-and n (sub1 n)) (add1 count))]))

(define/contract (sort-by-bits arr)
  (-> (listof exact-integer?) (listof exact-integer?))
  (sort arr (λ (a b)
              (let ([bits-a (bit-count a)]
                    [bits-b (bit-count b)])
                (or (< bits-a bits-b)
                    (and (= bits-a bits-b) (< a b)))))))

(sort-by-bits '(0 1 2 3 4 5 6 7 8))

(sort-by-bits '[1024 512 256 128 64 32 16 8 4 2 1])
