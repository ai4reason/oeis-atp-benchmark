;; sequence(s): A229093
;; terms: 0 0 1 2 4 6 9 12 17 22 27 34 41 48 57 66 75 86 97 108
;; small program: (1 + loop(((y * y) div (1 + 2)) + (x div 2), x, x)) div 2
;; fast program: (((((2 + x) * x) - (if ((x - 2) - 2) <= 0 then 1 else x)) div (1 + 2)) + 1) - x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* y y) (+ 1 2)) (div x 2)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (div (+ 1 (v0 x)) 2))))
(assert (forall ((x Int)) (= (fast x) (- (+ (div (- (* (+ 2 x) x) (ite (<= (- (- x 2) 2) 0) 1 x)) (+ 1 2)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
