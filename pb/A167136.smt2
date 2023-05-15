;; sequence(s): A167136
;; terms: 1 3 5 8 11 16 19 24 27 32 39 42 49 54 57 62 69 76 79 86
;; small program: (compr(loop2(1 + (x + y), x * 1, x, 0, 1) mod (1 + x), x) + 1) + x
;; fast program: loop2((compr(loop((1 - loop(x + x, x div 2, 1)) mod (1 + x), 1 - (x mod 2), x) - 2, y) * x) + x, 0, 2 + 2, 1, x) + x
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 () Int)
(declare-fun j1 () Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun t0 (Int) Int)
(declare-fun u0 (Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 (Int) Int)
(declare-fun h5 () Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 (Int) Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int Int) Int)
(declare-fun t3 (Int) Int)
(declare-fun u3 (Int) Int)
(declare-fun v3 (Int Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 () Int)
(declare-fun i2 () Int)
(declare-fun j2 (Int) Int)
(declare-fun u2 (Int Int Int) Int)
(declare-fun v2 (Int Int Int) Int)
(declare-fun w2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ 1 (+ x y)))))
(assert (forall ((x Int)) (= (g1 x) (* x 1))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (= i1 0))
(assert (= j1 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) i1 j1))))
(assert (forall ((x Int)) (= (f0 x) (mod (w1 x) (+ 1 x)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (t0 x) (ite (<= (f0 x) 0) x (t0 (+ x 1))))))
(assert (forall ((x Int)) (= (u0 x) (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) 1) x))))
(assert (forall ((x Int)) (= (f5 x) (+ x x))))
(assert (forall ((x Int)) (= (g5 x) (div x 2))))
(assert (= h5 1))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int)) (= (v5 x) (u5 (g5 x) h5))))
(assert (forall ((x Int)) (= (f4 x) (mod (- 1 (v5 x)) (+ 1 x)))))
(assert (forall ((x Int)) (= (g4 x) (- 1 (mod x 2)))))
(assert (forall ((x Int)) (= (h4 x) x)))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) (h4 x)))))
(assert (forall ((x Int)) (= (f3 x) (- (v4 x) 2))))
(assert (forall ((x Int) (y Int)) (= (g3 x y) y)))
(assert (forall ((x Int)) (= (t3 x) (ite (<= (f3 x) 0) x (t3 (+ x 1))))))
(assert (forall ((x Int)) (= (u3 x) (ite (<= x 0) (t3 0) (t3 (+ (u3 (- x 1)) 1))))))
(assert (forall ((x Int) (y Int)) (= (v3 x y) (u3 (g3 x y)))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (+ (* (v3 x y) x) x))))
(assert (= g2 0))
(assert (= h2 (+ 2 2)))
(assert (= i2 1))
(assert (forall ((x Int)) (= (j2 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u2 x y z) (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v2 x y z) (ite (<= x 0) z g2))))
(assert (forall ((x Int)) (= (w2 x) (u2 h2 i2 (j2 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (w2 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)