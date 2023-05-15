;; sequence(s): A180355
;; terms: 0 6 42 258 1044 3150 7806 16842 32808 59094 100050 161106 248892 371358 537894 759450 1048656 1419942 1889658 2476194
;; small program: ((2 + (2 + loop(x * x, 2, x))) * x) + x
;; fast program: ((2 + (2 + (((x * x) * x) * x))) * x) + x
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
(assert (forall ((x Int)) (= (small x) (+ (* (+ 2 (+ 2 (v0 x))) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 2 (+ 2 (* (* (* x x) x) x))) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
