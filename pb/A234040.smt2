;; sequence(s): A234040
;; terms: 1 1 5 7 42 66 429 715 4862 8398 58786 104006 742900 1337220 9694845 17678835 129644790 238819350 1767263190 3282060210
;; small program: loop((((1 + 2) * (x * y)) div (2 + y)) + x, x, 1) div (1 + (x mod 2))
;; fast program: (loop(2 * (((x div y) + x) + x), x, 2 - (x mod 2)) div (1 + x)) div (2 + x)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (div (* (+ 1 2) (* x y)) (+ 2 y)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (div (v0 x) (+ 1 (mod x 2))))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* 2 (+ (+ (div x y) x) x)))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (forall ((x Int)) (= (h1 x) (- 2 (mod x 2)))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (div (div (v1 x) (+ 1 x)) (+ 2 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
