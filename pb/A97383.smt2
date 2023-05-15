;; sequence(s): A97383
;; terms: 0 2 3 6 8 11 13 17 20 24 27 31 34 38 41 46 50 55 59 64
;; small program: loop(2 + ((x div (1 + y)) + x), x, 0) - (x div 2)
;; fast program: (((loop(2 + ((x div y) + x), x, 0) * (2 + x)) div (1 + x)) - (x div 2)) - x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ (div x (+ 1 y)) x)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) (div x 2)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ 2 (+ (div x y) x)))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 0))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (- (- (div (* (v1 x) (+ 2 x)) (+ 1 x)) (div x 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
