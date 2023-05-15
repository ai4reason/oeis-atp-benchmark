;; sequence(s): A86325
;; terms: 0 2 6 36 220 1590 12978 118664 1201464 13349610 161530270 2114578092 29780308116 448995414686 7215997736010 123153028027920 2224451568754288 42395429898611154 850263899633257014 17900292623858042420
;; small program: loop(((((y mod 2) + x) div y) + x) * y, x, 0) * (1 + x)
;; fast program: ((loop(((x - (y mod 2)) * y) + x, x, 1) div (if x <= 0 then 1 else x)) * (1 + x)) * x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ (div (+ (mod y 2) x) y) x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (v0 x) (+ 1 x)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (* (- x (mod y 2)) y) x))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (* (* (div (v1 x) (ite (<= x 0) 1 x)) (+ 1 x)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)