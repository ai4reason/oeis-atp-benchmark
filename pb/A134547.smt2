;; sequence(s): A134547
;; terms: 29 64 109 164 229 304 389 484 589 704 829 964 1109 1264 1429 1604 1789 1984 2189 2404
;; small program: (2 + loop2((2 + (2 + y)) * x, x, 2, 1 + x, 1)) + 2
;; fast program: ((1 + (2 + 2)) * (((1 + (2 + x)) * (2 + x)) + x)) - 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ 2 (+ 2 y)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int)) (= (i0 x) (+ 1 x))))
(assert (= j0 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 (i0 x) j0))))
(assert (forall ((x Int)) (= (small x) (+ (+ 2 (w0 x)) 2))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ 1 (+ 2 2)) (+ (* (+ 1 (+ 2 x)) (+ 2 x)) x)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)