;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 3d-plotter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #t)))
(provide plotter-3d)
(require plot)
(plot-new-window? #t)

(define (plotter func x-min x-max)
  (plot (function func x-min x-max)))

(define (plotter-3d func lower-x upper-x lower-y upper-y)
  (plot3d (surface3d func
                     lower-x upper-x lower-y upper-y)))


  