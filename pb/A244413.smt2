;; sequence(s): A244413
;; terms: 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0
;; small program: (loop2((y mod 2) + x, y div (2 - (x mod 2)), x, 1, x) div 2) div (1 + 2)
;; fast program: ((((((loop(loop(loop(1 + loop(loop(x div 2, x mod 2, x), loop(2 + 2, x mod 2, 0), x), 1, x div 2), x mod 2, x) div 2, x mod 2, x div 2) * 2) + 1) * loop(x * x, 1, 2 + (2 + 2))) mod (1 + x)) * 2) + x) div (1 + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 (Int) Int)
(declare-fun h5 (Int) Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun f4 (Int) Int)
(declare-fun f6 () Int)
(declare-fun g6 (Int) Int)
(declare-fun h6 () Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 (Int) Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 () Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f7 (Int) Int)
(declare-fun g7 () Int)
(declare-fun h7 () Int)
(declare-fun u7 (Int Int) Int)
(declare-fun v7 () Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (mod y 2) x))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (div y (- 2 (mod x 2))))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (= i0 1))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (div (div (w0 x) 2) (+ 1 2)))))
(assert (forall ((x Int)) (= (f5 x) (div x 2))))
(assert (forall ((x Int)) (= (g5 x) (mod x 2))))
(assert (forall ((x Int)) (= (h5 x) x)))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int)) (= (v5 x) (u5 (g5 x) (h5 x)))))
(assert (forall ((x Int)) (= (f4 x) (v5 x))))
(assert (= f6 (+ 2 2)))
(assert (forall ((x Int)) (= (g6 x) (mod x 2))))
(assert (= h6 0))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y f6))))
(assert (forall ((x Int)) (= (v6 x) (u6 (g6 x) h6))))
(assert (forall ((x Int)) (= (g4 x) (v6 x))))
(assert (forall ((x Int)) (= (h4 x) x)))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) (h4 x)))))
(assert (forall ((x Int)) (= (f3 x) (+ 1 (v4 x)))))
(assert (= g3 1))
(assert (forall ((x Int)) (= (h3 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 g3 (h3 x)))))
(assert (forall ((x Int)) (= (f2 x) (v3 x))))
(assert (forall ((x Int)) (= (g2 x) (mod x 2))))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) (h2 x)))))
(assert (forall ((x Int)) (= (f1 x) (div (v2 x) 2))))
(assert (forall ((x Int)) (= (g1 x) (mod x 2))))
(assert (forall ((x Int)) (= (h1 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (f7 x) (* x x))))
(assert (= g7 1))
(assert (= h7 (+ 2 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u7 x y) (ite (<= x 0) y (f7 (u7 (- x 1) y))))))
(assert (= v7 (u7 g7 h7)))
(assert (forall ((x Int)) (= (fast x) (div (+ (* (mod (* (+ (* (v1 x) 2) 1) v7) (+ 1 x)) 2) x) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
