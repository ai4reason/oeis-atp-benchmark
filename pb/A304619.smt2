;; sequence(s): A304619
;; terms: 156 972 2436 4548 7308 10716 14772 19476 24828 30828 37476 44772 52716 61308 70548 80436 90972 102156 113988 126468
;; small program: (((((1 + x) * loop((2 * (2 + (2 * (x + x)))) + x, 2, x)) - 1) + x) + x) * (2 + 2)
;; fast program: (((((1 + (x + x)) * ((1 + x) * loop((x * x) * x, 1, 1 + 2))) - 1) + x) * (1 + 2)) * 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (* 2 (+ 2 (* 2 (+ x x)))) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (+ (+ (- (* (+ 1 x) (v0 x)) 1) x) x) (+ 2 2)))))
(assert (forall ((x Int)) (= (f1 x) (* (* x x) x))))
(assert (= g1 1))
(assert (= h1 (+ 1 2)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (fast x) (* (* (+ (- (* (+ 1 (+ x x)) (* (+ 1 x) v1)) 1) x) (+ 1 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)