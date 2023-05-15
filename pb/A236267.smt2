;; sequence(s): A236267
;; terms: 1 12 39 82 141 216 307 414 537 676 831 1002 1189 1392 1611 1846 2097 2364 2647 2946
;; small program: 1 + loop(x + y, 2 * (x + x), x)
;; fast program: 1 + ((2 * ((2 * (2 * (x * x))) + x)) + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) (* 2 (+ x x)))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 1 (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (* 2 (+ (* 2 (* 2 (* x x))) x)) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)