;; sequence(s): A198263
;; terms: 0 3 6 9 12 15 17 20 23 26 29 32 34 37 40 43 46 49 51 54
;; small program: loop(2 + (((y * y) div (x + y)) + y), x + x, 1) - 1
;; fast program: ((x + x) - (((x div (1 + (2 + 2))) + x) div (1 + (2 + (2 + 2))))) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ (div (* y y) (+ x y)) y)))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (- (+ x x) (div (+ (div x (+ 1 (+ 2 2))) x) (+ 1 (+ 2 (+ 2 2))))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
