;; sequence(s): A135706
;; terms: 0 2 14 36 68 110 162 224 296 378 470 572 684 806 938 1080 1232 1394 1566 1748
;; small program: (loop((x - 1) + x, 2, x) + x) * x
;; fast program: (((2 * ((x - 2) + x)) + x) * x) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (- x 1) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ (* 2 (+ (- x 2) x)) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
