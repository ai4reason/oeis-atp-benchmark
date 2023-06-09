;; sequence(s): A228291
;; terms: 0 7 254 3279 21844 97655 335922 960799 2396744 5380839 11111110 21435887 39089244 67977559 113522234 183063615 286331152 435984839 648232974 943531279
;; small program: loop2((x * y) + y, y, 2 + (2 + 2), x, x)
;; fast program: ((1 + x) * loop((1 + ((x * x) + x)) * x, 1, x * x)) + x
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
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* x y) y))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) y)))
(assert (= h0 (+ 2 (+ 2 2))))
(assert (forall ((x Int)) (= (i0 x) x)))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 (i0 x) (j0 x)))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int)) (= (f1 x) (* (+ 1 (+ (* x x) x)) x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (* x x))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 x) (v1 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
