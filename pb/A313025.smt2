;; sequence(s): A313025
;; terms: 1 4 9 14 18 22 26 30 35 40 44 48 53 58 62 66 70 74 79 84
;; small program: (((loop((((loop(((1 + (2 + (x + x))) mod (1 + (2 + (2 + 2)))) - 1, 1 - (x mod 2), x) + x) mod 2) + 1) + x, x - 1, 2) - 1) + x) + x) + x
;; fast program: ((((((((((((((((((((((loop((((((y * y) div (2 + (2 * (2 + 2)))) + x) mod 2) + 1) + x, x, 1) + x) * 2) - (if x <= 0 then 1 else 2)) * 2) + 1) + x) div (1 + 2)) + x) + x) * 2) + 1) + x) div (1 + 2)) + x) + x) + x) + x) - (if x <= 0 then 1 else 2)) + x) + x) div (1 + 2)) + 1) + x
(set-logic UFNIA)
(declare-fun f1 (Int) Int)
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
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (- (mod (+ 1 (+ 2 (+ x x))) (+ 1 (+ 2 (+ 2 2)))) 1))))
(assert (forall ((x Int)) (= (g1 x) (- 1 (mod x 2)))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (f0 x) (+ (+ (mod (+ (v1 x) x) 2) 1) x))))
(assert (forall ((x Int)) (= (g0 x) (- x 1))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (- (v0 x) 1) x) x) x))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (+ (+ (mod (+ (div (* y y) (+ 2 (* 2 (+ 2 2)))) x) 2) 1) x))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (+ (- (+ (+ (+ (+ (div (+ (+ (* (+ (+ (div (+ (+ (* (- (* (+ (v2 x) x) 2) (ite (<= x 0) 1 2)) 2) 1) x) (+ 1 2)) x) x) 2) 1) x) (+ 1 2)) x) x) x) x) (ite (<= x 0) 1 2)) x) x) (+ 1 2)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
