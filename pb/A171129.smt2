;; sequence(s): A171129
;; terms: 0 ~1 1 21 86 235 519 1001 1756 2871 4445 6589 9426 13091 17731 23505 30584 39151 49401 61541
;; small program: loop2((x * y) - y, y, 1 + 2, x, x) div 2
;; fast program: ((1 - (x * x)) * (((1 - x) * x) div 2)) - x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 () Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (* x y) y))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) y)))
(assert (= h0 (+ 1 2)))
(assert (forall ((x Int)) (= (i0 x) x)))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 (i0 x) (j0 x)))))
(assert (forall ((x Int)) (= (small x) (div (w0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (- (* (- 1 (* x x)) (div (* (- 1 x) x) 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
