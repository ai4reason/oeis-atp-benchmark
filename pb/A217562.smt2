;; sequence(s): A217562
;; terms: 2 4 6 8 12 14 16 18 22 24 26 28 32 34 36 38 42 44 46 48
;; small program: 2 + (2 * (((x div 2) div 2) + x))
;; fast program: 2 + (2 * ((x div (2 + 2)) + x))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 2 (* 2 (+ (div (div x 2) 2) x))))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (* 2 (+ (div x (+ 2 2)) x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
