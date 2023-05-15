;; sequence(s): A195180
;; terms: 0 1 2 3 4 4 5 6 7 7 8 9 10 10 11 12 13 13 14 15
;; small program: (((loop((x div 2) + 2, 1 + (2 + 2), x) + x) div 2) + x) div 2
;; fast program: x - ((2 * (2 * (x + x))) div (1 + (2 * (2 * (2 * (2 + 2))))))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (div x 2) 2))))
(assert (= g0 (+ 1 (+ 2 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (div (+ (div (+ (v0 x) x) 2) x) 2))))
(assert (forall ((x Int)) (= (fast x) (- x (div (* 2 (* 2 (+ x x))) (+ 1 (* 2 (* 2 (* 2 (+ 2 2))))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
