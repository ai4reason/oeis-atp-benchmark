;; sequence(s): A39207
;; terms: 0 1 2 3 4 5 6 7 10 11 12 13 14 15 16 17 18 21 22 23
;; small program: (2 * loop(x div (1 + 2), 2, 1 + x)) + x
;; fast program: (2 * ((1 + x) div (1 + (2 * (2 + 2))))) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (div x (+ 1 2)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* 2 (v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (div (+ 1 x) (+ 1 (* 2 (+ 2 2))))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
