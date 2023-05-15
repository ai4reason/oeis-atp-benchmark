;; sequence(s): A315175
;; terms: 1 6 10 14 18 22 26 32 38 42 46 50 54 58 64 70 74 78 82 86
;; small program: ((loop((if (((1 + x) div (1 + 2)) mod (1 + 2)) <= 0 then 2 else 1) + x, x, 1) + x) * 2) - (if x <= 0 then 1 else 2)
;; fast program: ((((((x - 1) div (1 + (2 + (2 + 2)))) + x) + x) + (x div (1 + (2 + (2 + 2))))) * (if x <= 0 then 1 else 2)) + 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (ite (<= (mod (div (+ 1 x) (+ 1 2)) (+ 1 2)) 0) 2 1) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (* (+ (v0 x) x) 2) (ite (<= x 0) 1 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ (+ (+ (div (- x 1) (+ 1 (+ 2 (+ 2 2)))) x) x) (div x (+ 1 (+ 2 (+ 2 2))))) (ite (<= x 0) 1 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
