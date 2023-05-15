;; sequence(s): A271346
;; terms: 4 6 8 12 14 16 24 26 28 32 34 36 44 46 48 52 54 56 64 66
;; small program: (2 + (compr((x div 2) mod 2, x div (1 + 2)) + x)) * 2
;; fast program: ((loop((x - (x mod 2)) + x, 1, x div (1 + 2)) + 2) + x) * 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun t0 (Int) Int)
(declare-fun u0 (Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (mod (div x 2) 2))))
(assert (forall ((x Int)) (= (g0 x) (div x (+ 1 2)))))
(assert (forall ((x Int)) (= (t0 x) (ite (<= (f0 x) 0) x (t0 (+ x 1))))))
(assert (forall ((x Int)) (= (u0 x) (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x)))))
(assert (forall ((x Int)) (= (small x) (* (+ 2 (+ (v0 x) x)) 2))))
(assert (forall ((x Int)) (= (f1 x) (+ (- x (mod x 2)) x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (div x (+ 1 2)))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ (+ (v1 x) 2) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)