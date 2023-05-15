;; sequence(s): A203016
;; terms: 3 6 9 12 21 24 27 30 39 42 45 48 57 60 63 66 75 78 81 84
;; small program: (1 + 2) * (1 + ((2 * ((x div 2) div 2)) + x))
;; fast program: (1 + 2) * (1 + ((2 * (x div (2 + 2))) + x))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (+ 1 2) (+ 1 (+ (* 2 (div (div x 2) 2)) x))))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 2) (+ 1 (+ (* 2 (div x (+ 2 2))) x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
