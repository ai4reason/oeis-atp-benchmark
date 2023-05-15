;; sequence(s): A129756
;; terms: 1 1 1 1 3 3 3 3 5 5 5 5 7 7 7 7 9 9 9 9
;; small program: 1 + (2 * ((x div 2) div 2))
;; fast program: 1 + (2 * (x div (2 + 2)))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (* 2 (div (div x 2) 2))))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* 2 (div x (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
