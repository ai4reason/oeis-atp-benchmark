;; sequence(s): A213495
;; terms: 1 4 9 16 27 38 53 70 89 110 135 160 189 220 253 288 327 366 409 454
;; small program: (loop(x + y, 2 + (x + x), 2) div (1 + 2)) + ((x * x) div 2)
;; fast program: ((1 + ((x * x) - (((x - 2) * x) div (2 + 1)))) + ((x * x) div 2)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 (+ x x)))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (div (v0 x) (+ 1 2)) (div (* x x) 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ 1 (- (* x x) (div (* (- x 2) x) (+ 2 1)))) (div (* x x) 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
