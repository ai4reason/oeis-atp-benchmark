;; sequence(s): A234904
;; terms: 3 12 18 21 30 36 39 48 54 57 66 72 75 84 90 93 102 108 111 120
;; small program: (1 + 2) * (((if (x mod (1 + 2)) <= 0 then 1 else 2) + x) + x)
;; fast program: (1 + 2) * ((x + x) + loop(2, x mod (1 + 2), 1))
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (+ 1 2) (+ (+ (ite (<= (mod x (+ 1 2)) 0) 1 2) x) x)))))
(assert (= f0 2))
(assert (forall ((x Int)) (= (g0 x) (mod x (+ 1 2)))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 2) (+ (+ x x) (v0 x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)