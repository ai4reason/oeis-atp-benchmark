;; sequence(s): A329974
;; terms: 1 2 3 5 6 7 9 10 11 13 14 15 17 18 19 21 22 23 25 26
;; small program: 1 + (((x - (x div loop(2 + (x * x), 2, 2))) div (1 + 2)) + x)
;; fast program: 1 + (((x - (x div (2 + loop(x * x, 1, 2 + (2 + 2))))) div (1 + 2)) + x)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 2 (* x x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (div (- x (div x v0)) (+ 1 2)) x)))))
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 1))
(assert (= h1 (+ 2 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (div (- x (div x (+ 2 v1))) (+ 1 2)) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
