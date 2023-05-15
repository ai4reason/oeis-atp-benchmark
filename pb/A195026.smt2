;; sequence(s): A195026
;; terms: 0 21 70 147 252 385 546 735 952 1197 1470 1771 2100 2457 2842 3255 3696 4165 4662 5187
;; small program: loop2((2 * (x * y)) + x, 1 + 2, 2, x, x)
;; fast program: (1 + (2 + (2 + 2))) * ((2 * (x * x)) + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* 2 (* x y)) x))))
(assert (= g0 (+ 1 2)))
(assert (= h0 2))
(assert (forall ((x Int)) (= (i0 x) x)))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z g0))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 (i0 x) (j0 x)))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (+ 2 (+ 2 2))) (+ (* 2 (* x x)) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)