#lang racket
;; Helper function to count occurrences of character in string
(define (string-count str char)
  (length (filter (lambda (c) (equal? c (string-ref char 0)))
                  (string->list str))))

(define (garbage-collection garbage travel)
  ;; Calculate prefix sums of travel times
  (define prefix-sums
    (reverse (foldl (lambda (t acc)
                      (cons (+ t (car acc)) acc))
                    '(0)
                    travel)))

  ;; Helper function to find last occurrence of garbage type and calculate time
  (define (calc-time-for-type type)
    (define last-house -1)
    (define total-garbage 0)

    ;; Find last house with this garbage type and count total garbage
    (for ([i (in-naturals)] [house garbage])
      (when (string-contains? house type)
        (set! last-house i)
        (set! total-garbage (+ total-garbage (string-count house type)))))

    ;; If no garbage of this type, return 0
    (if (= last-house -1)
        0
        (+ (list-ref prefix-sums last-house) total-garbage)))

  ;; Sum up times for all three garbage types
  (+ (calc-time-for-type "M")
     (calc-time-for-type "G")
     (calc-time-for-type "P")))

;; (garbage-collection (list "G" "P" "GP" "MGP") (list 2 4 3))
(garbage-collection (list "G" "P" "GP" "GG") (list 2 4 3))
