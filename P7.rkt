#lang scheme
(define (fpi funcion umbral i)
  (let loop((fun funcion) (cont 0) (valor i))
    (cond
      ((or(equal? valor (fun valor)) (>= umbral (abs (- (fun valor) valor)))) cont)
      (else (loop fun (+ cont 1) (fun valor)))
      )
    )
  )
(fpi (lambda (x) (cos x)) 0.02 1)
