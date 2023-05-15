;; sequence(s): A313556
;; terms: 1 5 10 14 19 24 28 32 37 42 46 51 56 61 66 70 75 80 84 88
;; small program: (loop((if (((2 * ((((x div 2) div 2) div 2) div 2)) + x) mod (2 + 2)) <= 0 then 2 else 1) + x, x + x, 1) + x) + x
;; fast program: (((((((((((((1 - ((x div (2 + (2 + 2))) mod 2)) + x) + x) * 2) - 1) + x) + x) - (if x <= 0 then 0 else 2)) + x) + x) div (1 + 2)) + 1) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (ite (<= (mod (+ (* 2 (div (div (div (div x 2) 2) 2) 2)) x) (+ 2 2)) 0) 2 1) x))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (+ (+ (- (+ (+ (- (* (+ (+ (- 1 (mod (div x (+ 2 (+ 2 2))) 2)) x) x) 2) 1) x) x) (ite (<= x 0) 0 2)) x) x) (+ 1 2)) 1) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
