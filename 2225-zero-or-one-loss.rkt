#lang racket

;; (define/contract (find-winners matches)
;;   (-> (listof (listof exact-integer?)) (listof (listof exact-integer?)))
;;   )

(define (find-winners matches)
  (define players (make-hash))
  (for ([m matches])
    (match-let ([(list winner loser) m])
      (hash-ref! players winner 0)
      (when (< (hash-ref! players loser 0) 2)
        (hash-update! players loser add1 0))))

  (for/fold ([zloss empty]
             [oneloss empty]
             #:result (list (sort zloss <) (sort oneloss <)))
            ([p (in-hash-pairs players)])
    (match-let ([(cons player score) p])
      (match score
        [0 (values (cons player zloss) oneloss)]
        [1 (values zloss (cons player oneloss))]
        [_ (values zloss oneloss)]))))

;; [[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10,9]]
(println (find-winners '[[1 3] [2 3] [3 6] [5 6] [5 7] [4 5] [4 8] [4 9] [10 4] [10 9]]))
(println (find-winners '((2 3) (1 3) (5 4) (6 4))))
