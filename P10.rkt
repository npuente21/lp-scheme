#lang scheme
(define (serie funcion entero)
  (define n (+ entero 1))
  (let loop ((int 0) (fun funcion) (cont 0))
    (cond
      ((> n cont) (loop (+ (fun cont) int) fun (+ cont 1)))
      (else int)
      )
    )
  )
(serie (lambda (x) (* x x)) 3)