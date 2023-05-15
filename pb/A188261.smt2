;; sequence(s): A188261
;; terms: 1 5 9 13 17 18 22 26 30 34 35 39 43 47 51 52 56 60 64 68
;; small program: (((loop(2 + (((y * y) div x) + y), 1 + x, 2) div 2) * (1 + 2)) - 2) + x
;; fast program: ((((1 - ((2 * (2 + (x + x))) div (1 + (2 * (2 + (2 * (2 + 2))))))) + x) * (1 + 2)) - 2) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ (div (* y y) x) y)))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (- (* (div (v0 x) 2) (+ 1 2)) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- (* (+ (- 1 (div (* 2 (+ 2 (+ x x))) (+ 1 (* 2 (+ 2 (* 2 (+ 2 2))))))) x) (+ 1 2)) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
