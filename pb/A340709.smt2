;; sequence(s): A340709
;; terms: 0 1 2 3 5 4 7 6 10 8 12 9 15 11 17 13 20 14 22 16
;; small program: ((2 * ((x mod 2) + x)) + (x div 2)) div (2 + (x mod 2))
;; fast program: (((1 + 2) * (x - (x div 2))) + x) div (2 + (x mod 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (+ (* 2 (+ (mod x 2) x)) (div x 2)) (+ 2 (mod x 2))))))
(assert (forall ((x Int)) (= (fast x) (div (+ (* (+ 1 2) (- x (div x 2))) x) (+ 2 (mod x 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
