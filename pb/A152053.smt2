;; sequence(s): A152053
;; terms: 27 36 81 72 135 108 189 144 243 180 297 216 351 252 405 288 459 324 513 360
;; small program: loop((1 + 2) * (((x mod y) + y) * x), 2, 1 + x)
;; fast program: (1 + 2) * ((1 + 2) * ((1 + (2 - (x mod 2))) * (1 + x)))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ 1 2) (* (+ (mod x y) y) x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 2) (* (+ 1 2) (* (+ 1 (- 2 (mod x 2))) (+ 1 x)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)