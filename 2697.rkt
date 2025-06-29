#lang racket

(define (make-smallest-palindrome s)
  (define slen (string-length s))
  (let loop ([head empty]
             [tail empty]
             [i 0])
    (cond
      [(>= i (quotient slen 2))
       (list->string (if (odd? slen)
                         (append (reverse head) (cons (string-ref s (quotient slen 2)) tail))
                         (append (reverse head) tail)))]
      [((negate char=?) (string-ref s i) (string-ref s (- slen i 1)))
       (let ([chead (string-ref s i)]
             [ctail (string-ref s (- slen 1 i))])
         (if (char<? chead ctail)
             (loop (cons chead head) (cons chead tail) (add1 i))
             (loop (cons ctail head) (cons ctail tail) (add1 i))))]
      [else (loop (cons (string-ref s i) head) (cons (string-ref s (- slen 1 i)) tail) (add1 i))])))

(make-smallest-palindrome "efcge")
(make-smallest-palindrome "abcd")
(make-smallest-palindrome "ab5cd")
(make-smallest-palindrome "seven")
