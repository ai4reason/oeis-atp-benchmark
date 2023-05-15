;; sequence(s): A161935
;; terms: 0 1 28 81 160 265 396 553 736 945 1180 1441 1728 2041 2380 2745 3136 3553 3996 4465
;; small program: (loop((2 + y) * x, 2, x - 1) + x) * x
;; fast program: ((2 * (2 * ((1 + 2) * (x - 1)))) + x) * x
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
(assert (forall ((x Int)) (= (h0 x) (- x 1))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (* (+ (* 2 (* 2 (* (+ 1 2) (- x 1)))) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
