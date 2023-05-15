;; sequence(s): A315418
;; terms: 1 6 11 15 20 26 32 37 41 46 52 58 63 67 72 78 84 89 93 98
;; small program: ((loop((((((y * y) div (2 + (2 * (2 + 2)))) + x) mod 2) + 1) + x, x + x, 2) - 1) + x) + x
;; fast program: ((((((((((((if x <= 0 then 1 else x) - 1) div (1 + (2 + 2))) + x) + 1) + (x div (1 + (2 + 2)))) + x) * 2) * 2) + 1) div (1 + 2)) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (mod (+ (div (* y y) (+ 2 (* 2 (+ 2 2)))) x) 2) 1) x))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (- (v0 x) 1) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (* (* (+ (+ (+ (+ (div (- (ite (<= x 0) 1 x) 1) (+ 1 (+ 2 2))) x) 1) (div x (+ 1 (+ 2 2)))) x) 2) 2) 1) (+ 1 2)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
