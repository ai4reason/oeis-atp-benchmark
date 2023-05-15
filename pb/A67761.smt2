;; sequence(s): A67761
;; terms: 5 10 15 20 25 30 40 45 50 55 60 65 75 80 85 90 95 100 110 115
;; small program: (1 + (2 + 2)) * (1 + (((x div 2) div (1 + 2)) + x))
;; fast program: (1 + (2 + 2)) * (1 + ((x div (2 + (2 + 2))) + x))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (+ 1 (+ 2 2)) (+ 1 (+ (div (div x 2) (+ 1 2)) x))))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (+ 2 2)) (+ 1 (+ (div x (+ 2 (+ 2 2))) x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
