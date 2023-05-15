;; sequence(s): A314672
;; terms: 1 5 9 13 17 21 25 29 34 39 43 47 51 55 59 63 68 73 77 81
;; small program: (loop((((if ((y div 2) mod (2 + 2)) <= 0 then 1 else 0) mod x) + 2) + x, x, 1) + x) + x
;; fast program: ((((((((if x <= 0 then 1 else x) - 1) div (2 * (2 + 2))) + (x div (2 * (2 + 2)))) + x) + x) + 1) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (mod (ite (<= (mod (div y 2) (+ 2 2)) 0) 1 0) x) 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (+ (div (- (ite (<= x 0) 1 x) 1) (* 2 (+ 2 2))) (div x (* 2 (+ 2 2)))) x) x) 1) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
