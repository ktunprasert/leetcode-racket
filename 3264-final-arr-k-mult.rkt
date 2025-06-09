#lang racket
(require data/heap)

(define (get-final-state nums k multiplier)
  (define heap
    (make-heap (lambda (a b) (or (< (cdr a) (cdr b)) (and (= (cdr a) (cdr b)) (< (car a) (car b)))))))

  ; Initialize heap with (index . value) pairs
  (for ([val nums]
        [i (in-naturals)])
    (heap-add! heap (cons i val)))

  ; Perform k multiplications
  (for ([_ (in-range k)])
    (define min-pair (heap-min heap))
    (heap-remove-min! heap)
    (heap-add! heap (cons (car min-pair) (* (cdr min-pair) multiplier))))

  ; Reconstruct the array
  (define result (make-vector (length nums)))
  (for ([pair (in-heap heap)])
    (vector-set! result (car pair) (cdr pair)))

  (vector->list result))

(get-final-state '(2 1 3 5 6) 5 2)
