;; sequence(s): A47254
;; terms: 2 3 5 8 9 11 14 15 17 20 21 23 26 27 29 32 33 35 38 39
;; small program: ((if (x mod (1 + 2)) <= 0 then 2 else 1) + x) + x
;; fast program: (loop(1, x mod (1 + 2), 2) + x) + x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (ite (<= (mod x (+ 1 2)) 0) 2 1) x) x))))
(assert (= f0 1))
(assert (forall ((x Int)) (= (g0 x) (mod x (+ 1 2)))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (v0 x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
