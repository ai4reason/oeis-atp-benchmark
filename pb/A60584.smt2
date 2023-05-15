;; sequence(s): A60584
;; terms: 0 1 1 1 0 1 1 1 0 0 1 1 1 0 1 1 1 0 0 1
;; small program: loop(1 + ((x div (1 + 2)) - x), 2, x) mod 2
;; fast program: if (((x div (1 + 2)) - x) mod (1 + 2)) <= 0 then 0 else 1
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (- (div x (+ 1 2)) x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (mod (v0 x) 2))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (mod (- (div x (+ 1 2)) x) (+ 1 2)) 0) 0 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
