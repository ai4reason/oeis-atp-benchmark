;; sequence(s): A154591
;; terms: 27 51 79 111 147 187 231 279 331 387 447 511 579 651 727 807 891 979 1071 1167
;; small program: (2 * (2 * loop(2 + (x + y), 2 + x, x))) - 1
;; fast program: ((1 + (2 + (x + x))) * (1 + ((2 * (2 + 2)) + x))) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ x y)))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (* 2 (* 2 (v0 x))) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 (+ 2 (+ x x))) (+ 1 (+ (* 2 (+ 2 2)) x))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
