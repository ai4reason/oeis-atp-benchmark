;; sequence(s): A140230
;; terms: 1 3 2 ~6 ~20 ~28 ~8 56 144 176 32 ~352 ~832 ~960 ~128 1920 4352 4864 512 ~9728
;; small program: loop2(x + y, y - x, x, 1 + x, 1)
;; fast program: if x <= 0 then 1 else loop2(x - y, x + y, x - 1, 2 + x, x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 (Int) Int)
(declare-fun j1 (Int) Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (- y x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int)) (= (i0 x) (+ 1 x))))
(assert (= j0 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) (i0 x) j0))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (- x y))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (+ x y))))
(assert (forall ((x Int)) (= (h1 x) (- x 1))))
(assert (forall ((x Int)) (= (i1 x) (+ 2 x))))
(assert (forall ((x Int)) (= (j1 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) (i1 x) (j1 x)))))
(assert (forall ((x Int)) (= (fast x) (ite (<= x 0) 1 (w1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
