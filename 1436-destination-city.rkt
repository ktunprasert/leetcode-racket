#lang racket

(define (dest-city paths)
  (define city-map
    (for/hash ([path paths])
      (apply values path)))
  (do ([city (second (car paths)) (hash-ref city-map city)])
      (((negate hash-has-key?) city-map city) city)))

(dest-city '[["London" "New York"] ["New York" "Lima"] ["Lima" "Sao Paulo"]])
