;; sequence(s): A256649
;; terms: 0 1 30 114 280 555 966 1540 2304 3285 4510 6006 7800 9919 12390 15240 18496 22185 26334 30970
;; small program: loop(x + y, x, 2 * ((2 * (x * x)) - 2)) * x
;; fast program: ((2 * ((2 * (x * x)) - 2)) + (((x * x) + x) div 2)) * x
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
(assert (forall ((x Int)) (= (h0 x) (* 2 (- (* 2 (* x x)) 2)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (* (+ (* 2 (- (* 2 (* x x)) 2)) (div (+ (* x x) x) 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
