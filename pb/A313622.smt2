;; sequence(s): A313622
;; terms: 1 5 10 14 20 25 30 35 40 46 50 55 60 65 70 74 80 85 90 95
;; small program: loop((if (((2 * ((x - (x div (2 + (2 + 2)))) div (2 + 2))) + x) mod (2 + 2)) <= 0 then 2 else 1) + x, (x + x) + x, 1) + x
;; fast program: ((((((((((((((((((((((((2 * (x + x)) - ((x div 2) mod 2)) div (1 + 2)) + 1) + x) div (if x <= 0 then 1 else 2)) + x) + x) + x) * (1 + 2)) + 1) + x) div (1 + 2)) * (if x <= 0 then 1 else 2)) * 2) + 1) + x) div (1 + 2)) - x) + x) * (1 + 2)) + 1) + x) div 2) div 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (ite (<= (mod (+ (* 2 (div (- x (div x (+ 2 (+ 2 2)))) (+ 2 2))) x) (+ 2 2)) 0) 2 1) x))))
(assert (forall ((x Int)) (= (g0 x) (+ (+ x x) x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (div (div (+ (+ (* (+ (- (div (+ (+ (* (* (div (+ (+ (* (+ (+ (+ (div (+ (+ (div (- (* 2 (+ x x)) (mod (div x 2) 2)) (+ 1 2)) 1) x) (ite (<= x 0) 1 2)) x) x) x) (+ 1 2)) 1) x) (+ 1 2)) (ite (<= x 0) 1 2)) 2) 1) x) (+ 1 2)) x) x) (+ 1 2)) 1) x) 2) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
