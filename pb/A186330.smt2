;; sequence(s): A186330
;; terms: 2 3 5 7 9 11 13 15 16 18 20 22 24 26 28 29 31 33 35 37
;; small program: ((loop((((2 * (y * y)) div (2 + x)) + y) + y, x + 1, 0) + 1) + x) div 2
;; fast program: ((((2 * ((x + x) + x)) + (x div (1 + (2 * (2 * (2 + 2)))))) div (1 + (2 + (2 + 2)))) + 2) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (div (* 2 (* y y)) (+ 2 x)) y) y))))
(assert (forall ((x Int)) (= (g0 x) (+ x 1))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (+ (+ (v0 x) 1) x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (* 2 (+ (+ x x) x)) (div x (+ 1 (* 2 (* 2 (+ 2 2)))))) (+ 1 (+ 2 (+ 2 2)))) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
