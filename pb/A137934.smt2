;; sequence(s): A137934
;; terms: 2 2 2 2 2 0 2 2 2 2 2 0 2 2 2 2 2 0 2 2
;; small program: if (2 - (x mod (2 + (x mod 2)))) <= 0 then 0 else 2
;; fast program: if ((1 + x) mod (2 + (2 + 2))) <= 0 then 0 else 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (ite (<= (- 2 (mod x (+ 2 (mod x 2)))) 0) 0 2))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (mod (+ 1 x) (+ 2 (+ 2 2))) 0) 0 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
