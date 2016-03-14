#lang racket

; Тут трюк в том, что по идее из-за аппликативного порядка вычислений должно было бы зациклиться выполнение этого кода,
; так как интерпретатор начал бы разворачивать процедуру, натыкался бы на рекурсивный кусок с sqrt-iter и зацикливался бы на нем.
; Но ВНЕЗАПНО DrRacket почему-то скушал этот код и не подавился. Выдал правильный ответ.
; MIT-Scheme интерпретатор Edwin, говорят, циклится как и задумано.

(define (new-if predicate then-clause else-clause) (cond (predicate then-clause)
        (else else-clause)))

(define (square x) (* x x))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 16)