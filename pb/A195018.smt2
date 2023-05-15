;; sequence(s): A195018
;; terms: 0 7 34 81 148 235 342 469 616 783 970 1177 1404 1651 1918 2205 2512 2839 3186 3553
;; small program: (loop((1 + 2) * (y - x), 2, x) + x) * x
;; fast program: (2 * ((((2 * (x + x)) - 2) + x) * x)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ 1 2) (- y x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (* (+ (- (* 2 (+ x x)) 2) x) x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
