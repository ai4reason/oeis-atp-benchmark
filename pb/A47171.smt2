;; sequence(s): A47171
;; terms: 0 0 0 2 3 9 14 34 55 125 209 461 791 1715 3002 6434 11439 24309 43757 92377
;; small program: loop(loop2(loop((x * y) div (y - (y div 2)), y, 1) - x, 1 + y, 2, x, y) - x, x, 1) - 1
;; fast program: (loop((x * y) div (y - (y div 2)), 1 + x, 1) - 1) mod loop((x * y) div (y - (y div 2)), x, 1)
(set-logic UFNIA)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 () Int)
(declare-fun i1 (Int) Int)
(declare-fun j1 (Int Int) Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f4 (Int Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f2 x y) (div (* x y) (- y (div y 2))))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) y)))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v2 x y) (u2 (g2 x y) h2))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (- (v2 x y) x))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (+ 1 y))))
(assert (= h1 2))
(assert (forall ((x Int)) (= (i1 x) x)))
(assert (forall ((x Int) (y Int)) (= (j1 x y) y)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int)) (= (w1 x y) (u1 h1 (i1 x) (j1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (w1 x y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) 1))))
(assert (forall ((x Int) (y Int)) (= (f3 x y) (div (* x y) (- y (div y 2))))))
(assert (forall ((x Int)) (= (g3 x) (+ 1 x))))
(assert (= h3 1))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int) (y Int)) (= (f4 x y) (div (* x y) (- y (div y 2))))))
(assert (forall ((x Int)) (= (g4 x) x)))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (fast x) (mod (- (v3 x) 1) (v4 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
