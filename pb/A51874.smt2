;; sequence(s): A51874
;; terms: 0 1 22 63 124 205 306 427 568 729 910 1111 1332 1573 1834 2115 2416 2737 3078 3439
;; small program: (loop((x + x) + x, 2, x - 1) + x) * x
;; fast program: (2 * ((1 + (2 + 2)) * ((x * x) - x))) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ x x) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (- x 1))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (* (+ 1 (+ 2 2)) (- (* x x) x))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
