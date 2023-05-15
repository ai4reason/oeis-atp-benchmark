;; sequence(s): A227380
;; terms: 0 2 2 3 8 10 6 7 16 18 10 11 24 26 14 15 32 34 18 19
;; small program: (2 - ((x div 2) mod 2)) * x
;; fast program: loop(0, (x mod (2 + 2)) - 1, x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (- 2 (mod (div x 2) 2)) x))))
(assert (= f0 0))
(assert (forall ((x Int)) (= (g0 x) (- (mod x (+ 2 2)) 1))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (v0 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
