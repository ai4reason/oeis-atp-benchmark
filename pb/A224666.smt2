;; sequence(s): A224666
;; terms: 78 108 142 180 222 268 318 372 430 492 558 628 702 780 862 948 1038 1132 1230 1332
;; small program: (loop(x + y, 2 * (2 + (2 + (2 + x))), x) + x) + x
;; fast program: (((2 + (2 * (2 + 2))) + x) * (((2 + 2) + x) * 2)) - 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) (* 2 (+ 2 (+ 2 (+ 2 x)))))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ (+ 2 (* 2 (+ 2 2))) x) (* (+ (+ 2 2) x) 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
