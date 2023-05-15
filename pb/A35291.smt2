;; sequence(s): A35291
;; terms: 0 0 16 88 280 680 1400 2576 4368 6960 10560 15400 21736 29848 40040 52640 68000 86496 108528 134520
;; small program: 2 * (2 * loop((((y - 1) * y) * y) + x, x, 0))
;; fast program: (2 + ((x + x) + x)) * ((((x * x) * x) - x) div (1 + 2))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (* (- y 1) y) y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* 2 (* 2 (v0 x))))))
(assert (forall ((x Int)) (= (fast x) (* (+ 2 (+ (+ x x) x)) (div (- (* (* x x) x) x) (+ 1 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)