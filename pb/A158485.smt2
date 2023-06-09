;; sequence(s): A158485
;; terms: 13 55 125 223 349 503 685 895 1133 1399 1693 2015 2365 2743 3149 3583 4045 4535 5053 5599
;; small program: (loop2(2 * (((x + y) * y) + x), x, 2, x, 2) - 1) - 2
;; fast program: (2 * ((1 + (2 + (2 + 2))) * (1 + ((2 + x) * x)))) - 1
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* 2 (+ (* (+ x y) y) x)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int)) (= (i0 x) x)))
(assert (= j0 2))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 (i0 x) j0))))
(assert (forall ((x Int)) (= (small x) (- (- (w0 x) 1) 2))))
(assert (forall ((x Int)) (= (fast x) (- (* 2 (* (+ 1 (+ 2 (+ 2 2))) (+ 1 (* (+ 2 x) x)))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
