#lang racket

(define code
  #[".-"
    "-..."
    "-.-."
    "-.."
    "."
    "..-."
    "--."
    "...."
    ".."
    ".---"
    "-.-"
    ".-.."
    "--"
    "-."
    "---"
    ".--."
    "--.-"
    ".-."
    "..."
    "-"
    "..-"
    "...-"
    ".--"
    "-..-"
    "-.--"
    "--.."])

(define (unique-morse-representations words)
  (length (group-by identity
                    (for/list ([w words])
                      (string-join (for/list ([c w])
                                     (define idx (- (char->integer c) 97))
                                     (vector-ref code idx))
                                   "")))))

(unique-morse-representations '("a"))
(unique-morse-representations '("gin" "zen" "gig" "msg"))
