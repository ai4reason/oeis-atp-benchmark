;; sequence(s): A20913
;; terms: 1 1 1 1 2 2 2 2 3 3 3 4 4 4 4 5 5 5 6 6
;; small program: (((loop(y, x div (1 + (2 + 2)), 1) - 1) + x) div (2 + 2)) + 1
;; fast program: (((1 + 2) * (x * x)) div (2 * ((2 * (2 + (x + x))) + x))) + 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) y)))
(assert (forall ((x Int)) (= (g0 x) (div x (+ 1 (+ 2 2))))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (div (+ (- (v0 x) 1) x) (+ 2 2)) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (div (* (+ 1 2) (* x x)) (* 2 (+ (* 2 (+ 2 (+ x x))) x))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
