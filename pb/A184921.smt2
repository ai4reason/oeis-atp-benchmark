;; sequence(s): A184921
;; terms: 3 8 13 18 23 27 32 37 42 47 52 56 61 66 71 76 81 85 90 95
;; small program: loop(1 + ((((y * y) div (2 + x)) + y) + y), 2 + (x + x), 0) - 2
;; fast program: ((((1 + 2) * (1 + x)) - ((x - (x div (1 + (2 + (2 + 2))))) div (1 + (2 + 2)))) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (+ (+ (div (* y y) (+ 2 x)) y) y)))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 (+ x x)))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (- (* (+ 1 2) (+ 1 x)) (div (- x (div x (+ 1 (+ 2 (+ 2 2))))) (+ 1 (+ 2 2)))) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
