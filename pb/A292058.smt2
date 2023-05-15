;; sequence(s): A292058
;; terms: 0 10 54 168 400 810 1470 2464 3888 5850 8470 11880 16224 21658 28350 36480 46240 57834 71478 87400
;; small program: (1 + x) * (loop(2 + (x + y), x, 2) * x)
;; fast program: (1 + x) * ((2 + (2 + x)) * (((x * x) + x) div 2))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ x y)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (+ 1 x) (* (v0 x) x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 x) (* (+ 2 (+ 2 x)) (div (+ (* x x) x) 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)