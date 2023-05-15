;; sequence(s): A228295
;; terms: 0 2 4 6 8 10 12 14 15 17 19 21 23 25 27 28 30 32 34 36
;; small program: loop(y - (((((x div 2) div 2) div 2) + x) div (1 + (2 + (2 + 2)))), x, 0) + x
;; fast program: (((((((x div (2 + (2 + 2))) + x) + x) div (2 + 1)) + x) div 2) + (if x <= 0 then 0 else 1)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y (div (+ (div (div (div x 2) 2) 2) x) (+ 1 (+ 2 (+ 2 2))))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (div (+ (+ (div x (+ 2 (+ 2 2))) x) x) (+ 2 1)) x) 2) (ite (<= x 0) 0 1)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
