;; sequence(s): A330184
;; terms: 1 3 6 7 10 12 15 16 19 21 24 25 28 30 33 34 37 39 42 43
;; small program: ((1 + (((x - (x div (2 + loop(2 * (2 + x), 2, 2)))) div 2) + x)) * (1 + 2)) div 2
;; fast program: ((1 + (((x - (x div (2 + (2 * (2 + (2 * (2 + 2))))))) div 2) + x)) * (1 + 2)) div 2
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
(assert (forall ((x Int)) (= (small x) (div (* (+ 1 (+ (div (- x (div x (+ 2 v0))) 2) x)) (+ 1 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (div (* (+ 1 (+ (div (- x (div x (+ 2 (* 2 (+ 2 (* 2 (+ 2 2))))))) 2) x)) (+ 1 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
