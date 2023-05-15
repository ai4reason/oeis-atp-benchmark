;; sequence(s): A161703
;; terms: 1 3 5 15 41 91 173 295 465 691 981 1343 1785 2315 2941 3671 4513 5475 6565 7791
;; small program: 1 + loop2((y * y) + x, y - 2, x, x, 1)
;; fast program: ((((((1 - x) * ((2 - x) * x)) div (1 + 2)) * 2) + x) * 2) + 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* y y) x))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (- y 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int)) (= (i0 x) x)))
(assert (= j0 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) (i0 x) j0))))
(assert (forall ((x Int)) (= (small x) (+ 1 (w0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ (* (div (* (- 1 x) (* (- 2 x) x)) (+ 1 2)) 2) x) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
