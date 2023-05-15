;; sequence(s): A178465
;; terms: 0 0 6 16 36 66 114 176 264 370 510 672 876 1106 1386 1696 2064 2466 2934 3440
;; small program: ((((((x * x) + (2 mod (1 + x))) div 2) * x) + 1) div 2) * 2
;; fast program: ((((((x * x) + loop(0, 2 - x, 2)) div 2) * x) + 1) div 2) * 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (div (+ (* (div (+ (* x x) (mod 2 (+ 1 x))) 2) x) 1) 2) 2))))
(assert (= f0 0))
(assert (forall ((x Int)) (= (g0 x) (- 2 x))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (* (div (+ (* (div (+ (* x x) (v0 x)) 2) x) 1) 2) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
