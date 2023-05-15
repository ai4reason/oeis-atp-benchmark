;; sequence(s): A168332
;; terms: 6 6 13 13 20 20 27 27 34 34 41 41 48 48 55 55 62 62 69 69
;; small program: ((2 * (2 + x)) + loop(y - x, x, 2)) + x
;; fast program: ((1 + (2 + (2 + 2))) * (1 + (x div 2))) - 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (* 2 (+ 2 x)) (v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ 1 (+ 2 (+ 2 2))) (+ 1 (div x 2))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
