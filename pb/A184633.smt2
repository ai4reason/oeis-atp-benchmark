;; sequence(s): A184633
;; terms: 1 4 12 28 55 96 152 227 324 444 591 768 976 1219 1500 1820 2183 2592 3048 3555
;; small program: (((((((loop(x * x, 2, 1 + x) div (1 + 2)) * 2) - x) div (1 + 2)) * 2) + 1) + x) div (1 + x)
;; fast program: (loop(x * x, 1, (1 + x) * (2 + (x + x))) + (2 * (2 + 2))) div (((1 + 2) * (1 + x)) * (1 + 2))
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
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (div (+ (+ (* (div (- (* (div (v0 x) (+ 1 2)) 2) x) (+ 1 2)) 2) 1) x) (+ 1 x)))))
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (* (+ 1 x) (+ 2 (+ x x))))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (div (+ (v1 x) (* 2 (+ 2 2))) (* (* (+ 1 2) (+ 1 x)) (+ 1 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
