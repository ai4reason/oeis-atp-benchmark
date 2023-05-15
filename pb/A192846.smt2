;; sequence(s): A192846
;; terms: 14 56 126 256 430 696 1022 1472 1998 2680 3454 4416 5486 6776 8190 9856 11662 13752 15998 18560
;; small program: ((1 + loop((x + y) + y, 2 + x, x mod 2)) * (1 + x)) * 2
;; fast program: ((1 + (((1 + (2 + x)) * (2 + x)) + (x mod 2))) * (1 + x)) * 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ x y) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (forall ((x Int)) (= (h0 x) (mod x 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (* (+ 1 (v0 x)) (+ 1 x)) 2))))
(assert (forall ((x Int)) (= (fast x) (* (* (+ 1 (+ (* (+ 1 (+ 2 x)) (+ 2 x)) (mod x 2))) (+ 1 x)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
