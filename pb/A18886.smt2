;; sequence(s): A18886
;; terms: 1 7 23 79 223 703 2175 6399 19455 58367 176127 528383 1589247 4767743 14319615 42991615 129105919 387186687 1161822207 3486515199
;; small program: (loop(x div 2, x, loop(1 + ((x + x) + x), x, 1)) * loop(x + x, x, 2)) - 1
;; fast program: ((((1 + 2) * loop2(x * y, y, x div 2, loop(1 + 2, x mod 2, 1), 1 + (2 * (2 + 2)))) div loop(x + x, x, 2)) * loop(x + x, x, 2)) - 1
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f3 (Int Int) Int)
(declare-fun g3 (Int Int) Int)
(declare-fun h3 (Int) Int)
(declare-fun f4 () Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun i3 (Int) Int)
(declare-fun j3 () Int)
(declare-fun u3 (Int Int Int) Int)
(declare-fun v3 (Int Int Int) Int)
(declare-fun w3 (Int) Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 (Int) Int)
(declare-fun h5 () Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun f6 (Int) Int)
(declare-fun g6 (Int) Int)
(declare-fun h6 () Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (div x 2))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (f1 x) (+ 1 (+ (+ x x) x)))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (h0 x) (v1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (f2 x) (+ x x))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (= h2 2))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (small x) (- (* (v0 x) (v2 x)) 1))))
(assert (forall ((x Int) (y Int)) (= (f3 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g3 x y) y)))
(assert (forall ((x Int)) (= (h3 x) (div x 2))))
(assert (= f4 (+ 1 2)))
(assert (forall ((x Int)) (= (g4 x) (mod x 2))))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y f4))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (i3 x) (v4 x))))
(assert (= j3 (+ 1 (* 2 (+ 2 2)))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u3 x y z) (ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v3 x y z) (ite (<= x 0) z (g3 (u3 (- x 1) y z) (v3 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w3 x) (u3 (h3 x) (i3 x) j3))))
(assert (forall ((x Int)) (= (f5 x) (+ x x))))
(assert (forall ((x Int)) (= (g5 x) x)))
(assert (= h5 2))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int)) (= (v5 x) (u5 (g5 x) h5))))
(assert (forall ((x Int)) (= (f6 x) (+ x x))))
(assert (forall ((x Int)) (= (g6 x) x)))
(assert (= h6 2))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y))))))
(assert (forall ((x Int)) (= (v6 x) (u6 (g6 x) h6))))
(assert (forall ((x Int)) (= (fast x) (- (* (div (* (+ 1 2) (w3 x)) (v5 x)) (v6 x)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
