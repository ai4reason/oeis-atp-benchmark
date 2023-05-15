;; sequence(s): A59135
;; terms: 11 54 161 396 887 1890 3917 7992 16163 32526 65273 130788 261839 523962 1048229
;; small program: ((((((loop(2 * (x + y), 1 + x, 0) * 2) - 1) - x) * 2) * 2) - 1) - x
;; fast program: (((((((((((2 * loop(x + x, x, 2)) - 1) - 2) - x) * 2) * 2) - 1) - x) * 2) * 2) - 1) - x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* 2 (+ x y)))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (- (* (* (- (- (* (v0 x) 2) 1) x) 2) 2) 1) x))))
(assert (forall ((x Int)) (= (f1 x) (+ x x))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (- (- (* (* (- (- (* (* (- (- (- (* 2 (v1 x)) 1) 2) x) 2) 2) 1) x) 2) 2) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)