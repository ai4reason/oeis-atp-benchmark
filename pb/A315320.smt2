;; sequence(s): A315320
;; terms: 1 6 10 16 21 26 32 36 42 48 52 58 63 68 74 78 84 90 94 100
;; small program: loop((((((2 * (x + x)) div y) + x) mod 2) + 1) + x, (x + x) + x, 2) - 1
;; fast program: ((((((((((((x div 2) + 2) + x) mod (2 + 2)) + x) div 2) + x) + x) div 2) + x) + (if x <= 0 then 1 else x)) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (mod (+ (div (* 2 (+ x x)) y) x) 2) 1) x))))
(assert (forall ((x Int)) (= (g0 x) (+ (+ x x) x))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (div (+ (+ (div (+ (mod (+ (+ (div x 2) 2) x) (+ 2 2)) x) 2) x) x) 2) x) (ite (<= x 0) 1 x)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
