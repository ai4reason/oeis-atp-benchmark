;; sequence(s): A22848
;; terms: 0 2 4 7 9 11 13 16 18 20 22 25 27 29 31 34 36 38 40 42
;; small program: (loop(1 + ((y * y) div (x + y)), 2 * (x + x), 0) div 2) + x
;; fast program: (((1 + (x - (x div (2 + (2 * (2 * (2 + 2))))))) div (2 + 2)) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (div (* y y) (+ x y))))))
(assert (forall ((x Int)) (= (g0 x) (* 2 (+ x x)))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (div (v0 x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ 1 (- x (div x (+ 2 (* 2 (* 2 (+ 2 2))))))) (+ 2 2)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
