;; sequence(s): A47291
;; terms: 0 1 4 6 7 8 11 13 14 15 18 20 21 22 25 27 28 29 32 34
;; small program: loop(y - x, (x div 2) + x, x mod 2) + x
;; fast program: ((2 * ((2 + x) div (2 + 2))) + ((1 + x) div (2 + 2))) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y x))))
(assert (forall ((x Int)) (= (g0 x) (+ (div x 2) x))))
(assert (forall ((x Int)) (= (h0 x) (mod x 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* 2 (div (+ 2 x) (+ 2 2))) (div (+ 1 x) (+ 2 2))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
