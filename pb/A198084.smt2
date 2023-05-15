;; sequence(s): A198084
;; terms: 0 3 6 8 11 14 16 19 22 24 27 30 32 35 38 40 43 45 48 51
;; small program: ((x + x) - (((x div loop(x * x, 2, 2)) + x) div (1 + 2))) + x
;; fast program: ((x + x) - (((x div (2 * (2 * (2 + 2)))) + x) div (1 + 2))) + x
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
(assert (forall ((x Int)) (= (small x) (+ (- (+ x x) (div (+ (div x v0) x) (+ 1 2))) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- (+ x x) (div (+ (div x (* 2 (* 2 (+ 2 2)))) x) (+ 1 2))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
