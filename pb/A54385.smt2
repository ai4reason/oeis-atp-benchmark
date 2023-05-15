;; sequence(s): A54385
;; terms: 1 3 4 6 7 9 11 12 14 15 17 18 20 22 23 25 26 28 30 31
;; small program: loop((((((((x div 2) div 2) div 2) + x) div (2 + 2)) + y) mod 2) + x, x, 1) + x
;; fast program: ((((((2 - (x div (1 + (2 + (2 * (2 + 2)))))) + x) + x) + x) div (1 + (2 + 2))) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (mod (+ (div (+ (div (div (div x 2) 2) 2) x) (+ 2 2)) y) 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (+ (+ (- 2 (div x (+ 1 (+ 2 (* 2 (+ 2 2)))))) x) x) x) (+ 1 (+ 2 2))) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
