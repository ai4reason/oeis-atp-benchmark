;; sequence(s): A184515
;; terms: 4 9 14 20 25 30 35 41 46 51 56 62 67 72 77 82 88 93 98 103
;; small program: (((loop(((y * y) div (2 + x)) + y, ((2 * (x + x)) + 2) + 1, x) div 2) + 2) + x) + x
;; fast program: (((((((((((2 * (x + x)) div (2 + (2 * (2 + (2 * (2 + 2)))))) + x) + 2) div (1 + (2 + 2))) + x) + 2) + x) + x) + 2) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* y y) (+ 2 x)) y))))
(assert (forall ((x Int)) (= (g0 x) (+ (+ (* 2 (+ x x)) 2) 1))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (div (v0 x) 2) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (+ (+ (div (+ (+ (div (* 2 (+ x x)) (+ 2 (* 2 (+ 2 (* 2 (+ 2 2)))))) x) 2) (+ 1 (+ 2 2))) x) 2) x) x) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
