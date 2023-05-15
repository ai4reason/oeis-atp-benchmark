;; sequence(s): A61167
;; terms: 0 0 30 240 1020 3120 7770 16800 32760 59040 99990 161040 248820 371280 537810 759360 1048560 1419840 1889550 2476080
;; small program: (loop(x * x, 2, x) * x) - x
;; fast program: ((((x * x) * x) * x) * x) - x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (* (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (- (* (* (* (* x x) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
