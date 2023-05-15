;; sequence(s): A212294
;; terms: 0 3 5 7 8 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
;; small program: (1 - loop2(y - 2, x div 2, x, 1, 1)) + x
;; fast program: ((2 + x) * (((2 + x) * x) + x)) div (1 + (2 + (x * x)))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y 2))))
(assert (forall ((x Int)) (= (g0 x) (div x 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (= i0 1))
(assert (= j0 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 j0))))
(assert (forall ((x Int)) (= (small x) (+ (- 1 (w0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (div (* (+ 2 x) (+ (* (+ 2 x) x) x)) (+ 1 (+ 2 (* x x)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)