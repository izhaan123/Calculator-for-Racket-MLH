;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname MLH-WolframAlpha) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; takes in an expression and prdouces a list of char 
(define (expression exp)
  (string->list exp))

;(list #\2 #\x #\^ #\2 #\space #\+ #\space #\3 #\x #\space #\+ #\space #\2)
;"322x^5 + 2"
;(list #\3 #\4 #\5)

;; takes in a number and produces a list of all the factors of that number
(define (find-factors number)
  (filter (lambda (item) (= (remainder number item) 0))
          (build-list (+ number 1) (lambda (i) (+ i 1))))) 

;; takes in a character (1-9) and prdouces the corresponding number
(define (character->int char)
  (- (char->integer char) 48))

;; takes in a list of characters and produces the number
;;  (list #\3 #\4 #\5)---> 345
(define (char-to-number list-of-char)
  (cond
    [(empty? list-of-char) 0]  
    [else (+ (* (expt 10 (- (length list-of-char) 1))
                (character->int (first list-of-char)))
             (char-to-number (rest list-of-char)))]))

;(char-to-number (list #\3 #\4 #\5))

;(filter (lambda (item) (not (equal? item #\x))) (expression "322x^5 + 2"))

;"322x^5 + 2"
;(list #\3 #\2 #\2 #\x #\^ #\5 #\space #\+ #\space #\2)
;
;"2x^2 + 3x + 2"
(define test (list #\2 #\x #\^ #\2 #\space #\+ #\space #\3 #\x #\space #\+ #\space #\2))
;
;(list 2 3 2)
;
;"23x^6 + 1x^3 + 3"
;(list 23 0 0 1 0 0 3)
(define test2 (list #\2 #\3 #\x #\^ #\6 #\space #\+ #\space #\1 #\x #\^ #\3 #\space #\+ #\space #\3))

(define (exponent-creater list-of-char list-so-far)
  (cond
    [(empty? list-of-char) list-so-far]
    [(number? (character->int (first list-of-char)))
     (exponent-creater (rest list-of-char) (cons (first list-of-char) list-so-far))]
    [(equal? (first list-of-char) #\^)
     (cons list-so-far (exponent-creater (rest (rest list-of-char)) empty))]
    [else (exponent-creater (rest list-of-char) empty)]))

(define (exponent-yup list-of-char)
  (append (exponent-creater list-of-char empty) (list (first (reverse list-of-char)))))

;(exponent-yup test2)

;(append list-so-far (list (first list-of-char)))

(filter (lambda (i) (and (>= (character->int i) 0)
                         (<= (character->int i) 9))) test2) 
