;; sequence(s): A154958
;; terms: 1 1 2 1 2 1 3 2 4 2 4 2 5 3 6 3 6 3 7 4
;; small program: (2 + ((2 + x) div (1 + (x mod 2)))) div (1 + 2)
;; fast program: (2 + loop(x div 2, x mod 2, 2 + x)) div (1 + 2)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (div (+ 2 (div (+ 2 x) (+ 1 (mod x 2)))) (+ 1 2)))))
(assert (forall ((x Int)) (= (f0 x) (div x 2))))
(assert (forall ((x Int)) (= (g0 x) (mod x 2))))
(assert (forall ((x Int)) (= (h0 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (div (+ 2 (v0 x)) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)