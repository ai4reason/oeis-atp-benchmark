;; sequence(s): A15221
;; terms: 1 5 55 91 285 385 819 1015 1785 2109 3311 3795 5525 6201 8555 9455 12529 13685 17575 19019
;; small program: loop((y * y) + x, 1 + ((2 * (x div 2)) + x), 0)
;; fast program: loop(((1 + (x + x)) * ((x * x) + x)) div (2 + (2 + 2)), 1, (1 + x) + (2 * (x div 2)))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* y y) x))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 (+ (* 2 (div x 2)) x)))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f1 x) (div (* (+ 1 (+ x x)) (+ (* x x) x)) (+ 2 (+ 2 2))))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (+ (+ 1 x) (* 2 (div x 2))))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (v1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
