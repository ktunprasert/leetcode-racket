#lang racket

(define (to-hex num)
  (set! num
        (if (negative? num)
            (+ (expt 2 32) num)
            num))

  (define BBGGRR (build-list 6 (λ (n) (modulo (quotient num (expt 16 n)) 16))))

  (define RRGGBB-char
    (reverse (for/list ([n BBGGRR])
               (cond
                 [(< n 10) (integer->char (+ n 48))]
                 [else (integer->char (+ 97 (- n 10)))]))))

  (list->string (cond
                  [(< num 256) (drop RRGGBB-char 4)]
                  [(< num (* 256 256)) (drop RRGGBB-char 2)]
                  [else RRGGBB-char])))

(to-hex 26)
(to-hex -1)
