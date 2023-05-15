;; sequence(s): A246574
;; terms: 0 4 20 84 336 1320 5148 20020 77792 302328 1175720 4576264 17829600 69535440 271455660 1060730100 4148633280 16239715800 63621474840 249436575960
;; small program: 2 * loop((((1 + 2) * (x * y)) div (2 + y)) + x, x, x)
;; fast program: ((loop(2 * (((x div y) + x) + x), x, 2) div ((1 + x) * (2 + x))) * 2) * x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* (+ 1 2) (* x y)) (+ 2 y)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* 2 (v0 x)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* 2 (+ (+ (div x y) x) x)))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (* (* (div (v1 x) (* (+ 1 x) (+ 2 x))) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)