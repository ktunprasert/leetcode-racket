#lang racket

(define (find-the-prefix-common-array a b)
  (define updateit (curryr hash-update add1 -1))
  (for/fold ([h (make-immutable-hash)]
             [out empty]
             [count 0]
             #:result (reverse out))
            ([a a]
             [b b])
    (let* ([h (updateit h a)]
           [left (if (= 1 (hash-ref h a)) 1 0)]
           [h (updateit h b)]
           [right (if (= 1 (hash-ref h b)) 1 0)]
           [new-count (+ count left right)])
      (values h (cons new-count out) new-count))))

(find-the-prefix-common-array '(1 3 2 4) '(3 1 2 4)) ; 0 2 3 4
(find-the-prefix-common-array '(2 3 1) '(3 1 2)) ; 0 1 3
