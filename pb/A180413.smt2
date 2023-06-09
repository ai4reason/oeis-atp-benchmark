;; sequence(s): A180413
;; terms: 0 144 576 1440 2880 5040 8064 12096 17280 23760 31680 41184 52416 65520 80640 97920 117504 139536 164160 191520
;; small program: (1 + x) * ((2 + x) * loop(x * y, 2 + 2, x))
;; fast program: 2 * (2 * (2 * ((1 + 2) * ((1 + x) * ((2 + x) * x)))))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* x y))))
(assert (= g0 (+ 2 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (+ 1 x) (* (+ 2 x) (v0 x))))))
(assert (forall ((x Int)) (= (fast x) (* 2 (* 2 (* 2 (* (+ 1 2) (* (+ 1 x) (* (+ 2 x) x)))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
