#lang racket

 (define (group-anagrams strs)
   (let ([groups (make-hash)])
     (for ([str strs])
       (let ([key (list->string (sort (string->list str) char<?))])
         (hash-update! groups key
                       (lambda (lst) (cons str lst))
                       '())))
     (hash-values groups)))

(group-anagrams '("eat" "tea" "tan" "ate" "nat" "bat"))
(group-anagrams '("" "c" "d"))
