;; sequence(s): A315306
;; terms: 1 6 10 16 20 24 30 34 40 46 50 56 60 64 70 74 80 86 90 96
;; small program: ((loop(((1 - ((x div 2) mod 2)) + y) div 2, x, 1) + x) + x) * (if x <= 0 then 1 else 2)
;; fast program: (((loop((((((1 + x) * (2 + (x div 2))) div 2) mod (2 + 2)) - 1) + x, x mod 2, x) + x) + (if x <= 0 then 1 else x)) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (+ (- 1 (mod (div x 2) 2)) y) 2))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (+ (+ (v0 x) x) x) (ite (<= x 0) 1 2)))))
(assert (forall ((x Int)) (= (f1 x) (+ (- (mod (div (* (+ 1 x) (+ 2 (div x 2))) 2) (+ 2 2)) 1) x))))
(assert (forall ((x Int)) (= (g1 x) (mod x 2))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (v1 x) x) (ite (<= x 0) 1 x)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
