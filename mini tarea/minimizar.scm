#lang scheme
(define (minimizar proc ls)
  (let loop ((nu(car ls)) (resto(cdr ls)) (aux (cdr ls)) (men +inf.0) (numeros '()))
    (cond
      ((> 2 (length aux)) numeros)
      ((equal? 0 (length resto)) (loop (car aux) (cdr aux) (cdr aux) men numeros))
      ((or(< (proc nu (car resto)) men) (< (proc (car resto) nu) men))
       (if (<= (proc nu (car resto)) (proc (car resto) nu))
       (loop nu (cdr resto) aux (proc nu (car resto)) (list nu (car resto)))
       (loop nu (cdr resto) aux (proc (car resto) nu) (list (car resto) nu))
       ))
      (else (loop nu (cdr resto) aux men numeros))
      )
    )
  )
(or
 (equal? (minimizar (lambda (x y) (+ x y)) '(4 1 9 2 3)) '(1 2))
 (equal? (minimizar (lambda (x y) (+ x y)) '(4 1 9 2 3)) '(2 1))
)

(equal? (minimizar (lambda (x y) (- x y)) '(4 2 9 3 1)) '(1 9))

(or
 (equal? (minimizar (lambda (x y) (* x y)) '(-4 2 -9 3 1 -5 9)) '(-9 9))
 (equal? (minimizar (lambda (x y) (* x y)) '(-4 2 -9 3 1 -5 9)) '(9 -9))
)

(or
 (equal? (minimizar (lambda (x y) (modulo x y)) '(6 2 3 4)) '(6 3))
 (equal? (minimizar (lambda (x y) (modulo x y)) '(6 2 3 4)) '(6 2))
 (equal? (minimizar (lambda (x y) (modulo x y)) '(6 2 3 4)) '(4 2))
)

(equal? (minimizar (lambda (x y) (/ x y)) '(5 4 3 2 1)) '(1 5))