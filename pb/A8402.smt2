;; sequence(s): A8402
;; terms: 1 55 883 6085 26461 86491 232975 545833 1151065 2235871 4065931 7004845 11535733 18284995 28048231 41818321 60815665 86520583 120707875 165483541
;; small program: (loop(loop2((x * y) + x, x, y, x, x), 2, x) * (1 + 2)) + 1
;; fast program: 1 + ((1 + 2) * loop((((2 + x) * x) * x) + x, 1, (x * x) + x))
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int Int) Int)
(declare-fun i1 (Int) Int)
(declare-fun j1 (Int) Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (* x y) x))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (forall ((x Int) (y Int)) (= (h1 x y) y)))
(assert (forall ((x Int)) (= (i1 x) x)))
(assert (forall ((x Int)) (= (j1 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int)) (= (w1 x y) (u1 (h1 x y) (i1 x) (j1 x)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (w1 x y))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (v0 x) (+ 1 2)) 1))))
(assert (forall ((x Int)) (= (f2 x) (+ (* (* (+ 2 x) x) x) x))))
(assert (= g2 1))
(assert (forall ((x Int)) (= (h2 x) (+ (* x x) x))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* (+ 1 2) (v2 x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
