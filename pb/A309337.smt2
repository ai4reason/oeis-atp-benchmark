;; sequence(s): A309337
;; terms: 0 1 6 27 48 125 162 343 384 729 750 1331 1296 2197 2058 3375 3072 4913 4374 6859
;; small program: ((((x div (2 - (x mod 2))) + x) * x) div 2) * x
;; fast program: loop(x - (x div (2 + 2)), 1 - (x mod 2), x * x) * x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (div (* (+ (div x (- 2 (mod x 2))) x) x) 2) x))))
(assert (forall ((x Int)) (= (f0 x) (- x (div x (+ 2 2))))))
(assert (forall ((x Int)) (= (g0 x) (- 1 (mod x 2)))))
(assert (forall ((x Int)) (= (h0 x) (* x x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (* (v0 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
