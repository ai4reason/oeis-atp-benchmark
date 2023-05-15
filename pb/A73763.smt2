;; sequence(s): A73763
;; terms: 24 48 96 120 168 192 240 264 312 336 384 408 456 480 528 552 600 624 672 696
;; small program: loop(x * y, 2 + 2, 1 + ((x div 2) + x))
;; fast program: 2 * (2 * (2 * ((1 + 2) * (1 + ((x div 2) + x)))))
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
(assert (forall ((x Int)) (= (h0 x) (+ 1 (+ (div x 2) x)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (* 2 (* 2 (* 2 (* (+ 1 2) (+ 1 (+ (div x 2) x)))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
