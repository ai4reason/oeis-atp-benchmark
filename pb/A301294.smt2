;; sequence(s): A301294
;; terms: 1 5 14 28 46 68 95 127 163 203 248 298 352 410 473 541 613 689 770 856
;; small program: 1 + loop((x div 2) + x, 2, (x * x) + x)
;; fast program: loop(((x div (2 + 2)) + x) + x, 1, (x * x) + x) + 1
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (div x 2) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (+ (* x x) x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ 1 (v0 x)))))
(assert (forall ((x Int)) (= (f1 x) (+ (+ (div x (+ 2 2)) x) x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (+ (* x x) x))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (v1 x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)