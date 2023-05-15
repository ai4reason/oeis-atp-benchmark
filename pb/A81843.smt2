;; sequence(s): A81843
;; terms: 0 4 8 13 17 21 25 30 34 38 42 46 51 55 59 63 68 72 76 80
;; small program: loop(((((y - 2) * y) + x) div x) + y, x + x, x) + x
;; fast program: (((((((((x - ((0 - x) div (2 + 2))) div (1 + 2)) + x) div 2) + 1) div (1 + 2)) + x) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (+ (* (- y 2) y) x) x) y))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (div (+ (div (+ (div (- x (div (- 0 x) (+ 2 2))) (+ 1 2)) x) 2) 1) (+ 1 2)) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
