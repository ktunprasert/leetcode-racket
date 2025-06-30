#lang racket

(define (word-pattern pattern s)
  (define pmap (make-hash))
  (define smap (make-hash))
  (if ((negate =) (length (string-split s)) (string-length pattern))
      false
      (begin
        (for/and ([k pattern]
                  [w (string-split s)])
          (begin0 (and (equal? w (hash-ref! pmap k w)) (equal? k (hash-ref! smap w k)))
            (hash-set! pmap k w)
            (hash-set! smap w k))))))

(word-pattern "abba" "dog cat cat dog")
;; (word-pattern "abba" "dog cat cat fox")
