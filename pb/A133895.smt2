;; sequence(s): A133895
;; terms: 20 21 22 23 24 45 46 47 48 49 70 71 72 73 74 95 96 97 98 99
;; small program: ((1 + (x div (1 + (2 + 2)))) * loop(2 * (2 + x), 2, 2)) + x
;; fast program: (2 * (2 * (((1 + (2 + 2)) - (x mod (1 + (2 + 2)))) + x))) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* 2 (+ 2 x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (* (+ 1 (div x (+ 1 (+ 2 2)))) v0) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (* 2 (+ (- (+ 1 (+ 2 2)) (mod x (+ 1 (+ 2 2)))) x))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
