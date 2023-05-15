;; sequence(s): A103747-A132417
;; terms: 2 6 10 14 18 22 26 30 34 38 42 46 50 54 58 126 130 134 138 142
;; small program: ((((1 - ((1 + x) mod loop(x * x, 2, 2))) + x) + x) * (2 + 2)) + 2
;; fast program: ((1 + ((x - ((1 + x) mod (2 * (2 * (2 + 2))))) + x)) * (2 + 2)) + 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (* (+ (+ (- 1 (mod (+ 1 x) v0)) x) x) (+ 2 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 (+ (- x (mod (+ 1 x) (* 2 (* 2 (+ 2 2))))) x)) (+ 2 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
