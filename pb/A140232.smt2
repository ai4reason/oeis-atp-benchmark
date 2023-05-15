;; sequence(s): A140232
;; terms: 6 11 16 21 26 31 36 41 46 51 56 61 66 71 76 81 86 91 96 101
;; small program: (((2 * (2 + (x + x))) + (x div loop(1 + (x + x), 1 + 2, 2))) + 2) + x
;; fast program: (2 + ((2 * (2 + (x + x))) + (x div ((2 * (2 * (2 + (2 + 2)))) - 1)))) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ x x)))))
(assert (= g0 (+ 1 2)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (* 2 (+ 2 (+ x x))) (div x v0)) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ 2 (+ (* 2 (+ 2 (+ x x))) (div x (- (* 2 (* 2 (+ 2 (+ 2 2)))) 1)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
