#lang racket

(define (square x) (* x x))

(define (sqrt-iter guess x)
   (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

;Сначала порывался ввести новую переменную, хранящую старый guess
;Потом обнаружил, что можно не множить сущности и опираться на следующий guess прямо при помощи (improve guess x)
;Таким образом, сравниваю по модулю (improve guess x) и (guess) с 0.001

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) 0.001))


(sqrt 10000000000000000000000000000000000000000000000000)

; На вопрос из упражнения "Верно ли, что на больших и маленьких числах она работает лучше?" ответить не смог.