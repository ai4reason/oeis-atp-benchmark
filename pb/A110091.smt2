;; sequence(s): A110091
;; terms: 1 1 1 3 1 3 5 1 5 7 1 7 9 1 9 11 1 11 13 1
;; small program: loop(2 + ((y div ((x div 2) + x)) * x), x, 2) - 1
;; fast program: (((if ((2 + x) mod (1 + 2)) <= 0 then 0 else x) div (1 + 2)) * 2) + 1
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (* (div y (+ (div x 2) x)) x)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (* (div (ite (<= (mod (+ 2 x) (+ 1 2)) 0) 0 x) (+ 1 2)) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
