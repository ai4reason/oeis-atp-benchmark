;; sequence(s): A158463
;; terms: ~1 11 47 107 191 299 431 587 767 971 1199 1451 1727 2027 2351 2699 3071 3467 3887 4331
;; small program: (loop((2 + y) * x, 2, x) * x) - 1
;; fast program: (2 * (2 * ((1 + 2) * (x * x)))) - 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ 2 y) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (* (v0 x) x) 1))))
(assert (forall ((x Int)) (= (fast x) (- (* 2 (* 2 (* (+ 1 2) (* x x)))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
