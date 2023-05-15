;; sequence(s): A16084
;; terms: 5 10 11 13 17 25 32 37 38 40 44 52 59 64 65 67 71 79 86 91
;; small program: loop((x mod (1 + (2 * (2 + 2)))) + x, 1 + x, 0 - 2)
;; fast program: (((((((2 - ((loop(2, x mod 2, x) + x) mod (1 + 2))) + x) * 2) + 1) + x) * (1 + 2)) div 2) - 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 () Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (mod x (+ 1 (* 2 (+ 2 2)))) x))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 (- 0 2)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (= f1 2))
(assert (forall ((x Int)) (= (g1 x) (mod x 2))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y f1))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (- (div (* (+ (+ (* (+ (- 2 (mod (+ (v1 x) x) (+ 1 2))) x) 2) 1) x) (+ 1 2)) 2) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)