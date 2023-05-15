;; sequence(s): A25719
;; terms: 1 2 4 7 11 15 20 26 33 41 49 58 68 79 90 102 115 129 144 159
;; small program: ((loop((y div (1 + 2)) + x, x, x * x) div (1 + 2)) + 1) + x
;; fast program: ((((x * x) + (((x * x) - x) div (2 + (2 + 2)))) div (1 + 2)) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div y (+ 1 2)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) (* x x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (div (v0 x) (+ 1 2)) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (* x x) (div (- (* x x) x) (+ 2 (+ 2 2)))) (+ 1 2)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
