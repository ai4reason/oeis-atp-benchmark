;; sequence(s): A195173
;; terms: 0 2 4 6 8 9 11 13 15 16 18 20 22 23 25 27 29 30 32 34
;; small program: (x - ((2 * (x + x)) div (1 + loop(x * x, 2, 2)))) + x
;; fast program: (x - ((2 * (x + x)) div (1 + (2 * (2 * (2 + 2)))))) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (- x (div (* 2 (+ x x)) (+ 1 v0))) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- x (div (* 2 (+ x x)) (+ 1 (* 2 (* 2 (+ 2 2)))))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
