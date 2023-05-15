;; sequence(s): A2783
;; terms: 1 3 11 39 131 423 1331 4119 12611 38343 116051 350199 1054691 3172263 9533171 28632279 85962371 258018183 774316691 2323474359
;; small program: 1 + loop2(((x + x) + x) + y, y + y, x, 0, 2)
;; fast program: 1 + (loop2(x * y, y, x div 2, loop(2 + (2 + 2), x mod 2, 2), 1 + (2 * (2 + 2))) - loop(x + x, x, 2))
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
(declare-fun f2 () Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun i1 (Int) Int)
(declare-fun j1 () Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (+ x x) x) y))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (+ y y))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (= i0 0))
(assert (= j0 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 j0))))
(assert (forall ((x Int)) (= (small x) (+ 1 (w0 x)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (forall ((x Int)) (= (h1 x) (div x 2))))
(assert (= f2 (+ 2 (+ 2 2))))
(assert (forall ((x Int)) (= (g2 x) (mod x 2))))
(assert (= h2 2))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y f2))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (i1 x) (v2 x))))
(assert (= j1 (+ 1 (* 2 (+ 2 2)))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) (i1 x) j1))))
(assert (forall ((x Int)) (= (f3 x) (+ x x))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (= h3 2))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (- (w1 x) (v3 x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
