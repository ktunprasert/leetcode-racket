#lang racket

(define (merge-alternately word1 word2)
  (define sl1 (string-length word1))
  (define sl2 (string-length word2))
  (define w1 (string->list word1))
  (define w2 (string->list word2))
  (list->string (flatten (list (for/list ([w1 w1]
                                          [w2 w2])
                                 (list w1 w2))
                               (cond
                                 [(> sl1 sl2) (drop w1 sl2)]
                                 [(> sl2 sl1) (drop w2 sl1)]
                                 [else empty])))))

(merge-alternately "abc" "123")
(merge-alternately "abcdef" "123")
