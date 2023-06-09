;; sequence(s): A50492
;; terms: 1 14 63 172 365 666 1099 1688 2457 3430 4631 6084 7813 9842 12195 14896 17969 21438 25327 29660
;; small program: x + loop2(1 + y, x * y, 2 + 2, 2, x)
;; fast program: (1 + (2 * ((2 * (x * x)) + x))) * (1 + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 () Int)
(declare-fun i0 () Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 y))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (* x y))))
(assert (= h0 (+ 2 2)))
(assert (= i0 2))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (+ x (w0 x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (* 2 (+ (* 2 (* x x)) x))) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
