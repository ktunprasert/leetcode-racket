#lang racket

(require parser-tools/lex)

(define the-lexer
  (lexer [(eof) eof]
         [(concatenation (repetition 2 2 numeric) "#")
          (+ 96 (string->number (substring lexeme 0 (sub1 (string-length lexeme)))))]
         [(repetition 1 1 numeric) (+ 96 (string->number lexeme))]
         [any-char (the-lexer input-port)]))

(define (freq-alphabets s)
  (define sport (open-input-string s))
  (let ([numbers (do ([n (the-lexer sport) (the-lexer sport)] [ns empty])
                     ((eof-object? n) (reverse ns))
                     (set! ns (cons n ns)))])
    (list->string (map integer->char numbers))))

(freq-alphabets "123456")
(freq-alphabets "10#")
