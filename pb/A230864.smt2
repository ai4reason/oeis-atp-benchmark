;; sequence(s): A230864
;; terms: 0 1 2 2 3 3 3 3 3 3 3 3 3 3 3 3 4 4 4 4
;; small program: ((2 * (x + x)) + (x div 2)) div (2 + x)
;; fast program: ((2 * (2 * (x + x))) + x) div (2 * (2 + x))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (+ (* 2 (+ x x)) (div x 2)) (+ 2 x)))))
(assert (forall ((x Int)) (= (fast x) (div (+ (* 2 (* 2 (+ x x))) x) (* 2 (+ 2 x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
