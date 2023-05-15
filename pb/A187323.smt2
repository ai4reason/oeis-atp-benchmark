;; sequence(s): A187323
;; terms: 0 0 1 2 4 4 6 6 8 9 10 10 13 13 14 15 17 17 19 19
;; small program: (((x div 2) div 2) + (x div 2)) + (x div (1 + 2))
;; fast program: ((x div 2) + (x div (1 + 2))) + (x div (2 + 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (div (div x 2) 2) (div x 2)) (div x (+ 1 2))))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div x 2) (div x (+ 1 2))) (div x (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
