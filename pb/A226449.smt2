;; sequence(s): A226449
;; terms: 0 1 9 39 106 225 411 679 1044 1521 2125 2871 3774 4849 6111 7575 9256 11169 13329 15751
;; small program: ((x - 1) * loop(x + y, x, 2 * ((x * x) - x))) + x
;; fast program: ((((((2 * (2 * (x - 2))) + x) * (x * x)) + x) div 2) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) (* 2 (- (* x x) x)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (- x 1) (v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (* (+ (* 2 (* 2 (- x 2))) x) (* x x)) x) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
