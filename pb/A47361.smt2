;; sequence(s): A47361
;; terms: 0 1 2 3 7 8 9 10 14 15 16 17 21 22 23 24 28 29 30 31
;; small program: ((1 + 2) * ((x div 2) div 2)) + x
;; fast program: ((1 + 2) * (x div (2 + 2))) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* (+ 1 2) (div (div x 2) 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 2) (div x (+ 2 2))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
