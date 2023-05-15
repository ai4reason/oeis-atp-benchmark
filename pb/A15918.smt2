;; sequence(s): A15918-A16056-A16240
;; terms: 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
;; small program: if (((1 + x) div (2 * (2 + 2))) - 2) <= 0 then 1 else 0
;; fast program: if (2 + (x - (2 * (2 * (2 + (2 + 2)))))) <= 0 then 1 else 0
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (ite (<= (- (div (+ 1 x) (* 2 (+ 2 2))) 2) 0) 1 0))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (+ 2 (- x (* 2 (* 2 (+ 2 (+ 2 2)))))) 0) 1 0))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
