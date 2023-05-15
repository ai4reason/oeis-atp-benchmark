;; sequence(s): A194511
;; terms: ~1 0 1 0 1 0 1 0 1 2 1 2 1 2 1 2 3 2 3 2
;; small program: ((2 * loop(y - (((x div 2) + x) div 2), x, 0)) - 1) - x
;; fast program: ((((1 + ((x + x) + x)) div (1 - (2 * (2 + 2)))) * 2) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y (div (+ (div x 2) x) 2)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (- (* 2 (v0 x)) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (div (+ 1 (+ (+ x x) x)) (- 1 (* 2 (+ 2 2)))) 2) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
