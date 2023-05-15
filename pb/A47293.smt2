;; sequence(s): A47293
;; terms: 0 2 4 6 7 9 11 13 14 16 18 20 21 23 25 27 28 30 32 34
;; small program: (x - ((x div 2) div 2)) + x
;; fast program: (x - (x div (2 + 2))) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (- x (div (div x 2) 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- x (div x (+ 2 2))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
