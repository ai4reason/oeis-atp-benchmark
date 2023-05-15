;; sequence(s): A153786
;; terms: 0 6 42 108 204 330 486 672 888 1134 1410 1716 2052 2418 2814 3240 3696 4182 4698 5244
;; small program: loop((((x - y) + x) * y) + x, 2, x) * x
;; fast program: ((1 + (2 + 2)) * ((((x - 2) + x) + x) * x)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (+ (- x y) x) y) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 (+ 2 2)) (* (+ (+ (- x 2) x) x) x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
