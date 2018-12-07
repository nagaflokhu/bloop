#lang typed/racket

(require typed/2htdp/universe)
(require math/array)

; A bloop is a creature living in a virtual world.
; bloop-t is its type
(struct bloop-t ([loc : pos] [hunger : Real]))

; It is not hungry when the world is created
(: initial-hunger Real)
(define initial-hunger 0)

; A pos denotes a position in the virtual world
; Note that we will be working with x going from left to right and y going
; from top to bottom.
(struct pos ([x : Real] [y : Real]))

(define world-height 50)
(define world-width 50)

; The 'thing' type represents all things that exist in the world
(define-type thing-t (U bloop-t 'empty 'food))

(define-type time-t Real)

(define-type world-map-t (Array thing-t))

(struct world-t ([map : world-map-t] [time : time-t]))

(: world-map world-map-t)
(define world-map (make-array (list->vector
                                   (list world-height world-width))
                                  'empty))

(define world (world-t world-map 0))

;(define (main)
;  (big-bang world : world-t
;    (to-draw render)))

;(: render (-> world-t
;(define (render world)
;  (