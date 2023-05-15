;; sequence(s): A187324
;; terms: 0 0 1 2 2 2 4 4 4 5 6 6 7 7 8 9 9 9 11 11
;; small program: ((1 + (x div 2)) div 2) + (x div (1 + 2))
;; fast program: ((2 + x) div (2 + 2)) + (x div (1 + 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (+ 1 (div x 2)) 2) (div x (+ 1 2))))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ 2 x) (+ 2 2)) (div x (+ 1 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
