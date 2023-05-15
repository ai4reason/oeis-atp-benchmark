;; sequence(s): A315423
;; terms: 1 6 11 15 21 25 30 36 42 47 51 57 61 66 72 78 83 87 93 97
;; small program: ((loop(compr(loop((x * x) mod ((2 * (2 * (2 + 2))) - 1), 2, x + x) mod 2, y), x, 1) + x) + x) + x
;; fast program: ((((((((((((((((((if x <= 0 then 1 else x) - 1) div (1 + (2 + (2 + 2)))) + x) + 1) + (x div (1 + (2 + (2 + 2))))) + x) + x) * (if x <= 0 then 1 else 2)) * 2) + 1) + x) div (1 + 2)) + x) * 2) + 1) + x) div (1 + 2)) + x
(set-logic UFNIA)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun t1 (Int) Int)
(declare-fun u1 (Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f2 x) (mod (* x x) (- (* 2 (* 2 (+ 2 2))) 1)))))
(assert (= g2 2))
(assert (forall ((x Int)) (= (h2 x) (+ x x))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (f1 x) (mod (v2 x) 2))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (forall ((x Int)) (= (t1 x) (ite (<= (f1 x) 0) x (t1 (+ x 1))))))
(assert (forall ((x Int)) (= (u1 x) (ite (<= x 0) (t1 0) (t1 (+ (u1 (- x 1)) 1))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (v1 x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (v0 x) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (+ (* (+ (div (+ (+ (* (* (+ (+ (+ (+ (+ (div (- (ite (<= x 0) 1 x) 1) (+ 1 (+ 2 (+ 2 2)))) x) 1) (div x (+ 1 (+ 2 (+ 2 2))))) x) x) (ite (<= x 0) 1 2)) 2) 1) x) (+ 1 2)) x) 2) 1) x) (+ 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
