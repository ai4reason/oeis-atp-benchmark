;; sequence(s): A220084
;; terms: 1 15 62 162 335 601 980 1492 2157 2995 4026 5270 6747 8477 10480 12776 15385 18327 21622 25290
;; small program: loop2((y * y) + x, 1 + y, 2 + x, (x * x) * x, x)
;; fast program: (((((1 + (2 * (2 + (x + x)))) * ((x * x) + x)) div (2 + (2 + 2))) * (1 + (2 + 2))) + 1) - (x * x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* y y) x))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (+ 1 y))))
(assert (forall ((x Int)) (= (h0 x) (+ 2 x))))
(assert (forall ((x Int)) (= (i0 x) (* (* x x) x))))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) (i0 x) (j0 x)))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int)) (= (fast x) (- (+ (* (div (* (+ 1 (* 2 (+ 2 (+ x x)))) (+ (* x x) x)) (+ 2 (+ 2 2))) (+ 1 (+ 2 2))) 1) (* x x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)