;; sequence(s): A47446
;; terms: 0 1 3 5 6 8 9 11 13 14 16 17 19 21 22 24 25 27 29 30
;; small program: loop((((y - x) div 2) + y) div 2, x, 0) + x
;; fast program: (((1 - (x + x)) div (1 + (2 + 2))) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (+ (div (- y x) 2) y) 2))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (- 1 (+ x x)) (+ 1 (+ 2 2))) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
