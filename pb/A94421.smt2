;; sequence(s): A94421
;; terms: 13 74 219 484 905 1518 2359 3464 4869 6610 8723 11244 14209 17654 21615 26128 31229 36954 43339 50420
;; small program: (loop2((1 + y) * (x * y), x, 2, 1 + x, 2) + 1) + x
;; fast program: (1 + (2 * ((1 + 2) * ((1 + x) * (2 + x))))) * (1 + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ 1 y) (* x y)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int)) (= (i0 x) (+ 1 x))))
(assert (= j0 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 (i0 x) j0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (w0 x) 1) x))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (* 2 (* (+ 1 2) (* (+ 1 x) (+ 2 x))))) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
