;; sequence(s): A26226
;; terms: 1 7 16 19 25 34 43 46 52 55 61 70 73 79 88 97 100 106 115 124
;; small program: (compr((loop(if (x mod (1 + 2)) <= 0 then (x div (1 + 2)) else x, x, x - 1) mod (1 + 2)) mod 2, 1 + x) * (1 + 2)) - 2
;; fast program: (((((loop((((loop((loop(if (x mod (1 + 2)) <= 0 then (x div (1 + 2)) else x, 2, x) mod (1 + 2)) mod 2, 1 - (x mod 2), x) + 1) mod 2) + 1) + x, x, 1) * 2) div 2) * (1 + 2)) div 2) * (1 + 2)) - 2
(set-logic UFNIA)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun t0 (Int) Int)
(declare-fun u0 (Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 () Int)
(declare-fun h4 (Int) Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (ite (<= (mod x (+ 1 2)) 0) (div x (+ 1 2)) x))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (forall ((x Int)) (= (h1 x) (- x 1))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (f0 x) (mod (mod (v1 x) (+ 1 2)) 2))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (forall ((x Int)) (= (t0 x) (ite (<= (f0 x) 0) x (t0 (+ x 1))))))
(assert (forall ((x Int)) (= (u0 x) (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x)))))
(assert (forall ((x Int)) (= (small x) (- (* (v0 x) (+ 1 2)) 2))))
(assert (forall ((x Int)) (= (f4 x) (ite (<= (mod x (+ 1 2)) 0) (div x (+ 1 2)) x))))
(assert (= g4 2))
(assert (forall ((x Int)) (= (h4 x) x)))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 g4 (h4 x)))))
(assert (forall ((x Int)) (= (f3 x) (mod (mod (v4 x) (+ 1 2)) 2))))
(assert (forall ((x Int)) (= (g3 x) (- 1 (mod x 2)))))
(assert (forall ((x Int)) (= (h3 x) x)))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) (h3 x)))))
(assert (forall ((x Int)) (= (f2 x) (+ (+ (mod (+ (v3 x) 1) 2) 1) x))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (fast x) (- (* (div (* (div (* (v2 x) 2) 2) (+ 1 2)) 2) (+ 1 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
