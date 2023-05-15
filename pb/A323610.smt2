;; sequence(s): A323610
;; terms: 48 64 72 80 88 96 104 112 120 128 136 144 152 160 168 176 184 192 200 208
;; small program: loop(2 * (2 + ((if x <= 0 then 1 else 2) + x)), 1 + 2, x)
;; fast program: 2 * (2 * (2 + (2 * (2 + ((2 + (if x <= 0 then 1 else 2)) + x)))))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* 2 (+ 2 (+ (ite (<= x 0) 1 2) x))))))
(assert (= g0 (+ 1 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (* 2 (* 2 (+ 2 (* 2 (+ 2 (+ (+ 2 (ite (<= x 0) 1 2)) x)))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
