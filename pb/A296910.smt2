;; sequence(s): A296910
;; terms: 1 4 6 14 14 22 22 30 30 38 38 46 46 54 54 62 62 70 70 78
;; small program: (loop2(2 + y, x, x - 2, 1, 2) + x) * (if x <= 0 then 1 else 2)
;; fast program: (((2 * ((x mod 2) + x)) - (if x <= 0 then 1 else 2)) * (if (x - 1) <= 0 then 1 else 2)) + 2
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) (- x 2))))
(assert (= i0 1))
(assert (= j0 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 j0))))
(assert (forall ((x Int)) (= (small x) (* (+ (w0 x) x) (ite (<= x 0) 1 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (* (- (* 2 (+ (mod x 2) x)) (ite (<= x 0) 1 2)) (ite (<= (- x 1) 0) 1 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)