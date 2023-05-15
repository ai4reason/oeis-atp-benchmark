;; sequence(s): A291568
;; terms: 1 1 1 1 ~3 1 1 1 1 ~3 1 1 1 1 ~3 1 1 1 1 ~3
;; small program: 1 - (2 * loop(0, (1 + x) mod (1 + (2 + 2)), 2))
;; fast program: loop((x - (2 + 2)) * x, ((x mod (1 + (2 + 2))) - 1) - 2, 1)
(set-logic UFNIA)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (= f0 0))
(assert (forall ((x Int)) (= (g0 x) (mod (+ 1 x) (+ 1 (+ 2 2))))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- 1 (* 2 (v0 x))))))
(assert (forall ((x Int)) (= (f1 x) (* (- x (+ 2 2)) x))))
(assert (forall ((x Int)) (= (g1 x) (- (- (mod x (+ 1 (+ 2 2))) 1) 2))))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (v1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)