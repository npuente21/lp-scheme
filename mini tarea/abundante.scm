#lang scheme
(define (abundante x)
  (let loop((numero 1) (conta 0))
    (cond
      ((equal? 0 (modulo x numero)) (loop (+ numero 1) (+ conta numero)))
      ((<= numero x) (loop (+ numero 1) conta))
      (else (if (< (* 2 x) conta) #t #f))
      )
    )
  )
(equal? (abundante 8)   #f)
(equal? (abundante 12)  #t)
(equal? (abundante 13)  #f)
(equal? (abundante 24)  #t)
(equal? (abundante 945) #t)