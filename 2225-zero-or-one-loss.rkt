#lang racket

;; (define/contract (find-winners matches)
;;   (-> (listof (listof exact-integer?)) (listof (listof exact-integer?)))
;;   )

(define (find-winners matches)
  (define players (make-hash))
  (for ([m matches])
    (match-let ([(list winner loser) m])
      (hash-update! players winner identity 0)
      (hash-update! players loser add1 0)))

  (for/fold ([zloss empty]
             [oneloss empty]
             #:result (list (sort zloss <) (sort oneloss <)))
            ([p (in-hash-pairs players)])
    (match-let ([(cons player score) p])

      (match score
        [0 (values (cons player zloss) oneloss)]
        [1 (values zloss (cons player oneloss))]
        [_ (values zloss oneloss)]))))

(println (find-winners '((2 3) (1 3) (5 4) (6 4))))
