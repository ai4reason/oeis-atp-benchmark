;; sequence(s): A182986
;; terms: 0 2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67
;; small program: compr((2 - loop(x + x, x, 2)) mod (1 + x), x) + loop(1, x * x, x)
;; fast program: (((compr(loop(((((((((if (((1 + loop(x + x, x div 2, 1)) mod (1 + x)) - 2) <= 0 then 1 else x) + x) mod 2) + 1) mod (1 + 2)) - 1) mod (1 + 2)) - 1) mod (1 + x), (1 + x) mod 2, x) - 1, (((1 + x) + x) + x) div (1 + 2)) + 1) * (if x <= 0 then 1 else 2)) div 2) div 1
(set-logic UFNIA)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun t0 (Int) Int)
(declare-fun u0 (Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun f2 () Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 (Int) Int)
(declare-fun h5 () Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 (Int) Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun t3 (Int) Int)
(declare-fun u3 (Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (+ x x))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (f0 x) (mod (- 2 (v1 x)) (+ 1 x)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (t0 x) (ite (<= (f0 x) 0) x (t0 (+ x 1))))))
(assert (forall ((x Int)) (= (u0 x) (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x)))))
(assert (= f2 1))
(assert (forall ((x Int)) (= (g2 x) (* x x))))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y f2))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) (h2 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) (v2 x)))))
(assert (forall ((x Int)) (= (f5 x) (+ x x))))
(assert (forall ((x Int)) (= (g5 x) (div x 2))))
(assert (= h5 1))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int)) (= (v5 x) (u5 (g5 x) h5))))
(assert (forall ((x Int)) (= (f4 x) (mod (- (mod (- (mod (+ (mod (+ (ite (<= (- (mod (+ 1 (v5 x)) (+ 1 x)) 2) 0) 1 x) x) 2) 1) (+ 1 2)) 1) (+ 1 2)) 1) (+ 1 x)))))
(assert (forall ((x Int)) (= (g4 x) (mod (+ 1 x) 2))))
(assert (forall ((x Int)) (= (h4 x) x)))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) (h4 x)))))
(assert (forall ((x Int)) (= (f3 x) (- (v4 x) 1))))
(assert (forall ((x Int)) (= (g3 x) (div (+ (+ (+ 1 x) x) x) (+ 1 2)))))
(assert (forall ((x Int)) (= (t3 x) (ite (<= (f3 x) 0) x (t3 (+ x 1))))))
(assert (forall ((x Int)) (= (u3 x) (ite (<= x 0) (t3 0) (t3 (+ (u3 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x)))))
(assert (forall ((x Int)) (= (fast x) (div (div (* (+ (v3 x) 1) (ite (<= x 0) 1 2)) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
