;; sequence(s): A242709
;; terms: 0 2 12 33 85 165 315 518 846 1260 1870 2607 3627 4823 6405 8220 10540 13158 16416 20045
;; small program: loop((((1 + (y div 2)) * (y * y)) + x) + y, x, 0)
;; fast program: ((((((1 + (((x * x) div (2 + 2)) + x)) * (if x <= 0 then 1 else 2)) - x) + 1) + (x div 2)) * (((x * x) + x) div 2)) div 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (* (+ 1 (div y 2)) (* y y)) x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (div (* (+ (+ (- (* (+ 1 (+ (div (* x x) (+ 2 2)) x)) (ite (<= x 0) 1 2)) x) 1) (div x 2)) (div (+ (* x x) x) 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
