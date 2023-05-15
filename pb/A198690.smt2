;; sequence(s): A198690
;; terms: 8 62 440 3086 21608 151262 1058840 7411886 51883208 363182462 2542277240 17795940686 124571584808 872001093662 6104007655640 42728053589486 299096375126408 2093674625884862 14655722381194040 102590056668358286
;; small program: loop2((2 * ((2 + y) * x)) + x, 1, 1 + x, 1, 2) - 1
;; fast program: ((1 + 2) * loop2(x * y, y, x, 1 + 2, 1 + (2 + (2 + 2)))) - 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* 2 (* (+ 2 y) x)) x))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (= i0 1))
(assert (= j0 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z g0))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 j0))))
(assert (forall ((x Int)) (= (small x) (- (w0 x) 1))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (= i1 (+ 1 2)))
(assert (= j1 (+ 1 (+ 2 (+ 2 2)))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) i1 j1))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ 1 2) (w1 x)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
