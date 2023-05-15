;; sequence(s): A5476
;; terms: 0 2 9 21 38 60 87 119 156 198 245 297 354 416 483 555 632 714 801 893
;; small program: (2 * (x * x)) - loop(x - y, x, x)
;; fast program: (2 * (x * x)) + (((x * x) - x) div 2)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (* 2 (* x x)) (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (* x x)) (div (- (* x x) x) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)