;; sequence(s): A71024
;; terms: 1 1 1 1 1 1 1 0 1 1 1 0 1 1 1 1 0 1 0 1
;; small program: (((((((loop(1 + ((loop((x mod y) + y, x, 0) + x) div 2), x, 1) + 1) div 2) + 1) div 2) * 2) + 1) div (1 + 2)) mod 2
;; fast program: (((((((((((loop((loop(((((1 + loop((x mod y) + y, x div (2 + 2), 0)) * (if (x - 1) <= 0 then 1 else 2)) * (if x <= 0 then 1 else 2)) - x) - 1, 1, x div 2) + 1) + x, x, 1) + 1) div 2) + 1) + x) + x) div 2) * 2) + 1) + x) div (1 + 2)) + x) mod 2
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f4 (Int Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 () Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (mod x y) y))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 0))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (f0 x) (+ 1 (div (+ (v1 x) x) 2)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (mod (div (+ (* (div (+ (div (+ (v0 x) 1) 2) 1) 2) 2) 1) (+ 1 2)) 2))))
(assert (forall ((x Int) (y Int)) (= (f4 x y) (+ (mod x y) y))))
(assert (forall ((x Int)) (= (g4 x) (div x (+ 2 2)))))
(assert (= h4 0))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (f3 x) (- (- (* (* (+ 1 (v4 x)) (ite (<= (- x 1) 0) 1 2)) (ite (<= x 0) 1 2)) x) 1))))
(assert (= g3 1))
(assert (forall ((x Int)) (= (h3 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 g3 (h3 x)))))
(assert (forall ((x Int)) (= (f2 x) (+ (+ (v3 x) 1) x))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (fast x) (mod (+ (div (+ (+ (* (div (+ (+ (+ (div (+ (v2 x) 1) 2) 1) x) x) 2) 2) 1) x) (+ 1 2)) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
