;; sequence(s): A299231
;; terms: 1 3 4 6 9 10 13 15 17 19 21 23 25 27 29 31 33 35 37 39
;; small program: ((1 - ((loop(x * y, x - 2, x) div 2) mod 2)) + x) + x
;; fast program: ((if (((x * x) mod (2 * (2 * (2 + 2)))) - x) <= 0 then 1 else 0) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* x y))))
(assert (forall ((x Int)) (= (g0 x) (- x 2))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (- 1 (mod (div (v0 x) 2) 2)) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (ite (<= (- (mod (* x x) (* 2 (* 2 (+ 2 2)))) x) 0) 1 0) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
