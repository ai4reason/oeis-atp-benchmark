;; sequence(s): A193766
;; terms: 2 4 6 8 11 13 15 17 20 22 24 26 29 31 33 35 38 40 42 44
;; small program: 2 + ((((x div 2) div 2) + x) + x)
;; fast program: 2 + (((x div (2 + 2)) + x) + x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 2 (+ (+ (div (div x 2) 2) x) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (+ (+ (div x (+ 2 2)) x) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
