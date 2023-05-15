;; sequence(s): A310529
;; terms: 1 4 10 16 22 28 34 38 42 48 54 60 66 72 76 80 86 92 98 104
;; small program: ((loop((if ((x div 2) mod (2 + (2 + 2))) <= 0 then 1 else 2) + x, x, 1) + x) * 2) - (if x <= 0 then 1 else 2)
;; fast program: (((((((((((((((((x + x) + x) div (1 + (2 + (2 + 2)))) * 2) + 1) + x) - (if x <= 0 then 1 else 2)) + x) + x) div (1 + 2)) * 2) + 2) + x) * 2) + 1) + x) div (1 + 2)) * (if x <= 0 then 1 else 2)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (ite (<= (mod (div x 2) (+ 2 (+ 2 2))) 0) 1 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (* (+ (v0 x) x) 2) (ite (<= x 0) 1 2)))))
(assert (forall ((x Int)) (= (fast x) (* (div (+ (+ (* (+ (+ (* (div (+ (+ (- (+ (+ (* (div (+ (+ x x) x) (+ 1 (+ 2 (+ 2 2)))) 2) 1) x) (ite (<= x 0) 1 2)) x) x) (+ 1 2)) 2) 2) x) 2) 1) x) (+ 1 2)) (ite (<= x 0) 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)