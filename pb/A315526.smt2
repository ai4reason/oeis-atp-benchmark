;; sequence(s): A315526
;; terms: 1 6 11 17 22 28 34 40 45 51 56 62 68 73 79 84 90 96 102 107
;; small program: ((((loop(((((x mod 2) + ((x div (1 + 2)) mod (1 + 2))) mod 2) + 1) + x, x, 2) - 1) + x) + x) + x) + x
;; fast program: (((((((((((2 * (x + x)) + x) div (1 + (2 + (2 * (2 + 2))))) + x) * 2) + 1) - (if x <= 0 then 1 else 2)) + x) + x) div (1 + 2)) + 1) + (2 * (x + x))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ (mod (+ (mod x 2) (mod (div x (+ 1 2)) (+ 1 2))) 2) 1) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (- (v0 x) 1) x) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (+ (- (+ (* (+ (div (+ (* 2 (+ x x)) x) (+ 1 (+ 2 (* 2 (+ 2 2))))) x) 2) 1) (ite (<= x 0) 1 2)) x) x) (+ 1 2)) 1) (* 2 (+ x x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
