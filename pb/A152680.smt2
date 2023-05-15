;; sequence(s): A152680
;; terms: 4 12 16 28 36 40 52 60 72 88 96 100 108 112 136 148 156 172 180 192
;; small program: compr(loop(loop2(x + y, x, x, 1, 2) mod (1 + x), 1 - (x mod (2 + 2)), x) - 1, 2 + x)
;; fast program: ((compr((((((loop(((if (loop(((loop((((2 * (y + y)) - 2) * x) div (1 + y), x, 1) mod (1 + (x + x))) - 2) mod (1 + x), (1 + x) mod 2, x) - 2) <= 0 then 1 else 2) mod (1 + x)) mod 2, 1 - (x mod 2), x) + x) mod 2) - (x mod 2)) mod (1 + 2)) + 1) mod 2, x) * 2) * 2) div 2
(set-logic UFNIA)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun i2 () Int)
(declare-fun j2 () Int)
(declare-fun u2 (Int Int Int) Int)
(declare-fun v2 (Int Int Int) Int)
(declare-fun w2 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun t0 (Int) Int)
(declare-fun u0 (Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f6 (Int Int) Int)
(declare-fun g6 (Int) Int)
(declare-fun h6 () Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int) Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 (Int) Int)
(declare-fun h5 (Int) Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 (Int) Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun t3 (Int) Int)
(declare-fun u3 (Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f2 x y) (+ x y))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (= i2 1))
(assert (= j2 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u2 x y z) (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v2 x y z) (ite (<= x 0) z (g2 (u2 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w2 x) (u2 (h2 x) i2 j2))))
(assert (forall ((x Int)) (= (f1 x) (mod (w2 x) (+ 1 x)))))
(assert (forall ((x Int)) (= (g1 x) (- 1 (mod x (+ 2 2))))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (f0 x) (- (v1 x) 1))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (forall ((x Int)) (= (t0 x) (ite (<= (f0 x) 0) x (t0 (+ x 1))))))
(assert (forall ((x Int)) (= (u0 x) (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f6 x y) (div (* (- (* 2 (+ y y)) 2) x) (+ 1 y)))))
(assert (forall ((x Int)) (= (g6 x) x)))
(assert (= h6 1))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v6 x) (u6 (g6 x) h6))))
(assert (forall ((x Int)) (= (f5 x) (mod (- (mod (v6 x) (+ 1 (+ x x))) 2) (+ 1 x)))))
(assert (forall ((x Int)) (= (g5 x) (mod (+ 1 x) 2))))
(assert (forall ((x Int)) (= (h5 x) x)))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int)) (= (v5 x) (u5 (g5 x) (h5 x)))))
(assert (forall ((x Int)) (= (f4 x) (mod (mod (ite (<= (- (v5 x) 2) 0) 1 2) (+ 1 x)) 2))))
(assert (forall ((x Int)) (= (g4 x) (- 1 (mod x 2)))))
(assert (forall ((x Int)) (= (h4 x) x)))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) (h4 x)))))
(assert (forall ((x Int)) (= (f3 x) (mod (+ (mod (- (mod (+ (v4 x) x) 2) (mod x 2)) (+ 1 2)) 1) 2))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (forall ((x Int)) (= (t3 x) (ite (<= (f3 x) 0) x (t3 (+ x 1))))))
(assert (forall ((x Int)) (= (u3 x) (ite (<= x 0) (t3 0) (t3 (+ (u3 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x)))))
(assert (forall ((x Int)) (= (fast x) (div (* (* (v3 x) 2) 2) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
