;; sequence(s): A47489
;; terms: 1 2 3 5 7 9 10 11 13 15 17 18 19 21 23 25 26 27 29 31
;; small program: 1 + loop((if ((x div 2) mod (2 + 2)) <= 0 then 1 else 2) + x, x, 0)
;; fast program: ((((2 * ((x + x) div (1 + (2 + 2)))) + x) div (1 + 2)) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (ite (<= (mod (div x 2) (+ 2 2)) 0) 1 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ 1 (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (* 2 (div (+ x x) (+ 1 (+ 2 2)))) x) (+ 1 2)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)