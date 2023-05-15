;; sequence(s): A274252
;; terms: 1 1 102 5043 87894 815365 5042737 23548008 89494870 290594892 833383334 2161532576 5159904769 11488393301 24104823494 48054578907 91626493270 168000201633 297539880337 510923426200
;; small program: (loop(((x * x) div (2 + (2 + 2))) + x, 1, loop(x * x, 2, x) * x) div 2) + 1
;; fast program: (loop(((x * x) div (2 + (2 + 2))) + x, 1, (((x * x) * x) * x) * x) div 2) + 1
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (div (* x x) (+ 2 (+ 2 2))) x))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 2))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (h0 x) (* (v1 x) x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (div (v0 x) 2) 1))))
(assert (forall ((x Int)) (= (f2 x) (+ (div (* x x) (+ 2 (+ 2 2))) x))))
(assert (= g2 1))
(assert (forall ((x Int)) (= (h2 x) (* (* (* (* x x) x) x) x))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (div (v2 x) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
