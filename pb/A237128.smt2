;; sequence(s): A237128
;; terms: 36 324 396 684 756 1044 1116 1404 1476 1764 1836 2124 2196 2484 2556 2844 2916 3204 3276 3564
;; small program: (1 + (loop(((x mod 2) + x) + x, 2, x) + x)) * loop(x * x, 1, 2 + (2 + 2))
;; fast program: ((((1 + ((2 * ((x mod 2) + x)) + x)) * (1 + 2)) - 1) + x) * (((2 + 2) * (2 + 2)) + 2)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ (mod x 2) x) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 1))
(assert (= h1 (+ 2 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (small x) (* (+ 1 (+ (v0 x) x)) v1))))
(assert (forall ((x Int)) (= (fast x) (* (+ (- (* (+ 1 (+ (* 2 (+ (mod x 2) x)) x)) (+ 1 2)) 1) x) (+ (* (+ 2 2) (+ 2 2)) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)