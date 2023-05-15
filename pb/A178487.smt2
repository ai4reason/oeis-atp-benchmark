;; sequence(s): A178487
;; terms: 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
;; small program: ((loop(x div 2, 2 + 2, x) - 2) div (1 + x)) + 2
;; fast program: if ((2 * (2 * (2 * (2 + 2)))) - x) <= 0 then 2 else (if x <= 0 then 0 else 1)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (div x 2))))
(assert (= g0 (+ 2 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (div (- (v0 x) 2) (+ 1 x)) 2))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (- (* 2 (* 2 (* 2 (+ 2 2)))) x) 0) 2 (ite (<= x 0) 0 1)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
