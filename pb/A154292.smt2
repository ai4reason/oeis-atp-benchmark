;; sequence(s): A154292
;; terms: 11 13 46 50 105 111 188 196 295 305 426 438 581 595 760 776 963 981 1190 1210
;; small program: loop((((((y mod 2) * (1 + (2 + 2))) * 2) * y) + x) + y, 1 + x, 0)
;; fast program: (1 + (2 + (2 * ((2 * ((2 - (x mod 2)) + x)) + x)))) * (1 + (x div 2))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (* (* (* (mod y 2) (+ 1 (+ 2 2))) 2) y) x) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (+ 2 (* 2 (+ (* 2 (+ (- 2 (mod x 2)) x)) x)))) (+ 1 (div x 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)