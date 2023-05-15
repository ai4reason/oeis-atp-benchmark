;; sequence(s): A59545
;; terms: 2 4 6 9 11 13 16 18 20 23 25 27 29 32 34 36 39 41 43 46
;; small program: loop(((((y - 2) * y) div (x + y)) + y) + y, 2 + x, 0) - 2
;; fast program: ((((x - ((1 + x) div (1 + (2 + (2 * (2 + 2)))))) div (1 + 2)) + x) + 2) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (div (* (- y 2) y) (+ x y)) y) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (- x (div (+ 1 x) (+ 1 (+ 2 (* 2 (+ 2 2)))))) (+ 1 2)) x) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
