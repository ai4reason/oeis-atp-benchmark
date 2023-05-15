;; sequence(s): A212519
;; terms: 0 0 0 1 4 12 30 63 108 192 300 450 660 936 1260 1715 2240 2880 3672 4617
;; small program: ((((x * x) - x) div (2 + (2 + 2))) * (x div 2)) * ((x - 1) div 2)
;; fast program: (((x * x) - x) div (2 + (2 + 2))) * ((1 + ((x - 2) * x)) div (2 + 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (* (div (- (* x x) x) (+ 2 (+ 2 2))) (div x 2)) (div (- x 1) 2)))))
(assert (forall ((x Int)) (= (fast x) (* (div (- (* x x) x) (+ 2 (+ 2 2))) (div (+ 1 (* (- x 2) x)) (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
