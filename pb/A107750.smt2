;; sequence(s): A107750
;; terms: 0 1 2 3 4 5 7 8 9 11 12 13 15 16 17 19 20 21 23 24
;; small program: (loop(y, x div (1 + 2), 1) - 1) + x
;; fast program: ((x div (1 + 2)) - (if (x - 2) <= 0 then 0 else 1)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) y)))
(assert (forall ((x Int)) (= (g0 x) (div x (+ 1 2)))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (- (v0 x) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- (div x (+ 1 2)) (ite (<= (- x 2) 0) 0 1)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
