;; sequence(s): A313875
;; terms: 1 5 10 16 21 26 32 37 42 47 52 58 63 68 74 79 84 89 94 100
;; small program: (loop((((x div 2) mod 2) + x) div 2, 2, x) + (if x <= 0 then 1 else (2 * (x + x)))) + x
;; fast program: (((((2 * ((x - (x div (2 * (2 + 2)))) + x)) div (1 + 2)) + (if x <= 0 then 1 else x)) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (div (+ (mod (div x 2) 2) x) 2))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) (ite (<= x 0) 1 (* 2 (+ x x)))) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (div (* 2 (+ (- x (div x (* 2 (+ 2 2)))) x)) (+ 1 2)) (ite (<= x 0) 1 x)) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
