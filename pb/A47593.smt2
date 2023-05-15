;; sequence(s): A47593
;; terms: 2 3 4 5 6 7 10 11 12 13 14 15 18 19 20 21 22 23 26 27
;; small program: 2 + ((2 * ((x div 2) div (1 + 2))) + x)
;; fast program: 2 + ((2 * (x div (2 + (2 + 2)))) + x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 2 (+ (* 2 (div (div x 2) (+ 1 2))) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (+ (* 2 (div x (+ 2 (+ 2 2)))) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
