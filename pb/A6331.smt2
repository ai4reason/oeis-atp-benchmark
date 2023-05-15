;; sequence(s): A6331
;; terms: 0 2 10 28 60 110 182 280 408 570 770 1012 1300 1638 2030 2480 2992 3570 4218 4940
;; small program: 2 * loop((y * y) + x, x, 0)
;; fast program: ((1 + (x + x)) * ((x * x) + x)) div (1 + 2)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* y y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* 2 (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (div (* (+ 1 (+ x x)) (+ (* x x) x)) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
