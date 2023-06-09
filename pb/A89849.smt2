;; sequence(s): A89849
;; terms: 1 1 2 1 6 2 20 5 70 14 252 42 924 132 3432 429 12870 1430 48620 4862
;; small program: loop((x * y) div (y - (y div 2)), x, 1) div (if (x mod 2) <= 0 then 1 else x)
;; fast program: loop(2 * ((x - (x div y)) + x), x div 2, 1) div (1 + ((x mod 2) * (x div 2)))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (div (* x y) (- y (div y 2))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (v0 x) (ite (<= (mod x 2) 0) 1 x)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* 2 (+ (- x (div x y)) x)))))
(assert (forall ((x Int)) (= (g1 x) (div x 2))))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (div (v1 x) (+ 1 (* (mod x 2) (div x 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
