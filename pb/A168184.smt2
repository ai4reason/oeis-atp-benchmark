;; sequence(s): A168184
;; terms: 0 1 1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 1
;; small program: (if (x mod (1 + (2 + 2))) <= 0 then x else 1) mod 2
;; fast program: if (x mod (2 + (2 * (2 + 2)))) <= 0 then 0 else 1
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (mod (ite (<= (mod x (+ 1 (+ 2 2))) 0) x 1) 2))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (mod x (+ 2 (* 2 (+ 2 2)))) 0) 0 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
