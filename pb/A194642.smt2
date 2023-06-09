;; sequence(s): A194642
;; terms: 1 7 8 4 5 1 2 8 9 5 6 2 3 9 0 6 7 3 4 0
;; small program: loop((((2 * (2 + x)) + x) mod (2 + (2 * (2 + 2)))) + y, x, 1) - x
;; fast program: (1 + (((1 + (2 + 2)) * ((x div 2) + x)) + x)) mod (((2 + 2) * 2) + 2)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (mod (+ (* 2 (+ 2 x)) x) (+ 2 (* 2 (+ 2 2)))) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (mod (+ 1 (+ (* (+ 1 (+ 2 2)) (+ (div x 2) x)) x)) (+ (* (+ 2 2) 2) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
