;; sequence(s): A329846
;; terms: 2 4 7 9 12 14 17 19 22 24 27 29 32 34 37 39 42 44 47 49
;; small program: 2 + ((((x - (x div (1 + loop(2 * (2 + x), 2, 2)))) div 2) + x) + x)
;; fast program: 2 + ((((x - (x div (1 + (2 * (2 + (2 * (2 + 2))))))) div 2) + x) + x)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* 2 (+ 2 x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ 2 (+ (+ (div (- x (div x (+ 1 v0))) 2) x) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (+ (+ (div (- x (div x (+ 1 (* 2 (+ 2 (* 2 (+ 2 2))))))) 2) x) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
