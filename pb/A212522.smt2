;; sequence(s): A212522
;; terms: 0 0 0 0 4 12 27 60 112 180 300 450 648 924 1274 1680 2240 2880 3645 4590
;; small program: (loop((x - 2) + y, x, 1) div (1 + 2)) * ((x * x) div (2 + 2))
;; fast program: (((1 - x) * (2 - x)) div (2 + (2 + 2))) * ((x * x) div (2 + 2))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- x 2) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (div (v0 x) (+ 1 2)) (div (* x x) (+ 2 2))))))
(assert (forall ((x Int)) (= (fast x) (* (div (* (- 1 x) (- 2 x)) (+ 2 (+ 2 2))) (div (* x x) (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
