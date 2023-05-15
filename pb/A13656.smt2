;; sequence(s): A13656
;; terms: 0 7 32 75 136 215 312 427 560 711 880 1067 1272 1495 1736 1995 2272 2567 2880 3211
;; small program: (loop((x + x) + x, 2, x) - 2) * x
;; fast program: (((2 * (2 * (x + x))) - 2) + x) * x
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
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (- (v0 x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (* (+ (- (* 2 (* 2 (+ x x))) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
