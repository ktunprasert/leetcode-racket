#lang racket

(define/contract (length-of-last-word s)
  (-> string? exact-integer?)
  (let find ([len 0] [rest (string->list s)] [found-space #f])
    (cond
      [(null? rest) len]
      [else
       (match (car rest)
         [#\space (find len (cdr rest) #t)]
         [_ (find (if (and found-space (> len 0)) 1 (add1 len)) (cdr rest) #f)])]
      )
    ))

(length-of-last-word "Hello World") ; should be 5
(length-of-last-word "  a") ; should be 1
(length-of-last-word "  fly    moon    ") ; should be 4
