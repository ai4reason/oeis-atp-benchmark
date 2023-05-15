;; sequence(s): A225551
;; terms: 1 4 6 7 8 10 11 12 14 15 17 18 20 21 23 24 26 27 29 30
;; small program: ((loop(2 + (2 + (x div y)), x, 2) + x) div 2) + x
;; fast program: (((((((if x <= 0 then 1 else (2 + (2 * (2 + 2)))) + x) div (2 + x)) + 1) + x) div 2) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ 2 (div x y))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (div (+ (v0 x) x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (+ (div (+ (ite (<= x 0) 1 (+ 2 (* 2 (+ 2 2)))) x) (+ 2 x)) 1) x) 2) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
