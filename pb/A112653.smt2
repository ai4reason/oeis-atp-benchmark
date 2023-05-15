;; sequence(s): A112653
;; terms: 0 1 13 14 26 27 39 40 52 53 65 66 78 79 91 92 104 105 117 118
;; small program: ((x div 2) * loop(1 + (x + x), 2, 2)) + x
;; fast program: ((1 + (2 + (2 * (2 + 2)))) * (x div 2)) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ x x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (* (div x 2) v0) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 (+ 2 (* 2 (+ 2 2)))) (div x 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
