#lang racket

(define (to-hex num)
  (set! num
        (if (negative? num)
            (+ (expt 2 32) num)
            num))
  (define BGR (build-list 9 (λ (n) (modulo (quotient num (expt 16 n)) 16))))
  (define RGB-char
    (reverse (for/list ([n BGR])
               (cond
                 [(< n 10) (integer->char (+ n 48))]
                 [else (integer->char (+ 97 (- n 10)))]))))
  (define dropped (dropf RGB-char (curry char=? #\0)))
  (if (zero? (length dropped))
      "0"
      (list->string dropped)))

(to-hex 26)
(to-hex -1)
(to-hex 0)
