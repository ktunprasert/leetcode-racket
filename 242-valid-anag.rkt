#lang racket

(define (is-anagram s t)
  (cond
    [(not (= (string-length s) (string-length t))) #f]
    [else
     (let ([s (sort (string->list s) char<?)]
           [t (sort (string->list t) char<?)])
       (for/and ([s s]
                 [t t])
         (char=? s t)))]))

(is-anagram "anagram" "nagaram") ; => #t
(is-anagram "car" "rat") ; => #f
