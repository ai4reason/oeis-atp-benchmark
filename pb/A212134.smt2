;; sequence(s): A212134
;; terms: 0 1 12 57 172 405 816 1477 2472 3897 5860 8481 11892 16237 21672 28365 36496 46257 57852 71497
;; small program: (((x * x) - x) * loop(x + y, x, x)) + x
;; fast program: ((1 + (2 + x)) * ((((x * x) - x) div 2) * x)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (- (* x x) x) (v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 (+ 2 x)) (* (div (- (* x x) x) 2) x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
