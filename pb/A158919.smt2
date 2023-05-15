;; sequence(s): A158919-A276384
;; terms: 0 1 3 5 7 9 11 12 14 16 18 20 22 23 25 27 29 31 33 34
;; small program: ((((x div loop(1 + (x * x), 2, 2)) - x) div (2 + (2 + 2))) + x) + x
;; fast program: (((if x <= 0 then 1 else x) - 1) - ((2 * (x + x)) div (1 + (2 * (2 * (2 + (2 + 2))))))) + x
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
(assert (forall ((x Int)) (= (small x) (+ (+ (div (- (div x v0) x) (+ 2 (+ 2 2))) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- (- (ite (<= x 0) 1 x) 1) (div (* 2 (+ x x)) (+ 1 (* 2 (* 2 (+ 2 (+ 2 2))))))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
