;; sequence(s): A313026
;; terms: 1 4 9 14 18 22 26 31 36 40 44 49 54 58 62 66 71 76 80 84
;; small program: ((loop((((((x * x) - x) mod (1 + (2 + (2 * (2 + 2))))) mod 2) + 1) + x, x + x, 1) - 1) + x) + (if x <= 0 then 1 else x)
;; fast program: (((loop((if ((((x * x) mod (1 + (2 * (2 + (2 + 2))))) mod (1 + (2 + 2))) - 2) <= 0 then 1 else 2) + x, x - 1, 2) - 1) + x) + x) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ (mod (mod (- (* x x) x) (+ 1 (+ 2 (* 2 (+ 2 2))))) 2) 1) x))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (- (v0 x) 1) x) (ite (<= x 0) 1 x)))))
(assert (forall ((x Int)) (= (f1 x) (+ (ite (<= (- (mod (mod (* x x) (+ 1 (* 2 (+ 2 (+ 2 2))))) (+ 1 (+ 2 2))) 2) 0) 1 2) x))))
(assert (forall ((x Int)) (= (g1 x) (- x 1))))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (- (v1 x) 1) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
