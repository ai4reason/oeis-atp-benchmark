;; sequence(s): A94390
;; terms: 2 4 6 8 10 13 15 17 19 21 24 26 28 30 32 35 37 39 41 43
;; small program: 2 + ((((x - (x div ((2 * (2 * (2 * (2 + 2)))) - 2))) div (1 + (2 + 2))) + x) + x)
;; fast program: ((((((1 + (2 + 2)) * (1 + x)) + x) div ((2 * (2 * (2 * (2 + 2)))) - 1)) + 2) + x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 2 (+ (+ (div (- x (div x (- (* 2 (* 2 (* 2 (+ 2 2)))) 2))) (+ 1 (+ 2 2))) x) x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (+ (* (+ 1 (+ 2 2)) (+ 1 x)) x) (- (* 2 (* 2 (* 2 (+ 2 2)))) 1)) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
