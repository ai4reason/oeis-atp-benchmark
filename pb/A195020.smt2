;; sequence(s): A195020
;; terms: 0 3 7 13 21 30 42 54 70 85 105 123 147 168 196 220 252 279 315 345
;; small program: loop(2 + (x - y), x - (x div 2), x * x) + x
;; fast program: ((((1 + (2 + 2)) * (x - (x div 2))) + x) * (1 + (x div 2))) div 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (- x y)))))
(assert (forall ((x Int)) (= (g0 x) (- x (div x 2)))))
(assert (forall ((x Int)) (= (h0 x) (* x x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (div (* (+ (* (+ 1 (+ 2 2)) (- x (div x 2))) x) (+ 1 (div x 2))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
