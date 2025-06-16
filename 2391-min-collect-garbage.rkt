#lang racket

(define (garbage-collection garbage travel)
  ;; Single pass with true incremental prefix sum
  (define-values (G-time P-time M-time total-garbage)
    (for/fold ([G-time 0] [P-time 0] [M-time 0] [total-len 0] [prefix-sum 0]
               #:result (values G-time P-time M-time total-len))
              ([house garbage] [t (in-list (cons 0 travel))])
      (let ([new-prefix (+ prefix-sum t)])
        (values (if (string-contains? house "G") new-prefix G-time)
                (if (string-contains? house "P") new-prefix P-time)
                (if (string-contains? house "M") new-prefix M-time)
                (+ total-len (string-length house))
                new-prefix))))

  (+ G-time P-time M-time total-garbage))

;; (garbage-collection (list "G" "P" "GP" "MGP") (list 2 4 3))
(garbage-collection (list "G" "P" "GP" "GG") (list 2 4 3))
