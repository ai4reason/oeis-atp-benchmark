;; sequence(s): A348339
;; terms: 3 6 9 12 19 28 39 52 67 84
;; small program: 1 + (2 + ((2 + loop(y, x - 2, 1)) * x))
;; fast program: (1 + ((if (x - 2) <= 0 then (1 + 2) else x) * x)) + 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) y)))
(assert (forall ((x Int)) (= (g0 x) (- x 2))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ 1 (+ 2 (* (+ 2 (v0 x)) x))))))
(assert (forall ((x Int)) (= (fast x) (+ (+ 1 (* (ite (<= (- x 2) 0) (+ 1 2) x) x)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)