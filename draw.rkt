#lang typed/racket

(require typed/2htdp/image)
(require typed/2htdp/universe)

(: draw-world-grid (-> Nonnegative-Real Nonnegative-Real Nonnegative-Real
                       Nonnegative-Real (U Pen Image-Color) Image))
(define (draw-world-grid height width v-lines-every h-lines-every
                         color-or-pen)
  (define outline (rectangle height width 'outline color-or-pen))
  (: add-v-line (-> Nonnegative-Real Image Image))
  (define (add-v-line x img)
    (add-line img x 0 x height color-or-pen))
  (: add-h-line (-> Nonnegative-Real Image Image))
  (define (add-h-line y img)
    (add-line img 0 y width y color-or-pen))
  (define with-v-lines
    (foldl add-v-line outline
           (cast (range v-lines-every width v-lines-every)
                 (Listof Nonnegative-Real))))
  (foldl add-h-line with-v-lines
         (cast (range h-lines-every height h-lines-every)
               (Listof Nonnegative-Real))))