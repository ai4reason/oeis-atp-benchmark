;; sequence(s): A81841
;; terms: 0 2 4 7 9 11 14 16 19 21 24 26 28 31 33 36 38 40 43 45
;; small program: (loop(((y * y) + x) div ((x + y) + y), x - 1, 0) + x) + x
;; fast program: ((((((((((((((((((((((((((((x div 2) + x) + x) div (1 + 2)) + x) + x) div (2 + 1)) + 1) + x) div 2) div 2) + 1) + x) + x) + x) + x) + x) + x) + x) + x) + x) + x) + x) + x) - (if x <= 0 then 1 else 2)) + x) + x) div (2 + 1)) div 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (+ (* y y) x) (+ (+ x y) y)))))
(assert (forall ((x Int)) (= (g0 x) (- x 1))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (v0 x) x) x))))
(assert (forall ((x Int)) (= (fast x) (div (div (+ (+ (- (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (div (div (+ (+ (div (+ (+ (div (+ (+ (div x 2) x) x) (+ 1 2)) x) x) (+ 2 1)) 1) x) 2) 2) 1) x) x) x) x) x) x) x) x) x) x) x) x) (ite (<= x 0) 1 2)) x) x) (+ 2 1)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
