;; sequence(s): A174012
;; terms: 0 6 3 18 6 30 9 42 12 54 15 66 18 78 21 90 24 102 27 114
;; small program: (1 + 2) * (if (x mod 2) <= 0 then (x div 2) else (x + x))
;; fast program: loop(2 + (2 * (x + x)), x mod 2, (x div 2) + x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (+ 1 2) (ite (<= (mod x 2) 0) (div x 2) (+ x x))))))
(assert (forall ((x Int)) (= (f0 x) (+ 2 (* 2 (+ x x))))))
(assert (forall ((x Int)) (= (g0 x) (mod x 2))))
(assert (forall ((x Int)) (= (h0 x) (+ (div x 2) x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (v0 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
