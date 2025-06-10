#lang racket

(define/contract (most-words-found sentences)
  (-> (listof string?) exact-integer?)

  (for/fold ([max-words 0]) ([s sentences])
    (max max-words (add1 (length (filter (curry eq? #\space) (string->list s)))))))

(most-words-found '("I am a sentence with five words" "This one has four"
                                                      "Short one"
                                                      "Another sentence with six words here"))
