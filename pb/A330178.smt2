;; sequence(s): A330178
;; terms: 1 3 4 7 9 10 12 15 16 18 19 22 24 25 27 30 31 33 36 37
;; small program: (((((1 + ((x div (1 + loop(x * x, 2, 2))) + x)) div (2 + 2)) + 1) + x) * (1 + 2)) div 2
;; fast program: (((((1 + ((x div (1 + (2 * (2 * (2 + 2))))) + x)) div (2 + 2)) + 1) + x) * (1 + 2)) div 2
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
(assert (forall ((x Int)) (= (small x) (div (* (+ (+ (div (+ 1 (+ (div x (+ 1 v0)) x)) (+ 2 2)) 1) x) (+ 1 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (div (* (+ (+ (div (+ 1 (+ (div x (+ 1 (* 2 (* 2 (+ 2 2))))) x)) (+ 2 2)) 1) x) (+ 1 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
