;; sequence(s): A301729
;; terms: 1 1 3 5 6 7 9 11 12 13 15 17 18 19 21 23 24 25 27 29
;; small program: (loop((x mod 2) + y, x, 2) div 2) + x
;; fast program: loop((x mod 2) + x, x mod 2, (if x <= 0 then 2 else x) div 2) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (mod x 2) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (div (v0 x) 2) x))))
(assert (forall ((x Int)) (= (f1 x) (+ (mod x 2) x))))
(assert (forall ((x Int)) (= (g1 x) (mod x 2))))
(assert (forall ((x Int)) (= (h1 x) (div (ite (<= x 0) 2 x) 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (v1 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
