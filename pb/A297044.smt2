;; sequence(s): A297044
;; terms: 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1
;; small program: x div ((2 * (2 + 2)) + (x div 2))
;; fast program: if (2 + (x - (2 * (2 * (2 + 2))))) <= 0 then 0 else 1
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div x (+ (* 2 (+ 2 2)) (div x 2))))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (+ 2 (- x (* 2 (* 2 (+ 2 2))))) 0) 0 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
