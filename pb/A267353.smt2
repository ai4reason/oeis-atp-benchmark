;; sequence(s): A267353
;; terms: 1 3 6 12 15 25 28 42 45 63 66 88 91 117 120 150 153 187 190 228
;; small program: (if (x mod 2) <= 0 then 1 else x) + loop(x + y, x, x)
;; fast program: ((((x * x) + x) div 2) + (if (x mod 2) <= 0 then 1 else x)) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (ite (<= (mod x 2) 0) 1 x) (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (* x x) x) 2) (ite (<= (mod x 2) 0) 1 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
