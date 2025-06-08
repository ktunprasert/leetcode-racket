#lang racket

(define (max-freq-sum s)
  (for/fold ([vowels (make-immutable-hash)]
             [consonants (make-immutable-hash)]
             #:result (+ (apply max 0 (hash-values consonants))
                         (apply max 0 (hash-values vowels))))
            ([s (in-string s)])
    (case s
      [(#\a #\e #\i #\o #\u) (values (hash-update vowels s add1 0) consonants)]
      [else (values vowels (hash-update consonants s add1 0))])))

(max-freq-sum "uiia")
(max-freq-sum "successes")
