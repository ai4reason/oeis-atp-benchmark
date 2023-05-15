;; sequence(s): A274681
;; terms: 0 5 11 26 38 63 81 116 140 185 215 270 306 371 413 488 536 621 675 770
;; small program: ((2 + (((x mod 2) + x) + x)) * x) - (x div 2)
;; fast program: (((1 + (x + x)) * (x - (x div 2))) + (x * x)) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- (* (+ 2 (+ (+ (mod x 2) x) x)) x) (div x 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ 1 (+ x x)) (- x (div x 2))) (* x x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
