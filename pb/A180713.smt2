;; sequence(s): A180713
;; terms: 0 4 6 11 12 16 18 23 24 28 30 35 36 40 42 47 48 52 54 59
;; small program: ((((((x div 2) * x) mod 2) + (x mod 2)) + x) + x) + x
;; fast program: (loop(loop(1, 2 - (x mod (2 + 2)), 2) + x, x mod 2, x) + x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f1 () Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (mod (* (div x 2) x) 2) (mod x 2)) x) x) x))))
(assert (= f1 1))
(assert (forall ((x Int)) (= (g1 x) (- 2 (mod x (+ 2 2))))))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y f1))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (f0 x) (+ (v1 x) x))))
(assert (forall ((x Int)) (= (g0 x) (mod x 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (v0 x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)