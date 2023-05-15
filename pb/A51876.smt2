;; sequence(s): A51876
;; terms: 0 1 24 69 136 225 336 469 624 801 1000 1221 1464 1729 2016 2325 2656 3009 3384 3781
;; small program: (loop(((2 + y) * x) - 2, 2, x) - x) * x
;; fast program: ((2 * ((1 + (2 + 2)) * (x - 1))) + x) * x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- (* (+ 2 y) x) 2))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (- (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (* (+ (* 2 (* (+ 1 (+ 2 2)) (- x 1))) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
