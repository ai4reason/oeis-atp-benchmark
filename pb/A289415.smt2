;; sequence(s): A289415
;; terms: 1 11 132 1694 22748 314116 4408272 62429224 888533008 12680511536 181232622912 2592261435104 37094163051968 530922829281856 7599944308484352 108797263565651584 1557545924511056128 22298311347021560576 319232797938258158592
;; small program: loop2((2 * (2 * (x + x))) + y, 2 * (((2 * ((y + y) + y)) + x) + y), x, 1, 1 + 2)
;; fast program: loop2(((((2 * (2 + 2)) + 2) * x) + x) + y, ((((2 * 2) + 1) * 2) + 1) * (x + y), x, 1, 0)
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
(assert (forall ((x Int) (y Int)) (= (g0 x y) (* 2 (+ (+ (* 2 (+ (+ y y) y)) x) y)))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (= i0 1))
(assert (= j0 (+ 1 2)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 j0))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (+ (* (+ (* 2 (+ 2 2)) 2) x) x) y))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (* (+ (* (+ (* 2 2) 1) 2) 1) (+ x y)))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (= i1 1))
(assert (= j1 0))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) i1 j1))))
(assert (forall ((x Int)) (= (fast x) (w1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
