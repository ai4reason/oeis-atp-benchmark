;; sequence(s): A313090
;; terms: 1 4 9 14 19 23 27 32 37 42 46 50 55 60 65 69 73 78 83 88
;; small program: (((loop((if ((x div 2) mod (2 + 2)) <= 0 then 1 else 2) + x, x - 1, 2) - 1) + x) + x) + x
;; fast program: ((((((((x mod (1 + (2 + 2))) + x) + x) + x) div (1 + (2 + 2))) + (if x <= 0 then 1 else x)) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (ite (<= (mod (div x 2) (+ 2 2)) 0) 1 2) x))))
(assert (forall ((x Int)) (= (g0 x) (- x 1))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (- (v0 x) 1) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (div (+ (+ (+ (mod x (+ 1 (+ 2 2))) x) x) x) (+ 1 (+ 2 2))) (ite (<= x 0) 1 x)) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
