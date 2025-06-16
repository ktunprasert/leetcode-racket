#lang racket

(define (garbage-collection garbage travel)
  (let ([giga (let loop ([i (sub1 (length garbage))]
                         [s (reverse garbage)]
                         [Mi 0]
                         [Gi 0]
                         [Pi 0])
                (cond
                  [(empty? s) (list Mi Gi Pi)]
                  [(not (ormap (curry = 0) (list Mi Gi Pi))) (list Mi Gi Pi)]
                  [else
                   (loop (sub1 i)
                         (cdr s)
                         (if (string-contains? (first s) "M")
                             (max Mi i)
                             Mi)
                         (if (string-contains? (first s) "G")
                             (max Gi i)
                             Gi)
                         (if (string-contains? (first s) "P")
                             (max Pi i)
                             Pi))]))])
    (+ (foldl (lambda (ti acc) (+ acc (apply + (take travel ti)))) 0 giga)
       (apply + (map string-length garbage)))))

;; (garbage-collection (list "G" "P" "GP" "MGP") (list 2 4 3))
(garbage-collection (list "G" "P" "GP" "GG") (list 2 4 3))
