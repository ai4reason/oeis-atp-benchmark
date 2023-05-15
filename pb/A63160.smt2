;; sequence(s): A63160
;; terms: 10 33 57 81 105 129 153 177 201 225 249 273 297 321 345 369 393 417 441 465
;; small program: loop(1 + ((2 + y) * (x * y)), 2, x) + (if x <= 0 then 1 else 0)
;; fast program: (2 * (2 * (2 + (2 * ((x + x) + x))))) + (if x <= 0 then 2 else 1)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (* (+ 2 y) (* x y))))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) (ite (<= x 0) 1 0)))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (* 2 (+ 2 (* 2 (+ (+ x x) x))))) (ite (<= x 0) 2 1)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)