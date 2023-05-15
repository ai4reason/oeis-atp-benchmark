;; sequence(s): A21003
;; terms: 0 1 17 123 514 1565 3891 8407 16388 29529 50005 80531 124422 185653 268919 379695 524296 709937 944793 1238059
;; small program: ((loop(x * x, 2, x) * x) + x) div 2
;; fast program: (((((x * x) * x) * x) * x) + x) div 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (div (+ (* (v0 x) x) x) 2))))
(assert (forall ((x Int)) (= (fast x) (div (+ (* (* (* (* x x) x) x) x) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
