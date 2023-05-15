;; sequence(s): A179865
;; terms: 1 1 3 6 10 15 21 28 36 45 55 66 78 91 105 120 136 153 171 190
;; small program: if x <= 0 then 1 else loop(x + y, x, 0)
;; fast program: ((x * x) + (if x <= 0 then 2 else x)) div 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (ite (<= x 0) 1 (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (div (+ (* x x) (ite (<= x 0) 2 x)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)