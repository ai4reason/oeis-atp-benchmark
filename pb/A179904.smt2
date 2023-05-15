;; sequence(s): A179904
;; terms: 1 3 7 16 32 57 93 142 206 287 387 508 652 821 1017 1242 1498 1787 2111 2472
;; small program: if x <= 0 then 1 else loop((y * y) + x, x, 2)
;; fast program: (((1 + (x + x)) * ((x * x) + x)) div (2 + (2 + 2))) + (if x <= 0 then 1 else 2)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* y y) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (ite (<= x 0) 1 (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (div (* (+ 1 (+ x x)) (+ (* x x) x)) (+ 2 (+ 2 2))) (ite (<= x 0) 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
