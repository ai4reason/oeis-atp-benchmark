;; sequence(s): A132773
;; terms: 0 32 66 102 140 180 222 266 312 360 410 462 516 572 630 690 752 816 882 950
;; small program: (loop((y * y) + x, 2 + 2, x) * x) + x
;; fast program: (((2 * (2 * (2 * (2 + 2)))) + x) * x) - x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* y y) x))))
(assert (= g0 (+ 2 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ (* 2 (* 2 (* 2 (+ 2 2)))) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
