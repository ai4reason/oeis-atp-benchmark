;; sequence(s): A341744
;; terms: 1 2 4 5 5 6 8 9 9 10 12 13 13 14 16 17 17 18 20 21
;; small program: 1 + (((x div 2) mod 2) + x)
;; fast program: loop(2, (x mod (2 + 2)) - 1, 1) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (mod (div x 2) 2) x)))))
(assert (= f0 2))
(assert (forall ((x Int)) (= (g0 x) (- (mod x (+ 2 2)) 1))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (+ (v0 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
