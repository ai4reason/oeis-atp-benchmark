;; sequence(s): A313692
;; terms: 1 5 10 15 19 24 29 33 38 43 48 53 58 63 67 72 77 81 86 91
;; small program: loop(((loop((if (((1 + x) mod loop(x * x, 2, 2)) mod x) <= 0 then 1 else 2) + x, 2, x) - x) + 1) + x, x, 1)
;; fast program: ((((((((((((((x + x) div (1 + (2 + 2))) + x) div 2) + x) * 2) + 1) - (if x <= 0 then 1 else 2)) + x) + x) div (1 + 2)) + 1) + x) + x) + x
(set-logic UFNIA)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 () Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f2 x) (* x x))))
(assert (= g2 2))
(assert (= h2 2))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (= v2 (u2 g2 h2)))
(assert (forall ((x Int)) (= (f1 x) (+ (ite (<= (mod (mod (+ 1 x) v2) x) 0) 1 2) x))))
(assert (= g1 2))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (f0 x) (+ (+ (- (v1 x) x) 1) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (div (+ (+ (- (+ (* (+ (div (+ (div (+ x x) (+ 1 (+ 2 2))) x) 2) x) 2) 1) (ite (<= x 0) 1 2)) x) x) (+ 1 2)) 1) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
