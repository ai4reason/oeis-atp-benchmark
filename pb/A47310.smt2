;; sequence(s): A47310
;; terms: 0 1 3 4 5 6 7 8 10 11 12 13 14 15 17 18 19 20 21 22
;; small program: ((2 + (x div 2)) div (1 + 2)) + x
;; fast program: x - ((1 - x) div (2 + (2 + 2)))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (+ 2 (div x 2)) (+ 1 2)) x))))
(assert (forall ((x Int)) (= (fast x) (- x (div (- 1 x) (+ 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
