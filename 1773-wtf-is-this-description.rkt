#lang racket

(define/match (search-fn _)
  [("type") first]
  [("color") second]
  [("name") third])

(define (count-matches items ruleKey ruleValue)
  (count (λ (lst) (string=? ruleValue ((search-fn ruleKey) lst))) items))

(count-matches '(("phone" "blue" "pixel") ("computer" "silver" "lenovo") ("phone" "gold" "iphone"))
               "color"
               "silver")
