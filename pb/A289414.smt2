;; sequence(s): A289414
;; terms: 1 10 110 1300 16100 205000 2651000 34570000 452810000 5944900000 78145100000 1027861000000 13524161000000 177975730000000 2342340110000000 30828986500000000 405769120100000000 5340773617000000000 70296251531000000000 925255405090000000000
;; small program: loop2((2 * (2 * (x + x))) + y, 2 * (((x + y) + y) * (1 + 2)), x, 1, 2)
;; fast program: loop2((2 * (2 * (x + x))) + y, (2 + (2 + 2)) * ((x + y) + y), x, 1, 2)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 () Int)
(declare-fun j1 () Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* 2 (* 2 (+ x x))) y))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (* 2 (* (+ (+ x y) y) (+ 1 2))))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (= i0 1))
(assert (= j0 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 j0))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (* 2 (* 2 (+ x x))) y))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (* (+ 2 (+ 2 2)) (+ (+ x y) y)))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (= i1 1))
(assert (= j1 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) i1 j1))))
(assert (forall ((x Int)) (= (fast x) (w1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)