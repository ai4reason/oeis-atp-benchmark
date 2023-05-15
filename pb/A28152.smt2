;; sequence(s): A28152
;; terms: 1 32 655 10950 163161 2259732 29775715 378619250 4689039421 56915519232 680089278375 8025775900350 93763747253281 1086429328159532 12502585856078635 143058153091970250 1629014308540764741 18473446420865476632 208754600438793376495
;; small program: loop((loop(loop2((loop((2 + y) * x, 2, x) - x) + (y * y), y + y, y, 1, 2) + (2 * ((2 * (x + x)) + x)), y, 1) + (2 * ((x + x) + x))) + x, x, 1)
;; fast program: loop((loop((loop2((2 * ((2 * (x + x)) + x)) + (y * y), y + y, y, 1, 2) + (2 * ((x + x) + x))) + x, y, 1) + (2 * ((2 * (x + x)) + x))) + x, x, 1)
(set-logic UFNIA)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 () Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun h2 (Int Int) Int)
(declare-fun i2 () Int)
(declare-fun j2 () Int)
(declare-fun u2 (Int Int Int) Int)
(declare-fun v2 (Int Int Int) Int)
(declare-fun w2 (Int Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f6 (Int Int) Int)
(declare-fun g6 (Int Int) Int)
(declare-fun h6 (Int Int) Int)
(declare-fun i6 () Int)
(declare-fun j6 () Int)
(declare-fun u6 (Int Int Int) Int)
(declare-fun v6 (Int Int Int) Int)
(declare-fun w6 (Int Int) Int)
(declare-fun f5 (Int Int) Int)
(declare-fun g5 (Int Int) Int)
(declare-fun h5 () Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int Int) Int)
(declare-fun f4 (Int Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f3 x y) (* (+ 2 y) x))))
(assert (= g3 2))
(assert (forall ((x Int)) (= (h3 x) x)))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v3 x) (u3 g3 (h3 x)))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (+ (- (v3 x) x) (* y y)))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) (+ y y))))
(assert (forall ((x Int) (y Int)) (= (h2 x y) y)))
(assert (= i2 1))
(assert (= j2 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u2 x y z) (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v2 x y z) (ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int)) (= (w2 x y) (u2 (h2 x y) i2 j2))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (w2 x y) (* 2 (+ (* 2 (+ x x)) x))))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) h1))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (v1 x y) (* 2 (+ (+ x x) x))) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f6 x y) (+ (* 2 (+ (* 2 (+ x x)) x)) (* y y)))))
(assert (forall ((x Int) (y Int)) (= (g6 x y) (+ y y))))
(assert (forall ((x Int) (y Int)) (= (h6 x y) y)))
(assert (= i6 1))
(assert (= j6 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u6 x y z) (ite (<= x 0) y (f6 (u6 (- x 1) y z) (v6 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v6 x y z) (ite (<= x 0) z (g6 (u6 (- x 1) y z) (v6 (- x 1) y z))))))
(assert (forall ((x Int) (y Int)) (= (w6 x y) (u6 (h6 x y) i6 j6))))
(assert (forall ((x Int) (y Int)) (= (f5 x y) (+ (+ (w6 x y) (* 2 (+ (+ x x) x))) x))))
(assert (forall ((x Int) (y Int)) (= (g5 x y) y)))
(assert (= h5 1))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v5 x y) (u5 (g5 x y) h5))))
(assert (forall ((x Int) (y Int)) (= (f4 x y) (+ (+ (v5 x y) (* 2 (+ (* 2 (+ x x)) x))) x))))
(assert (forall ((x Int)) (= (g4 x) x)))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (fast x) (v4 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
