#lang racket

(define (check-if-pangram sentence)
  (= 26
     (length (hash-keys (for/hash ([s sentence])
                          (values s #t))))))

(check-if-pangram "thequickbrownfoxjumpsoverthelazydog")
