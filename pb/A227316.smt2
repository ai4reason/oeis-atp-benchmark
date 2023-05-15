;; sequence(s): A227316
;; terms: 0 2 3 6 20 30 21 28 72 90 55 66 156 182 105 120 272 306 171 190
;; small program: ((x * x) + x) div (1 + ((x div 2) mod 2))
;; fast program: loop(x div 2, (x div 2) mod 2, (x * x) + x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (+ (* x x) x) (+ 1 (mod (div x 2) 2))))))
(assert (forall ((x Int)) (= (f0 x) (div x 2))))
(assert (forall ((x Int)) (= (g0 x) (mod (div x 2) 2))))
(assert (forall ((x Int)) (= (h0 x) (+ (* x x) x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (v0 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
