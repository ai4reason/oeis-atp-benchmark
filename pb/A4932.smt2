;; sequence(s): A4932-A4952
;; terms: 0 3571 7142 10713 14284 17855 21426 24997 28568 32139 35710 39281 42852 46423 49994 53565 57136 60707 64278 67849
;; small program: loop(loop2(x + y, x, x + x, 1, y), 2, 2) * x
;; fast program: (loop(((x * x) * y) + x, 2, 2 + (2 + 2)) * x) + x
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun i1 () Int)
(declare-fun j1 (Int Int) Int)
(declare-fun u1 (Int Int Int) Int)
(declare-fun v1 (Int Int Int) Int)
(declare-fun w1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 () Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ x y))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (forall ((x Int)) (= (h1 x) (+ x x))))
(assert (= i1 1))
(assert (forall ((x Int) (y Int)) (= (j1 x y) y)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u1 x y z) (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v1 x y z) (ite (<= x 0) z (g1 (u1 (- x 1) y z))))))
(assert (forall ((x Int) (y Int)) (= (w1 x y) (u1 (h1 x) i1 (j1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (w1 x y))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (* v0 x))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (+ (* (* x x) y) x))))
(assert (= g2 2))
(assert (= h2 (+ 2 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))))
(assert (= v2 (u2 g2 h2)))
(assert (forall ((x Int)) (= (fast x) (+ (* v2 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)