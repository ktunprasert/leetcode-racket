#lang racket

(require data/queue)

(define (count-students students sandwiches)
  (define student-queue (make-queue))
  (define sandwich-queue (make-queue))
  (define student-counts (make-hash))
  (define sandwich-counts (make-hash))

  (for ([s students])
    (enqueue! student-queue s)
    (hash-update! student-counts s add1 0))

  (for ([s sandwiches])
    (enqueue! sandwich-queue s)
    (hash-update! sandwich-counts s add1 0))

  (let loop ([sq student-queue]
             [saq sandwich-queue])
    (cond
      [(queue-empty? sq) 0]
      [(queue-empty? saq) (queue-length sq)]
      ;; [(and (> (hash-ref! sandwich-counts 0 #f) 0) (= 0 (hash-ref! student-counts 0 #f)))
      ;;  (queue-length sq)]
      ;; [(and (> (hash-ref! sandwich-counts 1 #f) 0) (= 0 (hash-ref! student-counts 1 #f)))
      ;;  (queue-length sq)]
      [else
       (define student (dequeue! student-queue))
       (define sandwich (dequeue! sandwich-queue))
       (println (list "stu" student "sand" sandwich "stuc" student-counts "sandc" sandwich-counts))

       (if (= student sandwich)
           (begin
             (hash-update! student-counts student sub1)
             (hash-update! sandwich-counts student sub1))
           (begin
             (enqueue! student-queue student)
             (enqueue-front! sandwich-queue sandwich)))

       (loop sq saq)])))

;; (count-students '(1 1 0 0) '(0 1 0 1)) ; 0
;; (count-students '(1 1 1 0 0 1) '(1 0 0 0 1 1)) ; 3

(count-students '[0 0 1 1 0 0 0 0 1 0 0 1 1 0 1 1] '[1 0 0 0 0 0 0 1 0 0 1 0 1 1 1 0])
