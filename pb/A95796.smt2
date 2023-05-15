;; sequence(s): A95796
;; terms: 1 26 98 238 467 806 1276 1898 2693 3682 4886 6326 8023 9998 12272 14866 17801 21098 24778 28862
;; small program: (((1 + ((2 * (2 + ((x + x) + x))) + x)) * loop(x + y, x, x)) + 1) + x
;; fast program: (((1 + ((2 * (2 + ((x + x) + x))) + x)) * ((((x * x) + x) div 2) + x)) + 1) + x
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
(assert (forall ((x Int)) (= (small x) (+ (+ (* (+ 1 (+ (* 2 (+ 2 (+ (+ x x) x))) x)) (v0 x)) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ 1 (+ (* 2 (+ 2 (+ (+ x x) x))) x)) (+ (div (+ (* x x) x) 2) x)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
