;; sequence(s): A173308
;; terms: 0 34 102 204 340 510 714 952 1224 1530 1870 2244 2652 3094 3570 4080 4624 5202 5814 6460
;; small program: (1 + loop(x * x, 2, 2)) * ((x * x) + x)
;; fast program: (1 + (2 * (2 * (2 + 2)))) * ((x * x) + x)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (* (+ 1 v0) (+ (* x x) x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (* 2 (* 2 (+ 2 2)))) (+ (* x x) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)