;; sequence(s): A315471
;; terms: 1 6 11 16 21 26 32 38 43 48 53 58 64 70 75 80 85 90 96 102
;; small program: ((loop((((if ((y div 2) mod (1 + 2)) <= 0 then 1 else 0) mod x) + 2) + x, x, 1) + x) + x) + x
;; fast program: ((((2 - ((x div 2) mod (1 + 2))) + x) div (1 + 2)) + (if x <= 0 then 1 else (2 * (x + x)))) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (mod (ite (<= (mod (div y 2) (+ 1 2)) 0) 1 0) x) 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (v0 x) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (- 2 (mod (div x 2) (+ 1 2))) x) (+ 1 2)) (ite (<= x 0) 1 (* 2 (+ x x)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
