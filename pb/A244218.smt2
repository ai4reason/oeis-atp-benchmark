;; sequence(s): A244218
;; terms: 0 1 2 3 5 6 7 8 10 11 12 13 14 15 16 17 19 20 21 22
;; small program: loop(y - (x div 2), (x div 2) div 2, 0) + x
;; fast program: ((2 + (2 * (x div (2 + 2)))) div (1 + 2)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y (div x 2)))))
(assert (forall ((x Int)) (= (g0 x) (div (div x 2) 2))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ 2 (* 2 (div x (+ 2 2)))) (+ 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
