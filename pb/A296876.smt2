;; sequence(s): A296876
;; terms: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
;; small program: (if loop(((x div 2) div 2) div 2, 2, x) <= 0 then 1 else (2 * (2 + 2))) + x
;; fast program: (if (loop(x * x, 1, 2 * (2 + 2)) - x) <= 0 then (2 * (2 + 2)) else 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (div (div (div x 2) 2) 2))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (ite (<= (v0 x) 0) 1 (* 2 (+ 2 2))) x))))
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 1))
(assert (= h1 (* 2 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (fast x) (+ (ite (<= (- v1 x) 0) (* 2 (+ 2 2)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
