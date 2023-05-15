;; sequence(s): A129194
;; terms: 0 1 2 9 8 25 18 49 32 81 50 121 72 169 98 225 128 289 162 361
;; small program: (x div (2 - (x mod 2))) * x
;; fast program: loop(x div 2, 1 - (x mod 2), x) * x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (div x (- 2 (mod x 2))) x))))
(assert (forall ((x Int)) (= (f0 x) (div x 2))))
(assert (forall ((x Int)) (= (g0 x) (- 1 (mod x 2)))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (* (v0 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
