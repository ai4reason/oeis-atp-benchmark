;; sequence(s): A332884
;; terms: 19 37 53 67 79 89 97 103 107 109 109 107 103 97 89 79 67 53 37 19
;; small program: ((1 + x) * (loop(2 * (2 + x), 2, 2) - x)) - 1
;; fast program: ((1 + x) * ((2 * (2 + (2 * (2 + 2)))) - x)) - 1
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
(assert (forall ((x Int)) (= (small x) (- (* (+ 1 x) (- v0 x)) 1))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ 1 x) (- (* 2 (+ 2 (* 2 (+ 2 2)))) x)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
