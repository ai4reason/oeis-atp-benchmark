;; sequence(s): A211538
;; terms: 0 0 0 1 3 5 9 12 18 22 30 35 45 51 63 70 84 92 108 117
;; small program: (0 - loop(x - (if x <= 0 then y else 2), x, x)) - x
;; fast program: (((((x - 1) div 2) - 2) + x) * (x div 2)) div 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- x (ite (<= x 0) y 2)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (- 0 (v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (div (* (+ (- (div (- x 1) 2) 2) x) (div x 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
