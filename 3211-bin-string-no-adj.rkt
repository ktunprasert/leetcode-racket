#lang racket

(define cache (make-hash))

(define (valid-strings n)
  (cond
    [(hash-has-key? cache n) (hash-ref cache n)]
    [(= n 1)
     (define result '("0" "1"))
     (hash-set! cache n result)
     result]
    [else
     (define prev-strings (valid-strings (sub1 n)))
     (define result
       (filter (lambda (s)
                 (not (string-contains? s "00")))
               (append (map (lambda (s) (string-append "0" s)) prev-strings)
                       (map (lambda (s) (string-append "1" s)) prev-strings))))
     (hash-set! cache n result)
     result]))

(println "Cache before:")
(println cache)
(define result (valid-strings 3))
(println "Valid strings of length 3:")
(for-each println result)
(println "Cache after:")
(println cache)
