;; sequence(s): A313894
;; terms: 1 5 10 16 21 27 32 38 43 48 53 58 64 69 75 80 86 91 96 101
;; small program: loop((((((loop((y div (1 + 2)) + x, x, x) mod 2) + 2) mod (1 + x)) + 2) + 1) + x, x, 1)
;; fast program: ((((((((((((((((((x * x) * x) * x) * x) mod (1 + (2 * (2 + 2)))) + 1) mod 2) + 1) + x) + x) + x) * 2) + 1) + x) div (1 + 2)) + x) + x) - (if x <= 0 then 0 else 1)) + x
(set-logic UFNIA)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (div y (+ 1 2)) x))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (f0 x) (+ (+ (+ (mod (+ (mod (v1 x) 2) 2) (+ 1 x)) 2) 1) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (- (+ (+ (div (+ (+ (* (+ (+ (+ (+ (mod (+ (mod (* (* (* (* x x) x) x) x) (+ 1 (* 2 (+ 2 2)))) 1) 2) 1) x) x) x) 2) 1) x) (+ 1 2)) x) x) (ite (<= x 0) 0 1)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)