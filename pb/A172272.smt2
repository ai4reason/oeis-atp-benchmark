;; sequence(s): A172272
;; terms: 0 1 3 4 6 7 9 11 12 14 15 17 19 20 22 23 25 26 28 30
;; small program: ((((x div 2) div (1 + 2)) + x) div 2) + x
;; fast program: (((x div (2 + (2 + 2))) + x) div 2) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (+ (div (div x 2) (+ 1 2)) x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (div x (+ 2 (+ 2 2))) x) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
