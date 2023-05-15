;; sequence(s): A167487
;; terms: 8 10 13 17 22 28 35 43 52 62 73 85 98 112 127 143 160 178 197 217
;; small program: (2 * (2 + 2)) + loop(x + y, x, x)
;; fast program: ((2 * (2 + 2)) + (((x * x) + x) div 2)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* 2 (+ 2 2)) (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* 2 (+ 2 2)) (div (+ (* x x) x) 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)