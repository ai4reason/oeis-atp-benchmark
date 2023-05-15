;; sequence(s): A23482
;; terms: ~40 ~39 ~38 ~37 ~36 ~35 ~34 ~33 ~32 ~31 ~30 ~29 ~28 ~27 ~26 ~25 ~24 ~23 ~22 ~21
;; small program: 2 + (x - loop((x * x) + x, 2, 2))
;; fast program: x - (2 * (2 * (2 + (2 * (2 + 2)))))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (* x x) x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ 2 (- x v0)))))
(assert (forall ((x Int)) (= (fast x) (- x (* 2 (* 2 (+ 2 (* 2 (+ 2 2)))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)