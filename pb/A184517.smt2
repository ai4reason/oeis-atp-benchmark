;; sequence(s): A184517
;; terms: 3 8 14 19 24 29 35 40 45 50 55 61 66 71 76 82 87 92 97 103
;; small program: loop(loop(((y * y) div (2 + x)) + y, 1 + x, 0), 2, x + x)
;; fast program: ((((((((1 + (((2 - (x div (1 + (2 * (2 + 2))))) div 2) + x)) div (2 + 2)) + 1) + 2) + x) + x) + x) + x) + x
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (div (* y y) (+ 2 x)) y))))
(assert (forall ((x Int)) (= (g1 x) (+ 1 x))))
(assert (= h1 0))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (f0 x) (v1 x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (+ x x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (+ (+ (div (+ 1 (+ (div (- 2 (div x (+ 1 (* 2 (+ 2 2))))) 2) x)) (+ 2 2)) 1) 2) x) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
