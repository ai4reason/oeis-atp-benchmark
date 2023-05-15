;; sequence(s): A134762
;; terms: 1 4 16 58 208 754 2770 10294 38608 145858 554266 2116294 8112466 31201798 120349798 465352558 1803241168 7000818658 27225405898 106035791398
;; small program: loop(1 + (2 * ((x - (x div y)) + x)), x, 2) - 1
;; fast program: loop(2 * ((x - (x div y)) + x), x, 1 + 2) - 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (* 2 (+ (- x (div x y)) x))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) 1))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* 2 (+ (- x (div x y)) x)))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 (+ 1 2)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (- (v1 x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)