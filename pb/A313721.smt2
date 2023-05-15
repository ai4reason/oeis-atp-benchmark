;; sequence(s): A313721
;; terms: 1 5 10 15 20 24 29 34 39 44 49 54 59 64 68 73 78 83 88 93
;; small program: loop((y - ((x div 2) div 2)) div 2, x + x, 1) + (2 * (x + x))
;; fast program: ((((((2 + (2 - x)) div (1 + (2 * (2 + 2)))) + x) + x) + (if x <= 0 then 1 else x)) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (- y (div (div x 2) 2)) 2))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) (* 2 (+ x x))))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (div (+ 2 (- 2 x)) (+ 1 (* 2 (+ 2 2)))) x) x) (ite (<= x 0) 1 x)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)