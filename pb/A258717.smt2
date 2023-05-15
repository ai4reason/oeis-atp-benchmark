;; sequence(s): A258717
;; terms: 0 3 16 27 48 67 96 123 160 195 240 283 336 387 448 507 576 643 720 795
;; small program: (2 * (((1 + 2) * (x div 2)) + (x * x))) + x
;; fast program: loop(x - (1 + 2), x mod 2, (2 * x) * (2 + x))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* 2 (+ (* (+ 1 2) (div x 2)) (* x x))) x))))
(assert (forall ((x Int)) (= (f0 x) (- x (+ 1 2)))))
(assert (forall ((x Int)) (= (g0 x) (mod x 2))))
(assert (forall ((x Int)) (= (h0 x) (* (* 2 x) (+ 2 x)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (v0 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
