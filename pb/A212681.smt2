;; sequence(s): A212681
;; terms: 0 0 4 24 88 230 504 966 1696 2772 4300 6380 9144 12714 17248 22890 29824 38216 48276 60192
;; small program: loop((((y * y) * y) - x) + y, x - 1, 0) * x
;; fast program: ((((1 + (x + x)) * ((x - 2) * x)) div (2 + 2)) + x) * x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (- (* (* y y) y) x) y))))
(assert (forall ((x Int)) (= (g0 x) (- x 1))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (* (+ (div (* (+ 1 (+ x x)) (* (- x 2) x)) (+ 2 2)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
