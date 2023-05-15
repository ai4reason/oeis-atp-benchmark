;; sequence(s): A147651
;; terms: 0 27 72 135 216 315 432 567 720 891 1080 1287 1512 1755 2016 2295 2592 2907 3240 3591
;; small program: (2 + x) * loop((x + x) + x, 2, x)
;; fast program: (1 + 2) * ((1 + 2) * ((2 + x) * x))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ x x) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (+ 2 x) (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 2) (* (+ 1 2) (* (+ 2 x) x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
