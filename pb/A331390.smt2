;; sequence(s): A331390
;; terms: 1 9 29 68 134 237 388 600 887 1265 1751 2364 3124 4053 5174 6512 8093 9945 12097 14580
;; small program: ((((loop(2 + ((2 + (2 + (2 + x))) * x), 2, x) div 2) div 2) div 2) + (x * x)) div 2
;; fast program: ((loop(x * x, 1, (1 + (2 + (2 + x))) * (1 + x)) div (2 * (2 + 2))) + (x * x)) div 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 2 (* (+ 2 (+ 2 (+ 2 x))) x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (div (+ (div (div (div (v0 x) 2) 2) 2) (* x x)) 2))))
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (* (+ 1 (+ 2 (+ 2 x))) (+ 1 x)))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (div (+ (div (v1 x) (* 2 (+ 2 2))) (* x x)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)