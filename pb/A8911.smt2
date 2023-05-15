;; sequence(s): A8911
;; terms: 0 0 2 12 40 100 210 392 672 1080 1650 2420 3432 4732 6370 8400 10880 13872 17442 21660
;; small program: loop((y div (1 + 2)) + x, x * x, 0)
;; fast program: ((((x * x) * x) - x) div (2 + (2 + 2))) * x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div y (+ 1 2)) x))))
(assert (forall ((x Int)) (= (g0 x) (* x x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (* (div (- (* (* x x) x) x) (+ 2 (+ 2 2))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
