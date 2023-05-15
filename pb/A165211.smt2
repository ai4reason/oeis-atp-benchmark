;; sequence(s): A165211
;; terms: 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1
;; small program: (((x div 2) div 2) + x) mod 2
;; fast program: ((x div (2 + 2)) + x) mod 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (mod (+ (div (div x 2) 2) x) 2))))
(assert (forall ((x Int)) (= (fast x) (mod (+ (div x (+ 2 2)) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
