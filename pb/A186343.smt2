;; sequence(s): A186343
;; terms: 2 4 6 9 11 14 16 19 21 23 26 28 31 33 35 38 40 43 45 47
;; small program: loop(((y * y) div ((2 * (2 + (x + x))) + 1)) + y, x + x, 0) + 2
;; fast program: ((((((2 * (x + x)) + (x div (1 + (2 + (2 + 2))))) + 1) div (((2 + 2) * 2) + 2)) + 2) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* y y) (+ (* 2 (+ 2 (+ x x))) 1)) y))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (+ (+ (* 2 (+ x x)) (div x (+ 1 (+ 2 (+ 2 2))))) 1) (+ (* (+ 2 2) 2) 2)) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
