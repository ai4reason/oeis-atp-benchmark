;; sequence(s): A313738
;; terms: 1 5 10 15 20 25 31 36 41 46 51 56 61 66 71 76 81 87 92 97
;; small program: (loop(y - ((x div 2) div (1 + (2 + 2))), (2 * (2 * (x + x))) + x, 2) div 2) + x
;; fast program: ((((((1 + (2 + (2 + x))) div (1 + (2 + (2 * (2 + 2))))) + (if x <= 0 then 1 else x)) + x) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y (div (div x 2) (+ 1 (+ 2 2)))))))
(assert (forall ((x Int)) (= (g0 x) (+ (* 2 (* 2 (+ x x))) x))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (div (v0 x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (+ (div (+ 1 (+ 2 (+ 2 x))) (+ 1 (+ 2 (* 2 (+ 2 2))))) (ite (<= x 0) 1 x)) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
