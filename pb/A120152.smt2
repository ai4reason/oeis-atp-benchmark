;; sequence(s): A120152
;; terms: 6 8 11 14 19 25 34 45 60 80 107 142 190 253 337 450 600 800 1066 1422
;; small program: (loop((x div (1 + 2)) + x, x, 1 + loop((2 + y) * x, 2, 2)) div 2) div 2
;; fast program: loop((x div (1 + 2)) + x, x, 1 + (2 + (2 * (2 * (2 + 2))))) div (1 + 2)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (div x (+ 1 2)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* (+ 2 y) x))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (= v1 (u1 g1 h1)))
(assert (= h0 (+ 1 v1)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (div (v0 x) 2) 2))))
(assert (forall ((x Int)) (= (f2 x) (+ (div x (+ 1 2)) x))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (= h2 (+ 1 (+ 2 (* 2 (* 2 (+ 2 2)))))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (fast x) (div (v2 x) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
