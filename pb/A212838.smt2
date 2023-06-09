;; sequence(s): A212838
;; terms: 2 99 634 2309 6306 14407 29114 53769 92674 151211 235962 354829 517154 733839 1017466 1382417 1844994 2423539 3138554 4012821
;; small program: ((loop2(((x + y) + y) * x, x, 2, 1 + x, 1) * x) + 2) + x
;; fast program: (((((((2 + x) * x) + x) * (1 + (2 + (2 + x)))) * (1 + x)) * (1 + x)) + 2) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun i0 (Int) Int)
(declare-fun j0 () Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ (+ x y) y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int)) (= (i0 x) (+ 1 x))))
(assert (= j0 1))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 (i0 x) j0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (* (w0 x) x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (* (* (+ (* (+ 2 x) x) x) (+ 1 (+ 2 (+ 2 x)))) (+ 1 x)) (+ 1 x)) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
