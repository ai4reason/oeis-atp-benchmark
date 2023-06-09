;; sequence(s): A153644
;; terms: 42 82 130 186 250 322 402 490 586 690 802 922 1050 1186 1330 1482 1642 1810 1986 2170
;; small program: (2 * (2 * (2 * loop(1 + (x + y), 2 + x, x)))) + 2
;; fast program: 2 + (2 * (2 * (2 + ((1 + x) * ((2 * (2 + 2)) + x)))))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (+ x y)))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* 2 (* 2 (* 2 (v0 x)))) 2))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (* 2 (* 2 (+ 2 (* (+ 1 x) (+ (* 2 (+ 2 2)) x)))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
