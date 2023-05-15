;; sequence(s): A340375
;; terms: 1 1 1 1 1 0 1 1 1 0 0 0 1 0 1 1 1 0 0 0
;; small program: if loop(loop((x - 1) mod y, x, 0), 2, x) <= 0 then 1 else 0
;; fast program: ((((((loop2(((1 + y) div (2 + 2)) + x, y div 2, 2 + (2 + 2), 0, x) * 2) - x) + 2) div 2) div 2) div 2) + 1
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun h2 () Int)
(declare-fun i2 () Int)
(declare-fun j2 (Int) Int)
(declare-fun u2 (Int Int Int) Int)
(declare-fun v2 (Int Int Int) Int)
(declare-fun w2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (mod (- x 1) y))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 0))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (f0 x) (v1 x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (ite (<= (v0 x) 0) 1 0))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (+ (div (+ 1 y) (+ 2 2)) x))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) (div y 2))))
(assert (= h2 (+ 2 (+ 2 2))))
(assert (= i2 0))
(assert (forall ((x Int)) (= (j2 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u2 x y z) (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v2 x y z) (ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w2 x) (u2 h2 i2 (j2 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (div (div (div (+ (- (* (w2 x) 2) x) 2) 2) 2) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
