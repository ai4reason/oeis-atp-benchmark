;; sequence(s): A276882
;; terms: 1 2 5 8 9 12 15 16 19 22 25 26 29 32 33 36 39 42 43 46
;; small program: ((loop((x + y) div (1 + x), (x * x) div 2, 0) * 2) + 1) + x
;; fast program: (((((((2 * (x + x)) div (1 + (2 * (2 * (2 * (2 + 2)))))) - x) div (1 + 2)) + x) * 2) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (+ x y) (+ 1 x)))))
(assert (forall ((x Int)) (= (g0 x) (div (* x x) 2))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (* (v0 x) 2) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ (div (- (div (* 2 (+ x x)) (+ 1 (* 2 (* 2 (* 2 (+ 2 2)))))) x) (+ 1 2)) x) 2) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
