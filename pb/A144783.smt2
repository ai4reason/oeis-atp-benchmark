;; sequence(s): A144783
;; terms: 10 91 8191 67084291 4500302031888391 20252718378218776104731448680491 410172601707440572557971589875869064610540321970215293555320591 168241563191450680898537024308131628447885486994777537422995633998657738457104605412468520116391629012196009150161991233268691
;; small program: 1 + loop((x * x) + x, x, 1 + (2 * (2 + 2)))
;; fast program: 1 + loop((1 + x) * x, x, 1 + (2 * (2 + 2)))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (* x x) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 (+ 1 (* 2 (+ 2 2)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ 1 (v0 x)))))
(assert (forall ((x Int)) (= (f1 x) (* (+ 1 x) x))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 (+ 1 (* 2 (+ 2 2)))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (v1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)