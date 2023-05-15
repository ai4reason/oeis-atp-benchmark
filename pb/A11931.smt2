;; sequence(s): A11931
;; terms: 0 0 0 0 1 5 17 40 80 144 240 377 565 817 1144 1560 2080 2720 3497 4429
;; small program: loop((x - y) * x, 2, 2 - x) div (1 + loop(2 * (2 + x), 2, 2))
;; fast program: (loop(((x * x) * x) - x, 1, x - 2) * x) div (1 + (2 * (2 + (2 * (2 + 2)))))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (- x y) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (- 2 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (f1 x) (* 2 (+ 2 x)))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (small x) (div (v0 x) (+ 1 v1)))))
(assert (forall ((x Int)) (= (f2 x) (- (* (* x x) x) x))))
(assert (= g2 1))
(assert (forall ((x Int)) (= (h2 x) (- x 2))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (div (* (v2 x) x) (+ 1 (* 2 (+ 2 (* 2 (+ 2 2)))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
