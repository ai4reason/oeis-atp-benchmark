;; sequence(s): A350042
;; terms: 0 0 0 3 4 10 18 28 40 63 80 110 144 182 224 285 336 408 486 570
;; small program: (loop((y div 2) + x, x, 1) div (1 + 2)) * x
;; fast program: ((1 + (2 + (x * x))) div (2 * (2 + (2 + 2)))) * x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div y 2) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (div (v0 x) (+ 1 2)) x))))
(assert (forall ((x Int)) (= (fast x) (* (div (+ 1 (+ 2 (* x x))) (* 2 (+ 2 (+ 2 2)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)