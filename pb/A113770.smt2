;; sequence(s): A113770
;; terms: 1 10 26 42 58 74 90 106 122 138 154 170 186 202 218 234 250 266 282 298
;; small program: if x <= 0 then 1 else loop(2 - (2 * (x + x)), 2, x)
;; fast program: (((x - 1) + x) * (if x <= 0 then 1 else (2 * (2 + 2)))) + 2
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (- 2 (* 2 (+ x x))))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (ite (<= x 0) 1 (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ (- x 1) x) (ite (<= x 0) 1 (* 2 (+ 2 2)))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
