;; sequence(s): A163979
;; terms: 1 3 5 7 15 23 31 45 59 73 93 113 133 159 185 211 243 275 307 345
;; small program: (1 + ((x * x) - x)) + (if (x mod (1 + 2)) <= 0 then 0 else 2)
;; fast program: ((x * x) - x) + loop(1 + 2, x mod (1 + 2), 1)
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ 1 (- (* x x) x)) (ite (<= (mod x (+ 1 2)) 0) 0 2)))))
(assert (= f0 (+ 1 2)))
(assert (forall ((x Int)) (= (g0 x) (mod x (+ 1 2)))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (fast x) (+ (- (* x x) x) (v0 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)