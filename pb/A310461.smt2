;; sequence(s): A310461
;; terms: 1 4 10 15 20 26 30 34 40 45 50 56 60 64 70 75 80 86 90 94
;; small program: (((((((1 + (x + x)) mod (2 + (x mod 2))) + x) - (if x <= 0 then 0 else 1)) + x) + x) + x) + x
;; fast program: (((loop((((x div 2) mod (1 + 2)) - 1) + x, x mod 2, if x <= 0 then 1 else x) + x) + x) + x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (- (+ (mod (+ 1 (+ x x)) (+ 2 (mod x 2))) x) (ite (<= x 0) 0 1)) x) x) x) x))))
(assert (forall ((x Int)) (= (f0 x) (+ (- (mod (div x 2) (+ 1 2)) 1) x))))
(assert (forall ((x Int)) (= (g0 x) (mod x 2))))
(assert (forall ((x Int)) (= (h0 x) (ite (<= x 0) 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (v0 x) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
