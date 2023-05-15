;; sequence(s): A7586
;; terms: 0 1 12 42 100 195 336 532 792 1125 1540 2046 2652 3367 4200 5160 6256 7497 8892 10450
;; small program: (loop(x + y, x, x * x) * x) - x
;; fast program: (((x * x) + (((x * x) + x) div 2)) * x) - x
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
(assert (forall ((x Int)) (= (h0 x) (* x x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (* (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ (* x x) (div (+ (* x x) x) 2)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
