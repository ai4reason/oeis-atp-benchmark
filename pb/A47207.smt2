;; sequence(s): A47207
;; terms: 0 1 3 4 5 6 8 9 10 11 13 14 15 16 18 19 20 21 23 24
;; small program: ((1 + (x div 2)) div 2) + x
;; fast program: ((2 + x) div (2 + 2)) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (+ 1 (div x 2)) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ 2 x) (+ 2 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
