;; sequence(s): A315517
;; terms: 1 6 11 17 22 27 32 37 42 47 53 58 64 70 75 81 86 91 96 101
;; small program: ((((loop(loop(((1 + loop(2 - x, x div 2, x)) mod (1 + 2)) mod 2, 1, y) + x, x - 1, 1) + x) + x) + x) + x) + x
;; fast program: (((((((((loop(((((((1 + (2 * (((1 + x) div (1 + 2)) + x))) div (1 + 2)) + 1) + x) mod 2) + 1) + x, x, 2) - 1) + x) + x) + x) * 2) + 1) + x) div (1 + 2)) + x) + x
(set-logic UFNIA)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f2 x) (- 2 x))))
(assert (forall ((x Int)) (= (g2 x) (div x 2))))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) (h2 x)))))
(assert (forall ((x Int)) (= (f1 x) (mod (mod (+ 1 (v2 x)) (+ 1 2)) 2))))
(assert (= g1 1))
(assert (forall ((x Int) (y Int)) (= (h1 x y) y)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 g1 (h1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (v1 x y) x))))
(assert (forall ((x Int)) (= (g0 x) (- x 1))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (+ (v0 x) x) x) x) x) x))))
(assert (forall ((x Int)) (= (f3 x) (+ (+ (mod (+ (+ (div (+ 1 (* 2 (+ (div (+ 1 x) (+ 1 2)) x))) (+ 1 2)) 1) x) 2) 1) x))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (= h3 2))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (+ (* (+ (+ (+ (- (v3 x) 1) x) x) x) 2) 1) x) (+ 1 2)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
