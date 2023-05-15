;; sequence(s): A47247
;; terms: 2 3 4 5 8 9 10 11 14 15 16 17 20 21 22 23 26 27 28 29
;; small program: 2 + ((2 * ((x div 2) div 2)) + x)
;; fast program: 2 + ((2 * (x div (2 + 2))) + x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 2 (+ (* 2 (div (div x 2) 2)) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (+ (* 2 (div x (+ 2 2))) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
