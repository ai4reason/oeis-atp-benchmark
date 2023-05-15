;; sequence(s): A132222
;; terms: 1 3 7 9 13 15 19 21 25 29 31 35 37 41 43 47 51 53 57 59
;; small program: ((loop((((x div 2) div 2) + y) div 2, x, 0) + x) * 2) + 1
;; fast program: (((((2 * ((if x <= 0 then 1 else x) + x)) - 1) div (1 + (2 + (2 + 2)))) + x) * 2) + 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (+ (div (div x 2) 2) y) 2))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (* (+ (v0 x) x) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ (div (- (* 2 (+ (ite (<= x 0) 1 x) x)) 1) (+ 1 (+ 2 (+ 2 2)))) x) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
