;; sequence(s): A315170
;; terms: 1 6 10 14 18 22 26 30 34 38 42 48 54 58 62 66 70 74 78 82
;; small program: (((((((if x <= 0 then 1 else x) - 1) div (1 + (2 + (2 * (2 + 2))))) + x) + x) + (x div loop(1 + (x + x), 2, 2))) * 2) + (if x <= 0 then 1 else 2)
;; fast program: (((((((if x <= 0 then 1 else x) - 1) div (1 + (2 + (2 * (2 + 2))))) + x) + x) + (x div (1 + (2 + (2 * (2 + 2)))))) * 2) + (if x <= 0 then 1 else 2)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ x x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (* (+ (+ (+ (div (- (ite (<= x 0) 1 x) 1) (+ 1 (+ 2 (* 2 (+ 2 2))))) x) x) (div x v0)) 2) (ite (<= x 0) 1 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ (+ (+ (div (- (ite (<= x 0) 1 x) 1) (+ 1 (+ 2 (* 2 (+ 2 2))))) x) x) (div x (+ 1 (+ 2 (* 2 (+ 2 2)))))) 2) (ite (<= x 0) 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)