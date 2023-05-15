;; sequence(s): A63195
;; terms: 0 1 1 1 1 3 1 3 3 3 3 5 3 5 5 5 5 7 5 7
;; small program: loop(1 + (2 * ((y - x) div (2 + 2))), x, 0)
;; fast program: ((if x <= 0 then 1 else x) - (2 * (x div (1 + 2)))) - (1 - (x mod 2))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (* 2 (div (- y x) (+ 2 2)))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (- (- (ite (<= x 0) 1 x) (* 2 (div x (+ 1 2)))) (- 1 (mod x 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
