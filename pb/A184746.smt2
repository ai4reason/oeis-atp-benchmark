;; sequence(s): A184746
;; terms: 1 3 4 6 7 9 10 12 13 14 16 17 19 20 22 23 25 26 27 29
;; small program: ((loop(2 + (y - (((x div 2) div (1 + 2)) div (1 + 2))), x + x, 2) + 1) + x) div 2
;; fast program: ((1 - ((((2 + (x + x)) div (1 + (2 + (2 * (2 * (2 + 2)))))) + x) div 2)) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (- y (div (div (div x 2) (+ 1 2)) (+ 1 2)))))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (+ (+ (v0 x) 1) x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (- 1 (div (+ (div (+ 2 (+ x x)) (+ 1 (+ 2 (* 2 (* 2 (+ 2 2)))))) x) 2)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
