;; sequence(s): A17137
;; terms: 6 14 22 30 38 46 54 62 70 78 86 94 102 110 118 126 134 142 150 158
;; small program: 2 * loop(1 + (x + x), 2, x)
;; fast program: 2 + (2 * (2 + (2 * (x + x))))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ x x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* 2 (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (* 2 (+ 2 (* 2 (+ x x))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)