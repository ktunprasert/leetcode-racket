#lang racket

; max can only be (count distinct) num
; sort reverse and minus one each time is your hash-map
(define (smaller-numbers-than-current nums)
  (let* ([sorted (sort nums <)]
         [h-freq (for/fold ([h (make-immutable-hash)])
                           ([v sorted]
                            [i (in-naturals)]
                            #:when (not (hash-has-key? h v)))
                   (hash-set h v i))])
    (for/list ([n nums])
      (hash-ref h-freq n))))

(smaller-numbers-than-current '(8 1 2 2 3))
;; (smaller-numbers-than-current '(60 14 3 39 49 43 53 24 33 13 32 93 65 26 77 55 2 28 2 50 18 4 92 20 57 90 64 86 54 69 28 80 88 66 57 28 67 83 3 50 86))
