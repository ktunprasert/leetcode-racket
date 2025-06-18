#lang racket

(define (get-sum a b)
  (let loop ([x a]
             [y b])
    (if (= y 0)
        x
        (let ([carry (bitwise-and (arithmetic-shift (bitwise-and x y) 1) #xFFFFFFFF)]
              [sum (bitwise-and (bitwise-xor x y) #xFFFFFFFF)])
          ;; Handle sign extension for 32-bit integers
          (let ([carry-signed (if (> carry #x7FFFFFFF)
                                  (- carry #x100000000)
                                  carry)]
                [sum-signed (if (> sum #x7FFFFFFF)
                                (- sum #x100000000)
                                sum)])
            (loop sum-signed carry-signed))))))

(get-sum 1 2)
(get-sum 5 7)
(get-sum -1 1)
