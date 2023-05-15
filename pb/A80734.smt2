;; sequence(s): A80734
;; terms: 1 4 7 10 12 15 18 21 24 27 30 32 35 38 41 44 47 50 52 55
;; small program: (loop(y - (((x div 2) - 2) div (1 + 2)), x, 1) + x) + x
;; fast program: ((x - ((x - (2 + 2)) div (((1 + 2) + 2) + 2))) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y (div (- (div x 2) 2) (+ 1 2))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (- x (div (- x (+ 2 2)) (+ (+ (+ 1 2) 2) 2))) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
