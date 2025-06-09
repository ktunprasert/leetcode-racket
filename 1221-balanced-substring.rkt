#lang racket

(define/contract (balanced-string-split s)
  (-> string? exact-integer?)

  (define total 0)
  (for/fold ([balance 0]) ([c s])
    (when (= 0 balance)
      (set! total (add1 total)))
    (match c
      [#\R (add1 balance)]
      [#\L (sub1 balance)]))

  total)

(balanced-string-split "RLRRLLRLRL")
(balanced-string-split "RLRRRLLRLL")
(balanced-string-split "LLLLRRRR")
(balanced-string-split "LRLR")
