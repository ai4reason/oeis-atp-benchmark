;; sequence(s): A63130
;; terms: 7 22 38 54 70 86 102 118 134 150 166 182 198 214 230 246 262 278 294 310
;; small program: loop(1 + (2 * (x + x)), 2, x) + (if x <= 0 then 2 else 1)
;; fast program: (2 * (2 * (2 + (2 * (x + x))))) - (if x <= 0 then 1 else 2)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (* 2 (+ x x))))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) (ite (<= x 0) 2 1)))))
(assert (forall ((x Int)) (= (fast x) (- (* 2 (* 2 (+ 2 (* 2 (+ x x))))) (ite (<= x 0) 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)