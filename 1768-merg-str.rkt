#lang racket

(define (merge-alternately word1 word2)
  (define sl1 (string-length word1))
  (define sl2 (string-length word2))

  (string-append (apply string
                        (flatten (for/list ([w1 word1]
                                            [w2 word2])
                                   (list w1 w2))))
                 (cond
                   [(= sl1 sl2) ""]
                   [(> sl1 sl2) (substring word1 sl2)]
                   [(> sl2 sl1) (substring word2 sl1)])))

(merge-alternately "abc" "123")
(merge-alternately "abcdef" "123")
