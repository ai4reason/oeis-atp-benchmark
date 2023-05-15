;; sequence(s): A63524-A178333
;; terms: 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
;; small program: 1 div (if x <= 0 then 2 else x)
;; fast program: loop(1 - x, 2 - x, 0)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div 1 (ite (<= x 0) 2 x)))))
(assert (forall ((x Int)) (= (f0 x) (- 1 x))))
(assert (forall ((x Int)) (= (g0 x) (- 2 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (v0 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
