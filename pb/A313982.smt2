;; sequence(s): A313982
;; terms: 1 5 10 17 22 29 34 39 44 49 56 61 68 73 78 83 88 95 100 107
;; small program: (((loop((if (x mod (1 + 2)) <= 0 then (if ((x div (1 + 2)) mod (1 + 2)) <= 0 then 1 else 2) else 1) + x, x, 1) + x) * 2) - (if x <= 0 then 1 else 2)) + x
;; fast program: (((((((((((((x + x) + x) div (1 + (2 + (2 + 2)))) * 2) + 1) + x) - (if x <= 0 then 1 else 2)) + x) + x) div (1 + 2)) + x) * 2) + (if x <= 0 then 1 else 2)) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (ite (<= (mod x (+ 1 2)) 0) (ite (<= (mod (div x (+ 1 2)) (+ 1 2)) 0) 1 2) 1) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (- (* (+ (v0 x) x) 2) (ite (<= x 0) 1 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ (div (+ (+ (- (+ (+ (* (div (+ (+ x x) x) (+ 1 (+ 2 (+ 2 2)))) 2) 1) x) (ite (<= x 0) 1 2)) x) x) (+ 1 2)) x) 2) (ite (<= x 0) 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
