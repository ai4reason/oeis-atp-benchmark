;; sequence(s): A208971
;; terms: 1 3 4 8 11 18 24 35 45 61 76 98 119 148 176 213 249 295 340 396
;; small program: (loop(loop(x + y, y div 2, x), 1 + x, 1) - (x div 2)) + x
;; fast program: ((((((x - ((0 - (x * x)) div (2 + 2))) * (2 + x)) div (1 + 2)) + 1) + x) div 2) + 1
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ x y))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (div y 2))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) (h1 x)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (v1 x y))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (- (v0 x) (div x 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (+ (div (* (- x (div (- 0 (* x x)) (+ 2 2))) (+ 2 x)) (+ 1 2)) 1) x) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)