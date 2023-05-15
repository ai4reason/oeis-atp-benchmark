;; sequence(s): A154599
;; terms: 30 56 86 120 158 200 246 296 350 408 470 536 606 680 758 840 926 1016 1110 1208
;; small program: ((1 + (2 + (x + x))) * loop(x + y, 2 + 2, x)) + x
;; fast program: ((1 + (2 + (x + x))) * (2 + ((2 * (2 + 2)) + x))) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (= g0 (+ 2 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (+ 1 (+ 2 (+ x x))) (v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 (+ 2 (+ x x))) (+ 2 (+ (* 2 (+ 2 2)) x))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
