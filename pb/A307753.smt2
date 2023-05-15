;; sequence(s): A307753
;; terms: 3 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
;; small program: (1 + ((2 - x) mod (2 + (2 + 2)))) div (1 + x)
;; fast program: (1 + (if (x - 2) <= 0 then (2 - x) else (2 + 2))) div (x + 1)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (+ 1 (mod (- 2 x) (+ 2 (+ 2 2)))) (+ 1 x)))))
(assert (forall ((x Int)) (= (fast x) (div (+ 1 (ite (<= (- x 2) 0) (- 2 x) (+ 2 2))) (+ x 1)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
