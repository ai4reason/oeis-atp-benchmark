;; sequence(s): A110326
;; terms: 1 ~1 ~3 ~2 ~11 ~3 ~23 ~4 ~39 ~5 ~59 ~6 ~83 ~7 ~111 ~8 ~143 ~9 ~179 ~10
;; small program: ((if (x mod 2) <= 0 then (2 - (x * x)) else x) div 2) - x
;; fast program: (loop(2 - (x * x), 1 - (x mod 2), x) div 2) - x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- (div (ite (<= (mod x 2) 0) (- 2 (* x x)) x) 2) x))))
(assert (forall ((x Int)) (= (f0 x) (- 2 (* x x)))))
(assert (forall ((x Int)) (= (g0 x) (- 1 (mod x 2)))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (- (div (v0 x) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
