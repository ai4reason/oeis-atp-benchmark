;; sequence(s): A128880
;; terms: 1 55 91 253 325 595 703 1081 1225 1711 1891 2485 2701 3403 3655 4465 4753 5671 5995 7021
;; small program: loop(1 + (x + y), (1 + 2) * (((x mod 2) + x) + x), 1)
;; fast program: (((1 + 2) * (1 + (x + x))) * (((x mod 2) + x) * (1 + 2))) + 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (+ x y)))))
(assert (forall ((x Int)) (= (g0 x) (* (+ 1 2) (+ (+ (mod x 2) x) x)))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (* (+ 1 2) (+ 1 (+ x x))) (* (+ (mod x 2) x) (+ 1 2))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)