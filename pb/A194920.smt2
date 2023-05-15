;; sequence(s): A194920
;; terms: 1 1 1 2 2 2 3 3 3 3 4 4 4 5 5 5 5 6 6 6
;; small program: loop(((2 * (y * y)) div (x * x)) + x, x, 1 + x) - x
;; fast program: ((2 * (2 * ((1 + 2) * (1 + x)))) div (1 + (2 * (2 * (2 + (2 * (2 + 2))))))) + 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* 2 (* y y)) (* x x)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (* 2 (* 2 (* (+ 1 2) (+ 1 x)))) (+ 1 (* 2 (* 2 (+ 2 (* 2 (+ 2 2))))))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
