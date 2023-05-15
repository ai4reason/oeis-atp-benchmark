;; sequence(s): A313746
;; terms: 1 5 10 15 20 26 31 36 41 46 51 56 61 66 72 77 82 87 92 97
;; small program: ((((loop((1 + x) div (1 + 2), 2, x) + (if x <= 0 then 1 else x)) + x) + x) + x) + x
;; fast program: (((2 + (2 + x)) div (1 + (2 * (2 + 2)))) + (if x <= 0 then 1 else (2 * (x + x)))) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (div (+ 1 x) (+ 1 2)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (+ (v0 x) (ite (<= x 0) 1 x)) x) x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ 2 (+ 2 x)) (+ 1 (* 2 (+ 2 2)))) (ite (<= x 0) 1 (* 2 (+ x x)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
