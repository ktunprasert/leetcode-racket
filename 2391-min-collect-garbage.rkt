#lang racket

(define (garbage-collection garbage travel)
  ;; Single pass to find last indices and total garbage length
  (define-values (Gi Pi Mi total-garbage)
    (for/fold ([Gi #f] [Pi #f] [Mi #f] [total-len 0])
              ([house garbage] [i (in-naturals)])
      (values (if (string-contains? house "G") i Gi)
              (if (string-contains? house "P") i Pi)
              (if (string-contains? house "M") i Mi)
              (+ total-len (string-length house)))))

  ;; Calculate travel times for each garbage type
  ;; Build prefix sums for travel times
  (define prefix-sums
    (reverse (foldl (lambda (t acc)
                      (cons (+ t (car acc)) acc))
                    '(0)
                    travel)))

  (define travel-time
    (+ (if Gi (list-ref prefix-sums Gi) 0)
       (if Pi (list-ref prefix-sums Pi) 0)
       (if Mi (list-ref prefix-sums Mi) 0)))

  (+ travel-time total-garbage))

;; (garbage-collection (list "G" "P" "GP" "MGP") (list 2 4 3))
(garbage-collection (list "G" "P" "GP" "GG") (list 2 4 3))
