;; sequence(s): A306736-A307845
;; terms: 1 4 36 576 14400 705600 57153600 6915585600 1168733966400 337764116289600 121932845980545600 64502475523708622400 40314047202317889000000 33904113697149344649000000 32581853262960520207689000000 44604557116992952164326241000000 74980260513665152588232411121000000
;; small program: loop2(loop((compr((loop(2 * ((x - (x div y)) + x), 1 + x, 1) - 2) mod (1 + x), y) * x) + x, y, x), y, 2, 1, x)
;; fast program: loop2(loop((compr((loop(2 * ((x - (x div y)) + x), 1 + x, 1) - 2) mod (1 + x), y) * x) + x, y, 1) * x, y, 2, 1, x)
(set-logic UFNIA)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun t2 (Int) Int)
(declare-fun u2 (Int) Int)
(declare-fun v2 (Int Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
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
(declare-fun f7 (Int Int) Int)
(declare-fun g7 (Int) Int)
(declare-fun h7 () Int)
(declare-fun u7 (Int Int) Int)
(declare-fun v7 (Int) Int)
(declare-fun f6 (Int) Int)
(declare-fun g6 (Int Int) Int)
(declare-fun t6 (Int) Int)
(declare-fun u6 (Int) Int)
(declare-fun v6 (Int Int) Int)
(declare-fun f5 (Int Int) Int)
(declare-fun g5 (Int Int) Int)
(declare-fun h5 () Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int Int) Int)
(declare-fun f4 (Int Int) Int)
(declare-fun g4 (Int Int) Int)
(declare-fun h4 () Int)
(declare-fun i4 () Int)
(declare-fun j4 (Int) Int)
(declare-fun u4 (Int Int Int) Int)
(declare-fun v4 (Int Int Int) Int)
(declare-fun w4 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f3 x y) (* 2 (+ (- x (div x y)) x)))))
(assert (forall ((x Int)) (= (g3 x) (+ 1 x))))
(assert (= h3 1))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int)) (= (f2 x) (mod (- (v3 x) 2) (+ 1 x)))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) y)))
(assert (forall ((x Int)) (= (t2 x) (ite (<= (f2 x) 0) x (t2 (+ x 1))))))
(assert (forall ((x Int)) (= (u2 x) (ite (<= x 0) (t2 0) (t2 (+ (u2 (- x 1)) 1))))))
(assert (forall ((x Int) (y Int)) (= (v2 x y) (u2 (g2 x y)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (* (v2 x y) x) x))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) (h1 x)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (v1 x y))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) y)))
(assert (= h0 2))
(assert (= i0 1))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int) (y Int)) (= (f7 x y) (* 2 (+ (- x (div x y)) x)))))
(assert (forall ((x Int)) (= (g7 x) (+ 1 x))))
(assert (= h7 1))
(assert (forall ((x Int) (y Int)) (= (u7 x y) (ite (<= x 0) y (f7 (u7 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v7 x) (u7 (g7 x) h7))))
(assert (forall ((x Int)) (= (f6 x) (mod (- (v7 x) 2) (+ 1 x)))))
(assert (forall ((x Int) (y Int)) (= (g6 x y) y)))
(assert (forall ((x Int)) (= (t6 x) (ite (<= (f6 x) 0) x (t6 (+ x 1))))))
(assert (forall ((x Int)) (= (u6 x) (ite (<= x 0) (t6 0) (t6 (+ (u6 (- x 1)) 1))))))
(assert (forall ((x Int) (y Int)) (= (v6 x y) (u6 (g6 x y)))))
(assert (forall ((x Int) (y Int)) (= (f5 x y) (+ (* (v6 x y) x) x))))
(assert (forall ((x Int) (y Int)) (= (g5 x y) y)))
(assert (= h5 1))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v5 x y) (u5 (g5 x y) h5))))
(assert (forall ((x Int) (y Int)) (= (f4 x y) (* (v5 x y) x))))
(assert (forall ((x Int) (y Int)) (= (g4 x y) y)))
(assert (= h4 2))
(assert (= i4 1))
(assert (forall ((x Int)) (= (j4 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u4 x y z) (ite (<= x 0) y (f4 (u4 (- x 1) y z) (v4 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v4 x y z) (ite (<= x 0) z (g4 (u4 (- x 1) y z) (v4 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w4 x) (u4 h4 i4 (j4 x)))))
(assert (forall ((x Int)) (= (fast x) (w4 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)