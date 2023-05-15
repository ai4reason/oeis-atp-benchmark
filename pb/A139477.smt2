;; sequence(s): A139477
;; terms: 1 3 6 8 11 13 16 18 21 23 26 29 31 34 36 39 41 44 46 49
;; small program: ((((((1 + (x + x)) div loop(1 + (2 * (2 + x)), 2, 2)) + x) div 2) + 1) + x) + x
;; fast program: 1 + ((((((1 + (x + x)) div ((2 * (2 * (2 + (2 + 2)))) - 1)) + x) div 2) + x) + x)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (* 2 (+ 2 x))))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (div (+ (div (+ 1 (+ x x)) v0) x) 2) 1) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (+ (div (+ (div (+ 1 (+ x x)) (- (* 2 (* 2 (+ 2 (+ 2 2)))) 1)) x) 2) x) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
