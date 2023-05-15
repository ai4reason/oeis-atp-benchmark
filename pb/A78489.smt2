;; sequence(s): A78489
;; terms: 2 2 3 4 4 5 6 6 7 7 8 9 9 10 10 11 12 12 13 14
;; small program: loop(((x + y) * y) div (2 + x), 2 + x, 0) - x
;; fast program: (((((((((x div (2 * (2 + 2))) + x) div 2) + x) + x) div (1 + 2)) + 1) + x) div (1 + 2)) + 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (* (+ x y) y) (+ 2 x)))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (+ (div (+ (+ (div (+ (div x (* 2 (+ 2 2))) x) 2) x) x) (+ 1 2)) 1) x) (+ 1 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
