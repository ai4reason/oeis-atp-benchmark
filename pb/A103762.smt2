;; sequence(s): A103762
;; terms: 1 4 7 10 12 15 18 20 23 26 29 31 34 37 39 42 45 48 50 53
;; small program: (((1 - ((((1 + ((x div 2) div 2)) div 2) + x) div (2 + 2))) + x) + x) + x
;; fast program: (((1 - (((((2 + 2) + x) div (2 * (2 + 2))) + x) div (2 + 2))) + x) + x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (- 1 (div (+ (div (+ 1 (div (div x 2) 2)) 2) x) (+ 2 2))) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (- 1 (div (+ (div (+ (+ 2 2) x) (* 2 (+ 2 2))) x) (+ 2 2))) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
