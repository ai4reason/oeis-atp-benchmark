;; sequence(s): A131189
;; terms: 2 9 16 23 30 37 51 58 65 72 79 86 100 107 114 121 128 135 149 156
;; small program: 2 + ((1 + (2 + (2 + 2))) * (((x div 2) div (1 + 2)) + x))
;; fast program: 2 + ((1 + (2 + (2 + 2))) * ((x div (2 + (2 + 2))) + x))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 2 (* (+ 1 (+ 2 (+ 2 2))) (+ (div (div x 2) (+ 1 2)) x))))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (* (+ 1 (+ 2 (+ 2 2))) (+ (div x (+ 2 (+ 2 2))) x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
