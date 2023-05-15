;; sequence(s): A266491
;; terms: 0 1 4 6 4 5 12 14 8 9 20 22 12 13 28 30 16 17 36 38
;; small program: (((x div 2) mod 2) * x) + x
;; fast program: loop(2, (x mod (2 + 2)) - 1, 1) * x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* (mod (div x 2) 2) x) x))))
(assert (= f0 2))
(assert (forall ((x Int)) (= (g0 x) (- (mod x (+ 2 2)) 1))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (* (v0 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
