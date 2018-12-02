#lang racket/gui
(require racket/gui/base)

(define (random-func x)
  (* x 2))

; Make a frame by instantiating the frame% class
(define frame (new frame% [label "Mayenk is sax"]))
 
; Make a static text message in the frame
(define msg (new message% [parent frame]
                          [label "Pranav is gay"]))
 
; Make a button in the frame
(new button% [parent frame]
             [label "Click me daddy"]
             ; Callback procedure for a button click:
             [callback (lambda (button event)
                         (send msg set-label "YES DADDY"))])
 
; Show the frame by calling its show method
(send frame show #t)

; Derive a new canvas (a drawing window) class to handle events
(define my-canvas%
  (class canvas% ; The base class is canvas%
    ; Define overriding method to handle mouse events
    (define/override (on-event event)
      (send msg set-label "Canvas mouse"))
    ; Define overriding method to handle keyboard events
    (define/override (on-char event)
      (send msg set-label "Canvas keyboard"))
    ; Call the superclass init, passing on all init args
    (super-new)))
 
; Make a canvas that handles events in the frame
(new my-canvas% [parent frame])

(new button% [parent frame]
             [label "Pause"]
             [callback (lambda (button event) (sleep 5))])

(define panel (new horizontal-panel% [parent frame]))
(new button% [parent panel]
             [label "Please don't click me"]
             [callback (lambda (button event)
                         (send msg set-label "Now you fucked up"))])
(new button% [parent panel]
             [label "Click me!!!"]
             [callback (lambda (button event)
                         (send msg set-label "Yay thank you jaan"))])

	 


