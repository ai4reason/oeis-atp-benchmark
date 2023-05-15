;; sequence(s): A315321
;; terms: 1 6 10 16 21 26 32 37 42 48 52 58 64 68 74 79 84 90 95 100
;; small program: ((loop((((((x * x) div (2 + loop(x * x, 2, 2))) + x) mod 2) + 1) + x, x + x, 2) - 1) + x) + x
;; fast program: ((loop((((((x * x) div (2 + (2 * (2 * (2 + 2))))) + x) mod 2) + 1) + x, x + x, 2) - 1) + x) + x
(set-logic UFNIA)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun f0 (Int) Int)
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
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (f0 x) (+ (+ (mod (+ (div (* x x) (+ 2 v1)) x) 2) 1) x))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (- (v0 x) 1) x) x))))
(assert (forall ((x Int)) (= (f2 x) (+ (+ (mod (+ (div (* x x) (+ 2 (* 2 (* 2 (+ 2 2))))) x) 2) 1) x))))
(assert (forall ((x Int)) (= (g2 x) (+ x x))))
(assert (= h2 2))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (- (v2 x) 1) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
