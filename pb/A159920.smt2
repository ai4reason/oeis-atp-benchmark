;; sequence(s): A159920
;; terms: 4 14 32 60 100 154 224 312 420 550 704 884 1092 1330 1600 1904 2244 2622 3040 3500
;; small program: loop((((y * y) - 2) + x) + y, 2 + x, 0)
;; fast program: ((1 + x) * ((2 + (2 + (2 + x))) * (2 + x))) div (1 + 2)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (- (* y y) 2) x) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (div (* (+ 1 x) (* (+ 2 (+ 2 (+ 2 x))) (+ 2 x))) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)