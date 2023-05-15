;; sequence(s): A335873
;; terms: 0 1 4 10 48 216 1440 9360 80640 685440 7257600 76204800 958003200 11975040000 174356582400 2528170444800 41845579776000 690452066304000 12804747411456000 236887827111936000
;; small program: loop(x * y, x - 1, (x - (x mod 2)) + x)
;; fast program: ((x - (x mod 2)) + x) * loop(x * y, x - 1, 1)
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* x y))))
(assert (forall ((x Int)) (= (g0 x) (- x 1))))
(assert (forall ((x Int)) (= (h0 x) (+ (- x (mod x 2)) x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* x y))))
(assert (forall ((x Int)) (= (g1 x) (- x 1))))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (* (+ (- x (mod x 2)) x) (v1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)