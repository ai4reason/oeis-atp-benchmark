;; sequence(s): A22853
;; terms: 0 3 6 9 13 16 19 22 25 28 31 35 38 41 44 47 50 53 57 60
;; small program: (loop(((y - (x div 2)) div (1 + 2)) + y, x, 0) + x) + x
;; fast program: ((((1 + (2 + x)) div (1 + (2 + (2 + 2)))) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (- y (div x 2)) (+ 1 2)) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (+ 1 (+ 2 x)) (+ 1 (+ 2 (+ 2 2)))) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
