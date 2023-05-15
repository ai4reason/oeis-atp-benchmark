;; sequence(s): A164004
;; terms: 0 5 10 18 28 40 54 70 88 108 130 154 180 208 238 270 304 340 378 418
;; small program: ((2 + (if (2 - x) <= 0 then x else 2)) * x) + x
;; fast program: ((2 + loop(2, 2 - x, x)) * x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* (+ 2 (ite (<= (- 2 x) 0) x 2)) x) x))))
(assert (= f0 2))
(assert (forall ((x Int)) (= (g0 x) (- 2 x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 2 (v0 x)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
