;; sequence(s): A262588
;; terms: 0 0 0 1 0 0 1 0 1 0 1 1 0 1 1 1 0 0 1
;; small program: ((x div 2) div (if (x mod (1 + 2)) <= 0 then 1 else (2 + 2))) mod 2
;; fast program: (x div (2 * loop(2 + 2, x mod (1 + 2), 1))) mod 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (mod (div (div x 2) (ite (<= (mod x (+ 1 2)) 0) 1 (+ 2 2))) 2))))
(assert (= f0 (+ 2 2)))
(assert (forall ((x Int)) (= (g0 x) (mod x (+ 1 2)))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (mod (div x (* 2 (v0 x))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
