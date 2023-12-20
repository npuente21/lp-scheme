#lang scheme
(define (segm funcion lista)
  (let loop ((true '()) (false '()) (fun funcion) (l1 lista))
  (cond
    ((equal? '() l1) (append true false))
    ((equal? #t (fun (car l1))) (loop (cons (car l1) true) false fun (cdr l1)))
    ((equal? #f (fun (car l1))) (loop true (cons (car l1) false) fun (cdr l1)))
    (else 0)
    )
   )
 )
(segm (lambda (x) (< x 4)) '(7 4 3 8 2))