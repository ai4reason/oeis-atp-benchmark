;; sequence(s): A315207
;; terms: 1 6 10 14 20 24 30 34 38 44 50 54 58 64 68 74 78 82 88 94
;; small program: (((loop((1 + (x + x)) div (1 + 2), 2, x) + x) * 2) + (if x <= 0 then 1 else x)) + x
;; fast program: ((((((((1 + (x + x)) div (1 + 2)) * 2) + 1) div (1 + 2)) + x) * 2) + (if x <= 0 then 1 else x)) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (div (+ 1 (+ x x)) (+ 1 2)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (* (+ (v0 x) x) 2) (ite (<= x 0) 1 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ (div (+ (* (div (+ 1 (+ x x)) (+ 1 2)) 2) 1) (+ 1 2)) x) 2) (ite (<= x 0) 1 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
