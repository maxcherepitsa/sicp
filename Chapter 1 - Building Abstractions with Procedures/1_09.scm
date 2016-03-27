#lang racket
; Каждая из следующих двух процедур определяет способ сложения двух положительных целых чисел с помощью процедур inc,
; которая добавляет к своему аргументу 1, и dec, которая отнимает от своего аргумента 1.

; Используя подстановочную модель, проиллюстрируйте процесс, порождаемый каждой из этих про- цедур, вычислив (+ 4 5).
; Являются ли эти процессы итеративными или рекурсивными?


  
(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

; a не равно нулю, значит сразу уходим в альтернативу (inc (+ (dec a) b))
; (+ 4 5)
; (inc (+ (dec 4) 5))
; (inc (+ 3 5))
; (inc (inc (+ (dec 3) 5)))
; (inc (inc (+ 2 5)))
; (inc (inc (inc (+ (dec 2) 5))))
; (inc (inc (inc (+ 1 5))))
; (inc (inc (inc (inc (+ (dec 1) 5))))))
; (inc (inc (inc (inc (+ 0 5)))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; (inc 9)
;
; Это рекурсивный процесс.
;
; ----------
;

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

; Подстановка:
; (+ 4 5)
; (+ (dec 4) (inc 5))
; (+ 3 6)
; (+ (dec 3) (inc 6))
; (+ 2 7)
; (+ (dec 1) (inc 8))
; (+ 0 9)
; 9
;
; Это итеративный процесс

; Когда проверял ответ обнаружил подсказку: без подстановки можно определить к какому типу относится процедура вот так:
; The easiest way to spot that the first process is recursive (without writing out the substitution) is to note that the "+" procedure calls itself at the end while nested
; in another expression; the second calls itself, but as the top expression.


