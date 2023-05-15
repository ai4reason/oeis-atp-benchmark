;; sequence(s): A40871
;; terms: 30 30 60 30 60 30 60 30 60 30 60 30 60 30 60 30 60 30 60 30
;; small program: loop((2 + (2 + y)) * x, 2, (if x <= 0 then 1 else 2) - (x mod 2))
;; fast program: 2 * ((1 + 2) * ((1 + (2 + 2)) * ((if x <= 0 then 1 else 2) - (x mod 2))))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ 2 (+ 2 y)) x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (- (ite (<= x 0) 1 2) (mod x 2)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (* 2 (* (+ 1 2) (* (+ 1 (+ 2 2)) (- (ite (<= x 0) 1 2) (mod x 2))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
