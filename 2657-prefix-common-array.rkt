#lang racket

(define (find-the-prefix-common-array A B)
  (define updateit (curryr hash-update add1 -1))
  (for/fold ([h (make-immutable-hash)]
             [out empty]
             #:result (reverse out))
            ([a A]
             [b B])
    (let* ([h h]
           [h (updateit h a)]
           [h (updateit h b)])
      (values h (cons (for/sum ([v (hash-values h)] #:when (positive? v)) v) out)))))

(find-the-prefix-common-array '(1 3 2 4) '(3 1 2 4)) ; 0 2 3 4
(find-the-prefix-common-array '(2 3 1) '(3 1 2)) ; 0 1 3
