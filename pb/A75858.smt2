;; sequence(s): A75858
;; terms: 11 211 3111 41111 511111 6111111 71111111 811111111 9111111111 101111111111 1111111111111 12111111111111 131111111111111 1411111111111111 15111111111111111 161111111111111111 1711111111111111111 18111111111111111111 191111111111111111111
;; small program: 1 + loop((1 + x) * (2 + (2 * (2 + 2))), 1 + x, x)
;; fast program: (loop2(1 + (x * y), y, x, 1, 2 + (2 * (2 + 2))) * (1 + loop((x + x) + x, 2, 1 + x))) + (1 + x)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 () Int)
(declare-fun j1 () Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* (+ 1 x) (+ 2 (* 2 (+ 2 2)))))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 1 (v0 x)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ 1 (* x y)))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (= i1 1))
(assert (= j1 (+ 2 (* 2 (+ 2 2)))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) i1 j1))))
(assert (forall ((x Int)) (= (f2 x) (+ (+ x x) x))))
(assert (= g2 2))
(assert (forall ((x Int)) (= (h2 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (* (w1 x) (+ 1 (v2 x))) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)