;; sequence(s): A314144
;; terms: 1 5 11 16 22 27 32 37 42 48 53 59 64 69 75 80 86 91 96 101
;; small program: ((((((((1 + ((1 + x) div (2 + 2))) mod (1 + 2)) + x) div (1 + 2)) + (if x <= 0 then 1 else x)) + x) + x) + x) + x
;; fast program: ((((((((loop((((1 + (if x <= 0 then 1 else x)) mod (1 + 2)) - 1) + x, 1 - (x mod (2 + 2)), x) + x) + x) * 2) + 1) + x) div (1 + 2)) + x) + x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (+ (div (+ (mod (+ 1 (div (+ 1 x) (+ 2 2))) (+ 1 2)) x) (+ 1 2)) (ite (<= x 0) 1 x)) x) x) x) x))))
(assert (forall ((x Int)) (= (f0 x) (+ (- (mod (+ 1 (ite (<= x 0) 1 x)) (+ 1 2)) 1) x))))
(assert (forall ((x Int)) (= (g0 x) (- 1 (mod x (+ 2 2))))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (+ (+ (* (+ (+ (v0 x) x) x) 2) 1) x) (+ 1 2)) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
