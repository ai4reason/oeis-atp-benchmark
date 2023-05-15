;; sequence(s): A47344
;; terms: 0 1 3 4 7 8 10 11 14 15 17 18 21 22 24 25 28 29 31 32
;; small program: (((x div 2) div 2) + (x div 2)) + x
;; fast program: ((x div 2) + (x div (2 + 2))) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (div (div x 2) 2) (div x 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div x 2) (div x (+ 2 2))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
