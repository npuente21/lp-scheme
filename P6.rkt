#lang scheme
(define (armar k lista)
  (define valor k)
  (let loop ((l1 '()) (actual (car lista)) (falta (cdr lista)) (l3 (cdr lista)) (l2 '()))
    (cond
      ((equal? (length l3) 0)
       (cond
         ((equal? (length l2) 0) #f)  #|revisa si la lista esta vacia o si encontro al menos 1 caso que se cumpla|#
         (else l2)
         ))
      ((equal? (length falta) 0) (loop l1 (car l3) (cdr l3) (cdr l3) l2))
      ((equal? (+ actual (car falta)) valor) (cond
                                               ((member (cons (car falta) (cons actual l1)) l2)(loop l1 actual (cdr falta) l3 l2)) #|revisa si el caso esta en la lista|#
                                               (else (loop l1 actual (cdr falta) l3 (cons (cons (car falta) (cons actual l1)) l2)))
                                               )
                                             )
      (else (loop l1 actual (cdr falta) l3 l2))
      )
  )
)
    (define ej '(1 2 3 8 23 8 14 4 9))
(define l2 '())
(define l3 '())
(armar 12 '(1 2 3 8 23 8 14 4 9))