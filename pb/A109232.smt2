;; sequence(s): A109232
;; terms: 2 5 8 11 14 17 19 22 25 28 31 34 36 39 42 45 48 51 53 56
;; small program: ((loop(y - ((x - ((x div 2) div 2)) div (2 + 2)), x, 0) + 2) + x) + x
;; fast program: (((2 - (((1 + 2) * (1 + x)) div (1 + (2 + (2 * (2 * (2 + 2))))))) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y (div (- x (div (div x 2) 2)) (+ 2 2))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (v0 x) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (- 2 (div (* (+ 1 2) (+ 1 x)) (+ 1 (+ 2 (* 2 (* 2 (+ 2 2))))))) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
