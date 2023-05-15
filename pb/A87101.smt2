;; sequence(s): A87101
;; terms: 0 0 0 0 1 1 0 1 1
;; small program: (2 mod (if (x mod (1 + 2)) <= 0 then 1 else x)) div 2
;; fast program: ((if (x - 2) <= 0 then 0 else x) * x) mod (1 + 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (mod 2 (ite (<= (mod x (+ 1 2)) 0) 1 x)) 2))))
(assert (forall ((x Int)) (= (fast x) (mod (* (ite (<= (- x 2) 0) 0 x) x) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
