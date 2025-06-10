#lang racket

(define/contract (find-center edges)
  (-> (listof (listof exact-integer?)) exact-integer?)
  (define edgy (make-hash))
  (define maximum 0)
  (define max-edge 0)
  (for ([e edges])
    (for ([n e])
      (hash-update! edgy n add1 0)
      (when (<= maximum (hash-ref edgy n))
        (set! maximum (max maximum (hash-ref edgy n)))
        (set! max-edge n))))

  max-edge)

(find-center '((1 2) (2 3) (4 2)))
