;; sequence(s): A118002
;; terms: 0 1 3 5 9 14 19 26 33 41 51 62 73 86 99 113 129 146 163 182
;; small program: loop((((x * x) + y) mod (1 + 2)) + x, x * x, 1) div 2
;; fast program: (((x * x) + loop(0, 2 - x, 2)) + ((x * x) mod (1 + 2))) div 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 () Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (mod (+ (* x x) y) (+ 1 2)) x))))
(assert (forall ((x Int)) (= (g0 x) (* x x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (v0 x) 2))))
(assert (= f1 0))
(assert (forall ((x Int)) (= (g1 x) (- 2 x))))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y f1))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (div (+ (+ (* x x) (v1 x)) (mod (* x x) (+ 1 2))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
