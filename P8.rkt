#lang scheme
(define lis '(1 2 3 4 5))
(define (cima lista)
  (let loop ((l1 '()) (listaa lista))
    (cond
      ((equal? '() lista) )
      ((>(length listaa) 1) (loop(append (list(+ (car listaa) (car(cdr listaa)))) l1) (cdr listaa))) #| suma los elementos de la lista que se encuentren al lado|#
      ((> (length l1) 1) (loop '() l1)) #| repite el mismo procedimiento mientras el tamaño de la lista sea mayor a 1 |#
      (else (car l1)) #| l1 resulta ser una lista con un unico valor por eso se usa car|#
      )
    )
  )
(cima '(1 2 3 4 5))
