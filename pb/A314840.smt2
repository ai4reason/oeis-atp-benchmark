;; sequence(s): A314840
;; terms: 1 5 9 14 18 23 28 32 37 41 46 51 55 60 64 69 74 78 83 87
;; small program: loop((((y - x) div (2 + 2)) + y) + y, x + x, 1) + x
;; fast program: ((((((2 - (x + x)) div (1 + (2 + 2))) + (if x <= 0 then 1 else x)) + x) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (div (- y x) (+ 2 2)) y) y))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (div (- 2 (+ x x)) (+ 1 (+ 2 2))) (ite (<= x 0) 1 x)) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
