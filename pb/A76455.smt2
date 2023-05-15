;; sequence(s): A76455
;; terms: 5 57 246 710 1635 3255 5852 9756 15345 23045 33330 46722 63791 85155 111480 143480 181917 227601 281390 344190
;; small program: (loop2((1 + (x + x)) * (2 + y), x, 2, x, x) * (1 + x)) div 2
;; fast program: (1 + (2 * ((1 + (x + x)) * (2 + x)))) * (((1 + x) * (2 + x)) div 2)
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ 1 (+ x x)) (+ 2 y)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int)) (= (i0 x) x)))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 (i0 x) (j0 x)))))
(assert (forall ((x Int)) (= (small x) (div (* (w0 x) (+ 1 x)) 2))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (* 2 (* (+ 1 (+ x x)) (+ 2 x)))) (div (* (+ 1 x) (+ 2 x)) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
