;; sequence(s): A167876
;; terms: 1 3 4 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
;; small program: (2 + x) div loop((x * y) - 1, x, 2)
;; fast program: 2 - loop2(x - y, x, 2 + (2 - x), if (x - 2) <= 0 then 1 else 2, 2)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 (Int) Int)
(declare-fun j1 () Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (* x y) 1))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (+ 2 x) (v0 x)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (- x y))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (forall ((x Int)) (= (h1 x) (+ 2 (- 2 x)))))
(assert (forall ((x Int)) (= (i1 x) (ite (<= (- x 2) 0) 1 2))))
(assert (= j1 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) (i1 x) j1))))
(assert (forall ((x Int)) (= (fast x) (- 2 (w1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)