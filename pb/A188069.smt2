;; sequence(s): A188069
;; terms: 1 4 8 12 15 19 23 27 30 34 38 42 45 49 53 56 60 64 68 71
;; small program: ((loop(y - ((x * y) div ((x + y) + y)), x, 1) + x) + x) + x
;; fast program: (((x - (((x div (2 + (2 * (2 + (2 + 2))))) + x) div (2 + 2))) + x) + (if x <= 0 then 1 else x)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y (div (* x y) (+ (+ x y) y))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (v0 x) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (- x (div (+ (div x (+ 2 (* 2 (+ 2 (+ 2 2))))) x) (+ 2 2))) x) (ite (<= x 0) 1 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
