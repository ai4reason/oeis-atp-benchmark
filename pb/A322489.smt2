;; sequence(s): A322489
;; terms: 2 18 22 38 42 58 62 78 82 98 102 118 122 138 142 158 162 178 182 198
;; small program: loop2((y * y) + x, 2 - y, x, 2, 2 + 2)
;; fast program: (((2 * (x + x)) + loop(2 + 2, x mod 2, 1)) + x) * 2
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
(declare-fun f1 () Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* y y) x))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (- 2 y))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (= i0 2))
(assert (= j0 (+ 2 2)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 j0))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (= f1 (+ 2 2)))
(assert (forall ((x Int)) (= (g1 x) (mod x 2))))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y f1))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (* (+ (+ (* 2 (+ x x)) (v1 x)) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
