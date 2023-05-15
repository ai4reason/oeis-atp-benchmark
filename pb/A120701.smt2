;; sequence(s): A120701
;; terms: 2 6 9 12 15 18 21 25 28 31 34 37 40 43 47 50 53 56 59 62
;; small program: ((loop(2 + ((((x div 2) div 2) div 2) + y), x, 1) + x) + 1) + x
;; fast program: (1 + ((((x div (1 + (2 + (2 + 2)))) + (if x <= 0 then 1 else 2)) + x) + x)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ (div (div (div x 2) 2) 2) y)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (v0 x) x) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ 1 (+ (+ (+ (div x (+ 1 (+ 2 (+ 2 2)))) (ite (<= x 0) 1 2)) x) x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
