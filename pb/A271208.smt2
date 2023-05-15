;; sequence(s): A271208
;; terms: ~1 1 33 245 1027 3129 7781 16813 32775 59057 100009 161061 248843 371305 537837 759389 1048591 1419873 1889585 2476117
;; small program: ((loop(x * x, 2, x) * x) - 1) + x
;; fast program: (((((x * x) * x) * x) * x) - 1) + x
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
(assert (forall ((x Int)) (= (small x) (+ (- (* (v0 x) x) 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- (* (* (* (* x x) x) x) x) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
