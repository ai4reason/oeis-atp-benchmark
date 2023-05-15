;; sequence(s): A244633
;; terms: 0 26 104 234 416 650 936 1274 1664 2106 2600 3146 3744 4394 5096 5850 6656 7514 8424 9386
;; small program: (loop(1 + (x * x), 2, 2) * x) * x
;; fast program: 2 * ((1 + (2 * (2 + (2 + 2)))) * (x * x))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (* x x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (* (* v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (* 2 (* (+ 1 (* 2 (+ 2 (+ 2 2)))) (* x x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
