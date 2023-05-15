;; sequence(s): A315546
;; terms: 1 6 11 17 23 29 35 41 46 52 58 63 69 75 81 87 93 98 104 110
;; small program: (((((((loop(((x + y) div (2 + 2)) + y, x, 1) + x) * 2) div (1 + 2)) + 1) + x) + x) + x) + x
;; fast program: (((((((((((1 - x) div (1 + 2)) + (if x <= 0 then 1 else x)) * 2) + 1) + x) div (1 + 2)) + x) + x) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (+ x y) (+ 2 2)) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (+ (div (* (+ (v0 x) x) 2) (+ 1 2)) 1) x) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (div (+ (+ (* (+ (div (- 1 x) (+ 1 2)) (ite (<= x 0) 1 x)) 2) 1) x) (+ 1 2)) x) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
