;; sequence(s): A270868
;; terms: 2 23 92 263 614 1247 2288 3887 6218 9479 13892 19703 27182 36623 48344 62687 80018 100727 125228 153959
;; small program: (((((loop(x + y, x, 2) * (2 + x)) + x) * 2) * x) + x) + 2
;; fast program: ((2 + ((2 + (2 + (2 + ((2 + x) * x)))) * x)) * (1 + x)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (* (* (+ (* (v0 x) (+ 2 x)) x) 2) x) x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 2 (* (+ 2 (+ 2 (+ 2 (* (+ 2 x) x)))) x)) (+ 1 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
