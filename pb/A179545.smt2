;; sequence(s): A179545
;; terms: 3 9 30 63 165 234 408 513 759 1218 1395 1998 2460 2709 3243 4134 5133 5490 6633 7455
;; small program: (loop2((compr((2 - loop(x + x, x, 2)) mod (1 + x), 1 + y) * x) + 1, y, 2, 1, x) div 2) * (1 + 2)
;; fast program: (loop2((compr(loop((1 - loop(x + x, (x - 1) div 2, 2)) mod (1 + x), 1 - (x mod 2), x) - 2, 1 + y) * x) + 1, y, 2, 1, x) div 2) * (1 + 2)
(set-logic UFNIA)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun t1 (Int) Int)
(declare-fun u1 (Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 () Int)
(declare-fun i0 () Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f6 (Int) Int)
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
(declare-fun g4 (Int Int) Int)
(declare-fun t4 (Int) Int)
(declare-fun u4 (Int) Int)
(declare-fun v4 (Int Int) Int)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int Int) Int)
(declare-fun h3 () Int)
(declare-fun i3 () Int)
(declare-fun j3 (Int) Int)
(declare-fun u3 (Int Int Int) Int)
(declare-fun v3 (Int Int Int) Int)
(declare-fun w3 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f2 x) (+ x x))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (= h2 2))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (f1 x) (mod (- 2 (v2 x)) (+ 1 x)))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (+ 1 y))))
(assert (forall ((x Int)) (= (t1 x) (ite (<= (f1 x) 0) x (t1 (+ x 1))))))
(assert (forall ((x Int)) (= (u1 x) (ite (<= x 0) (t1 0) (t1 (+ (u1 (- x 1)) 1))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (v1 x y) x) 1))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) y)))
(assert (= h0 2))
(assert (= i0 1))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (* (div (w0 x) 2) (+ 1 2)))))
(assert (forall ((x Int)) (= (f6 x) (+ x x))))
(assert (forall ((x Int)) (= (g6 x) (div (- x 1) 2))))
(assert (= h6 2))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y))))))
(assert (forall ((x Int)) (= (v6 x) (u6 (g6 x) h6))))
(assert (forall ((x Int)) (= (f5 x) (mod (- 1 (v6 x)) (+ 1 x)))))
(assert (forall ((x Int)) (= (g5 x) (- 1 (mod x 2)))))
(assert (forall ((x Int)) (= (h5 x) x)))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int)) (= (v5 x) (u5 (g5 x) (h5 x)))))
(assert (forall ((x Int)) (= (f4 x) (- (v5 x) 2))))
(assert (forall ((x Int) (y Int)) (= (g4 x y) (+ 1 y))))
(assert (forall ((x Int)) (= (t4 x) (ite (<= (f4 x) 0) x (t4 (+ x 1))))))
(assert (forall ((x Int)) (= (u4 x) (ite (<= x 0) (t4 0) (t4 (+ (u4 (- x 1)) 1))))))
(assert (forall ((x Int) (y Int)) (= (v4 x y) (u4 (g4 x y)))))
(assert (forall ((x Int) (y Int)) (= (f3 x y) (+ (* (v4 x y) x) 1))))
(assert (forall ((x Int) (y Int)) (= (g3 x y) y)))
(assert (= h3 2))
(assert (= i3 1))
(assert (forall ((x Int)) (= (j3 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u3 x y z) (ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v3 x y z) (ite (<= x 0) z (g3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w3 x) (u3 h3 i3 (j3 x)))))
(assert (forall ((x Int)) (= (fast x) (* (div (w3 x) 2) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
