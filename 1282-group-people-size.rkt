#lang racket

(define (group-the-people groupSizes)
  ;; (let-values ([(group-hash count-hash) (for/fold ([hgroup (make-immutable-hash)]
  ;;                                                  [hcount (make-immutable-hash)])
  ;;                                                 ([n (in-list groupSizes)]
  ;;                                                  [i (in-naturals)])
  ;;                                         (values (hash-update hgroup n (curry cons i) empty)
  ;;                                                 (hash-update hcount n add1 0)))])
  ;;   (println group-hash)
  ;;   (println count-hash)
  ;;   (for/list ([a (in-hash-pairs group-hash)])
  ;;     (rest a))
  ;;   )
  (for/fold ([hgroup (make-immutable-hash)]
             [hcount (make-immutable-hash)]
             [out empty])
            ([n (in-list groupSizes)]
             [i (in-naturals)])

    (if (= n (hash-ref hcount n -12345))
        (let* ([group (hash-ref hgroup n)]
               [hgroup (hash-set hgroup n empty)]
               [hcount (hash-set hcount n 0)])
          (begin
            (values (hash-update hgroup n (curry cons i) empty)
                    (hash-update hcount n add1 0)
                    (cons group out))))
        (values (hash-update hgroup n (curry cons i) empty) (hash-update hcount n add1 0) out))))

(group-the-people '(3 3 3 3 3 1 3))
