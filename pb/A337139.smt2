;; sequence(s): A337139
;; terms: 2 3 5 7 8 9 10 11 12 13 14 15 16 18 19 20 21 22 23 24
;; small program: (loop(((((((1 + (2 + x)) mod (1 + (2 + (2 * (2 + 2))))) - 1) div (1 + x)) mod 2) + 1) + x, x + x, 0) div 2) + 2
;; fast program: (((((((((((loop(1, 2 - x, 2 * (2 + 2)) - 1) + x) - (x div 2)) + x) + x) + (if x <= 0 then 1 else 2)) + x) - 1) + x) + x) div ((2 + 2) + 1)) + 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 () Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ (mod (div (- (mod (+ 1 (+ 2 x)) (+ 1 (+ 2 (* 2 (+ 2 2))))) 1) (+ 1 x)) 2) 1) x))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (div (v0 x) 2) 2))))
(assert (= f1 1))
(assert (forall ((x Int)) (= (g1 x) (- 2 x))))
(assert (= h1 (* 2 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y f1))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (+ (- (+ (+ (+ (+ (- (+ (- (v1 x) 1) x) (div x 2)) x) x) (ite (<= x 0) 1 2)) x) 1) x) x) (+ (+ 2 2) 1)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
