;; sequence(s): A33954
;; terms: 0 7 22 45 76 115 162 217 280 351 430 517 612 715 826 945 1072 1207 1350 1501
;; small program: loop(1 + (x + x), 2, x) * x
;; fast program: (2 * ((2 * (x * x)) + x)) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ x x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (+ (* 2 (* x x)) x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
