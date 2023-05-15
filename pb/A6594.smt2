;; sequence(s): A6594
;; terms: 1 2 4 5 6 8 9 10 12 13 15 16 17 19 20 21 23 24 25 27
;; small program: (loop(((x - (y mod 2)) * y) + x, x, 2) - 1) div loop(x * y, x, 1)
;; fast program: ((((2 * ((1 + 2) * (1 + x))) + x) div (1 + (2 + (2 * (2 * (2 + 2)))))) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (- x (mod y 2)) y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* x y))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (small x) (div (- (v0 x) 1) (v1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (* 2 (* (+ 1 2) (+ 1 x))) x) (+ 1 (+ 2 (* 2 (* 2 (+ 2 2)))))) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
