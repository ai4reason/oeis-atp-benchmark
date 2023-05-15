;; sequence(s): A160511
;; terms: 1 2 3 3 4 4 5 6 6 7 7 8 9 9 10 11 11 12 13 13
;; small program: ((((((x - 2) - ((x div (1 + 2)) mod 2)) div 2) div 2) + x) div 2) + 2
;; fast program: (((((loop(y, x mod (1 + 2), 2) + x) div (2 + 2)) + 1) + x) div 2) + 1
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (+ (div (div (- (- x 2) (mod (div x (+ 1 2)) 2)) 2) 2) x) 2) 2))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) y)))
(assert (forall ((x Int)) (= (g0 x) (mod x (+ 1 2)))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (+ (div (+ (+ (div (+ (v0 x) x) (+ 2 2)) 1) x) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
