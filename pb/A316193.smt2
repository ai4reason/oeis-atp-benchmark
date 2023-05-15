;; sequence(s): A316193
;; terms: 0 0 1 0 1 1 3 1 10 5
;; small program: (loop(2 * ((x - (x div y)) + x), (1 + x) div (1 + 2), 1) div (1 + (x mod 2))) div 2
;; fast program: loop(2 * ((x - (x div y)) + x), (1 + x) div (1 + 2), 1) div ((1 + (x mod 2)) * 2)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* 2 (+ (- x (div x y)) x)))))
(assert (forall ((x Int)) (= (g0 x) (div (+ 1 x) (+ 1 2)))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (div (v0 x) (+ 1 (mod x 2))) 2))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* 2 (+ (- x (div x y)) x)))))
(assert (forall ((x Int)) (= (g1 x) (div (+ 1 x) (+ 1 2)))))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (div (v1 x) (* (+ 1 (mod x 2)) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
