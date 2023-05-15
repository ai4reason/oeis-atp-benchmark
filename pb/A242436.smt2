;; sequence(s): A242436
;; terms: 0 ~1 28 237 1016 3115 7764 16793 32752 59031 99980 161029 248808 371267 537796 759345 1048544 1419823 1889532 2476061
;; small program: (loop(x * x, 2, x) - 2) * x
;; fast program: ((((x * x) * x) * x) - 2) * x
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (- (v0 x) 2) x))))
(assert (forall ((x Int)) (= (fast x) (* (- (* (* (* x x) x) x) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
