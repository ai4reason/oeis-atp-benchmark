;; sequence(s): A38707
;; terms: 0 0 2 5 9 13 19 26 34 42 52 63 75 87 101 116 132 148 166 185
;; small program: ((x * x) + (x div 2)) div 2
;; fast program: ((2 * (x * x)) + x) div (2 + 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (+ (* x x) (div x 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (div (+ (* 2 (* x x)) x) (+ 2 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
