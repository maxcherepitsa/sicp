#lang racket
;Определите процедуру, которая принимает в качестве аргументов 
;три числа и возвращает сумму квадратов двух бóльших из них.

(define (square x) (* x x))

;Можно ли без >=?
(define (>= y z) (not (< y z)))

(define (sum-of-two-bigger-sqrs a b c)                                  
  
;Кажется, можно упростить вот здесь логику:
  (cond ((and (>= a b) (>= b c)) (+ (square a) (square b)))
        ((and (>= b a) (>= c a)) (+ (square b) (square c)))
        (else (+ (square a) (square c)))
        ) 
)

(sum-of-two-bigger-sqrs 3 2 1)


