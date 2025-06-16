#lang racket

(define (garbage-collection garbage travel)
  (define gbg (map string->list garbage))

  (define-values (M G P) (values 0 0 0))

  (let ([travels (for/fold ([Mi 0]
                            [Gi 0]
                            [Pi 0]
                            #:result (append (take travel Mi) (take travel Gi) (take travel Pi)))
                           ([(s i) (in-indexed gbg)])
                   (when (member #\M s)
                     (set! Mi i)
                     (set! M (+ M (count (curry char=? #\M) s))))
                   (when (member #\G s)
                     (set! Gi i)
                     (set! G (+ G (count (curry char=? #\G) s))))
                   (when (member #\P s)
                     (set! Pi i)
                     (set! P (+ P (count (curry char=? #\P) s))))
                   (values Mi Gi Pi))])
    (+ M G P (apply + travels))))

(garbage-collection (list "G" "P" "GP" "GG") (list 2 4 3))
