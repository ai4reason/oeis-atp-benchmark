;; sequence(s): A313569
;; terms: 1 5 10 14 19 24 29 34 39 44 48 53 58 63 68 72 77 82 87 92
;; small program: (((((1 + ((((x - ((x div 2) mod 2)) + x) div (1 + 2)) + x)) div (if x <= 0 then 1 else 2)) + x) + x) + x) + x
;; fast program: ((((((((loop(x - 1, (x mod (2 + 2)) - 2, x) + x) div (1 + 2)) + 1) + x) div (if x <= 0 then 1 else 2)) + x) + x) + x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (div (+ 1 (+ (div (+ (- x (mod (div x 2) 2)) x) (+ 1 2)) x)) (ite (<= x 0) 1 2)) x) x) x) x))))
(assert (forall ((x Int)) (= (f0 x) (- x 1))))
(assert (forall ((x Int)) (= (g0 x) (- (mod x (+ 2 2)) 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (+ (div (+ (+ (div (+ (v0 x) x) (+ 1 2)) 1) x) (ite (<= x 0) 1 2)) x) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
