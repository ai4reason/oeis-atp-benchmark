;; sequence(s): A226720
;; terms: 2 4 5 7 9 10 12 14 15 17 18 20 22 23 25 27 28 30 31 33
;; small program: (1 + loop(y - (((((x div 2) div (1 + 2)) + x) - 2) div 2), x, 1)) + x
;; fast program: ((((2 * (2 * ((1 + 2) * (1 + x)))) - 1) div (1 + (2 + (2 * (2 * (2 + 2)))))) + 2) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y (div (- (+ (div (div x 2) (+ 1 2)) x) 2) 2)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ 1 (v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (- (* 2 (* 2 (* (+ 1 2) (+ 1 x)))) 1) (+ 1 (+ 2 (* 2 (* 2 (+ 2 2)))))) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
