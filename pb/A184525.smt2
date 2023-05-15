;; sequence(s): A184525
;; terms: 5 11 17 23 30 36 42 48 54 61 67 73 79 85 92 98 104 110 116 123
;; small program: loop(((((((y * y) div (2 + x)) + y) + y) + y) + y) + y, 1 + x, 0) + x
;; fast program: ((((((((((1 + ((2 * (2 * (2 + x))) + x)) div (((((2 + 2) + 2) * 2) * 2) + 2)) + 1) + x) + 2) + x) + x) + 2) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (+ (+ (+ (div (* y y) (+ 2 x)) y) y) y) y) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (+ (+ (+ (+ (div (+ 1 (+ (* 2 (* 2 (+ 2 x))) x)) (+ (* (* (+ (+ 2 2) 2) 2) 2) 2)) 1) x) 2) x) x) 2) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
