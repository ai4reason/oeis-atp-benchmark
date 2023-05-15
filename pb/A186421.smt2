;; sequence(s): A186421
;; terms: 0 1 2 1 4 3 6 3 8 5 10 5 12 7 14 7 16 9 18 9
;; small program: if (x mod 2) <= 0 then x else (1 + (2 * ((x div 2) div 2)))
;; fast program: loop(1 + (2 * (x div (2 + 2))), x mod 2, x)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (ite (<= (mod x 2) 0) x (+ 1 (* 2 (div (div x 2) 2)))))))
(assert (forall ((x Int)) (= (f0 x) (+ 1 (* 2 (div x (+ 2 2)))))))
(assert (forall ((x Int)) (= (g0 x) (mod x 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (v0 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)