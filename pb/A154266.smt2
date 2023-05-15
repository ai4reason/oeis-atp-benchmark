;; sequence(s): A154266
;; terms: 12 39 66 93 120 147 174 201 228 255 282 309 336 363 390 417 444 471 498 525
;; small program: loop(1 + ((x + x) + x), 1 + 2, x) - 1
;; fast program: (1 + 2) * ((2 * (2 + (2 * (x + x)))) + x)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ (+ x x) x)))))
(assert (= g0 (+ 1 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) 1))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 2) (+ (* 2 (+ 2 (* 2 (+ x x)))) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
