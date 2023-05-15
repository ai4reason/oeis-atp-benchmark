;; sequence(s): A163833
;; terms: 0 13 59 156 322 575 933 1414 2036 2817 3775 4928 6294 7891 9737 11850 14248 16949 19971 23332
;; small program: (loop(x + y, x, (2 + x) * (x * x)) * (1 + 2)) + x
;; fast program: (((1 + 2) * ((1 + (x + x)) * ((2 + x) * x))) - x) div 2
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
(assert (forall ((x Int)) (= (h0 x) (* (+ 2 x) (* x x)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (v0 x) (+ 1 2)) x))))
(assert (forall ((x Int)) (= (fast x) (div (- (* (+ 1 2) (* (+ 1 (+ x x)) (* (+ 2 x) x))) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
