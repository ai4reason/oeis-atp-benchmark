;; sequence(s): A258087
;; terms: 0 0 1 3 6 9 14 18 25 30 39 45 56 63 76 84 99 108 125 135
;; small program: loop(((if (y mod 2) <= 0 then 2 else y) + x) + y, x - 1, 0) div 2
;; fast program: ((((((x - 1) div 2) + x) * (x div 2)) - (if x <= 0 then 0 else 1)) + x) div 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (ite (<= (mod y 2) 0) 2 y) x) y))))
(assert (forall ((x Int)) (= (g0 x) (- x 1))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (div (+ (- (* (+ (div (- x 1) 2) x) (div x 2)) (ite (<= x 0) 0 1)) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
