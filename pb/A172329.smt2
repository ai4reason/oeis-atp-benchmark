;; sequence(s): A172329
;; terms: 0 4 9 14 18 23 28 33 37 42 47 52 56 61 66 70 75 80 85 89
;; small program: (loop(2 + (x * x), 2, 1 + 2) * x) div loop(1 + (x * x), 2, 2)
;; fast program: ((loop((x * x) * x, 1, 1 + (2 + 2)) - 2) * x) div (2 + (2 * (2 * (2 + (2 + 2)))))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 () Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 2 (* x x)))))
(assert (= g0 2))
(assert (= h0 (+ 1 2)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (f1 x) (+ 1 (* x x)))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (small x) (div (* v0 x) v1))))
(assert (forall ((x Int)) (= (f2 x) (* (* x x) x))))
(assert (= g2 1))
(assert (= h2 (+ 1 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (= v2 (u2 g2 h2)))
(assert (forall ((x Int)) (= (fast x) (div (* (- v2 2) x) (+ 2 (* 2 (* 2 (+ 2 (+ 2 2)))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
