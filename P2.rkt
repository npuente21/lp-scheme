#lang scheme
(define (maymecola lista)
  (let loop ((men +inf.0) (may -inf.0) (id1 0) (id2 0) (recor lista)) #| id1 es el nombre de la lista de mayor valor e id2 la de menor valor  |#
    (cond                                                             #| men es el menor numero actual y may el mayor numero actual |#
      ((equal? '() recor) (cons id1 (list id2)))
      ((< may (apply + (cdr (car recor)))) (loop men (apply + (cdr (car recor))) (caar recor) id2 (cdr recor)))
      ((> men (apply + (cdr (car recor)))) (loop (apply + (cdr (car recor))) may id1 (caar recor) (cdr recor)))
      )
    )
)
(maymecola '((1 2 3 4) (432 4 3 2 3) (4 0 1 4) (-1 -1 -1 -1 -2 -3)))