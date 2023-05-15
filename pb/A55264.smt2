;; sequence(s): A55264
;; terms: 0 1 3 6 9 10 12 15 18 19 21 24 27 28 30 33 36 37 39 42
;; small program: loop((x div 2) + (x div y), 1 + 2, x) + x
;; fast program: ((((1 + x) div (2 + 2)) - (if (x mod (2 + 2)) <= 0 then 0 else 1)) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div x 2) (div x y)))))
(assert (= g0 (+ 1 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (- (div (+ 1 x) (+ 2 2)) (ite (<= (mod x (+ 2 2)) 0) 0 1)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
