;; sequence(s): A59538
;; terms: 5 11 17 23 29 35 41 47 53 59 65 71 77 83 89 95 101 107 113 118
;; small program: (((1 + (2 + 2)) * (1 + x)) - ((1 + x) div loop(2 * (2 + x), 2, 2))) + x
;; fast program: (((1 + (2 + 2)) * (1 + x)) - ((1 + x) div (2 * (2 + (2 * (2 + 2)))))) + x
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
(assert (forall ((x Int)) (= (small x) (+ (- (* (+ 1 (+ 2 2)) (+ 1 x)) (div (+ 1 x) v0)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- (* (+ 1 (+ 2 2)) (+ 1 x)) (div (+ 1 x) (* 2 (+ 2 (* 2 (+ 2 2)))))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
