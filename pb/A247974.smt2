;; sequence(s): A247974
;; terms: 1 6 11 15 20 25 29 34 39 43 48 52 57 62 66 71 76 80 85 90
;; small program: ((((((((if loop(x div (1 + 2), 2, x) <= 0 then 2 else 1) + x) + x) div (1 + 2)) + 1) + x) + x) + x) + x
;; fast program: ((((((((((if (x - (2 * (2 + 2))) <= 0 then 1 else 0) + x) div (1 + 2)) + 1) + x) div 2) + 1) + x) + x) + x) + x
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
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (+ (div (+ (+ (ite (<= (v0 x) 0) 2 1) x) x) (+ 1 2)) 1) x) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (div (+ (+ (div (+ (ite (<= (- x (* 2 (+ 2 2))) 0) 1 0) x) (+ 1 2)) 1) x) 2) 1) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
