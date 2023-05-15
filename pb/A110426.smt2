;; sequence(s): A110426
;; terms: 1 3 3 ~5 ~30 ~84 ~182 ~342 ~585 ~935 ~1419 ~2067 ~2912 ~3990 ~5340 ~7004 ~9027 ~11457 ~14345 ~17745
;; small program: loop(y - (((x * x) + x) div 2), 2, x) + x
;; fast program: ((((1 + (2 + x)) * ((1 + x) * ((2 - x) * x))) div (2 * (2 + 2))) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- y (div (+ (* x x) x) 2)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (* (+ 1 (+ 2 x)) (* (+ 1 x) (* (- 2 x) x))) (* 2 (+ 2 2))) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
