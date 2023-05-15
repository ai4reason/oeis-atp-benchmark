;; sequence(s): A66530
;; terms: 1 2 2 3 4 5 5 6 7 8 8 9 10 11 11 12 13 14 14 15
;; small program: ((2 - (x div 2)) div 2) + x
;; fast program: x - ((x - 2) div (2 + 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (- 2 (div x 2)) 2) x))))
(assert (forall ((x Int)) (= (fast x) (- x (div (- x 2) (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
