;; sequence(s): A186783
;; terms: 0 1 2 6 10 15 21 28 36 45 55 66 78
;; small program: if (x - 2) <= 0 then x else loop(x + y, x, 0)
;; fast program: (((if (x - 2) <= 0 then 1 else x) * x) + x) div 2
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
(assert (forall ((x Int)) (= (small x) (ite (<= (- x 2) 0) x (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (div (+ (* (ite (<= (- x 2) 0) 1 x) x) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
