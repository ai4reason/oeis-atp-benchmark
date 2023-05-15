;; sequence(s): A212975
;; terms: 1 2 15 28 65 102 175 248 369 490 671 852 1105 1358 1695 2032 2465 2898 3439 3980
;; small program: (1 + x) * loop(((y * y) - x) + y, x, 1)
;; fast program: (1 + (2 * (((2 + x) * x) div (2 + 2)))) * (1 + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- (* y y) x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (+ 1 x) (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (* 2 (div (* (+ 2 x) x) (+ 2 2)))) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
