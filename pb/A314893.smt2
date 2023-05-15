;; sequence(s): A314893
;; terms: 1 5 9 14 19 24 28 32 37 42 47 51 56 61 65 70 75 80 84 88
;; small program: ((((((((loop((x mod 2) + y, x, 1 + 2) div 2) * 2) + 1) + x) div (1 + 2)) + x) + x) + x) + x
;; fast program: ((((((((1 + ((x * x) * x)) mod (2 + 2)) + x) + x) div (1 + 2)) + (if x <= 0 then 1 else x)) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (mod x 2) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 (+ 1 2)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (div (+ (+ (* (div (v0 x) 2) 2) 1) x) (+ 1 2)) x) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (div (+ (+ (mod (+ 1 (* (* x x) x)) (+ 2 2)) x) x) (+ 1 2)) (ite (<= x 0) 1 x)) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
