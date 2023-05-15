;; sequence(s): A186326
;; terms: 2 3 5 6 8 9 11 12 14 16 17 19 20 22 24 25 27 28 30 31
;; small program: (((((loop(x div (1 + 2), 2, x) + (x div 2)) div (2 + 2)) + x) div 2) + 2) + x
;; fast program: (((((((if x <= 0 then 2 else x) - 2) + x) div ((((2 + 2) + 2) * 2) + 1)) + x) div 2) + 2) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (div x (+ 1 2)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (div (+ (div (+ (v0 x) (div x 2)) (+ 2 2)) x) 2) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (div (+ (- (ite (<= x 0) 2 x) 2) x) (+ (* (+ (+ 2 2) 2) 2) 1)) x) 2) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
