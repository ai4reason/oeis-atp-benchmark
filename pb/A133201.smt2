;; sequence(s): A133201
;; terms: 0 1 2 3 13 23 33 133 233 333 1333 2333 3333 13333 23333 33333 133333 233333 333333 1333333
;; small program: loop(loop(2 * ((2 * (x + x)) + x), (y - 1) div (1 + 2), 1) + x, x, 0)
;; fast program: loop((((x + x) + x) div (x mod (1 + (2 * (2 + 2))))) + x, x, 1) div (1 + 2)
(set-logic UFNIA)
(declare-fun f1 (Int) Int)
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
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (* 2 (+ (* 2 (+ x x)) x)))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (div (- y 1) (+ 1 2)))))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) h1))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (v1 x y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f2 x) (+ (div (+ (+ x x) x) (mod x (+ 1 (* 2 (+ 2 2))))) x))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (fast x) (div (v2 x) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
