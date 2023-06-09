;; sequence(s): A128091
;; terms: 1 8 45 160 425 936 1813 3200 5265 8200 12221 17568 24505 33320 44325 57856 74273 93960 117325 144800
;; small program: 1 + (loop((x * x) + x, 2, x) + x)
;; fast program: (1 + ((2 + x) * x)) * (1 + (x * x))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (* x x) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (v0 x) x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (* (+ 2 x) x)) (+ 1 (* x x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
