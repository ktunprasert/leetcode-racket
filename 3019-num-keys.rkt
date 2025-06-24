#lang racket

(define/contract (count-key-changes s)
  (-> string? exact-integer?)
  (sub1 (set-count (list->set (string->list (string-downcase s))))))

(count-key-changes "abc")
