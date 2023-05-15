;; sequence(s): A109718
;; terms: 0 1 0 3 0 1 0 3 0 1 0 3 0 1 0 3 0 1 0 3
;; small program: (x mod 2) * (x mod (2 + 2))
;; fast program: ((x * x) * x) mod (2 + 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (mod x 2) (mod x (+ 2 2))))))
(assert (forall ((x Int)) (= (fast x) (mod (* (* x x) x) (+ 2 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
