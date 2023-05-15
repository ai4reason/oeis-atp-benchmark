;; sequence(s): A276889
;; terms: 1 2 5 8 11 14 17 20 21 24 27 30 33 36 39 42 43 46 49 52
;; small program: ((((loop(((y * y) div (2 + x)) + y, x, 0) + x) div (1 + 2)) * 2) + 1) + x
;; fast program: (((((((2 * (x + x)) div (1 + (2 * (2 * (2 + 2))))) - x) div (2 + (2 + 2))) + x) * 2) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* y y) (+ 2 x)) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (* (div (+ (v0 x) x) (+ 1 2)) 2) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ (div (- (div (* 2 (+ x x)) (+ 1 (* 2 (* 2 (+ 2 2))))) x) (+ 2 (+ 2 2))) x) 2) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
