;; sequence(s): A284675
;; terms: 1 6 10 14 19 23 27 32 36 40 45 49 53 57 62 66 70 75 79 83
;; small program: loop(2 + (((((y * y) div (2 + x)) + y) + y) + y), x, 1) + x
;; fast program: ((((1 - (((x div (1 + (2 + (2 * (2 + 2))))) - x) div (1 + 2))) + x) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ (+ (+ (div (* y y) (+ 2 x)) y) y) y)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (- 1 (div (- (div x (+ 1 (+ 2 (* 2 (+ 2 2))))) x) (+ 1 2))) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
