;; sequence(s): A2737
;; terms: 0 5 35 189 924 4290 19305 85085 369512 1587222 6760390 28601650 120349800 504131940 2103781365 8751023325 36300541200 150217371150 620309379690 2556724903590
;; small program: (loop(2 * ((x - (x div y)) + x), 2 + x, x) div 2) div 2
;; fast program: (loop(2 * (((x div y) + x) + x), 1 + x, x) div 2) div (2 + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* 2 (+ (- x (div x y)) x)))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (div (div (v0 x) 2) 2))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* 2 (+ (+ (div x y) x) x)))))
(assert (forall ((x Int)) (= (g1 x) (+ 1 x))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (div (div (v1 x) 2) (+ 2 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)