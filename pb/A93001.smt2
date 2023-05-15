;; sequence(s): A93001
;; terms: 2 3 5 6 8 9 11 12 13 15 16 18 19 20 22 23 25 26 28 29
;; small program: loop(loop(x + y, x, y) div x, 1 + (((2 + x) * x) + x), 1)
;; fast program: (((2 + (((x div (2 + (2 * (2 + (2 + 2))))) + (x + loop(0, 2 - x, 1))) + x)) div (1 + (2 + 2))) + x) + 2
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 () Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ x y))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (forall ((x Int) (y Int)) (= (h1 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x) (h1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (v1 x y) x))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 (+ (* (+ 2 x) x) x)))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (= f2 0))
(assert (forall ((x Int)) (= (g2 x) (- 2 x))))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y f2))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ 2 (+ (+ (div x (+ 2 (* 2 (+ 2 (+ 2 2))))) (+ x (v2 x))) x)) (+ 1 (+ 2 2))) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
