;; sequence(s): A92054
;; terms: 1 2 4 6 7 8 11 14 15 16 18 20 21 22 26 30 31 32 34 36
;; small program: loop((loop2(((y div 2) mod 2) + x, y div (2 - (x mod 2)), x, 1, y) div 2) + x, x, 1) + x
;; fast program: loop(loop(loop2((y mod 2) + x, y div (2 - (x mod 2)), x, 1, x) div 2, 1, y div 2) + x, x, 1) + x
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 () Int)
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
(declare-fun f4 (Int Int) Int)
(declare-fun g4 (Int Int) Int)
(declare-fun h4 (Int) Int)
(declare-fun i4 () Int)
(declare-fun j4 (Int) Int)
(declare-fun u4 (Int Int Int) Int)
(declare-fun v4 (Int Int Int) Int)
(declare-fun w4 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 () Int)
(declare-fun h3 (Int Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (mod (div y 2) 2) x))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (div y (- 2 (mod x 2))))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (= i1 1))
(assert (forall ((x Int) (y Int)) (= (j1 x y) y)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int)) (= (w1 x y) (u1 (h1 x) i1 (j1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (w1 x y) 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int) (y Int)) (= (f4 x y) (+ (mod y 2) x))))
(assert (forall ((x Int) (y Int)) (= (g4 x y) (div y (- 2 (mod x 2))))))
(assert (forall ((x Int)) (= (h4 x) x)))
(assert (= i4 1))
(assert (forall ((x Int)) (= (j4 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u4 x y z) (ite (<= x 0) y (f4 (u4 (- x 1) y z) (v4 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v4 x y z) (ite (<= x 0) z (g4 (u4 (- x 1) y z) (v4 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w4 x) (u4 (h4 x) i4 (j4 x)))))
(assert (forall ((x Int)) (= (f3 x) (div (w4 x) 2))))
(assert (= g3 1))
(assert (forall ((x Int) (y Int)) (= (h3 x y) (div y 2))))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v3 x y) (u3 g3 (h3 x y)))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (+ (v3 x y) x))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (fast x) (+ (v2 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)