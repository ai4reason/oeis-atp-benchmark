;; sequence(s): A186227
;; terms: 1 3 4 6 7 9 10 12 13 14 16 17 19 20 22 23 25 26 28 29
;; small program: ((loop(1 + (y - (x div (2 + loop(x * x, 2, 2)))), x + x, 0) + x) div 2) + 1
;; fast program: ((((1 - ((1 + (x + x)) div ((((2 * (2 + 2)) + 1) * 2) + 1))) + x) div 2) + 1) + x
(set-logic UFNIA)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (- y (div x (+ 2 v1)))))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (div (+ (v0 x) x) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (- 1 (div (+ 1 (+ x x)) (+ (* (+ (* 2 (+ 2 2)) 1) 2) 1))) x) 2) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)