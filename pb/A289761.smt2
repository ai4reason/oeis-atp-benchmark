;; sequence(s): A289761
;; terms: 3 6 9 12 15 22 29 36 43 50 57 68 79 90 101 112 123 138 153 168
;; small program: (((1 + loop((2 * ((1 + y) div (2 + (2 + 2)))) + x, x, x)) * 2) + x) + 1
;; fast program: (((((((1 + ((x - 2) * x)) div (((2 + 2) + 2) * 2)) * 2) + x) * 2) + 1) + 2) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* 2 (div (+ 1 y) (+ 2 (+ 2 2)))) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (* (+ 1 (v0 x)) 2) x) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (* (+ (* (div (+ 1 (* (- x 2) x)) (* (+ (+ 2 2) 2) 2)) 2) x) 2) 1) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
