;; sequence(s): A98849
;; terms: 0 17 36 57 80 105 132 161 192 225 260 297 336 377 420 465 512 561 612 665
;; small program: (loop(x * x, 2, 2) + x) * x
;; fast program: ((2 * (2 * (2 + 2))) + x) * x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (* (+ v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (* (+ (* 2 (* 2 (+ 2 2))) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
