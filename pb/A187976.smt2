;; sequence(s): A187976
;; terms: 0 1 0 1 0 0 1 0 1 0 1 1 0 1 0 1 0 0 1 0
;; small program: ((((((((((((x mod (1 + 2)) + x) div (2 + 2)) + 1) + x) div (2 + 2)) + 1) + x) div 2) + 1) + x) div 2) mod 2
;; fast program: ((((((loop(1 + 2, (x mod (2 + 2)) - 2, 1) + x) div (1 + (2 + 2))) + x) + 1) div (((1 + 2) + 2) + 2)) + x) mod 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (mod (div (+ (+ (div (+ (+ (div (+ (+ (div (+ (mod x (+ 1 2)) x) (+ 2 2)) 1) x) (+ 2 2)) 1) x) 2) 1) x) 2) 2))))
(assert (= f0 (+ 1 2)))
(assert (forall ((x Int)) (= (g0 x) (- (mod x (+ 2 2)) 2))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (mod (+ (div (+ (+ (div (+ (v0 x) x) (+ 1 (+ 2 2))) x) 1) (+ (+ (+ 1 2) 2) 2)) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
