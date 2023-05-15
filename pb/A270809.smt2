;; sequence(s): A270809
;; terms: 4 2 2 6 16 34 62 102 156 226 314 422 552 706 886 1094 1332 1602 1906 2246
;; small program: 2 + loop((((y * y) - 2) - y) + x, x, 2)
;; fast program: ((((x * x) * x) - x) div (1 + 2)) + (2 * (2 - x))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- (- (* y y) 2) y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ 2 (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (div (- (* (* x x) x) x) (+ 1 2)) (* 2 (- 2 x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
