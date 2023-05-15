;; sequence(s): A190346
;; terms: 4 10 14 20 24 30 35 40 45 50 55 60 65 71 75 81 85 91 96 101
;; small program: ((((((loop(x * x, 1, 2 * (2 + (2 + 2))) - 2) * (1 + x)) div ((2 * loop(x * x, 2, 2)) - 1)) * 2) + 1) + x) div 2
;; fast program: ((((((loop(x * x, 1, 2 * (2 + (2 + 2))) - 2) * (1 + x)) div ((2 * (2 * (2 * (2 + 2)))) - 1)) * 2) + 1) + x) div 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 () Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 1))
(assert (= h0 (* 2 (+ 2 (+ 2 2)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (small x) (div (+ (+ (* (div (* (- v0 2) (+ 1 x)) (- (* 2 v1) 1)) 2) 1) x) 2))))
(assert (forall ((x Int)) (= (f2 x) (* x x))))
(assert (= g2 1))
(assert (= h2 (* 2 (+ 2 (+ 2 2)))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (= v2 (u2 g2 h2)))
(assert (forall ((x Int)) (= (fast x) (div (+ (+ (* (div (* (- v2 2) (+ 1 x)) (- (* 2 (* 2 (* 2 (+ 2 2)))) 1)) 2) 1) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)