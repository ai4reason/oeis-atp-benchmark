;; sequence(s): A297038
;; terms: 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1
;; small program: if ((x div (1 + 2)) - 2) <= 0 then 0 else 1
;; fast program: if (x - (2 * (2 + 2))) <= 0 then 0 else 1
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (ite (<= (- (div x (+ 1 2)) 2) 0) 0 1))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (- x (* 2 (+ 2 2))) 0) 0 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
