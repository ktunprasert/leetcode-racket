#lang racket

(define (count-max-or-subsets nums)
  (for/fold ([hash (make-immutable-hash)]
             [max-key 0]
             #:result (hash-ref hash max-key)
             )
            ([lst (in-combinations nums)])
    (let ([key (apply bitwise-ior lst)]) (values (hash-update hash key add1 0) (max max-key key)))))

(count-max-or-subsets '(3 1))
(count-max-or-subsets '(2 2 2))
(count-max-or-subsets '(3 2 1 5))
