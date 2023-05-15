;; sequence(s): A189407
;; terms: 1 2 4 6 7 9 10 12 14 15 17 19 20 22 24 25 27 28 30 32
;; small program: ((loop(((((y * y) div (2 + (x + x))) + y) div (1 + x)) + x, x, x) div 2) + 1) + x
;; fast program: (((((1 + ((x - (x div (2 * (2 + 2)))) + x)) div (1 + (2 + (2 + 2)))) + x) div 2) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (+ (div (* y y) (+ 2 (+ x x))) y) (+ 1 x)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (div (v0 x) 2) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (div (+ 1 (+ (- x (div x (* 2 (+ 2 2)))) x)) (+ 1 (+ 2 (+ 2 2)))) x) 2) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
