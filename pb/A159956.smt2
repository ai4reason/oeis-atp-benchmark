;; sequence(s): A159956
;; terms: 0 1 2 3 1 2 3 0 2 3 0 1 3 0 1 2 0 1 2 3
;; small program: (((x div 2) div 2) + x) mod (2 + 2)
;; fast program: ((x div (2 + 2)) + x) mod (2 + 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (mod (+ (div (div x 2) 2) x) (+ 2 2)))))
(assert (forall ((x Int)) (= (fast x) (mod (+ (div x (+ 2 2)) x) (+ 2 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
