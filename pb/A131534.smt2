;; sequence(s): A131534
;; terms: 1 2 1 1 2 1 1 2 1 1 2 1 1 2 1 1 2 1 1 2
;; small program: 1 + ((x mod (1 + 2)) mod 2)
;; fast program: if ((2 + x) mod (1 + 2)) <= 0 then 2 else 1
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (mod (mod x (+ 1 2)) 2)))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (mod (+ 2 x) (+ 1 2)) 0) 2 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
