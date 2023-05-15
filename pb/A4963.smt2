;; sequence(s): A4963
;; terms: 0 47 94 141 188 235 282 329 376 423 470 517 564 611 658 705 752 799 846 893
;; small program: (2 * loop(x * y, 2 + 2, x)) - x
;; fast program: (2 * (2 * (2 * (2 * ((x + x) + x))))) - x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* x y))))
(assert (= g0 (+ 2 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (* 2 (v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (- (* 2 (* 2 (* 2 (* 2 (+ (+ x x) x))))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
