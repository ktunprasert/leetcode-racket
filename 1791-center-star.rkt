#lang racket

(define/contract (find-center edges)
  (-> (listof (listof exact-integer?)) exact-integer?)

  (define edgy (make-hash))
  (define look-for (length edges))
  (define found 0)

  (for* ([e edges]
         [n e]
         #:do [(hash-update! edgy n add1 0) (set! found n)]
         #:break (= (hash-ref edgy n) look-for))
    (void))

  found)

(find-center '((1 2) (2 3) (4 2)))
