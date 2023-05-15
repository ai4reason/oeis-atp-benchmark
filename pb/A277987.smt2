;; sequence(s): A277987
;; terms: ~28 72 172 272 372 472 572 672 772 872 972 1072 1172 1272 1372 1472 1572 1672 1772 1872
;; small program: 2 * (2 * loop(((2 * (x + x)) - y) + x, 2, x))
;; fast program: (1 + ((2 * (2 * (2 * (((x - 1) + x) + x)))) + x)) * (2 + 2)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- (* 2 (+ x x)) y) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* 2 (* 2 (v0 x))))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (+ (* 2 (* 2 (* 2 (+ (+ (- x 1) x) x)))) x)) (+ 2 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)