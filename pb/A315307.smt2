;; sequence(s): A315307
;; terms: 1 6 10 16 20 26 30 36 40 46 50 56 62 66 72 76 82 86 92 96
;; small program: (((((((x div loop(1 + (x + x), 2, 2)) + x) - 1) div 2) + x) + x) * (if x <= 0 then 1 else 2)) + 2
;; fast program: (((((1 + ((x div (1 + (2 + (2 * (2 + 2))))) + x)) div 2) + x) * 2) + (if x <= 0 then 1 else x)) + x
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
(assert (forall ((x Int)) (= (small x) (+ (* (+ (+ (div (- (+ (div x v0) x) 1) 2) x) x) (ite (<= x 0) 1 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ (div (+ 1 (+ (div x (+ 1 (+ 2 (* 2 (+ 2 2))))) x)) 2) x) 2) (ite (<= x 0) 1 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
