;; sequence(s): A117596
;; terms: 6 12 36 288 16704 55808064 622908012647232 77602878444025201997703040704 1204441348559630271252918141028336694332989128001036771264 290135792424028156178425357986052529062710984863337179470336908191924417208517059859206222048920739921330978585792
;; small program: loop(((x div (1 + (2 + 2))) * x) + x, x, 2 + (2 + 2))
;; fast program: loop((1 + (x div (1 + (2 + 2)))) * x, x, 2 + (2 + 2))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
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
(assert (forall ((x Int)) (= (f0 x) (+ (* (div x (+ 1 (+ 2 2))) x) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 (+ 2 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f1 x) (* (+ 1 (div x (+ 1 (+ 2 2)))) x))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 (+ 2 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (v1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)