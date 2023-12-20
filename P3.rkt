#lang scheme
(define (vs lista)
  (define OP (car lista))
  (let loop ((bina 0) (J1 (second lista)) (J2 (third lista)) (cont1 0) (cont2 0))   
    (cond
      ((equal? OP 'X) (cond
                        ((equal? '() J1)(cond 
                                          ((< cont1 cont2) '2)     #|aqui se busca el ganador o empate|#
                                          ((> cont1 cont2) '1)
                                          ((equal? cont1 cont2) #f))
                      )
                        ((equal? (car J1) (car J2) ) (cond  #|cumple si ambos son iguales|#
                                                       ((equal? bina 0) (loop (+ bina 1) (cdr J1) (cdr J2) (+ cont1 1) cont2))    #|si bina = 0 se añade punto a lista 1 |#
                                                       (else (loop (- bina 1) (cdr J1) (cdr J2) cont1 (+ cont2 1))))) #| bina =1 se añade punto a lista 2 |#
                        (else (loop bina (cdr J1) (cdr J2) cont1 cont2)))
                        )
      ((equal? OP 'O) (cond
                        ((equal? '() J1)(cond
                                          ((< cont1 cont2) '2) #| lo mismo ocurre en los otros casos |#
                                          ((> cont1 cont2) '1)
                                          ((equal? cont1 cont2) #f))
                      )
                        ((or (equal? 1 (car J1)) (equal? 1 (car J2)))(cond   #|cumple siempre a menos que ambos sean falsos (0)|#
                                                       ((equal? bina 0) (loop (+ bina 1) (cdr J1) (cdr J2) (+ cont1 1) cont2))
                                                       (else (loop (- bina 1) (cdr J1) (cdr J2) cont1 (+ cont2 1)))))
                        (else (loop bina (cdr J1) (cdr J2) cont1 cont2)))
                        )
      ((equal? OP 'A) (cond
                        ((equal? '() J1)(cond
                                          ((< cont1 cont2) '2) 
                                          ((> cont1 cont2) '1)
                                          ((equal? cont1 cont2) #f))
                      )
                        ((and (equal? 1 (car J1)) (equal? 1 (car J2)))(cond   #|cumple cuando los 2 son Verdaderos (1)|#
                                                       ((equal? bina 0) (loop (+ bina 1) (cdr J1) (cdr J2) (+ cont1 1) cont2))
                                                       (else (loop (- bina 1) (cdr J1) (cdr J2) cont1 (+ cont2 1)))))
                        (else (loop bina (cdr J1) (cdr J2) cont1 cont2)))
                        )
      )
    )
  )
(vs '(O (1 0 0 0 0 0 1 0) (1 0 0 0 0 1 1 0)))
(vs '(A (0 1 1 0 1 1) (1 0 1 1 0 1)))