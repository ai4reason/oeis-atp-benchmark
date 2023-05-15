;; sequence(s): A108647
;; terms: 1 20 150 700 2450 7056 17640 39600 81675 157300 286286 496860 828100 1332800 2080800 3162816 4694805 6822900 9728950 13636700
;; small program: loop((((((x + x) + x) div y) + x) * (2 + (2 + y))) div y, x, 1)
;; fast program: ((loop(loop(x * x, 1, (((x * x) * x) - x) div (2 + (2 + 2))), 1, 2 + x) * (2 + (2 + x))) div 2) div 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (* (+ (div (+ (+ x x) x) y) x) (+ 2 (+ 2 y))) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f2 x) (* x x))))
(assert (= g2 1))
(assert (forall ((x Int)) (= (h2 x) (div (- (* (* x x) x) x) (+ 2 (+ 2 2))))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (f1 x) (v2 x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (div (div (* (v1 x) (+ 2 (+ 2 x))) 2) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)