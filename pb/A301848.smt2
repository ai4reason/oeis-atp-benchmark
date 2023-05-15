;; sequence(s): A301848
;; terms: 1 3 1 4 1 3 2 4 1 3 1 4 2 3 2 4 1 3 1 4
;; small program: (((loop(x div (2 - (x mod 2)), x, x) div 2) mod 2) + (2 * (x mod 2))) + 1
;; fast program: ((((((1 + loop(loop(x div 2, x mod 2, x), 2 + (2 + 2), x - 1)) mod (2 + 2)) div 2) + 1) + x) + (2 * (x mod 2))) - x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (div x (- 2 (mod x 2))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (mod (div (v0 x) 2) 2) (* 2 (mod x 2))) 1))))
(assert (forall ((x Int)) (= (f2 x) (div x 2))))
(assert (forall ((x Int)) (= (g2 x) (mod x 2))))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) (h2 x)))))
(assert (forall ((x Int)) (= (f1 x) (v2 x))))
(assert (= g1 (+ 2 (+ 2 2))))
(assert (forall ((x Int)) (= (h1 x) (- x 1))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (- (+ (+ (+ (div (mod (+ 1 (v1 x)) (+ 2 2)) 2) 1) x) (* 2 (mod x 2))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
