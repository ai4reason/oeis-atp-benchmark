;; sequence(s): A100583
;; terms: 0 8 44 124 268 492 816 1256 1832 2560 3460 4548 5844 7364 9128 11152 13456 16056 18972 22220
;; small program: loop2(((x + x) + y) * y, x, 2, x, x + 1) div 2
;; fast program: ((((2 * (2 + x)) + x) * (x * x)) + ((x * x) div 2)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ (+ x x) y) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int)) (= (i0 x) x)))
(assert (forall ((x Int)) (= (j0 x) (+ x 1))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 (i0 x) (j0 x)))))
(assert (forall ((x Int)) (= (small x) (div (w0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ (* 2 (+ 2 x)) x) (* x x)) (div (* x x) 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
