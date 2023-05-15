;; sequence(s): A202
;; terms: 1 3 4 6 8 9 11 12 14 16 17 19 21 22 24 25 27 29 30 32
;; small program: ((loop(2 + (x div 2), 2, x) + x) div 2) + x
;; fast program: 1 + ((x - ((x - (x div (2 + 2))) div 2)) + x)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 2 (div x 2)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (div (+ (v0 x) x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (- x (div (- x (div x (+ 2 2))) 2)) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
