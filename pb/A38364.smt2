;; sequence(s): A38364
;; terms: 0 19 29 39 49 59 69 79 89 99
;; small program: (if x <= 0 then 0 else loop((x + x) + x, 2, 1 + x)) + x
;; fast program: ((1 + 2) * ((1 + 2) * ((if x <= 0 then 0 else 1) + x))) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ x x) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (ite (<= x 0) 0 (v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 2) (* (+ 1 2) (+ (ite (<= x 0) 0 1) x))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
