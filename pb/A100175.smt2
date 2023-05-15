;; sequence(s): A100175
;; terms: 1 8 30 76 155 276 448 680 981 1360 1826 2388 3055 3836 4740 5776 6953 8280 9766 11420
;; small program: (1 + x) * loop(((x + y) + y) + y, x, 1)
;; fast program: (1 + ((1 + 2) * (((x * x) + x) div 2))) * (1 + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (+ x y) y) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (+ 1 x) (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (* (+ 1 2) (div (+ (* x x) x) 2))) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
