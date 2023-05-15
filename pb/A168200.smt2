;; sequence(s): A168200
;; terms: 4 3 7 6 10 9 13 12 16 15 19 18 22 21 25 24 28 27 31 30
;; small program: 2 + (loop(1 + (y - x), x, 2) + x)
;; fast program: 2 + (2 + (((1 + (2 + 2)) * (x div 2)) - x))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (- y x)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ 2 (+ (v0 x) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (+ 2 (- (* (+ 1 (+ 2 2)) (div x 2)) x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
