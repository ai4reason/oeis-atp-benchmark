;; sequence(s): A186322
;; terms: 2 3 5 6 8 10 11 13 15 16 18 19 21 23 24 26 28 29 31 32
;; small program: ((((((((loop(y - 1, (x - 2) div (2 * (2 + 2)), 0) + x) + x) div 2) div 2) div 2) + x) div 2) + x) + 2
;; fast program: (((((((2 * (2 * (x div (2 + (2 * (2 + 2)))))) div (1 + (2 + (2 + 2)))) + x) div (2 + 2)) + x) div 2) + x) + 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y 1))))
(assert (forall ((x Int)) (= (g0 x) (div (- x 2) (* 2 (+ 2 2))))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (div (+ (div (div (div (+ (+ (v0 x) x) x) 2) 2) 2) x) 2) x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (div (+ (div (* 2 (* 2 (div x (+ 2 (* 2 (+ 2 2)))))) (+ 1 (+ 2 (+ 2 2)))) x) (+ 2 2)) x) 2) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
