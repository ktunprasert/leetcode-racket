#lang racket

(define (get-final-state nums k multiplier)
  (define arr (list->vector nums))
  (define n (vector-length arr))

  (for ([_ (in-range k)])
    (define min-val (vector-ref arr 0))
    (define min-idx 0)

    (for ([i (in-range 1 n)])
      (define val (vector-ref arr i))
      (when (< val min-val)
        (set! min-val val)
        (set! min-idx i)))

    (vector-set! arr min-idx (* min-val multiplier)))

  (vector->list arr))

(get-final-state '(2 1 3 5 6) 5 2)
