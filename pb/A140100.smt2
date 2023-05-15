;; sequence(s): A140100
;; terms: 1 3 4 6 7 9 10 12 14 15 17 18 20 21 23 24 26 27 29 30
;; small program: ((((((1 + ((2 - (x mod (2 + 2))) + x)) div loop(1 + (x + x), 2, 2)) + 1) + x) div 2) + 1) + x
;; fast program: ((((((1 + ((2 - (x mod (2 + 2))) + x)) div (1 + (2 + (2 * (2 + 2))))) + 1) + x) div 2) + 1) + x
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
(assert (forall ((x Int)) (= (small x) (+ (+ (div (+ (+ (div (+ 1 (+ (- 2 (mod x (+ 2 2))) x)) v0) 1) x) 2) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (+ (div (+ 1 (+ (- 2 (mod x (+ 2 2))) x)) (+ 1 (+ 2 (* 2 (+ 2 2))))) 1) x) 2) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
