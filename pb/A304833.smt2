;; sequence(s): A304833
;; terms: 12 65 124 189 260 337 420 509 604 705 812 925 1044 1169 1300 1437 1580 1729 1884 2045
;; small program: ((loop(((2 * (2 + 2)) + x) + y, x, 2) * 2) * (2 + 1)) - x
;; fast program: (((((((2 * (2 * (2 + 2))) + x) * x) + 2) + 2) * (1 + 2)) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (* 2 (+ 2 2)) x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (* (* (v0 x) 2) (+ 2 1)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ (+ (* (+ (* 2 (* 2 (+ 2 2))) x) x) 2) 2) (+ 1 2)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
