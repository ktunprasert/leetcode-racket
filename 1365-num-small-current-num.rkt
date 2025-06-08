#lang racket

; max can only be (count distinct) num
; sort reverse and minus one each time is your hash-map
(define (smaller-numbers-than-current nums)
  (let* ([h-freq (foldl (lambda (n h) (hash-update h n add1 0)) (make-immutable-hash) nums)]
         [h-freq (for/fold ([h-final (make-immutable-hash)]
                            [prefix 0]
                            #:result h-final)
                           ([kv (in-hash-pairs h-freq)])
                   (begin (println kv) (values (hash-set h-final (car kv) prefix) (+ prefix (cdr kv)))))])
    (for/list ([n nums])
      (hash-ref h-freq n))))


;; (smaller-numbers-than-current '(8 1 2 2 3))

;; [60,14,3,39,49,43,53,24,33,13,32,93,65,26,77,55,2,28,2,50,18,4,92,20,57,90,64,86,54,69,28,80,88,66,57,28,67,83,3,50,86]
(smaller-numbers-than-current '(60 14 3 39 49 43 53 24 33 13 32 93 65 26 77 55 2 28 2 50 18 4 92 20 57 90 64 86 54 69 28 80 88 66 57 28 67 83 3 50 86))
