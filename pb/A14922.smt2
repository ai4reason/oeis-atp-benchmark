;; sequence(s): A14922-A14988-A15076-A15120-A15142-A15186-A15208-A15252-A15406-A15450-A15516-A15538-A15648-A15670-A15736-A15802-A15846-A15912-A15978-A16000-A16110-A16132
;; terms: 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0
;; small program: if loop(x - y, 2 + 2, x) <= 0 then 1 else 0
;; fast program: if ((x - 2) - (2 * (2 + 2))) <= 0 then 1 else 0
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- x y))))
(assert (= g0 (+ 2 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (ite (<= (v0 x) 0) 1 0))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (- (- x 2) (* 2 (+ 2 2))) 0) 1 0))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
