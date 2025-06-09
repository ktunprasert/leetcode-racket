#lang racket

(define (find-the-prefix-common-array a b)
  (for/fold ([h (make-hash)]
             [out empty]
             [count 0]
             #:result (reverse out))
            ([x a]
             [y b])
    (hash-update! h x add1 0)
    (define left (if (= 2 (hash-ref h x)) 1 0))
    (hash-update! h y add1 0)
    (define right (if (= 2 (hash-ref h y)) 1 0))
    (define new-count (+ count left right))
    (values h (cons new-count out) new-count)))

(find-the-prefix-common-array '(1 3 2 4) '(3 1 2 4)) ; 0 2 3 4
(find-the-prefix-common-array '(2 3 1) '(3 1 2)) ; 0 1 3
