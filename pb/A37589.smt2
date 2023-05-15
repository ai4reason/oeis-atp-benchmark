;; sequence(s): A37589
;; terms: 3 31 313 3131 31313 313131 3131313 31313131 313131313 3131313131 31313131313 313131313131 3131313131313 31313131313131 313131313131313 3131313131313131
;; small program: loop(1 + (2 * (((2 * (x + x)) + (y mod 2)) + x)), x + 1, 0)
;; fast program: loop2((2 * ((2 * (x + x)) + x)) + y, 1 + (2 div y), x, 1 + 2, 1)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 () Int)
(declare-fun j1 () Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (* 2 (+ (+ (* 2 (+ x x)) (mod y 2)) x))))))
(assert (forall ((x Int)) (= (g0 x) (+ x 1))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (* 2 (+ (* 2 (+ x x)) x)) y))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (+ 1 (div 2 y)))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (= i1 (+ 1 2)))
(assert (= j1 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w1 x) (u1 (h1 x) i1 j1))))
(assert (forall ((x Int)) (= (fast x) (w1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
