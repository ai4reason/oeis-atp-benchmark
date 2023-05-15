;; sequence(s): A314828
;; terms: 1 5 9 14 18 22 26 31 35 40 45 49 54 58 62 66 71 75 80 85
;; small program: loop((loop(((((x div (2 * (2 + 2))) - (x mod 2)) - 2) mod (1 + (2 + 2))) + 1, 2, x) + 1) + x, x, 1)
;; fast program: (((((((((((loop((loop(((((x * x) div (2 * (2 + (2 + 2)))) mod 2) + 1) + x, x, 1) - x) - x, 2, x) + 1) + x) + x) + x) + x) - (if x <= 0 then 1 else 2)) + x) + x) div (1 + 2)) + 1) + x) + x
(set-logic UFNIA)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (+ (mod (- (- (div x (* 2 (+ 2 2))) (mod x 2)) 2) (+ 1 (+ 2 2))) 1))))
(assert (= g1 2))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (f0 x) (+ (+ (v1 x) 1) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f3 x) (+ (+ (mod (div (* x x) (* 2 (+ 2 (+ 2 2)))) 2) 1) x))))
(assert (forall ((x Int)) (= (g3 x) x)))
(assert (= h3 1))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int)) (= (f2 x) (- (- (v3 x) x) x))))
(assert (= g2 2))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (div (+ (+ (- (+ (+ (+ (+ (+ (v2 x) 1) x) x) x) x) (ite (<= x 0) 1 2)) x) x) (+ 1 2)) 1) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
