;; sequence(s): A108579
;; terms: 0 0 0 0 1 3 4 7 10 13 17 22 26 32 38 44 51 59 66 75
;; small program: (((x - 1) div 2) * (x div 2)) - (x div (1 + 2))
;; fast program: (0 - (x div (1 + 2))) - (((2 - x) * x) div (2 + 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- (* (div (- x 1) 2) (div x 2)) (div x (+ 1 2))))))
(assert (forall ((x Int)) (= (fast x) (- (- 0 (div x (+ 1 2))) (div (* (- 2 x) x) (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
