;; sequence(s): A218245
;; terms: 2 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
;; small program: 1 + ((2 - (x div 2)) div (2 + x))
;; fast program: if (2 + (2 + (2 - x))) <= 0 then 0 else (if x <= 0 then 2 else 1)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (div (- 2 (div x 2)) (+ 2 x))))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (+ 2 (+ 2 (- 2 x))) 0) 0 (ite (<= x 0) 2 1)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
