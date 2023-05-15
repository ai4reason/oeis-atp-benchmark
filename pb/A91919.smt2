;; sequence(s): A91919
;; terms: 1 2 6 12 27 54 112 224 453 906 1818 3636 7279 14558 29124 58248 116505 233010 466030 932060
;; small program: loop(((if (x mod 2) <= 0 then 1 else y) + x) + x, x, 2) div 2
;; fast program: loop((2 * (x + x)) + y, 1 + (x div 2), 0) * (1 + (x mod 2))
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (ite (<= (mod x 2) 0) 1 y) x) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (v0 x) 2))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (* 2 (+ x x)) y))))
(assert (forall ((x Int)) (= (g1 x) (+ 1 (div x 2)))))
(assert (= h1 0))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (* (v1 x) (+ 1 (mod x 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
