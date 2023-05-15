;; sequence(s): A11746
;; terms: 1 0 0 0 0 1 0 1 0 1 1 1 0 1 1 0 0 0 1 1
;; small program: loop(((((loop(x * x, 2, x) * x) mod ((2 * loop(x * x, 2, 2)) - 1)) - 2) mod (1 + (2 * (2 + 2)))) - 1, 2, x) mod 2
;; fast program: loop((((((((x * x) * x) * x) * x) mod ((2 * (2 * (2 * (2 + 2)))) - 1)) - 2) mod (1 + (2 * (2 + 2)))) - 1, 2, x) mod 2
(set-logic UFNIA)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 () Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 () Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 2))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (f2 x) (* x x))))
(assert (= g2 2))
(assert (= h2 2))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (= v2 (u2 g2 h2)))
(assert (forall ((x Int)) (= (f0 x) (- (mod (- (mod (* (v1 x) x) (- (* 2 v2) 1)) 2) (+ 1 (* 2 (+ 2 2)))) 1))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (mod (v0 x) 2))))
(assert (forall ((x Int)) (= (f3 x) (- (mod (- (mod (* (* (* (* x x) x) x) x) (- (* 2 (* 2 (* 2 (+ 2 2)))) 1)) 2) (+ 1 (* 2 (+ 2 2)))) 1))))
(assert (= g3 2))
(assert (forall ((x Int)) (= (h3 x) x)))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 g3 (h3 x)))))
(assert (forall ((x Int)) (= (fast x) (mod (v3 x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
