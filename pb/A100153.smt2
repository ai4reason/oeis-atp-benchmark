;; sequence(s): A100153
;; terms: 1 60 276 748 1575 2856 4690 7176 10413 14500 19536 25620 32851 41328 51150 62416 75225 89676 105868 123900
;; small program: (((1 + (loop((2 + y) * x, 2, x) - x)) * (2 + ((x + x) + x))) div 2) * (1 + x)
;; fast program: (1 + ((2 * ((2 * (x + x)) + x)) + x)) * (((1 + x) * (2 + ((x + x) + x))) div 2)
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ 2 y) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (div (* (+ 1 (- (v0 x) x)) (+ 2 (+ (+ x x) x))) 2) (+ 1 x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (+ (* 2 (+ (* 2 (+ x x)) x)) x)) (div (* (+ 1 x) (+ 2 (+ (+ x x) x))) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)