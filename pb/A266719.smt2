;; sequence(s): A266719
;; terms: 1 0 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1
;; small program: ((if (x - 2) <= 0 then 1 else 0) + x) mod 2
;; fast program: loop(y, 1 + (2 - x), x) mod 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (mod (+ (ite (<= (- x 2) 0) 1 0) x) 2))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) y)))
(assert (forall ((x Int)) (= (g0 x) (+ 1 (- 2 x)))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (mod (v0 x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
