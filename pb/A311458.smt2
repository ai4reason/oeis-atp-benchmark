;; sequence(s): A311458
;; terms: 1 4 8 12 17 21 26 30 34 38 42 46 50 55 59 64 68 72 76 80
;; small program: (((loop((((((x * x) - x) mod (1 + (2 + (2 * (2 + 2))))) mod 2) + 1) + x, x, 1) - 1) + x) + (if x <= 0 then 1 else x)) + x
;; fast program: (((((((((((((((((((((((((x mod (1 + (2 * (2 + 2)))) div 2) + 1) + x) - (if x <= 0 then 0 else 1)) + x) + x) + x) + x) - (if x <= 0 then 1 else 2)) + x) + x) div (2 + 1)) + 1) + x) * (if x <= 0 then 1 else 2)) * 2) + 1) div (1 + 2)) + x) + x) - (if x <= 0 then 1 else 2)) + x) + x) div 2) + 1
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ (mod (mod (- (* x x) x) (+ 1 (+ 2 (* 2 (+ 2 2))))) 2) 1) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (- (v0 x) 1) x) (ite (<= x 0) 1 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (+ (- (+ (+ (div (+ (* (* (+ (+ (div (+ (+ (- (+ (+ (+ (+ (- (+ (+ (div (mod x (+ 1 (* 2 (+ 2 2)))) 2) 1) x) (ite (<= x 0) 0 1)) x) x) x) x) (ite (<= x 0) 1 2)) x) x) (+ 2 1)) 1) x) (ite (<= x 0) 1 2)) 2) 1) (+ 1 2)) x) x) (ite (<= x 0) 1 2)) x) x) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
