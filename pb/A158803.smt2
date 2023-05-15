;; sequence(s): A158803
;; terms: 17 24 58 65 99 106 140 147 181 188 222 229 263 270 304 311 345 352 386 393
;; small program: ((((loop(((x + x) + x) + y, 2, x div 2) + x) + x) * (1 + 2)) + 2) + x
;; fast program: (((1 + 2) * ((((1 + 2) * (((1 + 2) * (x div 2)) + 2)) + x) + x)) - 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (+ x x) x) y))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (div x 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (* (+ (+ (v0 x) x) x) (+ 1 2)) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- (* (+ 1 2) (+ (+ (* (+ 1 2) (+ (* (+ 1 2) (div x 2)) 2)) x) x)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
