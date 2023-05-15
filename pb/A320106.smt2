;; sequence(s): A320106
;; terms: 1 0 0 0 1 1 1 0 0 0 1 0 1 0 0 0 1 1 1 0
;; small program: ((if ((x mod (1 + 2)) - 1) <= 0 then 1 else ((x div 2) * x)) + x) mod 2
;; fast program: loop((1 + x) * (x div 2), (x mod (1 + 2)) - 1, 1 + x) mod 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (mod (+ (ite (<= (- (mod x (+ 1 2)) 1) 0) 1 (* (div x 2) x)) x) 2))))
(assert (forall ((x Int)) (= (f0 x) (* (+ 1 x) (div x 2)))))
(assert (forall ((x Int)) (= (g0 x) (- (mod x (+ 1 2)) 1))))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (mod (v0 x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
