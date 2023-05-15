;; sequence(s): A314096
;; terms: 1 5 11 16 20 25 31 36 41 47 52 56 61 67 72 77 83 88 92 97
;; small program: (((((((loop(((0 - (x div (1 + 2))) div 2) + y, x, 1) + x) + x) * (if x <= 0 then 1 else 2)) * 2) + 1) + x) div (1 + 2)) + x
;; fast program: ((((((((((1 + 2) * (1 + (x + x))) div (1 + (2 + (2 + 2)))) + (if x <= 0 then 1 else x)) + x) * 2) * 2) + 1) + x) div (1 + 2)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (- 0 (div x (+ 1 2))) 2) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (div (+ (+ (* (* (+ (+ (v0 x) x) x) (ite (<= x 0) 1 2)) 2) 1) x) (+ 1 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (+ (* (* (+ (+ (div (* (+ 1 2) (+ 1 (+ x x))) (+ 1 (+ 2 (+ 2 2)))) (ite (<= x 0) 1 x)) x) 2) 2) 1) x) (+ 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
