;; sequence(s): A131282
;; terms: 1 2 3 3 4 5 1 2 3 3 4 5 1 2 3 3 4 5 1 2
;; small program: 1 + loop(y - (x div 2), x mod (2 + (2 + 2)), 0)
;; fast program: 1 + ((2 + (2 * (x mod (2 + (2 + 2))))) div (1 + 2))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y (div x 2)))))
(assert (forall ((x Int)) (= (g0 x) (mod x (+ 2 (+ 2 2))))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ 1 (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (div (+ 2 (* 2 (mod x (+ 2 (+ 2 2))))) (+ 1 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
