;; sequence(s): A56838
;; terms: 0 0 0 1 1 2 4 5 7 9 11 13 16 18 21 25 28 32 36 40
;; small program: loop(x div (1 + 2), 2, x * x)
;; fast program: (x * x) div (1 + (2 * (2 + 2)))
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
(assert (forall ((x Int)) (= (h0 x) (* x x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (div (* x x) (+ 1 (* 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
