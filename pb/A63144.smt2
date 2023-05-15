;; sequence(s): A63144
;; terms: 8 27 47 67 87 107 127 147 167 187 207 227 247 267 287 307 327 347 367 387
;; small program: loop(1 + (((2 + y) * x) + x), 2, x) + (if x <= 0 then 2 else 1)
;; fast program: ((1 + (2 * (x + x))) * (((if x <= 0 then 2 else 1) + 2) + 2)) + 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (+ (* (+ 2 y) x) x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) (ite (<= x 0) 2 1)))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 (* 2 (+ x x))) (+ (+ (ite (<= x 0) 2 1) 2) 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)