;; sequence(s): A63151
;; terms: 7 20 34 48 62 76 90 104 118 132 146 160 174 188 202 216 230 244 258 272
;; small program: ((if x <= 0 then 1 else x) + loop(((2 + y) * x) + y, 2, x)) + x
;; fast program: ((2 * ((1 + 2) * (1 + (x + x)))) + (if x <= 0 then 1 else x)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (+ 2 y) x) y))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (ite (<= x 0) 1 x) (v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* 2 (* (+ 1 2) (+ 1 (+ x x)))) (ite (<= x 0) 1 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
