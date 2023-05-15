;; sequence(s): A239086
;; terms: 1 2 3 4 5 6 7 8 9 10 12 11 13 14 15 16 17 18 19 20
;; small program: (((((if x <= 0 then 1 else x) mod loop(1 + (x + x), 2, 2)) - 1) div (1 + (2 * (2 + 2)))) + 1) + x
;; fast program: (((((if x <= 0 then 1 else x) mod (1 + (2 + (2 * (2 + 2))))) - 1) div (1 + (2 * (2 + 2)))) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ x x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (+ (div (- (mod (ite (<= x 0) 1 x) v0) 1) (+ 1 (* 2 (+ 2 2)))) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (- (mod (ite (<= x 0) 1 x) (+ 1 (+ 2 (* 2 (+ 2 2))))) 1) (+ 1 (* 2 (+ 2 2)))) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
