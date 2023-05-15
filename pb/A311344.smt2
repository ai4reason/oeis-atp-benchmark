;; sequence(s): A311344
;; terms: 1 4 8 12 16 22 26 30 34 38 42 46 50 54 60 64 68 72 76 80
;; small program: (((loop((1 + x) div (1 + 2), 2, x) + x) * 2) + (if x <= 0 then 1 else x)) + x
;; fast program: (((((2 + (2 + x)) div (1 + (2 * (2 + 2)))) + x) * 2) + (if x <= 0 then 1 else x)) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (div (+ 1 x) (+ 1 2)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (* (+ (v0 x) x) 2) (ite (<= x 0) 1 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ (div (+ 2 (+ 2 x)) (+ 1 (* 2 (+ 2 2)))) x) 2) (ite (<= x 0) 1 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
