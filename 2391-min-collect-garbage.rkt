#lang racket

(define (garbage-collection garbage travel)
  (define tsum (make-hash))
  (for ([(t i) (in-indexed travel)])
    (hash-set! tsum i (+ t (hash-ref! tsum (sub1 i) 0))))
  ;; (displayln tsum)

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

    ;; (displayln giga)
    ;; (displayln (map (lambda (key) (hash-ref! tsum (sub1 key) 0)) giga))
    ;; (displayln (apply + (map string-length garbage)))

    (+ (foldl (lambda (key acc) (+ acc (hash-ref! tsum (sub1 key) 0))) 0 giga)
       (apply + (map string-length garbage)))

    ;; (+ (foldl (lambda (ti acc) (+ acc (apply + (take travel ti)))) 0 giga)
    ;;    ;; (+ (apply + (map (curry hash-ref! tsum) giga ) )
    ;;    (apply + (map string-length garbage)))
    ))

;; (garbage-collection (list "G" "P" "GP" "MGP") (list 2 4 3))
(garbage-collection (list "G" "P" "GP" "GG") (list 2 4 3))
