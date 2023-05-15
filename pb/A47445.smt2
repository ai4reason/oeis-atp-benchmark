;; sequence(s): A47445
;; terms: 1 3 5 6 9 11 13 14 17 19 21 22 25 27 29 30 33 35 37 38
;; small program: 1 + ((x - (((x div 2) * x) mod 2)) + x)
;; fast program: (loop(0, (x mod (2 + 2)) - 2, 1) + x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (- x (mod (* (div x 2) x) 2)) x)))))
(assert (= f0 0))
(assert (forall ((x Int)) (= (g0 x) (- (mod x (+ 2 2)) 2))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (v0 x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
