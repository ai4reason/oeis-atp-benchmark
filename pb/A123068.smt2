;; sequence(s): A123068
;; terms: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
;; small program: (x div ((x div 2) + loop(x * x, 2, 2))) + x
;; fast program: (if (2 + (x - (2 * (2 * (2 * (2 + 2)))))) <= 0 then 0 else 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (div x (+ (div x 2) v0)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (ite (<= (+ 2 (- x (* 2 (* 2 (* 2 (+ 2 2)))))) 0) 0 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
