;; sequence(s): A214678
;; terms: 1 2 3 4 5 6 7 8 11 12 13 14 15 16 17 18 21 22 23 24
;; small program: 1 + ((2 * (((x div 2) div 2) div 2)) + x)
;; fast program: 1 + ((2 * (x div (2 * (2 + 2)))) + x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (* 2 (div (div (div x 2) 2) 2)) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (* 2 (div x (* 2 (+ 2 2)))) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
