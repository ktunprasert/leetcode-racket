#lang racket

(define/contract length-of-last-word (-> string? exact-integer?) (compose1 string-length last string-split))

(length-of-last-word "Hello World") ; should be 5
(length-of-last-word "  a") ; should be 1
(length-of-last-word "  fly    moon    ") ; should be 4
