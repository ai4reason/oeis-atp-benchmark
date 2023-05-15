;; sequence(s): A153808
;; terms: 0 8 64 168 320 520 768 1064 1408 1800 2240 2728 3264 3848 4480 5160 5888 6664 7488 8360
;; small program: loop((2 - x) * y, 2 + 2, x) * x
;; fast program: 2 * (2 * (2 * ((((x - 2) + x) + x) * x)))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (- 2 x) y))))
(assert (= g0 (+ 2 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (* 2 (* 2 (* 2 (* (+ (+ (- x 2) x) x) x)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)