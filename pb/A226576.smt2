;; sequence(s): A226576
;; terms: 0 3 3 1 4 4 2 5 5 3 6 6 4 7 7 5 8 8 6 9
;; small program: ((2 + x) div (1 + 2)) + (if (x mod (1 + 2)) <= 0 then 0 else 2)
;; fast program: loop(1 + 2, x mod (1 + 2), 0) + (x div (1 + 2))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (+ 2 x) (+ 1 2)) (ite (<= (mod x (+ 1 2)) 0) 0 2)))))
(assert (= f0 (+ 1 2)))
(assert (forall ((x Int)) (= (g0 x) (mod x (+ 1 2)))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (+ (v0 x) (div x (+ 1 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)