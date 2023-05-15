;; sequence(s): A247128
;; terms: 5 9 13 17 22 27 31 35 39 44 49 53 57 61 66 71 75 79 83 88
;; small program: (((1 + loop(2 + ((x div (2 + (2 + y))) + x), 2, x)) + x) + x) + x
;; fast program: ((((1 + (2 + 2)) * (1 + x)) + ((1 + x) div (1 + (2 + 2)))) + (x div (1 + (2 + 2)))) - x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ (div x (+ 2 (+ 2 y))) x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ 1 (v0 x)) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (- (+ (+ (* (+ 1 (+ 2 2)) (+ 1 x)) (div (+ 1 x) (+ 1 (+ 2 2)))) (div x (+ 1 (+ 2 2)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
