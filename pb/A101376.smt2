;; sequence(s): A101376
;; terms: 0 1 14 99 424 1325 3366 7399 14624 26649 45550 73931 114984 172549 251174 356175 493696 670769 895374 1176499
;; small program: ((x - 1) * loop(x + y, x * x, x)) + x
;; fast program: (((1 + (x * x)) * (((x * x) - x) div 2)) + x) * x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) (* x x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (- x 1) (v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (* (+ (* (+ 1 (* x x)) (div (- (* x x) x) 2)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
