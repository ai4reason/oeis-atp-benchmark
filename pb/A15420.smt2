;; sequence(s): A15420-A15522-A15658-A15726-A15760-A15828-A15862-A15930-A16168-A16236
;; terms: 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0
;; small program: if (x - loop(x * x, 2, 2)) <= 0 then 1 else 0
;; fast program: if (x - (2 * (2 * (2 + 2)))) <= 0 then 1 else 0
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
(assert (forall ((x Int)) (= (small x) (ite (<= (- x v0) 0) 1 0))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (- x (* 2 (* 2 (+ 2 2)))) 0) 1 0))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
