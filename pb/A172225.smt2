;; sequence(s): A172225
;; terms: 0 2 24 96 260 570 1092 1904 3096 4770 7040 10032 13884 18746 24780 32160 41072 51714 64296 79040
;; small program: loop((x - 2) + y, (2 + x) * x, x) + x
;; fast program: (((((2 + (2 + x)) * (x * x)) + x) div 2) * x) - x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- x 2) y))))
(assert (forall ((x Int)) (= (g0 x) (* (+ 2 x) x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (- (* (div (+ (* (+ 2 (+ 2 x)) (* x x)) x) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
