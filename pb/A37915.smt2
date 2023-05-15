;; sequence(s): A37915
;; terms: 1 1 2 3 4 4 5 6 7 7 8 9 10 10 11 12 13 13 14 15
;; small program: 1 + (((x div 2) + x) div 2)
;; fast program: x - ((x - 1) div (2 + 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (div (+ (div x 2) x) 2)))))
(assert (forall ((x Int)) (= (fast x) (- x (div (- x 1) (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
