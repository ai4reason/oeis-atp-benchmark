;; sequence(s): A86746
;; terms: 3018 6036 9054 12072 15090 18108 21126 24144 27162 30180 33198 36216 39234 42252 45270 48288 51306 54324 57342 60360
;; small program: loop(((x * x) + loop(x * y, 2 + 2, 2)) + x, 2, 2) * (1 + x)
;; fast program: loop((2 * ((1 + x) * ((x * x) * x))) - x, 1, 2 + (2 + 2)) * (1 + x)
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 () Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* x y))))
(assert (= g1 (+ 2 2)))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (f0 x) (+ (+ (* x x) v1) x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (* v0 (+ 1 x)))))
(assert (forall ((x Int)) (= (f2 x) (- (* 2 (* (+ 1 x) (* (* x x) x))) x))))
(assert (= g2 1))
(assert (= h2 (+ 2 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (= v2 (u2 g2 h2)))
(assert (forall ((x Int)) (= (fast x) (* v2 (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
