;; sequence(s): A38709
;; terms: 0 0 1 2 4 6 9 13 17 21 26 31 37 43 50 58 66 74 83 92
;; small program: ((x * x) + (x div 2)) div (2 + 2)
;; fast program: ((2 * (x * x)) + x) div (2 * (2 + 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (+ (* x x) (div x 2)) (+ 2 2)))))
(assert (forall ((x Int)) (= (fast x) (div (+ (* 2 (* x x)) x) (* 2 (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
