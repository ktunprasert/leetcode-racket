#lang racket

(define (remove-outer-parentheses s)
  (define result empty)
  (define current "")
  (define depth 0)

  (for ([char s])
    (cond
      [(char=? char #\()
       (set! depth (add1 depth))
       (when (> depth 1)
         (set! current (string-append current (string char))))]
      [(char=? char #\))
       (set! depth (sub1 depth))
       (cond
         [(= depth 0)
          (set! result (append result (list current)))
          (set! current "")]
         [else
          (set! current (string-append current (string char)))])]))

  (string-join result ""))

(remove-outer-parentheses "(()())(())")
