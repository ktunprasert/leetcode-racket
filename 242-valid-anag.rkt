#lang racket

(define (is-anagram s t)
  (cond
    [(not (= (string-length s) (string-length t))) #f]
    [else
     (define shash (make-hash))
     (for ([s s])
       (hash-update! shash s add1 0))
     (define thash (make-hash))
     (for ([t t])
       (hash-update! thash t add1 0))
     (for/and ([k (hash-keys shash)])
       (= (hash-ref shash k -1) (hash-ref thash k -2)))]))

(is-anagram "anagram" "nagaram") ; => #t
(is-anagram "car" "rat") ; => #f
