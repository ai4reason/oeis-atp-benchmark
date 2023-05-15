;; sequence(s): A252169
;; terms: 2 4 6 9 11 13 15 18 20 22 24 27 29 31 33 36 38 40 42 45
;; small program: ((((1 + (((x div loop(1 + (x * x), 2, 2)) div 2) + x)) div (2 + 2)) + 2) + x) + x
;; fast program: ((((1 + ((x div ((1 + (2 * (2 + 2))) * (2 + (2 + 2)))) + x)) div (2 + 2)) + 2) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (* x x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (div (+ 1 (+ (div (div x v0) 2) x)) (+ 2 2)) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (+ 1 (+ (div x (* (+ 1 (* 2 (+ 2 2))) (+ 2 (+ 2 2)))) x)) (+ 2 2)) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
