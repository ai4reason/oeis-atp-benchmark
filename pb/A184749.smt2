;; sequence(s): A184749
;; terms: 2 5 7 9 12 14 16 19 21 23 26 28 30 32 35 37 39 42 44 46
;; small program: (((((loop(((y * y) div (2 + x)) + y, ((1 + 2) + x) + x, 0) - 1) div 2) + x) div 2) + x) + 2
;; fast program: ((((((((((2 - (x div (2 * (2 + (2 * (2 + 2)))))) + x) div (2 + 2)) + 1) + x) div 2) + 1) div 2) + 2) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* y y) (+ 2 x)) y))))
(assert (forall ((x Int)) (= (g0 x) (+ (+ (+ 1 2) x) x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (div (+ (div (- (v0 x) 1) 2) x) 2) x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (+ (div (+ (+ (div (+ (- 2 (div x (* 2 (+ 2 (* 2 (+ 2 2)))))) x) (+ 2 2)) 1) x) 2) 1) 2) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
