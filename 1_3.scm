#lang racket
;Определите процедуру, которая принимает в качестве аргументов 
;три числа и возвращает сумму квадратов двух бóльших из них.

(define (square x) (* x x))

;Можно ли без >=?
(define (>= y z) (not (< y z)))

(define (sum-of-two-bigger-sqrs a b c)                                  
  (define sq-a (square a))
  (define sq-b (square b))
  (define sq-c (square c))

;Кажется, можно упростить вот здесь логику:
  (cond ((and (>= sq-a sq-b) (>= sq-b sq-c)) (+ sq-a sq-b))
        ((and (>= sq-b sq-a) (>= sq-c sq-a)) (+ sq-b sq-c))
        (else (+ sq-a sq-c))
        ) 
)

(sum-of-two-bigger-sqrs 1 2 3)


