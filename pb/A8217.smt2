;; sequence(s): A8217
;; terms: 0 0 0 0 1 1 1 2 4 4 4 6 9 9 9 12 16 16 16 20
;; small program: ((1 + x) div (2 + 2)) * ((x div 2) div 2)
;; fast program: ((1 + x) div (2 + 2)) * (x div (2 + 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (div (+ 1 x) (+ 2 2)) (div (div x 2) 2)))))
(assert (forall ((x Int)) (= (fast x) (* (div (+ 1 x) (+ 2 2)) (div x (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
