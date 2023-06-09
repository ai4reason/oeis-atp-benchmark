;; sequence(s): A28253
;; terms: 0 0 1 1 0 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
;; small program: (1 + x) mod loop((y div 2) + x, x, 1)
;; fast program: (1 + x) mod (1 + ((x * x) div (2 + 2)))
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
(assert (forall ((x Int)) (= (small x) (mod (+ 1 x) (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (mod (+ 1 x) (+ 1 (div (* x x) (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
