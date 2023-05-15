;; sequence(s): A306285
;; terms: 4 21 30 47 56 73 82 99 108 125 134 151 160 177 186 203 212 229 238 255
;; small program: (loop(((2 + y) * (x div y)) + y, 2, x) * 2) + x
;; fast program: (2 * (2 + (2 * ((((x mod 2) + x) + x) + x)))) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (+ 2 y) (div x y)) y))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (v0 x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (+ 2 (* 2 (+ (+ (+ (mod x 2) x) x) x)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
