;; sequence(s): A162254
;; terms: 4 19 51 106 190 309 469 676 936 1255 1639 2094 2626 3241 3945 4744 5644 6651 7771 9010
;; small program: ((1 + (x + x)) * loop(x + y, 2 + x, 0)) + 1
;; fast program: ((1 + x) * ((2 * ((2 + x) * (2 + x))) + x)) div 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (* (+ 1 (+ x x)) (v0 x)) 1))))
(assert (forall ((x Int)) (= (fast x) (div (* (+ 1 x) (+ (* 2 (* (+ 2 x) (+ 2 x))) x)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
