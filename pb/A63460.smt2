;; sequence(s): A63460
;; terms: 1 3 5 7 9 11 13 15 16 18 20 22 24 26 28 30 31 33 35 37
;; small program: 1 + ((x - (((x div 2) div 2) div 2)) + x)
;; fast program: 1 + ((x - (x div (2 * (2 + 2)))) + x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (- x (div (div (div x 2) 2) 2)) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (- x (div x (* 2 (+ 2 2)))) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
