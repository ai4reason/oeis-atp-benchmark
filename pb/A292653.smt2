;; sequence(s): A292653
;; terms: 2 5 7 10 12 15 17 20 23 25 28 30 33 35 38 40 43 46 48 51
;; small program: (loop(1 + (x + x), 1 + 2, x) - (x div (1 + 2))) div (1 + 2)
;; fast program: 2 + (((((1 + (2 + 2)) * (1 + x)) div (1 + (2 * (2 + 2)))) + x) + x)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ x x)))))
(assert (= g0 (+ 1 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (div (- (v0 x) (div x (+ 1 2))) (+ 1 2)))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (+ (+ (div (* (+ 1 (+ 2 2)) (+ 1 x)) (+ 1 (* 2 (+ 2 2)))) x) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
