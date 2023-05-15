;; sequence(s): A47510
;; terms: 2 4 6 7 10 12 14 15 18 20 22 23 26 28 30 31 34 36 38 39
;; small program: 2 + ((x - (((x div 2) * x) mod 2)) + x)
;; fast program: (loop(1, (x mod (2 + 2)) - 2, 2) + x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 2 (+ (- x (mod (* (div x 2) x) 2)) x)))))
(assert (= f0 1))
(assert (forall ((x Int)) (= (g0 x) (- (mod x (+ 2 2)) 2))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (v0 x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)