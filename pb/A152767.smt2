;; sequence(s): A152767
;; terms: 0 3 30 81 156 255 378 525 696 891 1110 1353 1620 1911 2226 2565 2928 3315 3726 4161
;; small program: (loop(((2 + y) * x) - 2, 2, x) * x) + x
;; fast program: (2 * (2 * ((((x - 2) + x) + x) * x))) - x
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
(assert (forall ((x Int)) (= (small x) (+ (* (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (- (* 2 (* 2 (* (+ (+ (- x 2) x) x) x))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
