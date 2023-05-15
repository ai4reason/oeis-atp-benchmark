;; sequence(s): A171662
;; terms: 0 0 1 3 6 9 13 17 22 28 35 42 50 58 67 77 88 99 111 123
;; small program: ((x * x) + (x div 2)) div (1 + 2)
;; fast program: ((2 * (x * x)) + x) div (2 + (2 + 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (+ (* x x) (div x 2)) (+ 1 2)))))
(assert (forall ((x Int)) (= (fast x) (div (+ (* 2 (* x x)) x) (+ 2 (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
