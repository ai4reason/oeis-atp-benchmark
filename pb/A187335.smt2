;; sequence(s): A187335
;; terms: 2 3 5 6 8 9 11 12 13 14 17 18 20 21 23 24 26 27 28 29
;; small program: ((if (2 + (2 - ((x div 2) mod (1 + (2 + 2))))) <= 0 then 1 else 2) + (x div 2)) + x
;; fast program: ((((loop(1, 2 - ((2 + x) mod ((2 * (2 + 2)) + 2)), 2) + x) + x) * 2) - x) div 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (ite (<= (+ 2 (- 2 (mod (div x 2) (+ 1 (+ 2 2))))) 0) 1 2) (div x 2)) x))))
(assert (= f0 1))
(assert (forall ((x Int)) (= (g0 x) (- 2 (mod (+ 2 x) (+ (* 2 (+ 2 2)) 2))))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (div (- (* (+ (+ (v0 x) x) x) 2) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
