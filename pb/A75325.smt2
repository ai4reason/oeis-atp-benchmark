;; sequence(s): A75325
;; terms: 1 4 6 8 11 14 16 19 21 24 26 28 31 34 36 38 41 44 46 48
;; small program: (1 + ((loop((if (x mod 2) <= 0 then 2 else x) div 2, x + x, x) + x) + (x div 2))) + x
;; fast program: ((loop((loop(x div (if (x mod (2 + 2)) <= 0 then (2 + 2) else 1), x mod (2 + 2), 1 + x) mod 2) + x, x mod 2, x div 2) + 1) + x) + x
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
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (div (ite (<= (mod x 2) 0) 2 x) 2))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ 1 (+ (+ (v0 x) x) (div x 2))) x))))
(assert (forall ((x Int)) (= (f2 x) (div x (ite (<= (mod x (+ 2 2)) 0) (+ 2 2) 1)))))
(assert (forall ((x Int)) (= (g2 x) (mod x (+ 2 2)))))
(assert (forall ((x Int)) (= (h2 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) (h2 x)))))
(assert (forall ((x Int)) (= (f1 x) (+ (mod (v2 x) 2) x))))
(assert (forall ((x Int)) (= (g1 x) (mod x 2))))
(assert (forall ((x Int)) (= (h1 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (v1 x) 1) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)