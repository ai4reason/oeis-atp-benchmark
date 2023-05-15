;; sequence(s): A144619
;; terms: 8 27 46 65 84 103 122 141 160 179 198 217 236 255 274 293 312 331 350 369
;; small program: (2 * loop(1 + ((x + x) + x), 2, x)) + x
;; fast program: (2 * ((2 * (2 + (2 * (x + x)))) + x)) + x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ (+ x x) x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* 2 (v0 x)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (+ (* 2 (+ 2 (* 2 (+ x x)))) x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
