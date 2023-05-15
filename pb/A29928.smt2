;; sequence(s): A29928
;; terms: 0 1 2 3 3 4 5 6 7 8 9 10 10 11 12 13 14 15 16 17
;; small program: (((1 - ((loop(x div (1 + (2 + y)), 2, x) + x) div 2)) div 2) div 2) + x
;; fast program: ((x + x) - (((x div (2 * (2 + (2 * (2 + 2))))) + x) div (2 + 2))) div 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div x (+ 1 (+ 2 y))))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (div (div (- 1 (div (+ (v0 x) x) 2)) 2) 2) x))))
(assert (forall ((x Int)) (= (fast x) (div (- (+ x x) (div (+ (div x (* 2 (+ 2 (* 2 (+ 2 2))))) x) (+ 2 2))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
