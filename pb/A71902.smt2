;; sequence(s): A71902
;; terms: ~1 5 65 306 975 2479 5425 10660 19311 32825 53009 82070 122655 177891 251425 347464 470815 626925 821921 1062650
;; small program: ((loop((y * y) + x, (2 + x) * x, 0) div (1 + x)) - 1) - x
;; fast program: (((1 + (2 * ((2 + x) * x))) * (((1 + x) * ((2 + x) * x)) div (2 + (2 + 2)))) - 1) - x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* y y) x))))
(assert (forall ((x Int)) (= (g0 x) (* (+ 2 x) x))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (- (div (v0 x) (+ 1 x)) 1) x))))
(assert (forall ((x Int)) (= (fast x) (- (- (* (+ 1 (* 2 (* (+ 2 x) x))) (div (* (+ 1 x) (* (+ 2 x) x)) (+ 2 (+ 2 2)))) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
