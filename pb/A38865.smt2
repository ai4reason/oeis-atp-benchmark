;; sequence(s): A38865
;; terms: 63 117 189 279 387 513 657 819 999 1197 1413 1647 1899 2169 2457 2763 3087 3429 3789 4167
;; small program: (1 + (2 * (2 + 2))) * loop((x + y) + y, x + 2, 1)
;; fast program: (1 + 2) * ((1 + 2) * (1 + ((1 + (2 + x)) * (2 + x))))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ x y) y))))
(assert (forall ((x Int)) (= (g0 x) (+ x 2))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (+ 1 (* 2 (+ 2 2))) (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 2) (* (+ 1 2) (+ 1 (* (+ 1 (+ 2 x)) (+ 2 x))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)