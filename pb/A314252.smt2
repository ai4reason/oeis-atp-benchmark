;; sequence(s): A314252
;; terms: 1 5 11 17 23 29 35 41 47 53 58 63 69 75 81 87 93 99 105 111
;; small program: (loop((((if ((y div 2) mod (1 + (2 + 2))) <= 0 then 1 else 2) mod x) + 2) + x, x, 1) + x) + x
;; fast program: (((((((((((((((((((x mod (1 + (2 + 2))) + x) + x) + x) div (1 + (2 + 2))) + x) * (1 + 2)) div 2) + 1) + x) div (if x <= 0 then 1 else 2)) + x) + x) * 2) + 1) + x) div (1 + 2)) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (mod (ite (<= (mod (div y 2) (+ 1 (+ 2 2))) 0) 1 2) x) 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (+ (+ (* (+ (+ (div (+ (+ (div (* (+ (div (+ (+ (+ (mod x (+ 1 (+ 2 2))) x) x) x) (+ 1 (+ 2 2))) x) (+ 1 2)) 2) 1) x) (ite (<= x 0) 1 2)) x) x) 2) 1) x) (+ 1 2)) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
