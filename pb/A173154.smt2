;; sequence(s): A173154
;; terms: 1 4 10 19 33 52 78 111 153 204 266 339 425 524 638 767 913 1076 1258 1459
;; small program: loop(2 + ((((y * y) div 2) + x) + y), x, 1)
;; fast program: (((((1 + (x + x)) * ((2 + (2 + x)) * x)) div (2 * (2 + (2 + 2)))) + 1) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ (+ (div (* y y) 2) x) y)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (* (+ 1 (+ x x)) (* (+ 2 (+ 2 x)) x)) (* 2 (+ 2 (+ 2 2)))) 1) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)