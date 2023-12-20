#lang scheme
(define (par-impar ls)
  (define fin '())
  (if (not(equal? '() ls))
      (let loop ((numero (car ls)) (resto (cdr ls)) (pares '()) (impares '()))
        (cond
          ((equal? 0 (length resto))
           (cond
             ((integer? (/ numero 2)) (cons ( reverse (cons numero pares)) (cons (reverse impares) fin)))
             (else (cons ( reverse pares) (cons (reverse (cons numero impares)) fin)))))
          ((integer? (/ numero 2)) (loop (car resto) (cdr resto) (cons numero pares) impares))
          (else (loop (car resto) (cdr resto) pares (cons numero impares)))
          )
        )
      '(() ()))
  )
(equal? (par-impar '(1 2 3 4 5 6 7 8 9)) '((2 4 6 8) (1 3 5 7 9)))

(equal? (par-impar (list 1 2 3 4 5 6 7 8 9)) (list (list 2 4 6 8) (list 1 3 5 7 9)))

(equal? (par-impar '()) '(() ()))

(equal? (par-impar '(1 3 5)) '(() (1 3 5)))

(equal? (par-impar '(2 4 6)) '((2 4 6) ()))

