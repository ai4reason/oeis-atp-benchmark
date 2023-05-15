;; sequence(s): A22852
;; terms: 0 3 5 8 11 14 16 19 22 24 27 30 33 35 38 41 43 46 49 52
;; small program: ((((0 - (((x div (2 * (2 + 2))) + x) div 2)) div 2) + x) + x) + x
;; fast program: ((((1 - ((x div (2 * (2 + 2))) + x)) div (2 + 2)) + x) + x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (div (- 0 (div (+ (div x (* 2 (+ 2 2))) x) 2)) 2) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (- 1 (+ (div x (* 2 (+ 2 2))) x)) (+ 2 2)) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
