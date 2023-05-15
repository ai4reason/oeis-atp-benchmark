;; sequence(s): A313781
;; terms: 1 5 10 15 21 26 31 36 41 47 52 57 62 67 72 77 83 88 93 98
;; small program: (((((((((2 * (x + x)) - ((x div 2) mod 2)) div (1 + 2)) + 1) + x) div (if x <= 0 then 1 else 2)) + x) + x) + x) + x
;; fast program: ((((((((1 + (loop(0, (x mod (2 + 2)) - 2, 2) + x)) div (1 + 2)) + x) + x) div (if x <= 0 then 1 else 2)) + x) + x) + x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (div (+ (+ (div (- (* 2 (+ x x)) (mod (div x 2) 2)) (+ 1 2)) 1) x) (ite (<= x 0) 1 2)) x) x) x) x))))
(assert (= f0 0))
(assert (forall ((x Int)) (= (g0 x) (- (mod x (+ 2 2)) 2))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (div (+ (+ (div (+ 1 (+ (v0 x) x)) (+ 1 2)) x) x) (ite (<= x 0) 1 2)) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
