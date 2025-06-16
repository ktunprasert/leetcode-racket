#lang racket

(define (remove-outer-parentheses s)
  (define (helper chars depth current result)
    (cond
      [(empty? chars)
       (string-join (reverse result) "")]
      [(char=? (first chars) #\()
       (let ([new-depth (add1 depth)])
         (if (> new-depth 1)
             (helper (rest chars) new-depth
                     (string-append current (string (first chars))) result)
             (helper (rest chars) new-depth current result)))]
      [(char=? (first chars) #\))
       (let ([new-depth (sub1 depth)])
         (if (= new-depth 0)
             (helper (rest chars) new-depth "" (cons current result))
             (helper (rest chars) new-depth
                     (string-append current (string (first chars))) result)))]))

  (helper (string->list s) 0 "" empty))

(remove-outer-parentheses "(()())(())")
