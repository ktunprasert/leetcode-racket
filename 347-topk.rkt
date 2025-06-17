#lang racket

(define (top-k-frequent nums k)
  (cond
    [(= k (length nums)) nums]
    [else
     (define nhash (make-hash))
     (for ([n nums])
       (hash-update! nhash n add1 0))

     (let loop ([out empty]
                [n (take (sort (hash-values nhash) >) k)])
       (cond
         [(= k (length out)) out]
         [else
          (begin0 (loop (cons (for/first ([(key v) nhash]
                                          #:when (= v (first n)))
                                (hash-remove! nhash key)
                                key)
                              out)
                        (drop n 1))
            )]))]))

(top-k-frequent '(1 1 1 2 2 3) 2) ; 1 2
(top-k-frequent '(1) 1) ; 1
(top-k-frequent '(3) 1) ; 1
(top-k-frequent '(1 2) 2) ; 1
