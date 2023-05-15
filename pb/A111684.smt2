;; sequence(s): A111684
;; terms: 2 2 3 3 4 4 5 5 6 6 7 8 8 9 9 10 10 11 11 12
;; small program: ((loop(x div (2 + y), 2, 1 + x) + x) div 2) + 2
;; fast program: 2 + ((((1 + x) div (2 * (2 + (2 + 2)))) + x) div 2)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div x (+ 2 y)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (div (+ (v0 x) x) 2) 2))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (div (+ (div (+ 1 x) (* 2 (+ 2 (+ 2 2)))) x) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
