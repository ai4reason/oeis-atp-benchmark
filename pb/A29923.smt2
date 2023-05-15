;; sequence(s): A29923
;; terms: 0 0 1 1 2 2 3 3 4 4 5 5 5 6 6 7 7 8 8 9
;; small program: (1 + ((((x div 2) + x) div (0 - loop(x * x, 2, 2))) + x)) div 2
;; fast program: (1 + ((((x div 2) + x) div (0 - (2 * (2 * (2 + 2))))) + x)) div 2
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
(assert (forall ((x Int)) (= (small x) (div (+ 1 (+ (div (+ (div x 2) x) (- 0 v0)) x)) 2))))
(assert (forall ((x Int)) (= (fast x) (div (+ 1 (+ (div (+ (div x 2) x) (- 0 (* 2 (* 2 (+ 2 2))))) x)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
