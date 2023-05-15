;; sequence(s): A229718
;; terms: 2 4 8 18 26 40 52 70 86 108 128 154 178 208
;; small program: (loop(2 + (x + y), x - 1, x mod 2) * 2) + 2
;; fast program: (((2 * ((x mod 2) + (if x <= 0 then 2 else x))) + (x * x)) + x) - 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (+ x y)))))
(assert (forall ((x Int)) (= (g0 x) (- x 1))))
(assert (forall ((x Int)) (= (h0 x) (mod x 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (v0 x) 2) 2))))
(assert (forall ((x Int)) (= (fast x) (- (+ (+ (* 2 (+ (mod x 2) (ite (<= x 0) 2 x))) (* x x)) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
