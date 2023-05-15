;; sequence(s): A145885
;; terms: 0 1 10 63 336 1650 7722 35035 155584 680238 2939300 12584726 53488800 225990180 950094810 3977737875 16594533120 69018792150 286296636780 1184823735810
;; small program: (loop((((1 + 2) * (x * y)) div (2 + y)) + x, x, x) div 2) * x
;; fast program: (loop(2 * (((x div y) + x) + x), x, x) div ((1 + x) * (2 + x))) * x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* (+ 1 2) (* x y)) (+ 2 y)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (div (v0 x) 2) x))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* 2 (+ (+ (div x y) x) x)))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (* (div (v1 x) (* (+ 1 x) (+ 2 x))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)