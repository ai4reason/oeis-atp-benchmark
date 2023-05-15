;; sequence(s): A246296
;; terms: 5 11 17 24 30 36 43 49 55 61 68 74 80 87 93 99 105 112 118 124
;; small program: ((((((loop(loop(2 + ((2 + y) * x), 2, x) + x, 2, x) div 2) div 2) div 2) div 2) div 2) + 1) + x
;; fast program: ((((((((((1 + (((2 + (x div 2)) div (2 + 2)) + x)) div (2 + 2)) + 1) + x) + 2) + x) + x) + 2) + x) + x) + x
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ 2 (* (+ 2 y) x)))))
(assert (= g1 2))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (f0 x) (+ (v1 x) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (div (div (div (div (div (v0 x) 2) 2) 2) 2) 2) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (+ (+ (+ (+ (div (+ 1 (+ (div (+ 2 (div x 2)) (+ 2 2)) x)) (+ 2 2)) 1) x) 2) x) x) 2) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
